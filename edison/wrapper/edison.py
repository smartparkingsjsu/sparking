class Edison(object):

    def __init__(self):
        self.macAddress = None
        self.sensors = None

    def __retrieve_mac_address(self):
        # Get the mac from edison
        pass

    def get_mac(self):
        return self.macAddress

    def get_sensors_count(self):
        # Returns number of sensors attache to edison
        pass