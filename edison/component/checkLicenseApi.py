from wrapper.api import Api
import datetime


class CheckLicenseApi(object):

    def __init__(self):
        self.apiclient = Api("http://smartparkingsjsu-api.herokuapp.com/api/v1/triggers")
        self.confidence = None
        self.licensePlate = None
        self.edisonSerial = None

    def buildParams(self, edisonSerial, licensePlate, confidence):
        self.licensePlate = licensePlate
        self.confidence = confidence
        self.edisonSerial = edisonSerial

    def check(self):
        print("PARAMS: ")
        print("Serial", self.edisonSerial)
        print("Plate", self.licensePlate)
        print("Confidence", self.confidence)
        print("Time", str(datetime.datetime.now()))

        response = self.apiclient.post(params = {
            "serial": self.edisonSerial,
            "time": str(datetime.datetime.now()),
            # "time": "2018-02-23 19:45:00",
            "license_plate": self.licensePlate,
            "confidence": self.confidence
        })

        return response