#include <math.h>
#include <immintrin.h>
#include <fmaintrin.h>

typedef __m256 vec8;
typedef __m256i vec8int;
#define vec8_init(v)               _mm256_set1_ps(v)
#define vec8_init_8(v1, v2, v3, v4, v5, v6, v7, v8) _mm256_set_ps((v1), (v2), (v3), (v4), \
                                                                  (v5), (v6), (v7), (v8))
#define vec8_muladd(a, b, c)        _mm256_fmadd_ps((a), (b), (c))  // a * b + c
#define vec8_mulsub(a, b, c)        _mm256_fmsub_ps((a), (b), (c))  // a * b - c
#define vec8_sqrt(val)              _mm256_sqrt_ps(val)
#define vec8_mul(val)               _mm256_mul_ps(val)
#define vec8_add(val)               _mm256_add_ps(val)
#define vec8_div(val)               _mm256_div_ps(val)
#define vec8_and(val)               _mm256_and_ps(val)

// comparisons yield all ones (-1.0) or all zeros (0.0) for each comparison
// (a < b) -> 0 or -1.0
#define vec8_less_than(a, b)        _mm256_cmp_ps((a), (b), _CMP_LT_OS)
// (a > b) -> 0 or -1.0
#define vec8_greater_than(a, b)     _mm256_cmp_ps((a), (b), _CMP_GT_OS)

// useful for extracting the results from comparisons
#define vec8_signs(a)               (_mm256_movemask_ps(a) & 255)
#define vec8_comparison_result(a)   vec8_signs(a)

#define vec8_to_vec8int(val)        _mm256_cvtps_epi32(val)
