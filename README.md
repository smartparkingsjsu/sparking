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


## Architecture Diagram

Below are the major components of the system. Not all the diagrams are provided as our system is pretty huge.

#### High Level Architecture Diagram

A complete garage system (hardware and software) solution that is based on Web Application.

![](/public/images/high_level.jpg)

#### ER Diagram

![](/public/images/er_diagram.png)

#### Relation Schema Diagram

![](/public/images/relational_schema.png)

#### Assign A Spot Algorithm Flow

An algorithm to assign a spot to user.

![](/public/images/booking_algorithm.jpeg)

#### License Plate Matching Flow

An algorithm to check if the license plate received from HTTP POST request from micro controller matches the result in database.

![](/public/images/api_matching.jpeg)

## Technologies

### Software Technology

#### Application Framework & API Framework
- Ruby on Rails

#### Front End Framework
- Materialize Framework

#### Database
- PostgreSQL

#### Ruby Gems

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

#### Other Technology & Programming Language Used
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

### Hardware Technology

- Intel Edison
- USB Camera
- Barcode Scanner
- Tablet Computers
- Battery

## Setup

### Edison

#### Required

- A flashed Intel Edison
- Python 2.7
- Ultrasonic sensor
- Camera

#### Install

1. Clone this repository

#### Install camera firmware

1. Add packages for opkg
```
$ vi /etc/opkg/base-feeds.conf
```

2. Copy paste these links into the opened vi file
```
src/gz all http://repo.opkg.net/edison/repo/all
src/gz edison http://repo.opkg.net/edison/repo/edison
src/gz core2–32 http://repo.opkg.net/edison/repo/core2-32
src intel-iotdk http://iotdk.intel.com/repos/3.0/intelgalactic/opkg/i586
```

3. Update opkg
```
$ opkg update
```

4. Install camera package
```
$ opkg install kernel-module-uvcvideo
```

#### Install pip

1. Run the following command
```
$ wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate 
$ python get-pip.py
```

#### Run the application

1. From the cloned repository
```
$ cd sparking/edison
```

2. Run the program and follow the instructions
```
$ python -m application.sparking
```

3. Install any missing python package
```
$ pip install <package_name>
```

### Ruby On Rails

#### Required

- Ruby 2.4.1
- Rails 5.1

#### Install

1. Clone this repository
2. Install all the packages by using `bundle install` command.
3. Start the server with `rails s` command.

## Code Structure

### Edison

The edison code is under `sparking/edison/`

    .
    ├── application             # Holds high level abstract code (application specific)
    │   └── sparking            # Smart Parking application logic
    ├── component               # Device specific logic
    │   ├── camera
    │   ├── checkLicensePlate
    │   ├── led
    │   ├── openAlprApi
    │   ├── sparkingEdison
    │   └── ultrasonic 
    ├── images                  # Directory to store images
    ├── lib                     # Directory to store custom libraries
    └── wrapper                 # Lowest level logic
        ├── api
        ├── edison
        └── sensor 

### Rails Server

The server code is under `sparking/`
In the following structure, we will only highlight the most important directories

    .
    ├── app                   # Application specific code (Uses MVC structure)
    │   ├── assets            # Directory for JS & CSS
    │   │   ├── javascript    # JS code
    │   │   └── stylesheets   # CSS code
    │   ├── controllers       # Has the logic between the model and view
    │   ├── models            # Stores all model related code
    │   └── views             # Directory for HTML files
    ├── config                # Initialize set values for website
    │   └── routes            # Defines the URL structure of the website 
    ├── db                    # Database related files
    │   ├── schema            # Generates database tables
    │   └── seeds             # Populates database with preset entries
    └── script                # Ruby scripts to test API endpoints

## Demo

### Pictures of System In Action

#### Home Page
![](/public/images/homepage.png)

#### Materialize Notification Toast Feature
![](/public/images/materialize_toast.png)

#### Reservation: Online Booking
![](/public/images/reservation_home.png)

#### Reservation: Select Garage from Map via Online Booking
![](/public/images/reservation_home_map.png)

#### Reservation: Payment feature
![](/public/images/reservation_home_payment.png)

#### Reservation In Garage
![](/public/images/reservation_home.png)

#### Dynamic Count Down Clock for Upcoming Booking
![](/public/images/profile_dynamic_clock.png)

#### A list of Booking Associate to the User
![](/public/images/profile_reservations.png)

#### A list of Vehicle Info Associate to the User
![](/public/images/profile_vehicle_info.png)

#### Dynamic Update in Profile Page
![](/public/images/profile_edit.png)

### Video of System In Action

### Ruby On Rails Demo

We do not provide tech support to anyone that tries to run our code Ruby on Rails code. This is due to there are too many constraints that are set within the code and relies on a lot of dependencies. 

| Description   | API Server    | Host |
|-------------|-------------|-----|
| Regular Server      | [Link](http://smartparkingsjsu.herokuapp.com) | [Heroku](http://www.heroku.com) |
| API Server      | [Link](http://smartparkingsjsu-api.herokuapp.com) | [Heroku](http://www.heroku.com) |
