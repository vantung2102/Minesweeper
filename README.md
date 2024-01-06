## General Information

- Ruby version: `ruby 3.2.2`
- Rails version: `rails 7.1.1`
- Database: `postgresql`

## Installation

- Install correct ruby version for our project: `rbenv local 3.2.2`
- Install bundler: `gem install bundler`
- Install gems: `bundle install`
- Config database: create `config/database.yml`
- Add rails master key at `config/master.key` or generate new one by `rm -rf config/credentials.yml.enc && rm -rf config/master.key && EDITOR=vim rails credentials:edit`
- Database setup: `bundle exec rake db:setup`
- Start server: `rails s`
- Visit `http://localhost:3000` and start your development

## Rspec

- Run test by `bundle exec rspec`
- Check test coverage at `coverage/index.html`

## Screenshot
![image](https://github.com/ZaneTungLe/Minesweeper/assets/109327235/b9870cd5-fe59-4de1-a996-8c4f0de4daba)
![image](https://github.com/ZaneTungLe/Minesweeper/assets/109327235/6732277d-2a74-4894-b97e-7a1ddb5f9f5d)
![image](https://github.com/ZaneTungLe/Minesweeper/assets/109327235/36cfa9ad-b45e-4a9d-93ad-d08b1fb48c4c)
![image](https://github.com/ZaneTungLe/Minesweeper/assets/109327235/4d325892-3b57-49f2-92de-225684cd1d30)
![image](https://github.com/ZaneTungLe/Minesweeper/assets/109327235/da5f140d-a2c0-497b-a1d2-b079cddbde91)

## Unit Test Result
<img width="1170" alt="image" src="https://github.com/ZaneTungLe/Minesweeper/assets/109327235/8f77d812-8943-43a2-8c89-be2952b906a5">
