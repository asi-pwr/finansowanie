# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "finansowanie"
set :repo_url, "https://github.com/asi-pwr/finansowanie.git"
set :branch, "master"
set :deploy_to, "/home/#{fetch(:application)}/#{fetch(:application)}"
set :linked_files, fetch(:linked_files, []).push("config/database.yml", "config/secrets.yml")
set :linked_dirs, fetch(:linked_dirs, []).push("public/uploads")
set :keep_releases, 5
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :rbenv_path, '/home/finansowanie/.rbenv'
set :rbenv_ruby, File.read('.ruby-version').strip

namespace :puma do
  desc "Create directories for Puma pids and sockets"
  task :make_directories do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/tmp/sockets"
      execute "mkdir -p #{shared_path}/tmp/pids"
    end
  end

  before :start, :make_directories
end

namespace :deploy do
  desc "Make sure local repository is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc "Initial deployment"
  task :initial do
    on roles(:app) do
      before "deploy:restart", "puma:start"
      invoke "deploy"
    end
  end

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "puma:restart"
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
