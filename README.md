# Help Desk

This app allows user to submit a support ticket regarding the issue they are experiencing. There are two pages on the app, `Help Desk` and `Support Tickets`. On the `Help Desk` page, users can submit a ticket with their name, email, and a description of the concern. On the `Support Tickets` page, support staff can see a list of support tickets with options to view details, update ticket status, and respond to each ticket. There are 3 ticket statuses: "new", "in progress", and "resolved". This app will not send email, instead it will simply display the ticket detail and response onto the developer console.

Frontend ([Repository](https://github.com/xchen136/future_health_frontend)) is written in React.js, while backend is build using Ruby on Rails.

**Live Demo:** https://future-health-frontend-81267e8cf9e0.herokuapp.com

<img width="722" alt="image" src="https://github.com/xchen136/future_health_frontend/assets/31082478/213f068f-ebea-4910-9bbc-5a335d68e18e">

<img width="2114" alt="image" src="https://github.com/xchen136/future_health_frontend/assets/31082478/f399609a-4e3f-4e09-ad7f-f38701ceb549">

<br>

## Installations
**My Operating System:** MacOS in Ventura 13.1 (22C65)

Make sure these are installed:
1. ruby `3.0.0p0` ([source](https://guides.rubyonrails.org/getting_started.html#installing-ruby))
2. PostgreSQL `14.8` ([source](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos#step-1-installing-postgresql))
3. Rails `7.0.7` ([source](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails-installing-rails))
4. Bundler version `2.4.13` ([source](https://help.dreamhost.com/hc/en-us/articles/115001070131-Using-Bundler-to-install-Ruby-gems))

<br>

## Setup Database
1. Create Role and Password
   1. terminal: `brew services start postgresql@14`  //start PostgreSQL service
   2. terminal: `psql postgres`  //enter the PostgreSQL console
   3. `postgres=# CREATE ROLE future_health_api WITH CREATEDB LOGIN; ` // inside console, create role "future_health_api" with create DB access
   4. `postgres=# \du` //list all the roles to verify that new role is created
   5. `\password future_health_api` //setup password for new DB role 
2. Follow Step 4 - [Configuring and Creating Your Database](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos#step-4-configuring-and-creating-your-database)
   1. `database.yml` - username must match the role name "future_health_api"

<br>

## Running Locally
1. Install Gems - `terminal: bundle install`
2. Run migrations - `terminal: rails db:migrate`
3. Run rails server - `terminal: rails s`

<br>

## Heroku Setup
**Resource**: [Deploy to Heroku](https://dev.to/lizlaffitte/series/10869) (There are issues with heroku-22, so currently it uses heroku-20)

1. `cors.rb` - update origin to point to the url that hosts the frontend app. (ex: https://future-health-frontend-81267e8cf9e0.herokuapp.com)
2. `Procfile` - create a file called Procfile at the root folder so Heroku will run a migration. ([source](https://www.youtube.com/watch?v=ONsUBM10ypg))
```
release: bin/rails db:migrate
web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
```
3. Deploy: be sure to connect to github repository and enable automatic deploys.

