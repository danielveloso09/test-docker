# Geo-location

## Setting up the project

Ruby version: 2.5.3
Rails version: 5.2.2

Ps: This were the versions I used, its possible that works with others.

```bash
$ bundle install
$ bin/rails db:create
$ bin/rails db:migrate

# creates some dummy users
$ bin/rails db:seed
```

## Start application

### Start Rails
```bash
$ bin/rails s
```

## Runing specs

### All specs
```bash
$ bin/rspec 
```

### Specific spec
```bash
$ bin/rspec spec/path/to/file.rb
```

## With docker
```
# build image
$ docker-compose build

# start app
$ docker-compose up # add '-d' option to run in background

# shutdown
$ docker-compose down

# Create db
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate

# Run Specs
$ docker-compose run web rspec
```


## Assumptions / Explanations
Still missing:
- a good authentication for 3rd party API's
- create a proper deployment to production
- some specs to controllers/models
