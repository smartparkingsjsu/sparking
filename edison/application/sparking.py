from component.sparkingEdison import SparkingEdison
from component.openalprApi import OpenalprApi
from component.checkLicenseApi import CheckLicenseApi
from component.ultrasonic import Ultrasonic
from component.led import Led
from threading import Thread

def detectOjbect():
    ultrasonic = Ultrasonic()
    led = Led()
    while(True):
        if (ultrasonic.isObjectPresent(objectDistance=22, timeStayTrigger=0.10, noise=2)):
            print("Turn LED ON object is there")
            led.on()
        else:
            print("Turn LED OFF object not there")
            led.off()

def main():

    edison = SparkingEdison()
    alpr_client = OpenalprApi()
    license_client = CheckLicenseApi()

    ultrsonicThread = Thread(target=detectOjbect)
    ultrsonicThread.daemon = True
    ultrsonicThread.start()

    while(True):
        # Gets a trigger from ultrasonic
        trigger = None
        print("Enter a number from 1-3 to trigger its camera. 1 - Left; 2 - Middle; 3 - Right")
        trigger = raw_input()
        position = int(trigger)

        # Takes a picture
        if trigger is not None and (1 <= position <= 3):
            # skip for testing
            print("Taking picture!")
            # edison.sensors["camera"].write()

            # Check with ALPR
            print("Checking with ALPR...")
            response = alpr_client.getLicensePlate(edison.sensors["camera"].getImagePathSplit(position))

            if response != -1:
                # Send to sparking API
                print("Building params...")
                license_client.buildParams(edison.macAddress, response[0]["plate"], response[0]["confidence"], position)
                print("Sending to sparking API!")
                license_client.check()
            else:
                print("Spot is empty")

if __name__ == '__main__':
   main()