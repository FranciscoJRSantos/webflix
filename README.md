# Webflix - A competitor of Netflix

Context: This project was done as an academic assignment, it's not suppose to be more than that, have fun exploring my mess! :joy:

## Development setup 
For the development process I adopted Ruby on Rails v5, and PostgreSQL as a DBMS. 

### 1) Clone repository

    $ git@github.com:FranciscoJRSantos/webflix.git

or using HTTPS:

    $ git@github.com:FranciscoJRSantos/webflix.git

### 2) Server setup - Rails

#### 2.1) Install dependencies in the server - Bundle
  Run: 

    $ bundle install

#### 2.2) Setup database
  Run:
  
    $ rails db:setup

### 2.3) Start server
  Run:
  
    $ rails s 

## Testing 

I used [RSpec](http://rspec.info/) for testing the ruby code along with other
utility gems.

  Run tests:
  
    $ rspec
