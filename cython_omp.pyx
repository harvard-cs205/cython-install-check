from cython.parallel import parallel
from openmp cimport omp_lock_t, omp_init_lock, omp_set_lock, omp_unset_lock, omp_get_thread_num


cdef void acquire(omp_lock_t *l) nogil:
    omp_set_lock(l)

cdef void release(omp_lock_t *l) nogil:
    omp_unset_lock(l)

cpdef test():
    cdef:
         omp_lock_t lock

    omp_init_lock(&lock)

    print "OpenMP"
    with nogil, parallel(num_threads=5):
        acquire(&lock)
        with gil:  # we need the GIL to call print
            print("Thread {}".format(omp_get_thread_num()))
        release(&lock)
    print "Should be no overlapping lines.\n"
