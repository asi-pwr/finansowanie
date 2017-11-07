# Finansowanie

## Installation

### Fast mode

0. Install [Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) and [Ruby 2.4.1](https://gorails.com/setup/ubuntu/16.04)
1. `git clone https://github.com/asi-pwr/finansowanie.git && cd finansowanie`
2. `bundle install`
3. `bash start_database.sh`
4. `bundle exec rake db:create db:migrate db:seed`
5. `bundle exec rails s`
