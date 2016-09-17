# Beer Swap

#### A web app to help people share beer. Designed for homebrewers and beer lovers who regularly make or buy large quantities of beer and want to share/swap bottles and/or growlers with each other.

#### By Molly McGlone, September 2016

## Description:

An Epicodus independent student project to practice building a basic Ruby on Rails app.

Project Objectives:
* Code meets general coding standards (commits, spacing, naming, etc)
* There is thorough test coverage - unit and integration
* Routes follow proper convention including a root route
* Application logic is in the models (not the controller)
* Use of success and error flash messages
* Form and route helpers are present and functioning
* Uses the asset pipeline for Bootstrap/CSS
* Two or more models in one-to-many or many-to-many relationship.
* Factory Girl factories are used for testing.
* SimpleCov is included and reports at least 80% test coverage.
* Paperclip is included to upload images.
* There is authorization for admin accounts.

## Installation

* `gem install rails`
* `git clone https://github.com/mollykmcglone/beer_swap.git`
* `postgres`
* `cd beer_swap`
* `bundle install`
* `rake db:setup`
* `rake db:test:prepare`

## Running / Development

* Start the project with `rails server`
* Visit your app at [http://localhost:3000](http://localhost:3000).
* To login as an admin => email: molly@gmail.com and password: password
* To login as a non-admin user => email: erik@gmail.com and password: password

## Known Issues/Bugs

* This app is a work in progress- as of this time it is a blog with posts and comments, user account creation/destruction and login/logout.  Beers, user appreciations, mapping, search and more are all coming soon!

## Support and contact details

Please contact me with any questions, concerns, or ideas at mollykmcglone@gmail.com

## Technologies Used

* Ruby
* Rails
* PostgreSQL
* HTML/CSS
* Bootstrap

### License

MIT License

Copyright (c) 2016  **Molly McGlone**
