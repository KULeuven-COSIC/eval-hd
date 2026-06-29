#!/usr/bin/env python3

import argparse
import subprocess
import re


def run_with_timing(design_file: str, top_module: str, target: int, cell_library: str) -> bool:
    timing_success = True

    result = subprocess.run([
        "./yosys-bridge.py",
        design_file,
        "--report-timing",
        "--timing-target", str(target),
        "--top-module", top_module,
        "--cell-library", cell_library
    ], capture_output=True, text=True)

    trs = re.search(
        r"Cannot meet the target required times \((\d+.\d+)\). Continue anyway.", result.stdout)
    if trs:
        timing = float(trs.group(1))
        print(f"Timing failed ({target} ps)")
        timing_success = False
    else:
        print(
            f"Timing met: {target} ps = {target / 1000} ns = {1 / (target / 1000000):.2f} MHz")
        rs = re.search(
            r"Chip area for module \'\\Core\': (\d+.\d+)", result.stdout)
        if rs:
            area = float(rs.group(1))
            print(f"Area = {area:.2f} µm² = {(area / 1000000):.4f} mm²")
        else:
            print("Failed to parse area measurement.")

    return timing_success


def naive_search(design_file: str, top_module: str, maximum_target: int, cell_library: str) -> bool:
    successful_target = maximum_target
    success = False

    print(f"Starting timing search up to {maximum_target} ps...")

    for step in [1000, 100, 10, 1]:
        for target in range(successful_target - 9 * step, successful_target, step):
            success = run_with_timing(
                design_file, top_module, target, cell_library)
            if success:
                successful_target = target
                break

    return success

def main() -> None:
    parser = argparse.ArgumentParser(
        description="Find the area and the shortest critical path for a design with EVAL-HD.")
    parser.add_argument("design_file", type=str,
                        help="Path to the Verilog design file.")
    parser.add_argument("--top-module", type=str, default="Core",
                        help="Name of the top module (default: Core).")
    parser.add_argument("--cell-library", default="freepdk-45nm/stdcells.lib",
                        help="Path to the cell library (default: FreePDK).")
    parser.add_argument("--report-timing", action="store_true", help="Enable timing analysis during synthesis.")
    parser.add_argument("--timing-target", type=int, default=2500, help="Target timing constraint (in picoseconds, default: 2500).")
    parser.add_argument("--maximum-target", type=int, default=12000,
                        help="Maximum timing constraint (in picoseconds, default: 12000).")
    args = parser.parse_args()

    naive_search(args.design_file, args.top_module, args.maximum_target, args.cell_library)


if __name__ == "__main__":
    main()
