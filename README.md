# Points Tracker

![ruby](https://img.shields.io/badge/Ruby-2.7.4-red)
![rails](https://img.shields.io/badge/Rails-7.0.4-red)
![rspec](https://img.shields.io/badge/RSpec-3.11.0-green)

## Table of Contents
- [Schema](#schema)
- [Setup](#setup)
- [Gems](#gems)
- [Endpoints](#endpoints)
- [Contributors](#contributors)

## Schema

![schema](./app/media/images/Screen%20Shot%202022-09-29%20at%2014.45.23.png)

## Setup

1. Clone this repository: On your local machine, open a terminal session and enter the following commands for SSH or HTTPS to clone the repo.

- using SSH key <br>
```shell
$ git@github.com:josephdowns/points_tracker.git
```

- using HTTPS <br>
```shell
$ https://github.com/josephdowns/points_tracker.git
```

- Once cloned, you'll have a new local copy in the directory you ran the clone command in.

2. Change to the project directory: In terminal, use `$cd` to navigate to the project directory.
```shell
$ cd points_tracker
```

3. Install required Gems utilizing Bundler: <br>
- In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.
```shell
$ gem install bundler
```

- If Bundler is already installed or after it has been installed, run the following command.
```shell
$ bundle install
```

4. Database Migration<br>
- Before using the web application you will need to setup your databases locally by running the following command
```shell
$ rails db:{drop,create,migrate}
```
5. Startup and Access<br>
- Finally, you will have to start the server locally if you would like to test the functionality using a third party app such as Postman.

- Start server

- To access on your local machine use http://localhost:3000
```shell
$ rails s
```
## Gems
- These added gems are specific to testing and do not affect functionality
````ruby
gem 'rspec-rails'
gem 'shoulda-matchers'
````

## Endpoints

- Add transactions for a specific payer and date

````ruby
POST /api/v1/user_points

{
  'data': {
  'id': '1',
  'attributes': {
    'payer': 'Gamestop',
    'points': '700',
    'created_at': '9/30/22'
    }
  }
}
````

- Spend points
- Example: User wants to use 5000 points
````ruby
PATCH /api/v1/user_points?points=5000

{
  {'data': {
    "Miller Coors": -4700, 
    "Unilever": -200, 
    "Dannon": -100
    }
  }
}
````

- Return all payer point balances
````ruby
GET /api/v1/user_points

{
  'data': {
    "Dannon": 1100,
    "Unilever": 200,
    "Miller Coors": 10000
  }
}
````

## Contributors

<td align="center"><img src="https://avatars.githubusercontent.com/u/93220002?s=400&u=9e2d707e1b8f15766ce240ab4272fa2fde076e87&v=4" width="100px;" alt=""/><br /><sub><b>Joseph Downs (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/josdowns/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/josephdowns" title ="GitHub"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" width="115"></td>