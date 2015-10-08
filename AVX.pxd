# Cython Definition file for AVX.h

cdef extern from "AVX.h" nogil:
    ctypedef struct vec8:
        pass
    ctypedef struct vec8int:
        pass

    vec8 vec8_init(float)
    vec8 vec8_init_8(float, float, float, float,
                     float, float, float, float)
    vec8 vec8_add(vec8, vec8)
    vec8 vec8_sub(vec8, vec8)
    vec8 vec8_mul(vec8, vec8)
    vec8 vec8_div(vec8, vec8)
    vec8 vec8_sqrt(vec8)

    vec8 vec8_muladd(vec8 a, vec8 b, vec8 c)  # a * b + c
    vec8 vec8_divadd(vec8 a, vec8 b, vec8 c)  # a / b + c

    vec8 vec8_and(vec8, vec8) # bitwise AND.  Note that 0.0 = all zeros,
                              # -1.0 == all 1s

    # comparisons yield all ones (-1.0) or all zeros (0.0) for each
    # comparison, in each of the 8 float values.
    vec8 vec8_less_than(vec8 a, vec8 b)     # (a < b) -> 0.0 or -1.0
    vec8 vec8_greater_than(vec8 a, vec8 b)  # (a > b) -> 0.0 or -1.0

    # useful for extracting the results from comparisons
    vec8 vec8_signs(vec8)
    vec8_comparison_result(vec8)

    # extract to 32-bit integer
    vec8int vec8_to_vec8int(vec8)
