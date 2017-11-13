import os


class Edison(object):

    def __init__(self):
        self.macAddress = self.__retrieve_mac_address()
        self.sensors = None

    def __retrieve_mac_address(self):
        path = os.sep + "factory" + os.sep + "serial_number"
        f = open(path, "r")
        serial = f.read().split('\n')[0]
        f.close()
        return serial

    def get_mac(self):
        return self.macAddress

    def get_sensors_count(self):
        # Returns number of sensors attache to edison
        if sensors is not None:
            return len(sensors)