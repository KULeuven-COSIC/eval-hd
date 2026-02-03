# EVAL-HD

This repository contains an artifact for evaluating the cost of hardware implementations, using an open-source, ASIC-based toolchain.\
The artifact is described in our paper 'Hardware Cost Evaluation in Systems Security' ([DOI](https://doi.org/10.1145/3736731.3746155), [preprint](https://mici.hu/papers/demeulemeester25hardwarecost.pdf)).

## :file_folder: Contents

- [freepdk-45nm](https://github.com/mflowgen/freepdk-45nm): 45nm ASIC cell library
- [examples](examples/): [Proteus \& extensions](https://github.com/proteus-core/proteus) (HDL examples)

## :hammer: Installing EVAL-HD

### Pre-requisites

- Python + pip

### Cloning the Repository

To ensure all required libraries (git sub-modules) are included and downloaded, use:

```shell
git clone --recurse-submodules https://github.com/KULeuven-COSIC/eval-hd.git
```

Then install `pyosys` from pip:

```shell
pip install -r requirements.txt
```

## :bar_chart: Using EVAL-HD

Most of the functionality can be configured using the parameters of the `eval-hd.py` script:

```shell
$ ./eval-hd.py --help
usage: eval-hd.py [-h] [--top-module TOP_MODULE] [--cell-library CELL_LIBRARY] [--report-timing] [--timing-target TIMING_TARGET] design_file

Synthesize a design for ASIC using Yosys.

positional arguments:
  design_file           Path to the Verilog design file.

options:
  -h, --help            show this help message and exit
  --top-module TOP_MODULE
                        Name of the top module (default: Core).
  --cell-library CELL_LIBRARY
                        Path to the cell library (default: FreePDK).
  --report-timing       Enable timing analysis during synthesis.
  --timing-target TIMING_TARGET
                        Target timing constraint (in picoseconds, default: 2500).

$ ./eval-hd.py examples/core-ami-static.v --report-timing --timing-target 1500
[...]
```

For additional configuration, such as using SystemVerilog or multiple source files, it is recommended to modify the script directly.

The script synthesizes the target design into an ASIC netlist and displays ASIC area numbers [\mu m^2].

Additionally, if the `--report-timing` flag is set, the critical path of the design can be determined.
If the (flattened) netlist does not meet the timing constraint, a warning will appear in the log messages (Step 13.1.1. Executing ABC.):

```shell
ABC: Cannot meet the target required times (X picoseconds). Continue anyway.
```

One can relax the constraint and repeat, until the constraint is met.

Alternatively, the `find-timing.py` script can be used to automatically find the lowest possible timing constraint.
For more information, see `./find-timing.py --help`.

## OpenROAD
Install OpenROAD Flow Scripts (ORFS), as described in their [documentation](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts?tab=readme-ov-file#tool-installation).

Export path variables accordingly:
```shell
export OPENROAD_EXE=$(command -v openroad)
export YOSYS_EXE=$(command -v yosys)
```

Copy verilog sources to `OpenROAD-flow-scripts/flow/designs/src/`.
For example, create directory `OpenROAD-flow-scripts/flow/designs/proteus_libra/` and copy sources.

Select a target node (`PLATFORM`): sky130hd, sky130hs, nangate45 or asap7. Navigate to the appropriate directory and create directory. For example:

```shell
cd OpenROAD-flow-scripts/flow/designs/nangate45/libra/
```

and copy the `config.mk` and `constraint.sdc` file, after setting the appropriate variables in both.

Change directory to:
```shell
cd OpenROAD-flow-scripts/flow/
```

and make using:
```shell
make DESIGN_CONFIG=./designs/PLATFORM/DESIGN/config.mk
```
with `nangate45` as `PLATFORM` and `proteus_libra` as `DESIGN`.

Timing and power results can be found in:

```shell
OpenROAD-flow-scripts/flow/reports/PLATFORM/DESIGN/base/6_finish.rpt
```

Synthesized area can be found in
```shell
OpenROAD-flow-scripts/flow/reports/PLATFORM/DESIGN/base/synth_stat.txt
```

Post place+route area can be found in:
```shell
OpenROAD-flow-scripts/flow/logs/PLATFORM/DESIGN/base/6_report.log
```

Clean with:
```shell
make clean_all
```

## :book: Bibliography

If you use or build upon the code in this repository, please cite our paper using our [citation key](CITATION).
