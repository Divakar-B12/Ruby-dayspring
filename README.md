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



# Day13 - Rails Tasks and Notes

## 1. Adding a Column to a Table

To add a column to a table:

```bash
rails generate migration AddColumnColnameToTablename colname:datatype
rails generate migration AddColumnPhone_numberToCustomer phone_number:integer
rails db:migrate
```

* This will create a migration file in `db/migrate`, for example:
  `db/migrate/20260128044536_add_column_phone_to_customer.rb`

---

## 2. Installing Action Text

```bash
rails action_text:install
rails db:migrate
```

* Adds 4 tables to `schema.rb`:

  * `action_text_rich_texts`
  * `active_storage_attachments`
  * `active_storage_blobs`
  * `active_storage_variant_records`

* Creates migration files in `db/migrate`:

  * `20260128045359_create_active_storage_tables.active_storage.rb`
  * `20260128045360_create_action_text_tables.action_text.rb`

* Adds files/folders:

  * `app/assets/stylesheets/actiontext.css`
  * `app/views/active_storage/blobs/_blob.html.erb`
  * `app/views/layouts/action_text/contents/_content.html.erb`
  * `test/fixtures/action_text/rich_texts.yml`

* **Git commands:**

  * Check modified files: `git status`
  * Check changes in a specific file: `git diff <file_path>`

###  after installation

**Connections in Action Text tables**

* `active_storage_attachments` references `active_storage_blobs` via `blob_id`.
* `active_storage_variant_records` references `active_storage_blobs` via `blob_id`.

---

## 3. Array Operations in Ruby

```ruby
a1 = [1,2,3,4,5,6]
a2 = [1,3,5]

a3 = a1 & a2 # intersection => [1, 3, 5]
a4 = a1 | a2 # union => [1, 2, 3, 4, 5, 6]

print a3
puts
print a4
```

---

## 4. Debugging with `params.inspect`

* Used to inspect parameters from forms or requests for debugging.
* Stops execution and shows all permitted params in the error page.

```ruby
def create
  raise customer_params.inspect
  @customer = Customer.new(customer_params)
  respond_to do |format|
    if @customer.save
      format.html { redirect_to @customer, notice: "Customer was successfully created." }
      format.json { render :show, status: :created, location: @customer }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @customer.errors, status: :unprocessable_entity }
    end
  end
end
```

* Example output error:

```
#<ActionController::Parameters {"name"=>"jhon", "email"=>"1@gmail.com", "about_me"=>"<div>jhon is a english name</div>"} permitted: true>
```

---


# Day 14: Active Storage

## 1. Installation

Active Storage is included in Rails 5.2+. If not installed:

```bash
rails active_storage:install
rails db:migrate
```

> Configure storage in `config/storage.yml` for local or cloud (AWS, GCP, etc.).

---

## 2. Attaching Files to Models

**Product model (single & multiple attachments, rich text):**

```ruby
class Product < ApplicationRecord
  has_one_attached :invoice
  has_many_attached :product_images
  has_rich_text :review
end
```

**Customer model (multiple attachments):**

```ruby
class Customer < ApplicationRecord
  has_many_attached :profile_photos
end
```

> Use **snake_case** for attachment names.

---

## 3. Strong Parameters

**Product controller:**

```ruby
def product_params
  params.require(:product).permit(:name, :description, :price, :stock, :is_active, :review, :invoice, product_images: [])
end
```

**Customer controller:**

```ruby
def customer_params
  params.require(:customer).permit(:name, :email, :phone_number, :about_me, profile_photos: [])
end
```

---

## 4. Forms in Views

**Product form:**

```erb
<%= form.rich_text_area :review, class: "form-control", placeholder: "Enter review" %>
<%= form.file_field :product_picture, class: "form-control", multiple: true %>
<%= form.file_field :invoice, class: "form-control" %>
```

**Customer form:**

```erb
<%= form.file_field :profile_photos, class: "form-control", multiple: true %>
```

---

## 5. Adding Columns via Migration

```bash
rails generate migration AddColumnDobToCustomer dob:date
rails db:migrate
```

> Adds a `dob` column to `customers`.

---

## 6. Displaying Attachments

```erb
<% if customer.profile_photos.attached? %>
  <% customer.profile_photos.each do |photo| %>
    <%= image_tag url_for(photo), class: "rounded" %>
  <% end %>
<% end %>

<% if product.invoice.attached? %>
  <%= link_to "Download Invoice", url_for(product.invoice) %>
<% end %>
```

---

## 7. Key Points

1. Use **snake_case** for attachment names.
2. **Action Text** requires Active Storage.
3. Configure cloud storage in `storage.yml`.
4. For multiple files: `has_many_attached` + `multiple: true`.
5. Always whitelist attachments in controllers.
6. Use `url_for` to render attachments in views.

# Day 15 – Action Mailer

Action Mailer is used to **send emails** in Rails applications.
We **do not need to install** Action Mailer separately. It is **included by default** when a Rails application is created.

---

## Step 1: Generate Mailer

```bash
rails generate mailer CustomerMailer
```

This command creates the following files:

* `app/mailers/customer_mailer.rb`
* `app/views/customer_mailer/`
* `test/mailers/customer_mailer_test.rb`
* `test/mailers/previews/customer_mailer_preview.rb`

---

## Step 2: application.rb Changes

```ruby
require "action_mailer/railtie"
```

This file loads Action Mailer functionality. In most Rails apps, it is already included via `rails/all`.
A Railtie is the core component that allows a Ruby library or framework (like Action Mailer) to *plug in* to the Rails initialization process. 

---

## Step 3: Configure Email Delivery (development.rb)

Edit `config/environments/development.rb`:

```ruby
config.action_mailer.perform_deliveries = true
config.action_mailer.delivery_method = :letter_opener
```

* `letter_opener` is used to **mock email sending** in development
* Emails will open in browser instead of being sent
* In production, delivery method is usually **SMTP**

---

## Step 4: Customer Mailer Method

`app/mailers/customer_mailer.rb`

```ruby
class CustomerMailer < ApplicationMailer
  def welcome_email
    @customer = params[:customer]
    mail(to: @customer.email, subject: "Welcome !!")
  end
end
```

 `params` contains all the data passed while calling the mailer.

---

## Step 5: Mailer View

Create the file:

```
app/views/customer_mailer/welcome_email.html.erb
```

Add HTML content for the email.
---

## Step 6: Trigger Email from Controller

Send mail **after saving data**:

```ruby
CustomerMailer.with(customer: @customer).welcome_email.deliver
```

This line triggers the email.

---

## Step 7: Add Gems

In `Gemfile`:

```ruby
gem "letter_opener", group: :development
gem "letter_opener_web", group: :development
```

Run:

```bash
bundle install
```

---

## Step 8: Configure Routes

`config/routes.rb`

```ruby
if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
```

Visit in browser:

```
http://localhost:3000/letter_opener
```

---

## Product Mailer Example

Generate mailer:

```bash
rails generate mailer ProductMailer
```

Files created:

* `app/mailers/product_mailer.rb`
* `app/views/product_mailer/`
* `test/mailers/previews/product_mailer_preview.rb`
* `test/mailers/product_mailer_test.rb`

### Product Mailer Code

```ruby
class ProductMailer < ApplicationMailer
  def welcome_email
    @product = params[:product]
    mail(to: @product.email, subject: "Welcome to Rails Mailer Concept")
  end
end
```

---

## Calling Mailer from Controller

```ruby
def create
  @product = Product.new(product_params)

  if @product.save
    ProductMailer.with(product: @product).welcome_email.deliver
    redirect_to @product, notice: "Product was successfully created."
  else
    render :new, status: :unprocessable_entity
  end
end
```

---

## Mailer View for Product

Create:

```
app/views/product_mailer/welcome_email.html.erb
```

 Method name and view name must match:

```
welcome_email → welcome_email.html.erb
```

---

## Key Points 

* Action Mailer is built into Rails
* Do not delete `application.rb` or `boot.rb`
* `letter_opener` is used for development email preview
* Mailer method name must match view file name
* Emails should be triggered **after saving data**
* `params` contains all passed request data

---

# Day 16 – Action Mailbox 
---

## 1. Install Action Mailbox
```bash
rails action_mailbox:install
```

**Generated files:**

* `app/mailboxes/application_mailbox.rb`
* `db/migrate/20260202042002_create_action_mailbox_tables.action_mailbox.rb`

---

## 2. Database Migration
```bash
rails db:migrate
```

**Table created:**

* `action_mailbox_inbound_emails`

Used to store all incoming emails.

---
## 3. Production Configuration

In `config/environments/production.rb`:

```ruby
config.action_mailbox.ingress = :any_ingress_server
```

> Default ingress is `:relay`.

---
## 4. Application Mailbox

```ruby
class ApplicationMailbox < ActionMailbox::Base
  routing all: :support
end
```

All incoming emails are routed to `SupportMailbox`.

---
## 5. Generate Support Mailbox

```bash
rails generate mailbox support
```

**Generated files:**

* `app/mailboxes/support_mailbox.rb`
* `test/mailboxes/support_mailbox_test.rb`

---

## 6. Support Mailbox Logic

```ruby
class SupportMailbox < ApplicationMailbox
  def process
    # mail.decode  -> email body
    # mail.from    -> sender
    # mail.subject -> subject
  end
end
```

`process` method handles incoming email data.

---

## 7. View Incoming Emails (Development)

```bash
rails s
```
Open:

```
http://127.0.0.1:3000/rails/conductor/action_mailbox/inbound_emails
```

will get:
* View inbound emails
* Create emails using form or source
* Check message ID and status
---

# **Day 17 – References and Methods**
---

## **1. Creating a Namespaced Model (Model under another Model)**

Command to generate a namespaced migration:

```bash
rails generate migration ParentModel::ChildModel
```

**Example:**

```bash
rails generate migration Product::Category
rails db:migrate
```

This creates a **Category model inside Product namespace**.

---

## **2. Adding Column to a Namespaced Model**

General command:

```bash
rails generate migration AddColumnToModelName column_name:datatype
```

**Example:**

```bash
rails generate migration AddColumnCategoryNameToProductCategory category_name:string
rails db:migrate
```

This adds a `category_name` column to `Product::Category`.

---

## **3. ActiveRecord Methods**

### **Insert Records**
```ruby
ModelName.insert({ column: value, column: value })
ModelName.insert({})
ModelName.insert_all([{},{},{},...])
```

---

### **Find Records**
```ruby
Model.find(id)
```

* Returns record if present
* Throws exception if not found

```ruby
Model.find_by(id: id)
```

* Returns record if present
* Returns `nil` if not found

---

### **Fetch Records by Order**
```ruby
Model.first
Model.second
Model.third
Model.fourth
Model.fifth
Model.last
```

---

## **References**
* **Reference**: stores another table’s id to connect records
* **has_many**: one record is linked to many records
* **foreign_key**: tells Rails which column connects tables
* **Reference during generation**: creates DB column + relation together

---

## **Primary Key**
* **primary key**: unique column used to identify a record
* **custom primary key**: used when column name is not `id`

---

## **Migration Handling**
* **Migration not run**: delete the file
* **Migration run**: fix using a new migration

---

## **SQL vs Rails**
* **SQL**: direct database query
* **ActiveRecord**: Ruby way to write database queries

---

## **Fetching Records**
* **all.limit(n)**: returns first `n` records
* **take**: returns one random record

---

## **Method Differences**
* **save**: saves object with validations
* **find**: finds record by id only (error if not found)
* **find_by**: finds record by any column (nil if not found)
* **where**: returns filtered records as a collection → `[]`
* **delete**: removes record without callbacks
* **destroy**: removes record with callbacks (safe)
* **update**: updates record with validations
* **update_all**: updates many records without validations (fast but risky)

---


---

# **Day 18 – Core Extensions & ActiveSupport**
---

## **1. Core Extensions**
Rails extends Ruby core classes using **ActiveSupport**.

### Covered Extensions

* **Date calculation methods**
* **Time calculation methods**
* **String methods**
* **Array methods**
* **Hash methods**
* **Object methods**

These methods are **available only in Rails**, not in plain Ruby.

---

## **2. ActiveSupport Methods**

ActiveSupport adds helper methods that make Rails development easier.
Example:
```ruby
Time.zone.now
```
Console output:
```
2026-02-04 05:40:23.064766300 UTC +00:00
```
---

## **3. Time Calculations**

Rails allows time calculations using readable syntax.
### Example:
```ruby
curr = Time.zone.now
```
#### Adding Time

```ruby
curr + 2.day
curr + 3.week
curr + 3.month
curr + 2.days
curr + 2.hour
```
#### Output Examples:
* `curr + 2.day` → adds 2 days
* `curr + 3.week` → adds 3 weeks
* `curr + 3.month` → adds 3 months
* `curr + 2.hour` → adds 2 hours

### Supported Time Helpers
* `n.day / n.days`
* `n.hour / n.hours`
* `n.week / n.weeks`
* `n.month / n.months`

---
## **4. Date Methods**
```ruby
Date.today
Date.new(year, month, day)
```
### Beginning of Period
```ruby
Date.today.beginning_of_day
Date.today.beginning_of_week
Date.today.beginning_of_month
Date.today.beginning_of_year
```
### End of Period
```ruby
Date.today.end_of_day
Date.today.end_of_week
Date.today.end_of_month
Date.today.end_of_year
```
---
## **5. Instrumentation (Pub/Sub)**
* Used for **logging and monitoring**
* Rails uses **publish–subscribe** mechanism internally
* Helps track events like requests, SQL queries, etc.
---

## **6. ActiveSupport::Concern**
* Used to **share common code between models/controllers**
* Helps organize reusable modules
* Keeps code clean and structured
---

## **7. Multi-Language Translations (I18n)**

* Rails uses **I18n** for language translations
* Translations are configured using `en.yml`
Example:
```yaml
en:
  hello: "Hello"
```
* `I18n` is the class that holds all translations
---

## **8. Blank, Nil, Present, Empty Methods**

These methods are provided by **ActiveSupport**.
### `blank?`
```ruby
" ".blank?   # true
[].blank?    # true
{}.blank?    # true
```
---

### `nil?`
```ruby
" ".nil?   # false
[].nil?    # false
{}.nil?    # false
```
--
### `present?`
```ruby
" ".present?   # false
[].present?    # false
{}.present?    # false
```
---
### `empty?`
```ruby
" ".empty?   # true
[].empty?    # true
{}.empty?    # true
```

---


# **Day 19 – References and Associations **
---
## **1. Generate Model with Reference**

```bash
rails generate model Vendor name:string location:string user:references
```
### Generated Files
```
app/models/vendor.rb
db/migrate/XXXXXXXXXX_create_vendors.rb
test/models/vendor_test.rb
test/fixtures/vendors.yml
```
---
## **2. Migration File Content (auto-generated)**

```ruby
create_table :vendors do |t|
  t.string :name
  t.string :location
  t.references :user, null: false, foreign_key: true
  t.timestamps
end
```
---
## **3. Run Migration**

```bash
rails db:migrate
```

### Effect

```
Creates vendors table in database
Adds user_id foreign key
```
---
## **4. Generate Model (Without Reference)**
```bash
rails generate model Order details:string count:integer
```
### Generated Files
```
app/models/order.rb
db/migrate/XXXXXXXXXX_create_orders.rb
test/models/order_test.rb
test/fixtures/orders.yml
```

---
## **5. Add Reference to Existing Model**

```bash
rails generate migration AddUserToOrders user:references
```
### Generated Files
```
db/migrate/XXXXXXXXXX_add_user_to_orders.rb
```

---
## **6. Add Column to Existing Table**

```bash
rails generate migration AddEmailToVendors email:string
```
### Generated Files
```
db/migrate/XXXXXXXXXX_add_email_to_vendors.rb
```
---
## **8. Create Records from Console**

```ruby
User.create(name: "Divakar")
Vendor.create(name: "Divakar", location: "Karnataka", user_id: 1)
Order.create(details: "Setsuko", count: 2, user_id: 1)
```

---
## **9. Association-Based Creation**

```ruby
User.last.vendors.create(name: "Saita", location: "japan")
Product.last.orders.create(details: "Wanted Books", count: 5)
```
---
* `rails generate model` → model + migration + tests
* `rails generate migration` → only migration file
* `user:references` → creates `user_id` + foreign key
* `rails db:migrate` → applies changes to DB


 ## 📌 Quick Reference Table

| Command | Description |
|-------|-------------|
| `ruby --version` | Check Ruby version |
| `rails --version` | Check Rails version |
| `gem install rails` | Install Rails |
| `rails new ProjectName` | Create new Rails project |
| `rails new project_name --skip-test` | Create project without tests |
| `rails g scaffold` | Generate full MVC structure |
| `rails g controller` | Generate only controller |
| `rails g model` | Generate only model |
| `rails db:create` | Create database |
| `rails db:migrate` | Apply migrations |
| `rails db:seed` | Insert seed data |
| `rails c` | Open Rails console |
| `rails s` | Start Rails server |
| `gem install faker` | Install Faker gem |

---
