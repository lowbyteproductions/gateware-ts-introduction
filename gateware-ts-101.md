# gateware-ts 101

- FPGA used in the example is lattice ice40-up5k

- Open source toolchain
  - Yosys: Synthesises HDL into the logic representation specific to the FPGA architecture
  - NextPNR: Place-and-route tool that takes in the logic that yosys synthesised and tries to map to the physical layout of the FPGA itself (creating a bitstream)
  - Icestorm tools: Lattice ice40 specific tools. We can use iceprog to flash the bitstream to the board
  - Icarus Verilog: A simulation framework that allows for testing designs without the hardware
  - GTKWave: A waveform viewer tool for analysising the simulation data

- gateware-ts skills
  - Modules
  - Signals
  - Processes
  - Submodules
  - Parallelism
  - Abstraction

- Verilog

- Simulation
  - Simulation modules (otherwise known as test benches)
  - Producing vcd files
  - Examining in gtkwave

- Running on the hardware
  - Flashing with iceprog
  - Testing