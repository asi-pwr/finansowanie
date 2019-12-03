# Finansowanie

[![Build Status](https://travis-ci.com/asi-pwr/finansowanie.svg?branch=master)](https://travis-ci.com/asi-pwr/finansowanie)

## Installation

### Fast mode

0. Install [Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) (do not forget about [managing Docker as non-root user](https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user)), [docker-compose](https://docs.docker.com/compose/install/) and [Ruby 2.6.5 or later](https://gorails.com/setup/ubuntu/18.04).
1. `git clone https://github.com/asi-pwr/finansowanie.git && cd finansowanie`.
2. `docker-compose build && bin/setup`.
3. The application should be accessible under `http://localhost:3000`.

### Sample user

Login: `user@example.com`
Password: `password`

## Development

### Running things inside the container

Run the following:

`docker-compose run --rm <thing you want to run>`

For example:

`docker-compose run --rm bin/rails g model SuperModel name:string`

### Stop and start scripts

Use `bin/start` and `bin/stop` respectively.

### Problems with permissions?

`sudo chmod $USER:$USER -R .` in the project directory.
