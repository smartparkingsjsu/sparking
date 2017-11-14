from wrapper.sensor import Sensor
import os
import subprocess
from PIL import Image


class Camera(Sensor):

    def __init__(self):
        super(Camera, self).__init__()
        self.name = "Camera"
        self.type = "digital"
        self.image_name = "plates.jpg"
        base_path = os.path.abspath(os.path.dirname(__file__)) + os.sep + ".." + \
                          os.sep + "images"
        self.image_path =  base_path + os.sep + self.image_name
        self.split_number = 3
        self.split_image_path = base_path + os.sep + "split_plate.jpg"

        self.camera_args = ["fswebcam", "-r", "800x600", "--jpeg", "100", "-D", "1", self.image_path]

    def write(self):
        subprocess.call(self.camera_args)

    def getImagePath(self):
        return self.image_path

    def getImagePathSplit(self, position):
        image = Image.open(self.image_path)
        width, height = image.size

        split_width = width/self.split_number

        if position == 2:
            width_offset_left = split_width
            width_offset_right = split_width*2
        elif position == 3:
            width_offset_left = split_width*2
            width_offset_right = width
        else:
            width_offset_left = 0
            width_offset_right = split_width

        split_image = image.crop((width_offset_left, 0, width_offset_right, height))
        split_image.save(self.split_image_path)

        return self.split_image_path