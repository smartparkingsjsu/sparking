from wrapper.sensor import Sensor
import os
import subprocess


class Camera(Sensor):

    def __init__(self):
        super(Camera, self).__init__()
        self.name = "Camera"
        self.type = "digital"
        self.image_name = "plates.jpg"
        self.image_path = os.path.abspath(os.path.dirname(__file__)) + os.sep + ".." + \
                          os.sep + "images" + os.sep + self.image_name

        self.camera_args = ["fswebcam", "-r", "800x600", "--jpeg", "100", "-D", "1", self.image_path]

    def write(self):
        subprocess.call(self.camera_args)

    def getImagePath(self):
        return self.image_path