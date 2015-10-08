cimport numpy as np
import numpy

cimport AVX

cpdef test():
    cdef:
       AVX.vec8 v8
       np.float32_t tmp[8]


    print "AVX"
    with nogil:
        v8 = AVX.vec8_init(4)
        (<AVX.vec8 *> &tmp)[0] = AVX.vec8_sqrt(v8)
    print tmp[0], " (should be 2.0)"
    print tmp[7], " (should be 2.0)\n"
