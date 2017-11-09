from wrapper.sensor import Sensor
import mraa
import time

class Ultrasonic(Sensor):

    def __init__(self):
        super(Ultrasonic, self).__init__()
        self.trig = mraa.Gpio(7)
        self.echo = mraa.Gpio(8)
        self.name = "Ultrasonic"
        self.type = "digital"

        self.trig.dir(mraa.DIR_OUT)
        self.echo.dir(mraa.DIR_IN)

    def read(self):
        return self.distance()

    def isObjectPresent(self, objectDistance, timeStayTrigger=0.5, threshold=0.75, noise=30):
        # Input
        # timeStayTrigger in minutes
        # objectDistance in cm
        # threshold in percentage 0.75 for 75%
        count = 0
        sleepAmount = timeStayTrigger*60
        for i in range(int(sleepAmount)):
            if (self.distance() < objectDistance + noise):
                count += 1

            time.sleep(1)

        if ((count/sleepAmount) >= threshold):
            return True
        else:
            return False

    def distance(self, measure='cm'):
        self.trig.write(0)
        time.sleep(0.002)

        self.trig.write(1)
        time.sleep(0.00001)
        self.trig.write(0)

        sig = None
        nosig = None
        et = None

        while self.echo.read() == 0:
            nosig = time.time()

        while self.echo.read() == 1:
            sig = time.time()

        if sig == None or nosig == None:
            return 0

        # et = Elapsed Time
        et = sig - nosig

        if measure == 'cm':
            distance = et * 17150
        elif measure == 'in':
            distance = et / 0.000148
        else:
            print('improper choice of measurement!!')
            distance = None
        return distance