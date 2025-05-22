import logging
import sys

if __name__ == "__main__":
    sys.path.append("../")

from slothy import Slothy

import slothy.targets.aarch64.aarch64_neon as AArch64_Neon
import slothy.targets.aarch64.cortex_a72_frontend as Target_CortexA72

logging.basicConfig(stream=sys.stdout, level=logging.INFO)

arch = AArch64_Neon
target = Target_CortexA72

slothy = Slothy(arch, target)

# example
slothy.load_source_from_file("i_loop_clear_1.s")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 32

slothy.config.outputs = ["v1","v2","v3","v4","v5","v6","v7","v8","v9"]

slothy.optimize()
slothy.write_source_to_file("i_loop_opt_a72.s")
