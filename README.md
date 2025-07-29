# EVAL-HD
This repository contains an artifact for evaluating the cost of hardware implementations, using an open-source, ASIC-based toolchain.\
The artifact is described in our paper 'Hardware Cost Evaluation in Systems Security' ([DOI](https://doi.org/10.1145/3736731.3746155), [preprint](https://mici.hu/papers/demeulemeester25hardwarecost.pdf)).

## :file_folder: Contents
- [yosys](https://github.com/YosysHQ/yosys): (open-source) RTL synthesis tool
- [freepdk-45nm](https://github.com/mflowgen/freepdk-45nm): 45nm asic cell library
- [examples](examples/): [Proteus \& extensions](https://github.com/proteus-core/proteus) (HDL examples)

## :hammer: Installing EVAL-HD

### Pre-requisites
- A C++ compiler with C++17 (clang, gcc)

### Cloning the Repository
To ensure all required libraries (git sub-modules) are included and downloaded, use:
```shell
git clone --recurse-submodules https://github.com/KULeuven-COSIC/eval-hd.git
```

### Installing yosys
For more details and/or insturctions for other platforms, check its repository.

Move to `yosys` directory and get pre-requisites:
```shell
cd yosys
```
```shell
sudo apt-get install build-essential clang lld bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev
```
Make the config file.
For clang:
```shell
make config-clang
```
or gcc:
```shell
make config-gcc
```
Now build and install:
```shell
make
```
```shell
sudo make install
```

## :bar_chart: Using EVAL-HD

### ASIC Area 
Navigate to the root directory and set the following parameters in the synthesis script [synth_asic.ys](synth_asic.ys):

- Copy the target design sources to the root directory and set the name of the top design file:
```shell
read_verilog <yourdesign.v>
```
- For systemverilog, add `-sv`:
```shell
read_verilog -sv <yourdesign.v>
```
- Set the name of the top level module:
```shell
hierarchy -check -top <topmodule>
```
- Optionally, use a different (open-source) cell library:
```shell
dfflibmap -liberty <custom.lib>
abc -liberty <custom.lib>
stat -liberty <custom.lib>
```

Now, synthesize the target design into an ASIC netlist and get asic area numbers [\mu m^2]:
```shell
yosys/yosys synth_asic.ys
```

### ASIC Timing

Additionally, the script [timing_asic.ys](timing_asic.ys) can be used to determine the critical path of a design:

- Modify the design source, top-level module and library as stated above. Additionally, specify the target critical path by modifying the target delay (in picoseconds):
```shell
-D <targetdelay>
```

Now, synthesize the target design into a flattened ASIC netlist:
```shell
yosys/yosys timing_asic.ys
```

If the (flattened) netlist does not meet the timing constraint, a warning will appear in the log messages:
```shell
ABC: Cannot meet the target required times (X picoseconds). Continue anyway.
```
One can relax the constraint and repeat, until the constraint is met.

## :book: Bibliography
If you use or build upon the code in this repository, please cite our paper using our [citation key](CITATION).
