# frenchtoast
Made by AJ Najjar, Bailey Guthrie, Chris Sherman, Patrick Habashy (Product Owner), Shawn Simon, and Thomas Step (Scrum Master).

Hosted on [Heroku](https://thefrenchiesttoast.herokuapp.com/)

This app uses Ruby 2.4.0. The front end is made using React version 16.8.2 (capable by Webpacker gem version 3.5.5 and the react-rails gem version 2.4.7) and the Material UI core library version 3.9.2. The DB is PostgreSQL. The master branch is added to as features are created and approved by 2 other team members.

You need to download [PostgreSQL](https://postgresapp.com/) and Yarn using `brew install yarn` if you have Homebrew. Run `bundle install` after downloading repo.
  
Problems with local PostGres not recognizing 5432 port solved with commands  
`$ mkdir /var/pgsql_socket/`  
`$ ln -s /private/tmp/.s.PGSQL.5432 /var/pgsql_socket/ `   

 see here : `https://stackoverflow.com/questions/13868730/socket-file-var-pgsql-socket-s-pgsql-5432-missing-in-mountain-lion-    os-x-ser`  

Refer to this to [link issues with pull requests](https://help.github.com/en/articles/closing-issues-using-keywords)
