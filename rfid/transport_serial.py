import serial

from rfid.transport import BaseTransport


class SerialTransport(BaseTransport):

    def __init__(self, device='COM2', baud_rate=57600, timeout=5):
        serial
        self.serial = serial.Serial(device, baud_rate, timeout=timeout)

    def read_bytes(self, length):
        data = self.serial.read(length)
        #print("\n DATA FROM Serial ",length ," bytes ",data)
        return bytearray(data)

    def write_bytes(self, byte_array):
        self.serial.write(byte_array)

    def close(self):
        self.serial.close()
