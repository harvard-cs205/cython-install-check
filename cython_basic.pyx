cimport numpy as np
import numpy as np

cdef int csum(np.uint32_t[::1] arr) nogil:
    cdef:
        int idx, total
    total = 0
    for idx in range(arr.shape[0]):
        total += arr[idx]
    return total


cpdef test():
    print "basic numpy access"
    a = np.arange(10, dtype=np.uint32)
    assert sum(a) == csum(a)
    print "passed\n"
