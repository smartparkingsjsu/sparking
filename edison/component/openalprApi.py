from lib.openalpr_api.apis.default_api import DefaultApi


class OpenalprApi(object):

    def __init__(self):
        self.apiclient = DefaultApi()
        self.result = None

    def getLicensePlate(self, image_path):
        response = self.apiclient.recognize_post("sk_DEMODEMODEMODEMODEMODEMO", "plate,color,make,makemodel",
                                            image=image_path, country="us")

        self.result = response.plate.results
        returnArray = []
        if (len(self.result)):
            for result in self.result:
                json = {"plate": result.plate, "confidence": str(result.confidence)}
                returnArray.append(json)
            return returnArray
        else:
            return -1
