import set_compiler
set_compiler.install()

import pyximport
pyximport.install()

import cython_basic
import cython_omp
import cython_AVX

if __name__ == '__main__':
    cython_basic.test()
    cython_omp.test()
    cython_AVX.test()
