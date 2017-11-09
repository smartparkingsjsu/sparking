from component.camera import Camera
from component.ultrasonic import Ultrasonic
from wrapper.edison import Edison


class SparkingEdison(Edison):

    def __init__(self):
        super(SparkingEdison, self).__init__()
        self.sensors = {"camera": Camera(),
                        "ultrasonic": Ultrasonic()
                        }
