
add_definitions(-pipe)
add_definitions(-std=c++03)
#add_definitions(-pedantic) 
add_definitions(-mmmx -msse -msse2)

# https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Dialect-Options.html#C_002b_002b-Dialect-Options

## Functionality
add_definitions(-fno-strict-aliasing)
#add_definitions(-fvtable-verify=preinit)
add_definitions(-fwrapv)
# add_definitions(-ftrapv) # do we really wanna forbid signed int overflows? breaks code in subtle ways..

## Warnings
# Enabling, the order is important
add_definitions(-Wall)
# add_definitions(-Wextra)
add_definitions(-Wundef)
add_definitions(-Winvalid-pch)
add_definitions(-Wpointer-arith)
add_definitions(-Werror=format-security)
add_definitions(-Werror=format)
add_definitions(-Wdelete-non-virtual-dtor)
add_definitions(-Wnon-virtual-dtor)
add_definitions(-Wctor-dtor-privacy)
#add_definitions(-Wold-style-cast)
add_definitions(-Wsign-promo)
add_definitions(-Wliteral-suffix)
add_definitions(-Wnarrowing)
add_definitions(-Wnoexcept)
add_definitions(-Wreorder)
add_definitions(-Wstrict-null-sentinel)
add_definitions(-Woverloaded-virtual)

#add_definitions(-Wfloat-equal)
#add_definitions(-Wcast-align)
#add_definitions(-Wstrict-prototypes)
#add_definitions(-Wstrict-overflow=5)
#add_definitions(-Wwrite-strings)
#add_definitions(-Waggregate-return)
#add_definitions(-Wcast-qual)
#add_definitions(-Wswitch-default)
#add_definitions(-Wswitch-enum)
#add_definitions(-Wconversion)
#add_definitions(-Wunreachable-code)

#add_definitions(-Weffc++)

# Disabling problematic ones
add_definitions(-Wno-unknown-pragmas)
add_definitions(-Wno-unused-local-typedefs)
add_definitions(-Wno-unused-function)
add_definitions(-Wno-switch)
add_definitions(-Wno-sign-compare)
add_definitions(-Wno-invalid-offsetof)

#add_definitions(-Wno-pragmas)
#add_definitions(-Wno-unused-variable)
#add_definitions(-Wno-unused-but-set-variable)
#add_definitions(-Wno-unused-value)
#add_definitions(-Wno-multichar)


if(CMAKE_C_COMPILER_ID STREQUAL "Clang")
  add_definitions(-Wno-unknown-warning-option)
  add_definitions(-Wno-inline-new-delete)
  # append clang-specific settings for warnings (the second one make sure clang doesn't complain
  # about unknown -W flags, like -Wno-unused-but-set-variable)
  set(my_warn_flags "${my_warn_flags} -Wno-local-type-template-args -Wno-unknown-warning-option -Wno-inline-new-delete")
endif()

if(NOT UNIX) # MinGW
  # require msvcr70.dll or newer for _aligned_malloc etc
  # I think it is from Visual C++ .NET 2002, so it should be available on any remotely modern system.
  add_definitions(-D__MSVCRT_VERSION__=0x0700)
endif()	# NOT UNIX

#if(NOT ANDROID)
add_definitions(-DUSE_EXCEPTIONS)
#endif()


set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -D_DEBUG -O0 -ggdb ")
#set(CMAKE_C_FLAGS_DEBUGALL "${CMAKE_C_FLAGS_DEBUGALL} -g -ggdb -D_DEBUG")
#set(CMAKE_C_FLAGS_PROFILE "${CMAKE_C_FLAGS_PROFILE} -g -ggdb -D_DEBUG -O1 -fno-omit-frame-pointer")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O3 -ffast-math -fno-unsafe-math-optimizations -fomit-frame-pointer")
set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO} -ggdb -O3 -ffast-math -fno-unsafe-math-optimizations -fomit-frame-pointer")
set(CMAKE_C_FLAGS_MINSIZEREL "${CMAKE_C_FLAGS_MINSIZEREL} -Os -ffast-math -fno-unsafe-math-optimizations -fomit-frame-pointer")

set(CMAKE_CXX_FLAGS_DEBUG ${CMAKE_C_FLAGS_DEBUG})
#set(CMAKE_CXX_FLAGS_DEBUGALL ${CMAKE_C_FLAGS_DEBUGALL})
#set(CMAKE_CXX_FLAGS_PROFILE ${CMAKE_C_FLAGS_PROFILE})
set(CMAKE_CXX_FLAGS_RELEASE ${CMAKE_C_FLAGS_RELEASE})
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO ${CMAKE_C_FLAGS_RELWITHDEBINFO})
set(CMAKE_CXX_FLAGS_MINSIZEREL ${CMAKE_C_FLAGS_MINSIZEREL})
