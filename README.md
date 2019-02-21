# frenchtoast
Made by AJ Najjar, Bailey Guthrie, Chris Sherman, Patrick Habashy (Product Owner), Shawn Simon, and Thomas Step (Scrum Master)
Hosted on [Heroku](https://thefrenchiesttoast.herokuapp.com/)

This app uses Ruby 2.4.0. The front end is made using React (capable by Webpacker and the react-rails gem) and the Material UI library. The DB is PostgreSQL. The master branch is added to as features are created and approved by 2 other team members.
You need to download [PostgreSQL](https://postgresapp.com/) and Yarn using `brew install yarn` if you have Homebrew. Run `bundle install` after downloading repo.
  
Problems with local PostGres not recognizing 5432 port solved with commands  
`$ mkdir /var/pgsql_socket/`  
`$ ln -s /private/tmp/.s.PGSQL.5432 /var/pgsql_socket/ `   

 see here : `https://stackoverflow.com/questions/13868730/socket-file-var-pgsql-socket-s-pgsql-5432-missing-in-mountain-lion-    os-x-ser`  
