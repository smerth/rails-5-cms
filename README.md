# Rails v.5 CMS

This repo demonstrates the basics of working with Rails.

## System dependencies

Ruby - Version 5

Rails - Version 3

##  Installation

@ your-folder-of-choice

```bash
git clone https://github.com/smerth/rails-5-cms.git
```



## Database creation

go to the mysql command prompt

```bash
mysql -u root -p
```

Create development database

```bash
CREATE DATABASE rails_5_cms_development;
```

Create the test database

```bash
CREATE DATABASE rails_5_cms_test;
```

Grant privileges on development database

```bash
GRANT ALL PRIVILEGES ON rails_5_cms_development.* TO 'rails_user'@'localhost' IDENTIFIED BY'secretpassword';
```

Grant privileges on test database

```bash
GRANT ALL PRIVILEGES ON rails_5_cms_test.* TO 'rails_user'@'localhost' IDENTIFIED BY'secretpassword';
```

## Database configuration

@ /config/database.yml

```yaml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: rails_user
  password: secretpassword
  socket: /tmp/mysql.sock

development:
  <<: *default
  database: rails_5_cms_development

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: rails_5_cms_test
```



Test database connection

```bash
rails db:schema:dump
```

This should generate an empty schema.



## Database migrations

Run migrations on the development DB

```bash
rails db:migrate RAILS_ENV=development
```

Run migrations on the test DB

```bash
rails db:migrate RAILS_ENV=test
```



## Using the site

```bash
rails server
```

This should give you a functioning CMS on port:3000.  There is no data saved to the database and no admin users either so this is pretty boring...

At this point you can create an admin user at the command line and then login and create content, or, you can seed the cms with some dummy data to see how it works.

### Create admin user

enter rails console

```bash
rails console
```

Create new admin_user

```bash
user = AdminUser.create(:first_name => 'Firstly', :last_name => 'Lastly', :username => 'admin', :email => 'admin@test.com', :password => '12345')
```

To test the site go to: "localhost:3000/admin" and **login** and make some content.

**N.B.** Watch out for the validation rule in the admin_user model that disallows creation of new admin_users on Mondays! (I'm sure you'll agree this is a good idea... LOL)  Its just a demo… Just remove the validation, or wait till Tuesday.



### Seed the cms with dummy data

A better solution to exploring the site is to create dummy data by running the `seeds.rb` file which will populate the admin_user table and the  subjects, pages, and sections tables with some sensible data so it is easy to see how the site works.

```bash
rails db:seed
```



## How to run the test suite



## Services (job queues, cache servers, search engines, etc.)



## Deployment instructions

