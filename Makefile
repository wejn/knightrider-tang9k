# path to gw_sh from Gowin's IDE
GW_SH=../gowin/IDE/bin/gw_sh

# path to https://github.com/trabucayre/openFPGALoader
OFL=../openFPGALoader/build/openFPGALoader

all: compile flash

# compile the beauty
compile: knightrider.cst knightrider.tcl knightrider.v clockdivider.v
	$(GW_SH) knightrider.tcl

# flash to SRAM
flash: ./impl/pnr/project.fs
	$(OFL) --bitstream ./impl/pnr/project.fs --board tangnano9k

# flash to flash (persists power outage)
permaflash: ./impl/pnr/project.fs
	$(OFL) --bitstream ./impl/pnr/project.fs --board tangnano9k --write-flash

clean:
	rm -rf impl
