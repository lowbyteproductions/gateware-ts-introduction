PROJ 			:= uart
DEVICE		:= up5k
PACKAGE		:= sg48
PIN_DEF		:= icebreaker.pcf
TS_SRC		:= src/$(PROJ).ts
BUILD			:= build

all: $(BUILD)/$(PROJ).bin

%.v: $(TS_SRC)
	mkdir -p $(BUILD)
	ts-node $< > $@

%.json: %.v
	yosys -ql $*.log -p 'synth_ice40 -top top -json $@' $<

%.asc: $(PIN_DEF) %.json
	nextpnr-ice40 --$(DEVICE)  \
	--package $(PACKAGE)       \
	--json $(filter-out $<,$^) \
	--pcf $<                   \
	--asc $@

%.bin: %.asc
	icepack $< $@

prog: $(PROJ).bin
	iceprog $<

clean:
	rm -f $(BUILD)/*

.SECONDARY:
.PHONY: all prog clean
.DEFAULT_GOAL := all
