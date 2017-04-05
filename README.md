
Tune Search
========

Tune search is built using Ruby 2.3.0 and Rails 5.0.2. It lets users search for songs by song name, artist name, album name or any combination of them. 


Installation
------------
If you already have Ruby 2.3.0 and Rails 5.0.2 installed, skip this step and go to step 3.


1) Install Ruby 

     rvm install 2.3.1


2) Install Rails

     gem install rails --version 5.0.2
     
     
3) Database and basic set up
  
        - bundle install 
        - rake db:create
        - rake db:migrate
        - rake db:seed

  4)   Run the app locally

     - Type the following command in your terminal

           rails s 
               
      - Go to your Browser

            http://localhost:3000

  5) Run tests

          - rake db:seed RAILS_ENV=test
          - rspec
         
  6) Try it out here 
  
         https://murmuring-sands-22309.herokuapp.com/
