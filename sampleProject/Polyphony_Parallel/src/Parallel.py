from polyphony import  module, is_worker_running
from polyphony.io import Port
from polyphony.typing import bit, bit3, bit8, List, bit32

@module
class Parallel:

    def __init__(self):

        self.boardLED1 = Port(bit, 'out')    #onboard LED on TangNano9K
        self.boardLED2 = Port(bit, 'out')
        self.boardLED3 = Port(bit, 'out')
        self.oneSecondClk = Port(bool, 'in')

        self.append_worker(self.main)
        self.append_worker(self.secondCircuit)

    def main(self):
        time:bit32 = 72000                   #current time(unit:second)

        while is_worker_running():
            self.boardLED2.wr(1)
            self._wait()
            self.boardLED2.wr(0)
            self._wait()
            if(self.oneSecondClk.rd()):
                self.boardLED1.wr(1)
            else:
                self.boardLED1.wr(0)

    def secondCircuit(self):
        while is_worker_running():
            self.boardLED3.wr(1)
            self._wait()
            self.boardLED3.wr(0)
            self._wait()

    def _wait(self):
        for i in range(10000000):
            pass         

m =Parallel()
