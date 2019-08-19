# gfortran v8.3.0 compile setting
#========

F90     = gfortran
LDFLAGS = -lfftw3 -llapack
INCLUDES= -I/usr/include
AR      = ar rv

### standard

#FFLAGS  = mcmodel=large -ffree-line-length-none -fconvert=big-endian -O3

### for debug

FFLAGS  = -pedantic -Wconversion -Wunused -Wampersand -Wintrinsics-std -Wintrinsic-shadow -Waliasing -Wsurprising -Wc-binding-type -Wtabs -Wline-truncation -Wtarget-lifetime -Winteger-division -Wreal-q-constant -fbounds-check -O -ffpe-trap=invalid,zero,overflow -fbacktrace -fconvert=big-endian

# Unspecified options:
#  * -Wall              noisy ( due to uninitialized )
#  * -Wuninitialized    noisy
#  * -std=f2003         cannot use open( format= )

