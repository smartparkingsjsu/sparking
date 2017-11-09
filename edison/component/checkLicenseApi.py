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
        # TODO: check if all params are there & change time
        response = self.apiclient.post(params = {
            "serial": self.edisonSerial,
            "time": str(datetime.datetime.now()),
            # "time": "2018-02-23 19:45:00",
            "license_plate": self.licensePlate,
            "confidence": self.confidence
        })

        return response