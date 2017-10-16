from component.sparkingEdison import SparkingEdison
from component.openalprApi import OpenalprApi
from component.checkLicenseApi import CheckLicenseApi


def main():

    edison = SparkingEdison()
    alpr_client = OpenalprApi()
    license_client = CheckLicenseApi()

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
            alpr_client.getLicensePlate(edison.sensors["camera"].image_path)

            # Send to sparking API
            # TODO: check if response is good for alpr
            print("Building params...")
            license_client.buildParams(edison.macAddress, alpr_client.licensePlate, alpr_client.confidence)
            print("Sending to sparking API!")
            license_client.check()

if __name__ == '__main__':
   main()