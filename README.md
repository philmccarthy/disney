# Disney

```
git clone https://github.com/philmccarthy/disney.git
cd disney
bundle install
rake db:drop db:create db:migrate db:seed
rails s
```
Navigate to http://localhost:3000 in your browser

## WHAT:
An ActiveRecord project using a database that includes two parent-child relationships. This project is mirrored around Disney, which has theme parks and resorts. Theme parks have many rides, and resorts have many vacationers.

## SCHEMA:
Our scheme consists of two separate parent-child relationships. Theme Parks have many rides, and resorts have many vacationers. Each theme park table has an ID, a name, a city, a boolean of open, as well as created_at and updated_at datetime columns. Its child table, rides, has an ID, a name, a max_occupants, an operational boolean, as well as created_at and updated_at datetime columns. Our other parent table, resorts, contains an ID, name, amount_of_rooms, a vacancy boolean, and the two datetime columns. The resort's child table, vacationers, holds an ID, first_name, last_name, checked-in boolean, as well as the created_at and updated at datetime columns.
<img width="723" alt="Screen Shot 2020-12-02 at 8 47 01 PM" src="https://user-images.githubusercontent.com/69832134/101557800-f25e6d00-397a-11eb-91bb-6f67bb4fb397.png">

## FUNCTIONALITY: 
The site includes a navigation bar for links to every parent and child. Each parent page includes a link to sort by number of children. If you click on a parent name, it will bring you to a page that shows more details and also includes a link to show the children that belong to that parent, where you can alphebetize the children listed by clicking a button. On the rides and resorts pages, you can limit the results on the page by showing more than a selected number of the maximum number of occupants on a ride, or the amount of rooms at a resort. Every parent and child can be created, edited and deleted on the show page, as well as the page that lists the children belonging to a specific parent. Names of parents and children hold links to that element's show page for ease of access.

