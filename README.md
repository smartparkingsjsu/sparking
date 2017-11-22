# IIoT - Parking and Reservation System Using Image Processing

## Purpose

This is the repository for Senior Project (Final Year Project) of Computer/Software Engineering (BS) in San Jose State University.

## Team Members
- Yi Cong Ch'ng (Melvin)
- Alexis Cheung Ho
- Cherie Sew
- Timothy Wu

## Project Summary

Student group developed a system (hardware and software) to provide a guarantee parking spot for garage user. System includes microcontrollers with cameras, image recognition API to analyze license plates, Rails Web App with reserve and pay for a parking spot online or in garage, scalable Rails API App for REST API calls from microcontroller and Web App, statistics of parking garages, real time notification for garage administrator when a license plate is mismatched, and E-mail notification for users and administrators. 


# Architecture Diagram

Below are the major components of the system. Not all the diagrams are provided as our system is pretty huge.

## High Level Architecture Diagram

A complete garage system (hardware and software) solution that is based on Web Application.

![](/public/images/high_level.jpg)

## ER Diagram

![](/public/images/er_diagram.png)

## Relation Schema Diagram

![](/public/images/relational_schema.png)

## Assign A Spot Algorithm Flow

An algorithm to assign a spot to user.

![](/public/images/booking_algorithm.jpeg)

## License Plate Matching Flow

An algorithm to check if the license plate received from HTTP POST request from micro controller matches the result in database.

![](/public/images/api_matching.jpeg)

# Technologies

## Software Technology

### Application Framework & API Framework
- Ruby on Rails

### Front End Framework
- Materialize Framework

### Database
- PostgreSQL

### Ruby Gems

Below is part of gems that assist the development for our Web Application. 

- gravatar_image_tag
- [abracadabra](https://github.com/melvinchng/abracadabra.git) (fork and modified for Material Design)
- cocoon
- jquery-inputmask-rails
- hashids
- rqrcode
- geocoder
- gmaps4rails
- gon
- simple_calendar
- stripe
- jquery-rails
- jquery-turbolinks
- jquery-ui-rails
- materialize-sass
- material_icons
- devise
- redis
- bcrypt
- pg
- better_errors
- rails_db
- rack-mini-profiler

### Other Technology & Programming Language Used
- OpenAPLR API
- Python
- JSON
- ActionCable
- Redis
- RESTful API
- Heroku PaaS
- Google Maps
- Coffeescript
- JQuery
- Javascript
- Gmail SMTP
- SendGrid
- Heroku Scheduler
- Memcached Cloud

## Hardware Technology

- Intel Edison
- USB Camera
- Barcode Scanner
- Tablet Computers
- Battery

# Pictures of System In Action

# Video of System In Action

# Demo

We do not provide tech support to anyone that tries to run our code. This is due to there are too many constraints that are set within the code and relies on a lot of dependencies. 

| Description   | API Server    | Host |
|-------------|-------------|-----|
| Regular Server      | [Link](http://smartparkingsjsu.herokuapp.com) | [Heroku](http://www.heroku.com) |
| API Server      | [Link](http://smartparkingsjsu.herokuapp.com) | [Heroku](http://www.heroku.com) |

