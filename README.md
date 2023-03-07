# Phase 3 Project
# Portfolio App Back-End

## Table of Content
1. [Requirements](#requirements)
2. [Minimum Viable Product](#minimum-viable-product)
3. [User Stories](#user-stories)
4. [(pre-requisites](#pre-requisites)
3. [Project Setup](#project-setup)
    - [Installations](#installations)
    - [Access](#access)
4. [Authors](#author)
5. [License](#license)
 
## Requirements
A portfolio is a professional’s most important tool. You are tasked to create an application that will provide a platform for a professional to manage their online portfolio.

## Minimum Viable Product
This is an application that has ben created using ruby's Sinatra DSL

Users should be able to register / login to the platform.
A user should be able to view all their listed projects.
A user should be able to add a new project to their portfolio.
A user should be able to update existing project data.
A user should be able to delete a project.
A user can have a maximum of 10 skills.
A user should be able to view their listed skills.
A user should be able add, update and delete their skills.
In order to use the application, the user must be logged in.


## Project Setup
This application has been built with gem files listed in the <code>Gemfile</code> the following tools:

* To access this project on you local computer, follow the steps below

* Open your terminal

* Clone this repository: 
    - Run <code>git clone (https://github.com/NyokabiKamau/phase-3-project-potfolio-application-back-end)</code>

* cd into <code>phase-3-project-potfolio-application-front-end</code>


* Install the gemfiles needed using the 

   <code>bundle install </code>

* Perform any pending database migrations
<code> rake db:migrate</code>
   
* Run the application
   <code> rake db:migrate</code>
*. Open the application from your browse

* A <code>faker gem was used to generate random data</code> to test the data base
    <code bundle exec rake db:seed>

* the "exec rake" is a command that is used to run the gem files installed in the currect directory and not the gems installed globall environmemts


## Application
This application is a simple web API that allows users to:

- Register a new account.
- Log in to existing account.
- Create projects and skill items.
- Create skill items.
- Update individual TODO items.
- View all projects or skill items.
- Delete a Project ons skills item

## Tests

* Run <code>rake start<code> in order to a the binding.pry session on the console

* Install the Visual Studio uses <code>Thunder Client</code> to read the databse


# Author
This project was contributed to by: 
* [Nyokabi Kamau](https://github.com/NyokabiKamau/)

# License
* This project is licensed under GNU General Public License v3