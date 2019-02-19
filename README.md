# frenchtoast
Hosted on [Heroku](https://thefrenchiesttoast.herokuapp.com/)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.4.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

You need to download [PostgreSQL](https://postgresapp.com/) and Yarn using `brew install yarn` if you have Homebrew. Run `bundle install` after downloading repo.
  
  
Problems with local PostGres not recognizing 5432 port solved with commands  
'$ mkdir /var/pgsql_socket/ '  
'$ ln -s /private/tmp/.s.PGSQL.5432 /var/pgsql_socket/ '  
see here : https://stackoverflow.com/questions/13868730/socket-file-var-pgsql-socket-s-pgsql-5432-missing-in-mountain-lion-os-x-ser  
