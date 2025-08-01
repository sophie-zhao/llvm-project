//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// WARNING: This test was generated by generate_feature_test_macro_components.py
// and should not be edited manually.

// <numeric>

// Test the feature test macros defined by <numeric>

// clang-format off

#include <numeric>
#include "test_macros.h"

#if TEST_STD_VER < 14

#  ifdef __cpp_lib_constexpr_numeric
#    error "__cpp_lib_constexpr_numeric should not be defined before c++20"
#  endif

#  ifdef __cpp_lib_gcd_lcm
#    error "__cpp_lib_gcd_lcm should not be defined before c++17"
#  endif

#  ifdef __cpp_lib_interpolate
#    error "__cpp_lib_interpolate should not be defined before c++20"
#  endif

#  ifdef __cpp_lib_parallel_algorithm
#    error "__cpp_lib_parallel_algorithm should not be defined before c++17"
#  endif

#  ifdef __cpp_lib_ranges_iota
#    error "__cpp_lib_ranges_iota should not be defined before c++23"
#  endif

#  ifdef __cpp_lib_saturation_arithmetic
#    error "__cpp_lib_saturation_arithmetic should not be defined before c++26"
#  endif

#elif TEST_STD_VER == 14

#  ifdef __cpp_lib_constexpr_numeric
#    error "__cpp_lib_constexpr_numeric should not be defined before c++20"
#  endif

#  ifdef __cpp_lib_gcd_lcm
#    error "__cpp_lib_gcd_lcm should not be defined before c++17"
#  endif

#  ifdef __cpp_lib_interpolate
#    error "__cpp_lib_interpolate should not be defined before c++20"
#  endif

#  ifdef __cpp_lib_parallel_algorithm
#    error "__cpp_lib_parallel_algorithm should not be defined before c++17"
#  endif

#  ifdef __cpp_lib_ranges_iota
#    error "__cpp_lib_ranges_iota should not be defined before c++23"
#  endif

#  ifdef __cpp_lib_saturation_arithmetic
#    error "__cpp_lib_saturation_arithmetic should not be defined before c++26"
#  endif

#elif TEST_STD_VER == 17

#  ifdef __cpp_lib_constexpr_numeric
#    error "__cpp_lib_constexpr_numeric should not be defined before c++20"
#  endif

#  ifndef __cpp_lib_gcd_lcm
#    error "__cpp_lib_gcd_lcm should be defined in c++17"
#  endif
#  if __cpp_lib_gcd_lcm != 201606L
#    error "__cpp_lib_gcd_lcm should have the value 201606L in c++17"
#  endif

#  ifdef __cpp_lib_interpolate
#    error "__cpp_lib_interpolate should not be defined before c++20"
#  endif

#  if !defined(_LIBCPP_VERSION)
#    ifndef __cpp_lib_parallel_algorithm
#      error "__cpp_lib_parallel_algorithm should be defined in c++17"
#    endif
#    if __cpp_lib_parallel_algorithm != 201603L
#      error "__cpp_lib_parallel_algorithm should have the value 201603L in c++17"
#    endif
#  else
#    ifdef __cpp_lib_parallel_algorithm
#      error "__cpp_lib_parallel_algorithm should not be defined because it is unimplemented in libc++!"
#    endif
#  endif

#  ifdef __cpp_lib_ranges_iota
#    error "__cpp_lib_ranges_iota should not be defined before c++23"
#  endif

#  ifdef __cpp_lib_saturation_arithmetic
#    error "__cpp_lib_saturation_arithmetic should not be defined before c++26"
#  endif

#elif TEST_STD_VER == 20

#  ifndef __cpp_lib_constexpr_numeric
#    error "__cpp_lib_constexpr_numeric should be defined in c++20"
#  endif
#  if __cpp_lib_constexpr_numeric != 201911L
#    error "__cpp_lib_constexpr_numeric should have the value 201911L in c++20"
#  endif

#  ifndef __cpp_lib_gcd_lcm
#    error "__cpp_lib_gcd_lcm should be defined in c++20"
#  endif
#  if __cpp_lib_gcd_lcm != 201606L
#    error "__cpp_lib_gcd_lcm should have the value 201606L in c++20"
#  endif

#  ifndef __cpp_lib_interpolate
#    error "__cpp_lib_interpolate should be defined in c++20"
#  endif
#  if __cpp_lib_interpolate != 201902L
#    error "__cpp_lib_interpolate should have the value 201902L in c++20"
#  endif

#  if !defined(_LIBCPP_VERSION)
#    ifndef __cpp_lib_parallel_algorithm
#      error "__cpp_lib_parallel_algorithm should be defined in c++20"
#    endif
#    if __cpp_lib_parallel_algorithm != 201603L
#      error "__cpp_lib_parallel_algorithm should have the value 201603L in c++20"
#    endif
#  else
#    ifdef __cpp_lib_parallel_algorithm
#      error "__cpp_lib_parallel_algorithm should not be defined because it is unimplemented in libc++!"
#    endif
#  endif

#  ifdef __cpp_lib_ranges_iota
#    error "__cpp_lib_ranges_iota should not be defined before c++23"
#  endif

#  ifdef __cpp_lib_saturation_arithmetic
#    error "__cpp_lib_saturation_arithmetic should not be defined before c++26"
#  endif

#elif TEST_STD_VER == 23

#  ifndef __cpp_lib_constexpr_numeric
#    error "__cpp_lib_constexpr_numeric should be defined in c++23"
#  endif
#  if __cpp_lib_constexpr_numeric != 201911L
#    error "__cpp_lib_constexpr_numeric should have the value 201911L in c++23"
#  endif

#  ifndef __cpp_lib_gcd_lcm
#    error "__cpp_lib_gcd_lcm should be defined in c++23"
#  endif
#  if __cpp_lib_gcd_lcm != 201606L
#    error "__cpp_lib_gcd_lcm should have the value 201606L in c++23"
#  endif

#  ifndef __cpp_lib_interpolate
#    error "__cpp_lib_interpolate should be defined in c++23"
#  endif
#  if __cpp_lib_interpolate != 201902L
#    error "__cpp_lib_interpolate should have the value 201902L in c++23"
#  endif

#  if !defined(_LIBCPP_VERSION)
#    ifndef __cpp_lib_parallel_algorithm
#      error "__cpp_lib_parallel_algorithm should be defined in c++23"
#    endif
#    if __cpp_lib_parallel_algorithm != 201603L
#      error "__cpp_lib_parallel_algorithm should have the value 201603L in c++23"
#    endif
#  else
#    ifdef __cpp_lib_parallel_algorithm
#      error "__cpp_lib_parallel_algorithm should not be defined because it is unimplemented in libc++!"
#    endif
#  endif

#  ifndef __cpp_lib_ranges_iota
#    error "__cpp_lib_ranges_iota should be defined in c++23"
#  endif
#  if __cpp_lib_ranges_iota != 202202L
#    error "__cpp_lib_ranges_iota should have the value 202202L in c++23"
#  endif

#  ifdef __cpp_lib_saturation_arithmetic
#    error "__cpp_lib_saturation_arithmetic should not be defined before c++26"
#  endif

#elif TEST_STD_VER > 23

#  ifndef __cpp_lib_constexpr_numeric
#    error "__cpp_lib_constexpr_numeric should be defined in c++26"
#  endif
#  if __cpp_lib_constexpr_numeric != 201911L
#    error "__cpp_lib_constexpr_numeric should have the value 201911L in c++26"
#  endif

#  ifndef __cpp_lib_gcd_lcm
#    error "__cpp_lib_gcd_lcm should be defined in c++26"
#  endif
#  if __cpp_lib_gcd_lcm != 201606L
#    error "__cpp_lib_gcd_lcm should have the value 201606L in c++26"
#  endif

#  ifndef __cpp_lib_interpolate
#    error "__cpp_lib_interpolate should be defined in c++26"
#  endif
#  if __cpp_lib_interpolate != 201902L
#    error "__cpp_lib_interpolate should have the value 201902L in c++26"
#  endif

#  if !defined(_LIBCPP_VERSION)
#    ifndef __cpp_lib_parallel_algorithm
#      error "__cpp_lib_parallel_algorithm should be defined in c++26"
#    endif
#    if __cpp_lib_parallel_algorithm != 201603L
#      error "__cpp_lib_parallel_algorithm should have the value 201603L in c++26"
#    endif
#  else
#    ifdef __cpp_lib_parallel_algorithm
#      error "__cpp_lib_parallel_algorithm should not be defined because it is unimplemented in libc++!"
#    endif
#  endif

#  ifndef __cpp_lib_ranges_iota
#    error "__cpp_lib_ranges_iota should be defined in c++26"
#  endif
#  if __cpp_lib_ranges_iota != 202202L
#    error "__cpp_lib_ranges_iota should have the value 202202L in c++26"
#  endif

#  ifndef __cpp_lib_saturation_arithmetic
#    error "__cpp_lib_saturation_arithmetic should be defined in c++26"
#  endif
#  if __cpp_lib_saturation_arithmetic != 202311L
#    error "__cpp_lib_saturation_arithmetic should have the value 202311L in c++26"
#  endif

#endif // TEST_STD_VER > 23

// clang-format on
