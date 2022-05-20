VERILOG = iverilog
TARGET = PRPG.vcd
TEMP = PRPG.vvp
$(TARGET) : $(TEMP)
	vvp $(TEMP)
PRPG.vvp: PRPG_tb.v PRPG.v
	$(VERILOG) -o $(TEMP) PRPG_tb.v PRPG.v
clean:
	-del $(TARGET)
	-del $(TEMP)
