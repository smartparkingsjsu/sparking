from component.sparkingEdison import SparkingEdison
from component.openalprApi import OpenalprApi
from component.checkLicenseApi import CheckLicenseApi
from component.ultrasonic import Ultrasonic
from threading import Thread

def detectOjbect():
    ultrasonic = Ultrasonic()
    while(True):
        if (ultrasonic.isObjectPresent(objectDistance=22, timeStayTrigger=0.10, noise=2)):
            print("Turn LED ON object is there")
        else:
            print("Turn LED OFF object not there")

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
        print("Press any key to activate everything!")
        trigger = raw_input()

        # Takes a picture
        if trigger is not None:
            # skip for testing
            print("Taking picture!")
            # edison.sensors["camera"].write()

            # Check with ALPR
            print("Checking with ALPR...")
            response = alpr_client.getLicensePlate(edison.sensors["camera"].image_path)

            if response != -1:
                # Send to sparking API
                print("Building params...")
                license_client.buildParams(edison.macAddress, response[0]["plate"], response[0]["confidence"])
                print("Sending to sparking API!")
                license_client.check()
            else:
                print("ERROR fetching openALPR API")

if __name__ == '__main__':
   main()