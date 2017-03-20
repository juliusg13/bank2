# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 5.1.0.beta1

* Getting started
Download code
navigate to folder and do bundle install through ruby shell or whatever you prefer
run server, on windows it is: ruby bin/rails server
Use your favorite browser and open localhost:3000

* User is availible through CRUD with the path http://localhost:3000/v1/users?id=XXX
* Get transaction is through http://localhost:3000/v1/transfers/XXX
* Delete is through http://localhost:3000/v1/transfers/XXX
* Put and post are not working as intended.

* On log in a user gets a token but token is not working with the CRUD requests yet.
* Access to transfers are not restricted through tokens.

* ...

* Known bugs: Posting a 3 letter combination that does not match a alpha3 iso standard country loads an error page.

* Why Devise? I figured I would only be reinventing the wheel if I'd go into to try to make my own user account system, so I rather take something that has had a lot of time to improve and is already well made.
