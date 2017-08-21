# README

EndPoint: http://54.197.145.134/

CRUD for Products and their Rate Plans using Rails 5.

Steps to run:

1. rvm use ruby-2.2.2
2. rake db:create
3. rake db:migrate
4. rake db:seed

End URL: localhost:3000/admin (local)

Feel free to Play!!

API:

http://localhost:3000/products

Sample Response:

[{"id":1,"title":"Iphone","description":"Product from Apple","start_date":"2017-02-01","end_date":"2017-08-30","created_at":"2017-08-21T14:59:12.000Z","updated_at":"2017-08-21T14:59:12.000Z"}]

API:

http://localhost:3000/products/1

Sample Response:

{"id":1,"title":"Iphone","description":"Product from Apple","start_date":"2017-02-01","end_date":"2017-08-30","created_at":"2017-08-21T14:59:12.000Z","updated_at":"2017-08-21T14:59:12.000Z","rate_plans":[{"id":1,"title":"ATT Next","description":"ATT Next Plan","start_date":"2017-08-01","end_date":"2017-08-30","product_id":1,"recurrence":"monthly","price":20,"created_at":"2017-08-21T15:01:01.000Z","updated_at":"2017-08-21T15:01:01.000Z"},{"id":2,"title":"ATT Next1","description":"ATT Next Plan1","start_date":"2017-07-12","end_date":"2017-08-28","product_id":1,"recurrence":"quarterly","price":10,"created_at":"2017-08-21T15:02:32.000Z","updated_at":"2017-08-21T15:02:32.000Z"}]}
