# Day 1 Ruby on Rails Setup Guide

This guide helps you install Ruby and Rails and create your first Rails application.

## 1. Install Ruby

Download and install Ruby from:
https://rubyinstaller.org/downloads/

After installation, check whether Ruby is installed:

```bash
ruby -v
```
You should see the installed Ruby version.

## 2. Install Rails 

Install Rails using RubyGems: 
```bash
gem install rails
```
Verify the installation: 
```bash
rails -v
```
You should see the installed Rails version.

##3. Create a New Rails Project

Create a new Rails application: 
```bash
rails new ApplicationName
```
Replace ApplicationName with your project name.

Move into the project directory: cd ApplicationName

## 4. Run the Rails Application

Start the Rails server: 
```bash
rails s
```
Open your browser and visit: http://localhost:3000

You should see the Rails welcome page.

## Summary of Commands
```bash
ruby -v
```
Checks whether Ruby is installed and displays the installed Ruby version.
```bash
gem install rails
```
Installs the Ruby on Rails framework using RubyGems.
```bash
rails -v
```
Verifies that Rails is installed and shows the Rails version.
```bash
rails new ApplicationName
```
Creates a new Rails application with the given project name.
```bash
cd ApplicationName
```
Moves into the newly created Rails project directory.
```bash
rails s
```
Starts the Rails server to run your application locally.

# Day 2 – Ruby on Rails Notes
## PostgreSQL, Scaffold & Rails Console

---

## 1. Create New Rails Project with PostgreSQL

```bash
rails new app -d postgresql
```
Meaning:

Creates a new Rails project

Uses PostgreSQL as the database

-d postgresql specifies the database type

Other variations:
```bash
rails new project_name
rails new project_name -d postgresql
rails new project_name -d postgresql --skip-test
```

## 2. database.yml Setup

File: config/database.yml

Meaning:
This file contains database connection settings such as:

host

username

password

database name

⚠️ If any value is wrong → rails db:create will fail.

Example : 
```bash
default: &default
  adapter: postgresql
  encoding: unicode
  host: 127.0.0.1
  port: 5432
  username: postgres
  password: Root
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: my_db_development

test:
  <<: *default
  database: my_db_test
```

## 3. Create Database
```bash
rails db:create
```
Meaning: Creates the actual database in PostgreSQL.

## 4. Generate Scaffold (CRUD Application)
```bash
rails generate scaffold Customer name:string email:string
```
Meaning:
Scaffold automatically generates:

Model

Controller

Views

Routes

Migration

It provides full CRUD operations:

Create Customer

Read Customer

Update Customer

Delete Customer

It becomes a complete mini web application inside your Rails project.

Controller only: 
```bash
rails generate controller Customers
```

## 5. Migrate Database
```bash
rails db:migrate
```
Meaning:

Scaffold creates only the migration file

Migrate actually creates tables in the database

Easy way to remember:

Scaffold → creates migration file

Migrate → creates tables in DB

Only after migrate → data can be stored

## 6. Seed Database
```bash
rails db:seed
```
Meaning:
Inserts default/sample data written in db/seeds.rb.

Correct order is important:
```bash
rails db:create

rails db:migrate

rails db:seed
```
## 7. Start Rails Server
```bash
rails s (or) rails server
```
Run on different port: rails s -p 4000

Stop server: Ctrl + C

## 8. Check PostgreSQL Version
```bash
psql -V
```
Meaning: Shows the installed PostgreSQL version.

## 9. Rails Console
```bash
rails console (or) rails c
```
Meaning: Provides an interactive environment to execute Rails and ActiveRecord commands directly.

## 10. Main Database Commands Summary

rails db:create     → Creates database
rails db:migrate    → Applies schema changes
rails db:seed       → Inserts seed data

Correct order: create → migrate → seed 

## 11. Scaffold Summary
## Customer Scaffold
Scaffold generates:

Model

Controller

Views

Routes

Migration

Command: 
```bash
rails generate scaffold Customer name:string email:string 
```
## Product Scaffold

### Command
```bash
rails generate scaffold Product name:string description:text price:decimal stock:integer is_active:boolean
```
Meaning:
This command generates a complete CRUD structure for the Product model, including:

Model

Controller

Views

Routes

Migration file

After Any DB-Related Change 
Always run: 
```bash
rails db:migrate
```

Meaning:
Applies migration changes and creates/updates tables in the database.

Ways to Insert Data

1. Using UI (Rails-generated forms)

Go to browser

Use the Product form to add records

2. Using Manual SQL (DBeaver / pgAdmin)
```bash
Example: INSERT INTO products (name, description, price, stock, is_active, created_at, updated_at)
VALUES ('IQ', 'The IQ new product', 80, 2, TRUE, '2026-01-16', '2026-01-16');
```
4. Using Seeds File (db/seeds.rb)
   Example:
```bash
  Product.create(
  name: "Tesla 1",
  description: "The tesla 1 product",
  price: 900,
  stock: 30,
  is_active: true
)
```
Run seed: 
```bash
rails db:seed
```
⚠️ Remember correct order:
```bash
rails db:create
rails db:migrate
rails db:seed
```
6. Using Rails Console
   rails console (or) rails c
   Example:
  ```bash 
  Product.create(
  name: "iPhone",
  description: "Apple mobile",
  price: 1200,
  stock: 15,
  is_active: true
)
```

## Faker Gem Installation & Check

Install Faker gem:

```bash
gem install faker
```
If you are using it inside a Rails project, add it to your Gemfile: gem 'faker'
Then run: bundle install

Check if Faker is installed: 
```bash
gem list faker
```
OR inside Rails console:
```bash
rails console
require 'faker'
Faker::Name.name
```
If it returns a random name, Faker is working correctly.

Example Usage (for Seeds)

In db/seeds.rb:
```bash
10.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price(range: 100..1000),
    stock: Faker::Number.between(from: 1, to: 50),
    is_active: true
  )
end
```
```bash
Run: rails db:seed
```

# DAY 3 
Think of a Rails project like a big company, and every folder has its own department.

All in one view:
```bash
my_app/
│
├── app/                → Main application code (MVC)
│   ├── models/         → Model (database + business logic)
│   ├── controllers/    → Controller (handles requests & responses)
│   ├── views/          → View (HTML/ERB files, UI)
│   ├── helpers/        → Helper methods for views
│
├── config/             → Configuration files
│   ├── routes.rb       → Maps URLs to controllers/actions
│   ├── database.yml    → Database connection details
│   ├── application.rb  → Main app configuration
│
├── db/                 → Database related files
│   ├── migrate/        → Migration files (table creation/changes)
│   ├── schema.rb       → Current structure of database
│
├── bin/                → Rails and bundle commands
│
├── log/                → Log files
│
├── tmp/                → Temporary files, cache, server pid
│
├── public/             → Static files (images, 404.html, etc.)
│
├── test/               → Test cases (or spec/ if using RSpec)
│
├── .gitignore          → Files Git should ignore
├── Gemfile             → List of gems (libraries)
├── Gemfile.lock        → Exact gem versions installed
├── README.md           → Project documentation
└── Rakefile            → Task automation
```
