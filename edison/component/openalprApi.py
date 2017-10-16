from lib.openalpr_api.apis.default_api import DefaultApi


class OpenalprApi(object):

    def __init__(self):
        self.apiclient = DefaultApi()
        self.licensePlate = None
        self.confidence = None

    def getLicensePlate(self, image_path):
        response = self.apiclient.recognize_post("sk_DEMODEMODEMODEMODEMODEMO", "plate,color,make,makemodel",
                                            image=image_path, country="us")

        self.licensePlate = str(response.plate.results[0].plate)
        self.confidence = response.plate.results[0].confidence
