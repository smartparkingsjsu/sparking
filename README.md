

# Edison

##### Required
- A flashed Intel Edison
- Python 2.7
- Ultrasonic sensor
- Camera

##### Install
###### Clone this repository into the Edison
###### Install camera firmware

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

###### Install pip

1. Run the following command
```
wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate 
python get-pip.py
```

###### Run the application

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