# Finansowanie

[![Build Status](https://travis-ci.com/asi-pwr/finansowanie.svg?branch=master)](https://travis-ci.com/asi-pwr/finansowanie)

## Installation

### Fast mode

0. Install [Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) (do not forget about [managing Docker as non-root user](https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user)) and [Ruby 2.4.1](https://gorails.com/setup/ubuntu/16.04)
1. `gem install bundler`
2. `git clone https://github.com/asi-pwr/finansowanie.git && cd finansowanie`
3. `bundle install`
4. `bash start_database.sh`
5. `bundle exec rake db:create db:migrate db:seed`
6. `bundle exec rails s`
