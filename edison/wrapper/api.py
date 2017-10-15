import requests

class Api(object):

    def __init__(self, url=None):
        if url is not None:
            self.url = url
        else:
            self.url = None

    def setUrl(self, url):
        self.url = url

    def get(self, params):
        response = None
        if self.url is not None:
            response = requests.get(self.url)

        return response

    def post(self, params):
        response = None
        if self.url is not None:
            response = requests.post(self.url, data = params)

        return response

    def put(self, params):
        response = None
        if self.url is not None:
            response = requests.put(self.url, data = params)

        return response