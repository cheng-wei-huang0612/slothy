from slothy.targets.arm_v81m.arch_v81m import eor, ldr, ldrd, str_reg, strd
from slothy.targets.arm_v81m.cortex_m55r1 import (
    ExecutionUnit,
    get_inverse_throughput,
    get_latency,
    get_units,
    is_same_bank_scalar_store_load_hazard,
    m55_dtcm_bank,
    try_get_base_and_imm,
)


class _Node:
    def __init__(self, inst):
        self.inst = inst


def _consumer():
    return eor.make("eor r4, r5, r6")


def test_ldrd_model():
    inst = ldrd.make("ldrd r0, r1, [r2, #16]")

    assert get_units(inst) == [ExecutionUnit.LOAD]
    assert get_inverse_throughput(inst) == 1
    assert get_latency(inst, 0, _consumer()) == 2


def test_strd_model():
    inst = strd.make("strd r0, r1, [r2, #16]")

    assert get_units(inst) == [ExecutionUnit.STORE]
    assert get_inverse_throughput(inst) == 1
    assert get_latency(inst, 0, _consumer()) == 1


def test_scalar_str_model():
    inst = str_reg.make("str r1, [r0, #116]")

    assert get_units(inst) == [ExecutionUnit.STORE]
    assert get_inverse_throughput(inst) == 1
    assert get_latency(inst, 0, _consumer()) == 1


def test_dtcm_bank_uses_address_bits_3_2():
    assert m55_dtcm_bank(0) == 0
    assert m55_dtcm_bank(4) == 1
    assert m55_dtcm_bank(8) == 2
    assert m55_dtcm_bank(12) == 3
    assert m55_dtcm_bank(16) == 0


def test_same_base_same_bank_scalar_str_ldr_triggers():
    store = str_reg.make("str r2, [r0, #0]")
    load = ldr.make("ldr r3, [r0, #16]")

    assert try_get_base_and_imm(store) == ("r0", 0)
    assert try_get_base_and_imm(load) == ("r0", 16)
    assert is_same_bank_scalar_store_load_hazard(_Node(store), _Node(load))


def test_same_base_different_bank_scalar_str_ldr_does_not_trigger():
    store = str_reg.make("str r2, [r0, #0]")
    load = ldr.make("ldr r3, [r0, #4]")

    assert not is_same_bank_scalar_store_load_hazard(_Node(store), _Node(load))


def test_different_base_same_bank_scalar_str_ldr_does_not_trigger():
    store = str_reg.make("str r2, [r0, #0]")
    load = ldr.make("ldr r3, [r1, #16]")

    assert not is_same_bank_scalar_store_load_hazard(_Node(store), _Node(load))


def test_unknown_immediate_does_not_trigger_scalar_hazard():
    store = str_reg.make("str r2, [r0, #0]")
    load = ldr.make("ldr r3, [r0, #16]")
    store.pre_index = "unknown"

    assert try_get_base_and_imm(store) is None
    assert not is_same_bank_scalar_store_load_hazard(_Node(store), _Node(load))


def run_all():
    test_ldrd_model()
    test_strd_model()
    test_scalar_str_model()
    test_dtcm_bank_uses_address_bits_3_2()
    test_same_base_same_bank_scalar_str_ldr_triggers()
    test_same_base_different_bank_scalar_str_ldr_does_not_trigger()
    test_different_base_same_bank_scalar_str_ldr_does_not_trigger()
    test_unknown_immediate_does_not_trigger_scalar_hazard()


if __name__ == "__main__":
    run_all()
