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

# DAY 4
## App Folder

- Controllers  
  - Handles requests and responses  
- Models  
  - Maintains database tables  
- Views  
  - Used for UI (`.html.erb` files)

## Data Types

- String (mutable)
- Integer
- Float
- Symbol (immutable)
- Boolean
- Nil

## Variables

- Local → `name`
- Global → `$name`
- Instance → `@name`
- Class → `@@name`
- Constant → `NAME`


# DAY 5

# Ruby on Rails – Notes (Methods, Type Casting, Scaffold, Data Insertion, Faker)

---

## 📌 Notes

- A method in Ruby automatically returns the last executed line.
- If a specific condition is required, we explicitly use `return`.

### Comments in Ruby
- Single line comment:
```ruby
# This is a single line comment
```
- Multi-line comment:
  ```bash
  =begin
  This is a
  multi-line comment
  =end
  ```
Type Casting
- By default, input taken using gets is a String.
- Ruby does not support implicit type casting.
- We must convert types explicitly.
Common conversions:
String to Integer
```
str.to_i
```
Integer to String
```
num.to_s
```
String to Float
```
str.to_f
```

Float to String
```
float.to_s
```

- Creating Product Package (Scaffold):
  Creating Product Package (Scaffold)
  ```
  rails generate scaffold Product name:string description:text price:decimal stock:integer is_active:boolean
  ```
  
  After every DB-related change, run:
  ```
  rails db:migrate
  ```
-  Ways to Insert Data
  1. By UI
     Rails automatically provides a form UI to insert and update records.
  2. Manually Using Database (DBeaver / PgAdmin)
     ```
     INSERT INTO "products" 
     ("name", "description", "price", "stock", "is_active", "created_at", "updated_at")
     VALUES 
     ('Iq', 'The IQ new product', 80, 2, TRUE, '2026-01-16', '2026-01-16');
    ```
  3. Using db/seeds.rb
     ```bash
      Product.create(
      name: "Tesla 1",
      description: "The tesla 1 product",
      price: 900,
      stock: 30,
      is_active: true
      )

      Product.create(
      name: "Tesla 2",
      description: "The tesla 2 product",
      price: 9000,
      stock: 300,
      is_active: true
      )
    ```
Run: 
  ```
    rails db:seed
  ```
4. Using Rails Console
```
   rails console
```
```
Product.create(
  name: "Tesla",
  description: "The tesla product",
  price: 90,
  stock: 3,
  is_active: true
)
```
Faker API 
- Faker is used to generate fake or dummy data.
- Implemented using a gem.

Add to Gemfile:

```
gem 'faker'
```
Install:
```
bundle install

```
Usage example:
```
Product.create(
  name: Faker::Commerce.product_name,
  description: Faker::Lorem.sentence,
  price: Faker::Commerce.price,
  stock: rand(1..50),
  is_active: true
)
```
Important Notes:
- Rails commands are case-sensitive.
- Model names must start with a capital letter.
- Table and column names must not contain spaces.
- Strings must be written inside double quotes " ".
- Even a small space or wrong case can cause errors.
- Always run rails db:migrate after changing the database schema.

# Day 6
Loops in Ruby / Rails
Rails (Ruby) provides built-in looping constructs:
- for loop
  - Used when initialization is given.
  - Automatically increments by +1.
```
for i in 1..5
  puts i
end
```
- while loop
  - Checks the condition first.
  - Executes only if the condition is true.
```
i = 1
while i <= 5
  puts i
  i += 1
end
```
- loop (similar to do–while)
  - loop (similar to do–while)
```
i = 1
loop do
  puts i
  i += 1
  break if i > 5
end
```
- until loop
  - Runs until the condition becomes true.
```
i = 1
until i > 5
  puts i
  i += 1
end
```
In-Built Methods for Collections (Enumerable Module)
These methods are provided by Ruby’s Enumerable module:
- each
  - Used to access each element.
```
arr.each { |x| puts x }
```
- select
  - Returns elements that satisfy a condition.
```
arr.select { |x| x > 5 }
```

- reject
  - Returns elements that do NOT satisfy a condition.
```
arr.reject { |x| x > 5 } 
```
- map / collect
  - Used to transform each element.
  - Both do the same thing.
```
arr.map { |x| x * 2 }
```

Notes on Enumerable Methods: 
- These methods do not modify the original array.
- To modify the array permanently, use !:
```
arr.select! { |x| x > 5 }
```
- If a method returns a boolean, it usually ends with ?:
```
arr.all? { |x| x > 0 }
arr.any? { |x| x == 3 }
```
Rails Methods for Data Communication
- pluck
  - Used to select specific columns from the database.
  - Faster because it avoids loading full objects.
Example:
```
@products = Product.all.limit(10)
@stock   = Product.all.limit(10).pluck(:stock)
@prices  = Product.all.limit(10).pluck(:price)
```
Question 

Select 10 products which are in active condition
```
Product.where(is_active: true).limit(10)
```

# Day 7 
Class
  - Class names should always be written in CamelCase.
  - First letter must be capital.

Example:
```
class CustomerController
end
```
Methods 
  - Method and variable names should be written in snake_case.
Example:
```
def limit_active
end
```
There are mainly two important types of methods:
1. Predicate Methods
   - These methods return only true or false.
   - They always end with ?.

Example:
```
active?
empty?
valid?
```
2. Bang Methods
   - Normally, methods do not modify the original object.
   - When ! is used, the method modifies the original data.

Example:
```
arr.sort      # does not change original
arr.sort!     # changes original array
```

Inheritance 
  - Ruby allows single inheritance only.
  - One class can inherit from only one parent class.
  - The super keyword is used to call the parent class method.
    
Example:
```
class Animal
  def speak
    "Sound"
  end
end

class Dog < Animal
  def speak
    super + " Bark"
  end
end
```
- Method Lookup Hierarchy:
  When a method is called, Ruby searches in this order:
  1. Child Class
  2. Base (Parent) Class
  3. Object
  4. Kernel (Module)
  5. BasicObject
  
- Ancestors
  - Ruby checks methods following the hierarchy:
    ```
    Child → Parent → Object → Kernel → BasicObject
    ```
- You can see this using:
  ```
  ClassName.ancestors
  ```
respond_to?
  - Used to check whether an object has a particular method.
Example:
```
"Sample".respond_to?(:upcase)
```
Returns: 
  - true if the method exists
  - false if the method does not exist
Notes:
- respond_to? also returns true for inherited methods.
- Methods can be from:
  -  Child class
  -  Parent class
  -  Object
  -  Kernel
  -  BasicObject

# Day 8
Conditional Statements
Conditional statements are used to perform operations based on conditions.

1. If – Else
   - Checks a condition and executes code if it is true, otherwise executes the else part.
```
stock = -20
is_available = false

if stock > 0
  is_available = true
else
  puts "Item not available"
end
```
2. Elsif (Else If)
   - Used when multiple conditions need to be checked.
```
price = 350
discount = 0

if price > 100
  discount = 10
elsif price > 200
  discount = 20
elsif price > 300
  discount = 30
elsif price > 400
  discount = 40
else
  discount = 5
end

puts discount
```
3. Ternary Operator
   - A short form of if-else written in a single line.
```
puts is_active ? "Item present" : "Not present"
```

4. Unless
   - Opposite of if.
   - Executes when the condition is false.
```
stock = 15

unless stock < 0
  puts "Stock available"
else
  puts "Stock not available"
end
```
5. Case Statement
   - Used to handle multiple conditions like a switch statement.
Example using conditions:
```
price = 350
discount = 0

case
when price >= 100 && price < 200
  discount = 10
when price >= 200 && price < 300
  discount = 20
when price >= 300 && price < 400
  discount = 30
when price >= 400 && price < 500
  discount = 40
else
  discount = 5
end

puts discount
```
Example using ranges: 
```
price = 350
discount = 0

case price
when 100..200
  discount = 10
when 200..300
  discount = 20
when 300..400
  discount = 30
when 400..500
  discount = 40
else
  discount = 5
end

puts discount
```
Notes: 
  - When using logical operators (&&, ||, <, >), you write conditions explicitly.
  - When using ranges (100..200), you can directly pass the variable to case.

Access Modifiers
Ruby has three types of access modifiers:
1. Public
   - Default access level.
   - Methods and classes can be accessed from anywhere.
```
public
```
2. Private
   - Methods can only be accessed inside the same class.
   - Cannot be called directly using an object.
```
private
```
Example:
```
class Sample
  def show
    secret_method
  end

  private

  def secret_method
    puts "This is private"
  end
end
```
To access private methods:
  - Call them from a public method inside the same class.
3. Protected
  - Methods can be accessed:
    - Inside the same class
    - Inside subclasses
```
protected
```
```
class Parent
  protected

  def protected_method
    "Protected Method"
  end
end

class Child < Parent
  def show
    protected_method
  end
end
```
Notes on Access Modifiers
- Private methods:
  - Cannot be accessed using an object directly.
  - Must be called from a public method inside the class.
- Protected methods:
  - Can be accessed within the class and its subclasses.
  - Used when methods should be shared only among related classes.

# Day 9

Note:
  - Email validation in Rails was introduced as an inbuilt feature from Rails version 6.
  - Encryption and decryption features were introduced from Rails version 7, where we can directly use methods inside models to encrypt and decrypt data.

Validators
- Validations in Rails are used to ensure only valid data is saved into the database.

They can be done in two ways: 
- Frontend Validation
  - Done in HTML forms.
  - Checks data while the user is entering it.
  - Prevents invalid data from being submitted.
Example:
```
<input type="email" required>
```
- Backend Validation (Model Level)
  - Done inside Rails models.
  - Runs after data is sent from frontend.
  - Provides stronger security and reliability.

- Types of Validations
  1. Inbuilt Validations
    - Rails provides many built-in validation methods.
    - They are written using validates.
Examples:
  - Presence validation:
    ```
    validates :email, presence: true
    ```
  - Uniqueness validation:
    ```
    validates :email, uniqueness: true
    ```
  - Format validation:
    ```
    validates :name, format: { 
    with: /\A[a-zA-Z]+\z/, 
    message: "Only letters are allowed" 
    }
    ```
These validations ensure that:
  - Data is not empty
  - Data is unique
  - Data follows a proper format

  2. Custom Validations
     - We can define our own validation methods based on business logic.
     - These are written as normal Ruby methods inside the model.
     - They are called using validate.
       ```
       class Product < ApplicationRecord
        validate :check_price

        def check_price
        if stock == 0 && price > 0
        errors.add(:stock, "Stock is not available.")
            end
          end
        end
       ```
Important Notes 
- For inbuilt validations, use:
  ```
  validates
  ```
- For custom validations, use:
  ```
  validate
  ```
- Type	               Keyword Used
------------------------------------
- Inbuilt Validation	 validates
- Custom Validation	   validate

# Day 10

Scopes in Rails

- Scopes are defined inside **models**.
- They are used to handle **repetitive database queries**.
- Scopes always return **ActiveRecord relations (table records)**.
- They help in writing clean, reusable, and readable code.

---

Difference Between Methods and Scopes

- **Methods**
  - Used mainly for method chaining.
  - Used for reusable logic.
  - Can return any type of value.

- **Scopes**
  - Used mainly for filtering database records.
  - Perform a single operation on the database or collections.
  - Always return database records.

| Feature            | Method | Scope |
|-------------------|--------|-------|
Return DB records   | Optional | Always |
Chaining            | Mostly used | Limited |
Purpose             | Logic handling | Query filtering |

---

Writing Scopes Using Queries

1. Using Rails Query

```ruby
scope :out_of_stock, -> { where("stock <= ?", 0) }
```

2. Using SQL Query

```
scope :test_scope, -> { find_by_sql("WRITE YOUR SQL QUERY HERE") }
```

Example: 
```
scope :cheap_products, -> {
  find_by_sql("SELECT * FROM products WHERE price < 100")
}
```
Types of Scopes : 
1. Non-Parameterized Scope
Does not take any arguments.
```
scope :out_of_stock, -> { where("stock <= ?", 0) }
```
Usage:
```
Product.out_of_stock
``` 
2. Parameterized Scope
Takes arguments.
```
scope :blacklisted_customers, ->(customer_ids) { where(id: customer_ids) }
```
Usage:
```
Customer.blacklisted_customers([1, 2, 3])
```
- Assignment
  The assignment code is uploaded in the Day10 folder.
ERB Tags in Rails Views
Used to embed Ruby code inside HTML files.
- <% %>
  - Executes Ruby code.
  - Does NOT display anything.
```
<% if condition %>
  <!-- HTML content -->
<% end %>
```

- <%= %>
  - Executes Ruby code.
  - Displays the result on the webpage.
```
<%= @product.name %>
```

Note: 
- Scopes make database queries reusable.
- They improve readability of queries.
- They help maintain clean code in Rails applications.
- Use scopes when the same query is needed in multiple places.

# Day 11
```
No class
```

# Day 12

Rails Components & Routing

Components

- Rails provides many **components** which contain built-in methods and features.
- These components help to:
  - Reduce boilerplate code
  - Simplify development
  - Improve performance and maintainability
- Different Rails components are explained in detail in the **Day12 README.md** file.

---

ActivePack

- ActivePack is a Rails component used to generate controllers and views automatically.
- It simplifies UI generation by creating default controller actions and view files.

Example:

```bash
rails g controller admin
```

This command will:
  - Create AdminController
  - Create a folder app/views/admin/
  - Generate helper files and test files
So, by one command:
  - Controller + Views are generated automatically.

1 .Add a New Column to an Existing Table 
To add a new column to the products table:
```
rails g migration AddMobToProduct mob:bigint
rails db:migrate
```
This will:
  - Create a migration file
  - Add a new column mob of type bigint to the products table
  - Apply the changes to the database

2. Remove a Column from a Table
To remove a column from customers table:
```
rails g migration RemoveFromCustomers mob:bigint
rails db:migrate
```
This will: 
  - Remove the mob column from the customers table

Routes Configuration
- Rails provides flexibility to include or exclude routes.
  1. Skip Specific Routes
     If you want to skip certain routes:
     ```
     resources :products, except: [:show]
     ```
     This will generate all routes except:
      - show
2. Allow Only Specific Routes
   If you want only selected routes:
   ```
   resources :products, only: [:edit, :destroy]
   ```
This will generate only:
- edit
- destroy

Summary 
- Rails Components simplify coding.
- ActivePack auto-generates controllers and views.
- Migrations are used to:
  - Add columns
  - Remove columns
  - Modify tables
- Routes can be:
  - Limited using only
  - Skipped using except
- These features help maintain:
  - Clean structure
  - Flexible routing
  - Easy database evolution
