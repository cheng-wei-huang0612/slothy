import logging
import sys

if __name__ == "__main__":
    sys.path.append("../")

from slothy import Slothy

import slothy.targets.aarch64.aarch64_neon as AArch64_Neon
import slothy.targets.aarch64.cortex_a76_frontend as Target_CortexA76

logging.basicConfig(stream=sys.stdout, level=logging.INFO)

arch = AArch64_Neon
target = Target_CortexA76

slothy = Slothy(arch, target)

# example
slothy.load_source_from_file("../examples/naive/aarch64/aarch64_simple0_macros.s")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 32

slothy.optimize(start="start", end="end")
slothy.write_source_to_file("opt/aarch64_simple0_macros_opt_a55.s")
