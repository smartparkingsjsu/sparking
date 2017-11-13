import mraa
from wrapper.sensor import Sensor

class Led(Sensor):

    def __init__(self):
        super(Led, self).__init__()
        self.pin = mraa.Gpio(13)
        self.pin.dir(mraa.DIR_OUT)

    def on(self):
        self.pin.write(1)

    def off(self):
        self.pin.write(0)