from slothy import Slothy

import slothy.targets.aarch64.aarch64_neon as AArch64_Neon
import slothy.targets.aarch64.cortex_a72_frontend as Target_CortexA72

arch = AArch64_Neon
target = Target_CortexA72

slothy = Slothy(arch, target)

# example

slothy.load_source_from_file("../examples/naive/aarch64/my_examples/script.s")
# slothy.config.sw_pipelining.enabled = True
slothy.config.inputs_are_outputs = True
slothy.config.outputs = ["v15", "v16"]
slothy.config.sw_pipelining.minimize_overlapping = False
slothy.config.variable_size = True
slothy.config.reserved_regs = [f"x{i}" for i in range(0, 7)] + ["x30", "sp"]
slothy.config.constraints.stalls_first_attempt = 64
###
# slothy.optimize_loop("p1stage1LoopStart")
# slothy.optimize_loop("p1stage2")
# slothy.optimize_loop("p1stage2LoopStart")
# slothy.optimize_loop("p1stage3_1")
# slothy.optimize_loop("p1stage3_1LoopStart")
###
slothy.optimize(start="L_opt_loop_1", end="L_opt_loop_1_end")
slothy.write_source_to_file("out.s")
