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
