iverilog:="/usr/local/bin/iverilog"
vvp:="/usr/local/bin/vvp"

.PHONY: all clean

all: top_test.vcd

top_test.out: top_test.sv top.sv
	$(iverilog) -g2012 -o $@ -s top_test $^

top_test.vcd: top_test.out
	$(vvp) $^

clean:
	rm -rf *.out *.vcd
