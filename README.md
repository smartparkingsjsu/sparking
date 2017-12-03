# IIoT - Parking and Reservation System Using Image Processing

## Background

### Purpose

This is the repository for Senior Project (Final Year Project) of Computer/Software Engineering (BS) in San Jose State University.

### Team Members
- Yi Cong Ch'ng (Melvin)
- Alexis Cheung Ho
- Cherie Sew
- Timothy Wu

### Project Advisor
- [Ronald Mak](http://www.cs.sjsu.edu/~mak/)

### Project Summary

Student group developed a system (hardware and software) to provide a guarantee parking spot for garage user. System includes microcontrollers with cameras, image recognition API to analyze license plates, Rails Web App with reserve and pay for a parking spot online or in garage, scalable Rails API App for REST API calls from microcontroller and Web App, statistics of parking garages, real time notification for garage administrator when a license plate is mismatched, and E-mail notification for users and administrators. 

## Features Implemented

### General
- Mobile and user friendly front end
- Dynamic update without redirecting

### User
- Registration
- Session (login and logout)
- Forgot Password
- Email Authentication
- User Profile (basic information with vehicle information and license plate)
- [Admin Only] Is a Garage Owner
- Email & Text Notification System
- Notify user if booking their booking due soon
- Notify user if there is an upcoming booking

### Booking System (Online)
- Online Booking
- Payment System
- Choose Garages from Google Map
- Booking History
- QR Code generation
- Receive E-mail on a successful booking

### Garage System (In Person)
- Check-in page (for online user)
- Get a spot (for drop-in user)
- Search for Parking Spot based on Booking ID
- Payment System
- Check-out page
- Garage Dashboard 
- Real-time notification system based on Garage (ActionCable)
- Admin receive E-mail on license plate mismatch

### APIs
- Query booking information (HTTP GET) based on garage and time
- Query and resolve notifications (HTTP GET & HTTP POST) based on garage
- Process license plate information from HTTP POST request

### Python Script
- Capture license plate and store on onboard storage
- Send license plate picture to OpenALPR for (HTTP POST) license plate recognition
- Send license plate information (HTTP POST) to Rails backend for processing

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

### Ruby On Rails

#### Required

- Ruby 2.4.1
- Rails 5.1

#### Install

1. Clone this repository
2. Install all the packages by using `bundle install` command.
3. Start the server with `rails s` command.

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

## Code Structure

### Rails Server

The server code is under `sparking/`
In the following structure, we will only highlight the most important directories

    .
    ├── app                   # Application specific code (Uses MVC structure)
    │   ├── assets            # Directory for JS & CSS
    │   │   ├── javascript    # JS code
    │   │   └── stylesheets   # CSS code
    │   ├── controllers       # Has the logic between the model and view
    │   |   └── api           # API Controller
    │   ├── models            # Stores all model related code
    │   └── views             # Directory for HTML files
    ├── config                # Initialize set values for website
    │   └── routes            # Defines the URL structure of the website 
    ├── db                    # Database related files
    │   ├── schema            # Generates database tables
    │   └── seeds             # Populates database with preset entries
    └── script                # Ruby scripts to test API endpoints

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

## Demo

### Ruby on Rails Web Application

We do not provide tech support to anyone that tries to run our code Ruby on Rails code. This is due to there are too many constraints that are set within the code and relies on a lot of dependencies. Not all of the features available in this application are illustrated in the animated gif below. 

| Description   | API Server    | Host |
|-------------|-------------|-----|
| Regular Server      | [Link](http://smartparkingsjsu.herokuapp.com) | [Heroku](http://www.heroku.com) |
| API Server      | [Link](http://smartparkingsjsu-api.herokuapp.com) | [Heroku](http://www.heroku.com) |

#### Home Page
![](/public/gif/home_page.gif)

#### User Login
![](/public/gif/user_login.gif)

#### Online Reservation Feature
![](/public/gif/online_reservation.gif)

#### User Profile
![](/public/gif/profile.gif)

#### Edit User Profile
![](/public/gif/edit_profile.gif)

#### Add/Edit/Delete Vehicle License Plate
![](/public/gif/license_plate_edit.gif)

#### Garage Admin Login
![](/public/gif/admin_login.gif)

#### Garage Owner Dashboard
![](/public/gif/admin_dashboard.gif)

#### Dynamic Notification for Garage Admin
![](/public/gif/admin_notification.gif)

#### Get A Spot In Person (In The Garage)
![](/public/gif/user_get_spot.gif)

#### Check In via Online Booking (In The Garage)
![](/public/gif/user_check_in.gif)

#### Search And Pay (In The Garage)
![](/public/gif/search_and_pay.gif)

#### Check Out (In The Garage)
![](/public/gif/user_check_out.gif)

#### Mobile Friendly for Both User and Garage Owner
![](/public/gif/mobile_friendly.gif)

### Intel Edison

#### Edison: Ultrasonic with no object
![](/public/images/edison_ultrasonic_battery.PNG)

#### Edison: Ultrasonic with object
![](/public/images/edison_ultrasonic_on.png)

#### Edison: Camera taking picture of license plate
![](/public/images/license.PNG)

#### Edison: Console Output of image recognition from camera picture
![](/public/images/console_output.PNG)

### Video of System In Action
[![Link To Youtube](https://img.youtube.com/vi/Yx_ewRs2ULA/0.jpg)](https://www.youtube.com/watch?v=Yx_ewRs2ULA)