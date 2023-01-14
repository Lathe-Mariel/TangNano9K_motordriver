from polyphony import testbench, module, is_worker_running
from polyphony.timing import clksleep, wait_value
from polyphony.io import Port
from polyphony.typing import bit, bit5, bit8, bit16, bit32, List, int8, int16
from data import FONT_DATA

@module
class LEDMatrixAB:

    def __init__(self, interval):
        
        self.swA = Port(bool, 'in')
        self.swB = Port(bool, 'in')
        self.rotary1_a = Port(bool, 'in')
        self.rotary1_b = Port(bool, 'in')

        self.col = Port(bit8, 'out')
        self.row = Port(bit8, 'out')
        self.boardLED1 = Port(bit, 'out')
        self.oneSecondCLK = Port(bool, 'in')

        self.interval = interval
        self.append_worker(self.main)

    def main(self):
        fontPointer:int8 = 0
        antiChatter:bit16 = 0

        bufferClock:bit5 = 0
        time:bit32 = 72000  #current time(unit:second)

        row_cnt:bit5 = 0
        windowOffset:bit8 = 0
        windowCounter:bit32 = 0
        lastClockState:bit = 0

        old_rotary1_a:bit = 0
        antiChatter_rotary1_a:bit8 = 0

        frameBuffer:List[bit8] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
                
        while is_worker_running():
            windowCounter = windowCounter + 1
            if(windowCounter == 4096):
                windowCounter = 0
                windowOffset = windowOffset + 1
                if(windowOffset == 40):
                    windowOffset = 0

            if(self.rotary1_a.rd() != old_rotary1_a):
                antiChatter_rotary1_a += 1
                if(antiChatter_rotary1_a > 14):
                    if(old_rotary1_a):
                        old_rotary1_a = self.rotary1_a.rd()
                        antiChatter_rotary1_a = 0
                    else:
                        if(self.rotary1_b.rd()):
                            time += 60
                        else:
                            time -= 60
                    old_rotary1_a = self.rotary1_a.rd()
                    antiChatter_rotary1_a = 0

            elif(lastClockState == 0 and self.oneSecondCLK.rd() == 1):
                time = time +1
                if(time >= 86400):
                    time = 0
            else:
                bufferClock = bufferClock + 1
                if(bufferClock == 40):
                    bufferClock = 0
                self.updateBuffer(time, bufferClock, frameBuffer)

            self.boardLED1(self.oneSecondCLK.rd())
            lastClockState = self.oneSecondCLK.rd()

            self.col.wr(frameBuffer[row_cnt + windowOffset])
            self.row.wr(1 << row_cnt)
            row_cnt = row_cnt + 1
            
            if(row_cnt == 8):
                row_cnt = 0
                a = self.swA.rd()
                b = self.swB.rd()
                if(a == 0):
                    antiChatter = antiChatter + 1
                    if(antiChatter == 40):
                        fontPointer = fontPointer + 1
                        if(fontPointer == 11):
                            fontPointer = 0
                elif(b == 0):
                    antiChatter = antiChatter + 1
                    if(antiChatter == 40):
                        fontPointer = fontPointer - 1
                        if(fontPointer == -1):
                            fontPointer = 10
                else:
                    antiChatter = 0
            self._wait()

    def _wait(self):
        for i in range(self.interval // 2):
            pass

    def updateBuffer(self, time:bit32, bufferClock:bit5, frameBuffer:List[bit8]):
        
        hourLSB:bit5 = 0
        hourMSB:bit5 = 0
        hour:bit8 = time // 3600

        minuteLSB:bit5 = 0
        minuteMSB:bit5 = 0
        minute:bit8 = (time % 3600) // 60

        if(hour > 19):
            hourLSB = hour - 20
            hourMSB = 2
        elif(hour > 9):
            hourLSB = hour -10
            hourMSB = 1
        else:
            hourLSB = hour
            hourMSB = 10

        if(minute > 49):
            minuteLSB = minute - 50
            minuteMSB = 5
        elif(minute > 39):
            minuteLSB = minute -40
            minuteMSB = 4
        elif(minute > 29):
            minuteLSB = minute - 30
            minuteMSB = 3
        elif(minute > 19):
            minuteLSB = minute -20
            minuteMSB = 2
        elif(minute > 9):
            minuteLSB = minute - 10
            minuteMSB = 1
        else:
            minuteLSB = minute
            minuteMSB = 0
            
        currentNumber:bit5 = 10
        fontOffset:bit5 = 0           
        if(bufferClock < 5):
            currentNumber = hourMSB
            fontOffset = bufferClock
        elif(bufferClock == 5):
            pass
        elif(bufferClock < 11):
            currentNumber = hourLSB
            fontOffset = bufferClock - 6
        elif(bufferClock == 11):
            pass
        elif(bufferClock == 12):
            frameBuffer[19] = 0b01100110
            return
        elif(bufferClock == 13):
            pass        
        elif(bufferClock < 19):
            currentNumber = minuteMSB
            fontOffset = bufferClock - 14
        elif(bufferClock == 19):
            pass
        elif(bufferClock < 25):
            currentNumber = minuteLSB
            fontOffset = bufferClock - 20
            
        frameBuffer[bufferClock + 7] = FONT_DATA[5 * currentNumber + fontOffset]

m = LEDMatrixAB(2700)

@testbench
def test(matrix_m):
    pass

test(m)
