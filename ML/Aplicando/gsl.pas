unit gsl;
{$MINENUMSIZE 4}

interface

const
  {$IF Defined(WIN32)}
  LIBGSL = 'libgsl-23.dll';
  _PU = '';
  {$ELSE}
    {$MESSAGE Error 'Unsupported platform'}
  {$ENDIF}

const
  { TODO : Macro probably use invalid symbol "extern": }
  (* GSL_VAR extern *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ERROR ( reason , gsl_errno ) do { gsl_error ( reason , __FILE__ , __LINE__ , gsl_errno ) ; return gsl_errno ; } while ( 0 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ERROR_VAL ( reason , gsl_errno , value ) do { gsl_error ( reason , __FILE__ , __LINE__ , gsl_errno ) ; return value ; } while ( 0 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ERROR_VOID ( reason , gsl_errno ) do { gsl_error ( reason , __FILE__ , __LINE__ , gsl_errno ) ; return ; } while ( 0 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ERROR_NULL ( reason , gsl_errno ) GSL_ERROR_VAL ( reason , gsl_errno , 0 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ERROR_SELECT_2 ( a , b ) ( ( a ) != GSL_SUCCESS ? ( a ) : ( ( b ) != GSL_SUCCESS ? ( b ) : GSL_SUCCESS ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ERROR_SELECT_3 ( a , b , c ) ( ( a ) != GSL_SUCCESS ? ( a ) : GSL_ERROR_SELECT_2 ( b , c ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ERROR_SELECT_4 ( a , b , c , d ) ( ( a ) != GSL_SUCCESS ? ( a ) : GSL_ERROR_SELECT_3 ( b , c , d ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ERROR_SELECT_5 ( a , b , c , d , e ) ( ( a ) != GSL_SUCCESS ? ( a ) : GSL_ERROR_SELECT_4 ( b , c , d , e ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_STATUS_UPDATE ( sp , s ) do { if ( ( s ) != GSL_SUCCESS ) * ( sp ) = ( s ) ; } while ( 0 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_REAL ( z ) ( ( z ) . dat [ 0 ] ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_IMAG ( z ) ( ( z ) . dat [ 1 ] ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_COMPLEX_P ( zp ) ( ( zp ) -> dat ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_COMPLEX_P_REAL ( zp ) ( ( zp ) -> dat [ 0 ] ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_COMPLEX_P_IMAG ( zp ) ( ( zp ) -> dat [ 1 ] ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_COMPLEX_EQ ( z1 , z2 ) ( ( ( z1 ) . dat [ 0 ] == ( z2 ) . dat [ 0 ] ) && ( ( z1 ) . dat [ 1 ] == ( z2 ) . dat [ 1 ] ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SET_COMPLEX ( zp , x , y ) do { ( zp ) -> dat [ 0 ] = ( x ) ; ( zp ) -> dat [ 1 ] = ( y ) ; } while ( 0 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SET_REAL ( zp , x ) do { ( zp ) -> dat [ 0 ] = ( x ) ; } while ( 0 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SET_IMAG ( zp , y ) do { ( zp ) -> dat [ 1 ] = ( y ) ; } while ( 0 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SET_COMPLEX_PACKED ( zp , n , x , y ) do { * ( ( zp ) + 2 * ( n ) ) = ( x ) ; * ( ( zp ) + ( 2 * ( n ) + 1 ) ) = ( y ) ; } while ( 0 ) *)
  GSL_RANGE_CHECK = 1;
  { TODO : Unable to convert function-like macro: }
  (* GSL_RANGE_COND ( x ) ( x ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_VECTOR_REAL ( z , i ) ( ( z ) -> data [ 2 * ( i ) * ( z ) -> stride ] ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_VECTOR_IMAG ( z , i ) ( ( z ) -> data [ 2 * ( i ) * ( z ) -> stride + 1 ] ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_VECTOR_COMPLEX ( zv , i ) ( ( ( i ) >= ( zv ) -> size ? ( gsl_error ( "index out of range" , __FILE__ , __LINE__ , GSL_EINVAL ) , 0 ) : 0 , * GSL_COMPLEX_AT ( ( zv ) , ( i ) ) ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_COMPLEX_AT ( zv , i ) ( ( gsl_complex * ) & ( ( zv ) -> data [ 2 * ( i ) * ( zv ) -> stride ] ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_COMPLEX_FLOAT_AT ( zv , i ) ( ( gsl_complex_float * ) & ( ( zv ) -> data [ 2 * ( i ) * ( zv ) -> stride ] ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_COMPLEX_LONG_DOUBLE_AT ( zv , i ) ( ( gsl_complex_long_double * ) & ( ( zv ) -> data [ 2 * ( i ) * ( zv ) -> stride ] ) ) *)
  { TODO : Macro probably use invalid symbol "size_t": }
  (* CBLAS_INDEX size_t *)
  GSL_DBL_EPSILON = 2.2204460492503131e-16;
  GSL_SQRT_DBL_EPSILON = 1.4901161193847656e-08;
  GSL_ROOT3_DBL_EPSILON = 6.0554544523933429e-06;
  GSL_ROOT4_DBL_EPSILON = 1.2207031250000000e-04;
  GSL_ROOT5_DBL_EPSILON = 7.4009597974140505e-04;
  GSL_ROOT6_DBL_EPSILON = 2.4607833005759251e-03;
  GSL_LOG_DBL_EPSILON = (-3.6043653389117154e+01);
  GSL_DBL_MIN = 2.2250738585072014e-308;
  GSL_SQRT_DBL_MIN = 1.4916681462400413e-154;
  GSL_ROOT3_DBL_MIN = 2.8126442852362996e-103;
  GSL_ROOT4_DBL_MIN = 1.2213386697554620e-77;
  GSL_ROOT5_DBL_MIN = 2.9476022969691763e-62;
  GSL_ROOT6_DBL_MIN = 5.3034368905798218e-52;
  GSL_LOG_DBL_MIN = (-7.0839641853226408e+02);
  GSL_DBL_MAX = 1.7976931348623157e+308;
  GSL_SQRT_DBL_MAX = 1.3407807929942596e+154;
  GSL_ROOT3_DBL_MAX = 5.6438030941222897e+102;
  GSL_ROOT4_DBL_MAX = 1.1579208923731620e+77;
  GSL_ROOT5_DBL_MAX = 4.4765466227572707e+61;
  GSL_ROOT6_DBL_MAX = 2.3756689782295612e+51;
  GSL_LOG_DBL_MAX = 7.0978271289338397e+02;
  GSL_FLT_EPSILON = 1.1920928955078125e-07;
  GSL_SQRT_FLT_EPSILON = 3.4526698300124393e-04;
  GSL_ROOT3_FLT_EPSILON = 4.9215666011518501e-03;
  GSL_ROOT4_FLT_EPSILON = 1.8581361171917516e-02;
  GSL_ROOT5_FLT_EPSILON = 4.1234622211652937e-02;
  GSL_ROOT6_FLT_EPSILON = 7.0153878019335827e-02;
  GSL_LOG_FLT_EPSILON = (-1.5942385152878742e+01);
  GSL_FLT_MIN = 1.1754943508222875e-38;
  GSL_SQRT_FLT_MIN = 1.0842021724855044e-19;
  GSL_ROOT3_FLT_MIN = 2.2737367544323241e-13;
  GSL_ROOT4_FLT_MIN = 3.2927225399135965e-10;
  GSL_ROOT5_FLT_MIN = 2.5944428542140822e-08;
  GSL_ROOT6_FLT_MIN = 4.7683715820312542e-07;
  GSL_LOG_FLT_MIN = (-8.7336544750553102e+01);
  GSL_FLT_MAX = 3.4028234663852886e+38;
  GSL_SQRT_FLT_MAX = 1.8446743523953730e+19;
  GSL_ROOT3_FLT_MAX = 6.9814635196223242e+12;
  GSL_ROOT4_FLT_MAX = 4.2949672319999986e+09;
  GSL_ROOT5_FLT_MAX = 5.0859007855960041e+07;
  GSL_ROOT6_FLT_MAX = 2.6422459233807749e+06;
  GSL_LOG_FLT_MAX = 8.8722839052068352e+01;
  GSL_SFLT_EPSILON = 4.8828125000000000e-04;
  GSL_SQRT_SFLT_EPSILON = 2.2097086912079612e-02;
  GSL_ROOT3_SFLT_EPSILON = 7.8745065618429588e-02;
  GSL_ROOT4_SFLT_EPSILON = 1.4865088937534013e-01;
  GSL_ROOT5_SFLT_EPSILON = 2.1763764082403100e-01;
  GSL_ROOT6_SFLT_EPSILON = 2.8061551207734325e-01;
  GSL_LOG_SFLT_EPSILON = (-7.6246189861593985e+00);
  GSL_MACH_EPS = GSL_DBL_EPSILON;
  GSL_SQRT_MACH_EPS = 3.2e-08;
  GSL_ROOT3_MACH_EPS = 1.0e-05;
  GSL_ROOT4_MACH_EPS = 0.000178;
  GSL_ROOT5_MACH_EPS = 0.00100;
  GSL_ROOT6_MACH_EPS = 0.00316;
  GSL_LOG_MACH_EPS = (-34.54);
  _GSL_PREC_T_NUM = 3;
  { TODO : Macro probably use invalid symbol "float": }
  (* INFINITY ( ( float ) ( _HUGE_ENUF * _HUGE_ENUF ) ) *)
  //GSL_POSINF = INFINITY;
  { TODO : Macro uses commented-out symbol "INFINITY": }
  (* GSL_NEGINF ( - INFINITY ) *)
  { TODO : Macro probably use invalid symbol "float": }
  (* NAN ( ( float ) ( INFINITY * 0.0F ) ) *)
  //GSL_NAN = NAN;
  GSL_POSZERO = (+0.0);
  GSL_NEGZERO = (-0.0);
  { TODO : Unable to convert function-like macro: }
  (* GSL_MAX ( a , b ) ( ( a ) > ( b ) ? ( a ) : ( b ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MIN ( a , b ) ( ( a ) < ( b ) ? ( a ) : ( b ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MAX_INT ( a , b ) GSL_MAX ( a , b ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MIN_INT ( a , b ) GSL_MIN ( a , b ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MAX_DBL ( a , b ) GSL_MAX ( a , b ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MIN_DBL ( a , b ) GSL_MIN ( a , b ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MAX_LDBL ( a , b ) GSL_MAX ( a , b ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MIN_LDBL ( a , b ) GSL_MIN ( a , b ) *)
  M_E = 2.71828182845904523536028747135;
  M_LOG2E = 1.44269504088896340735992468100;
  M_LOG10E = 0.43429448190325182765112891892;
  M_SQRT2 = 1.41421356237309504880168872421;
  M_SQRT1_2 = 0.70710678118654752440084436210;
  M_SQRT3 = 1.73205080756887729352744634151;
  M_PI = 3.14159265358979323846264338328;
  M_PI_2 = 1.57079632679489661923132169164;
  M_PI_4 = 0.78539816339744830961566084582;
  M_SQRTPI = 1.77245385090551602729816748334;
  M_2_SQRTPI = 1.12837916709551257389615890312;
  M_1_PI = 0.31830988618379067153776752675;
  M_2_PI = 0.63661977236758134307553505349;
  M_LN10 = 2.30258509299404568401799145468;
  M_LN2 = 0.69314718055994530941723212146;
  M_LNPI = 1.14472988584940017414342735135;
  M_EULER = 0.57721566490153286060651209008;
  { TODO : Unable to convert function-like macro: }
  (* GSL_IS_ODD ( n ) ( ( n ) & 1 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_IS_EVEN ( n ) ( ! ( GSL_IS_ODD ( n ) ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SIGN ( x ) ( ( x ) >= 0.0 ? 1 : - 1 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_IS_REAL ( x ) ( gsl_finite ( x ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_FN_EVAL ( F , x ) ( * ( ( F ) -> function ) ) ( x , ( F ) -> params ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_FN_FDF_EVAL_F ( FDF , x ) ( * ( ( FDF ) -> f ) ) ( x , ( FDF ) -> params ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_FN_FDF_EVAL_DF ( FDF , x ) ( * ( ( FDF ) -> df ) ) ( x , ( FDF ) -> params ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_FN_FDF_EVAL_F_DF ( FDF , x , y , dy ) ( * ( ( FDF ) -> fdf ) ) ( x , ( FDF ) -> params , ( y ) , ( dy ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_FN_VEC_EVAL ( F , x , y ) ( * ( ( F ) -> function ) ) ( x , y , ( F ) -> params ) *)
  GSL_BST_AVL_MAX_HEIGHT = 32;
  GSL_BST_RB_MAX_HEIGHT = 48;
  GSL_PREC_DOUBLE = 0;
  GSL_PREC_SINGLE = 1;
  GSL_PREC_APPROX = 2;
  { TODO : Unable to convert function-like macro: }
  (* GSL_MODE_PREC ( mt ) ( ( mt ) & ( unsigned int ) 7 ) *)
  GSL_MODE_DEFAULT = 0;
  { TODO : Macro probably use invalid symbol "gsl_complex_rect": }
  (* GSL_COMPLEX_ONE ( gsl_complex_rect ( 1.0 , 0.0 ) ) *)
  { TODO : Macro probably use invalid symbol "gsl_complex_rect": }
  (* GSL_COMPLEX_ZERO ( gsl_complex_rect ( 0.0 , 0.0 ) ) *)
  { TODO : Macro probably use invalid symbol "gsl_complex_rect": }
  (* GSL_COMPLEX_NEGONE ( gsl_complex_rect ( - 1.0 , 0.0 ) ) *)
  GSL_CONST_NUM_FINE_STRUCTURE = (7.297352533e-3);
  GSL_CONST_NUM_AVOGADRO = (6.02214199e23);
  GSL_CONST_NUM_YOTTA = (1e24);
  GSL_CONST_NUM_ZETTA = (1e21);
  GSL_CONST_NUM_EXA = (1e18);
  GSL_CONST_NUM_PETA = (1e15);
  GSL_CONST_NUM_TERA = (1e12);
  GSL_CONST_NUM_GIGA = (1e9);
  GSL_CONST_NUM_MEGA = (1e6);
  GSL_CONST_NUM_KILO = (1e3);
  GSL_CONST_NUM_MILLI = (1e-3);
  GSL_CONST_NUM_MICRO = (1e-6);
  GSL_CONST_NUM_NANO = (1e-9);
  GSL_CONST_NUM_PICO = (1e-12);
  GSL_CONST_NUM_FEMTO = (1e-15);
  GSL_CONST_NUM_ATTO = (1e-18);
  GSL_CONST_NUM_ZEPTO = (1e-21);
  GSL_CONST_NUM_YOCTO = (1e-24);
  GSL_CONST_CGS_SPEED_OF_LIGHT = (2.99792458e10);
  GSL_CONST_CGS_GRAVITATIONAL_CONSTANT = (6.673e-8);
  GSL_CONST_CGS_PLANCKS_CONSTANT_H = (6.62606896e-27);
  GSL_CONST_CGS_PLANCKS_CONSTANT_HBAR = (1.05457162825e-27);
  GSL_CONST_CGS_ASTRONOMICAL_UNIT = (1.49597870691e13);
  GSL_CONST_CGS_LIGHT_YEAR = (9.46053620707e17);
  GSL_CONST_CGS_PARSEC = (3.08567758135e18);
  GSL_CONST_CGS_GRAV_ACCEL = (9.80665e2);
  GSL_CONST_CGS_ELECTRON_VOLT = (1.602176487e-12);
  GSL_CONST_CGS_MASS_ELECTRON = (9.10938188e-28);
  GSL_CONST_CGS_MASS_MUON = (1.88353109e-25);
  GSL_CONST_CGS_MASS_PROTON = (1.67262158e-24);
  GSL_CONST_CGS_MASS_NEUTRON = (1.67492716e-24);
  GSL_CONST_CGS_RYDBERG = (2.17987196968e-11);
  GSL_CONST_CGS_BOLTZMANN = (1.3806504e-16);
  GSL_CONST_CGS_MOLAR_GAS = (8.314472e7);
  GSL_CONST_CGS_STANDARD_GAS_VOLUME = (2.2710981e4);
  GSL_CONST_CGS_MINUTE = (6e1);
  GSL_CONST_CGS_HOUR = (3.6e3);
  GSL_CONST_CGS_DAY = (8.64e4);
  GSL_CONST_CGS_WEEK = (6.048e5);
  GSL_CONST_CGS_INCH = (2.54e0);
  GSL_CONST_CGS_FOOT = (3.048e1);
  GSL_CONST_CGS_YARD = (9.144e1);
  GSL_CONST_CGS_MILE = (1.609344e5);
  GSL_CONST_CGS_NAUTICAL_MILE = (1.852e5);
  GSL_CONST_CGS_FATHOM = (1.8288e2);
  GSL_CONST_CGS_MIL = (2.54e-3);
  GSL_CONST_CGS_POINT = (3.52777777778e-2);
  GSL_CONST_CGS_TEXPOINT = (3.51459803515e-2);
  GSL_CONST_CGS_MICRON = (1e-4);
  GSL_CONST_CGS_ANGSTROM = (1e-8);
  GSL_CONST_CGS_HECTARE = (1e8);
  GSL_CONST_CGS_ACRE = (4.04685642241e7);
  GSL_CONST_CGS_BARN = (1e-24);
  GSL_CONST_CGS_LITER = (1e3);
  GSL_CONST_CGS_US_GALLON = (3.78541178402e3);
  GSL_CONST_CGS_QUART = (9.46352946004e2);
  GSL_CONST_CGS_PINT = (4.73176473002e2);
  GSL_CONST_CGS_CUP = (2.36588236501e2);
  GSL_CONST_CGS_FLUID_OUNCE = (2.95735295626e1);
  GSL_CONST_CGS_TABLESPOON = (1.47867647813e1);
  GSL_CONST_CGS_TEASPOON = (4.92892159375e0);
  GSL_CONST_CGS_CANADIAN_GALLON = (4.54609e3);
  GSL_CONST_CGS_UK_GALLON = (4.546092e3);
  GSL_CONST_CGS_MILES_PER_HOUR = (4.4704e1);
  GSL_CONST_CGS_KILOMETERS_PER_HOUR = (2.77777777778e1);
  GSL_CONST_CGS_KNOT = (5.14444444444e1);
  GSL_CONST_CGS_POUND_MASS = (4.5359237e2);
  GSL_CONST_CGS_OUNCE_MASS = (2.8349523125e1);
  GSL_CONST_CGS_TON = (9.0718474e5);
  GSL_CONST_CGS_METRIC_TON = (1e6);
  GSL_CONST_CGS_UK_TON = (1.0160469088e6);
  GSL_CONST_CGS_TROY_OUNCE = (3.1103475e1);
  GSL_CONST_CGS_CARAT = (2e-1);
  GSL_CONST_CGS_UNIFIED_ATOMIC_MASS = (1.660538782e-24);
  GSL_CONST_CGS_GRAM_FORCE = (9.80665e2);
  GSL_CONST_CGS_POUND_FORCE = (4.44822161526e5);
  GSL_CONST_CGS_KILOPOUND_FORCE = (4.44822161526e8);
  GSL_CONST_CGS_POUNDAL = (1.38255e4);
  GSL_CONST_CGS_CALORIE = (4.1868e7);
  GSL_CONST_CGS_BTU = (1.05505585262e10);
  GSL_CONST_CGS_THERM = (1.05506e15);
  GSL_CONST_CGS_HORSEPOWER = (7.457e9);
  GSL_CONST_CGS_BAR = (1e6);
  GSL_CONST_CGS_STD_ATMOSPHERE = (1.01325e6);
  GSL_CONST_CGS_TORR = (1.33322368421e3);
  GSL_CONST_CGS_METER_OF_MERCURY = (1.33322368421e6);
  GSL_CONST_CGS_INCH_OF_MERCURY = (3.38638815789e4);
  GSL_CONST_CGS_INCH_OF_WATER = (2.490889e3);
  GSL_CONST_CGS_PSI = (6.89475729317e4);
  GSL_CONST_CGS_POISE = (1e0);
  GSL_CONST_CGS_STOKES = (1e0);
  GSL_CONST_CGS_STILB = (1e0);
  GSL_CONST_CGS_LUMEN = (1e0);
  GSL_CONST_CGS_LUX = (1e-4);
  GSL_CONST_CGS_PHOT = (1e0);
  GSL_CONST_CGS_FOOTCANDLE = (1.076e-3);
  GSL_CONST_CGS_LAMBERT = (1e0);
  GSL_CONST_CGS_FOOTLAMBERT = (1.07639104e-3);
  GSL_CONST_CGS_CURIE = (3.7e10);
  GSL_CONST_CGS_ROENTGEN = (2.58e-7);
  GSL_CONST_CGS_RAD = (1e2);
  GSL_CONST_CGS_SOLAR_MASS = (1.98892e33);
  GSL_CONST_CGS_BOHR_RADIUS = (5.291772083e-9);
  GSL_CONST_CGS_NEWTON = (1e5);
  GSL_CONST_CGS_DYNE = (1e0);
  GSL_CONST_CGS_JOULE = (1e7);
  GSL_CONST_CGS_ERG = (1e0);
  GSL_CONST_CGS_STEFAN_BOLTZMANN_CONSTANT = (5.67040047374e-5);
  GSL_CONST_CGS_THOMSON_CROSS_SECTION = (6.65245893699e-25);
  GSL_CONST_MKS_SPEED_OF_LIGHT = (2.99792458e8);
  GSL_CONST_MKS_GRAVITATIONAL_CONSTANT = (6.673e-11);
  GSL_CONST_MKS_PLANCKS_CONSTANT_H = (6.62606896e-34);
  GSL_CONST_MKS_PLANCKS_CONSTANT_HBAR = (1.05457162825e-34);
  GSL_CONST_MKS_ASTRONOMICAL_UNIT = (1.49597870691e11);
  GSL_CONST_MKS_LIGHT_YEAR = (9.46053620707e15);
  GSL_CONST_MKS_PARSEC = (3.08567758135e16);
  GSL_CONST_MKS_GRAV_ACCEL = (9.80665e0);
  GSL_CONST_MKS_ELECTRON_VOLT = (1.602176487e-19);
  GSL_CONST_MKS_MASS_ELECTRON = (9.10938188e-31);
  GSL_CONST_MKS_MASS_MUON = (1.88353109e-28);
  GSL_CONST_MKS_MASS_PROTON = (1.67262158e-27);
  GSL_CONST_MKS_MASS_NEUTRON = (1.67492716e-27);
  GSL_CONST_MKS_RYDBERG = (2.17987196968e-18);
  GSL_CONST_MKS_BOLTZMANN = (1.3806504e-23);
  GSL_CONST_MKS_MOLAR_GAS = (8.314472e0);
  GSL_CONST_MKS_STANDARD_GAS_VOLUME = (2.2710981e-2);
  GSL_CONST_MKS_MINUTE = (6e1);
  GSL_CONST_MKS_HOUR = (3.6e3);
  GSL_CONST_MKS_DAY = (8.64e4);
  GSL_CONST_MKS_WEEK = (6.048e5);
  GSL_CONST_MKS_INCH = (2.54e-2);
  GSL_CONST_MKS_FOOT = (3.048e-1);
  GSL_CONST_MKS_YARD = (9.144e-1);
  GSL_CONST_MKS_MILE = (1.609344e3);
  GSL_CONST_MKS_NAUTICAL_MILE = (1.852e3);
  GSL_CONST_MKS_FATHOM = (1.8288e0);
  GSL_CONST_MKS_MIL = (2.54e-5);
  GSL_CONST_MKS_POINT = (3.52777777778e-4);
  GSL_CONST_MKS_TEXPOINT = (3.51459803515e-4);
  GSL_CONST_MKS_MICRON = (1e-6);
  GSL_CONST_MKS_ANGSTROM = (1e-10);
  GSL_CONST_MKS_HECTARE = (1e4);
  GSL_CONST_MKS_ACRE = (4.04685642241e3);
  GSL_CONST_MKS_BARN = (1e-28);
  GSL_CONST_MKS_LITER = (1e-3);
  GSL_CONST_MKS_US_GALLON = (3.78541178402e-3);
  GSL_CONST_MKS_QUART = (9.46352946004e-4);
  GSL_CONST_MKS_PINT = (4.73176473002e-4);
  GSL_CONST_MKS_CUP = (2.36588236501e-4);
  GSL_CONST_MKS_FLUID_OUNCE = (2.95735295626e-5);
  GSL_CONST_MKS_TABLESPOON = (1.47867647813e-5);
  GSL_CONST_MKS_TEASPOON = (4.92892159375e-6);
  GSL_CONST_MKS_CANADIAN_GALLON = (4.54609e-3);
  GSL_CONST_MKS_UK_GALLON = (4.546092e-3);
  GSL_CONST_MKS_MILES_PER_HOUR = (4.4704e-1);
  GSL_CONST_MKS_KILOMETERS_PER_HOUR = (2.77777777778e-1);
  GSL_CONST_MKS_KNOT = (5.14444444444e-1);
  GSL_CONST_MKS_POUND_MASS = (4.5359237e-1);
  GSL_CONST_MKS_OUNCE_MASS = (2.8349523125e-2);
  GSL_CONST_MKS_TON = (9.0718474e2);
  GSL_CONST_MKS_METRIC_TON = (1e3);
  GSL_CONST_MKS_UK_TON = (1.0160469088e3);
  GSL_CONST_MKS_TROY_OUNCE = (3.1103475e-2);
  GSL_CONST_MKS_CARAT = (2e-4);
  GSL_CONST_MKS_UNIFIED_ATOMIC_MASS = (1.660538782e-27);
  GSL_CONST_MKS_GRAM_FORCE = (9.80665e-3);
  GSL_CONST_MKS_POUND_FORCE = (4.44822161526e0);
  GSL_CONST_MKS_KILOPOUND_FORCE = (4.44822161526e3);
  GSL_CONST_MKS_POUNDAL = (1.38255e-1);
  GSL_CONST_MKS_CALORIE = (4.1868e0);
  GSL_CONST_MKS_BTU = (1.05505585262e3);
  GSL_CONST_MKS_THERM = (1.05506e8);
  GSL_CONST_MKS_HORSEPOWER = (7.457e2);
  GSL_CONST_MKS_BAR = (1e5);
  GSL_CONST_MKS_STD_ATMOSPHERE = (1.01325e5);
  GSL_CONST_MKS_TORR = (1.33322368421e2);
  GSL_CONST_MKS_METER_OF_MERCURY = (1.33322368421e5);
  GSL_CONST_MKS_INCH_OF_MERCURY = (3.38638815789e3);
  GSL_CONST_MKS_INCH_OF_WATER = (2.490889e2);
  GSL_CONST_MKS_PSI = (6.89475729317e3);
  GSL_CONST_MKS_POISE = (1e-1);
  GSL_CONST_MKS_STOKES = (1e-4);
  GSL_CONST_MKS_STILB = (1e4);
  GSL_CONST_MKS_LUMEN = (1e0);
  GSL_CONST_MKS_LUX = (1e0);
  GSL_CONST_MKS_PHOT = (1e4);
  GSL_CONST_MKS_FOOTCANDLE = (1.076e1);
  GSL_CONST_MKS_LAMBERT = (1e4);
  GSL_CONST_MKS_FOOTLAMBERT = (1.07639104e1);
  GSL_CONST_MKS_CURIE = (3.7e10);
  GSL_CONST_MKS_ROENTGEN = (2.58e-4);
  GSL_CONST_MKS_RAD = (1e-2);
  GSL_CONST_MKS_SOLAR_MASS = (1.98892e30);
  GSL_CONST_MKS_BOHR_RADIUS = (5.291772083e-11);
  GSL_CONST_MKS_NEWTON = (1e0);
  GSL_CONST_MKS_DYNE = (1e-5);
  GSL_CONST_MKS_JOULE = (1e0);
  GSL_CONST_MKS_ERG = (1e-7);
  GSL_CONST_MKS_STEFAN_BOLTZMANN_CONSTANT = (5.67040047374e-8);
  GSL_CONST_MKS_THOMSON_CROSS_SECTION = (6.65245893699e-29);
  GSL_CONST_MKS_BOHR_MAGNETON = (9.27400899e-24);
  GSL_CONST_MKS_NUCLEAR_MAGNETON = (5.05078317e-27);
  GSL_CONST_MKS_ELECTRON_MAGNETIC_MOMENT = (9.28476362e-24);
  GSL_CONST_MKS_PROTON_MAGNETIC_MOMENT = (1.410606633e-26);
  GSL_CONST_MKS_FARADAY = (9.64853429775e4);
  GSL_CONST_MKS_ELECTRON_CHARGE = (1.602176487e-19);
  GSL_CONST_MKS_VACUUM_PERMITTIVITY = (8.854187817e-12);
  GSL_CONST_MKS_VACUUM_PERMEABILITY = (1.25663706144e-6);
  GSL_CONST_MKS_DEBYE = (3.33564095198e-30);
  GSL_CONST_MKS_GAUSS = (1e-4);
  GSL_CONST_CGSM_SPEED_OF_LIGHT = (2.99792458e10);
  GSL_CONST_CGSM_GRAVITATIONAL_CONSTANT = (6.673e-8);
  GSL_CONST_CGSM_PLANCKS_CONSTANT_H = (6.62606896e-27);
  GSL_CONST_CGSM_PLANCKS_CONSTANT_HBAR = (1.05457162825e-27);
  GSL_CONST_CGSM_ASTRONOMICAL_UNIT = (1.49597870691e13);
  GSL_CONST_CGSM_LIGHT_YEAR = (9.46053620707e17);
  GSL_CONST_CGSM_PARSEC = (3.08567758135e18);
  GSL_CONST_CGSM_GRAV_ACCEL = (9.80665e2);
  GSL_CONST_CGSM_ELECTRON_VOLT = (1.602176487e-12);
  GSL_CONST_CGSM_MASS_ELECTRON = (9.10938188e-28);
  GSL_CONST_CGSM_MASS_MUON = (1.88353109e-25);
  GSL_CONST_CGSM_MASS_PROTON = (1.67262158e-24);
  GSL_CONST_CGSM_MASS_NEUTRON = (1.67492716e-24);
  GSL_CONST_CGSM_RYDBERG = (2.17987196968e-11);
  GSL_CONST_CGSM_BOLTZMANN = (1.3806504e-16);
  GSL_CONST_CGSM_MOLAR_GAS = (8.314472e7);
  GSL_CONST_CGSM_STANDARD_GAS_VOLUME = (2.2710981e4);
  GSL_CONST_CGSM_MINUTE = (6e1);
  GSL_CONST_CGSM_HOUR = (3.6e3);
  GSL_CONST_CGSM_DAY = (8.64e4);
  GSL_CONST_CGSM_WEEK = (6.048e5);
  GSL_CONST_CGSM_INCH = (2.54e0);
  GSL_CONST_CGSM_FOOT = (3.048e1);
  GSL_CONST_CGSM_YARD = (9.144e1);
  GSL_CONST_CGSM_MILE = (1.609344e5);
  GSL_CONST_CGSM_NAUTICAL_MILE = (1.852e5);
  GSL_CONST_CGSM_FATHOM = (1.8288e2);
  GSL_CONST_CGSM_MIL = (2.54e-3);
  GSL_CONST_CGSM_POINT = (3.52777777778e-2);
  GSL_CONST_CGSM_TEXPOINT = (3.51459803515e-2);
  GSL_CONST_CGSM_MICRON = (1e-4);
  GSL_CONST_CGSM_ANGSTROM = (1e-8);
  GSL_CONST_CGSM_HECTARE = (1e8);
  GSL_CONST_CGSM_ACRE = (4.04685642241e7);
  GSL_CONST_CGSM_BARN = (1e-24);
  GSL_CONST_CGSM_LITER = (1e3);
  GSL_CONST_CGSM_US_GALLON = (3.78541178402e3);
  GSL_CONST_CGSM_QUART = (9.46352946004e2);
  GSL_CONST_CGSM_PINT = (4.73176473002e2);
  GSL_CONST_CGSM_CUP = (2.36588236501e2);
  GSL_CONST_CGSM_FLUID_OUNCE = (2.95735295626e1);
  GSL_CONST_CGSM_TABLESPOON = (1.47867647813e1);
  GSL_CONST_CGSM_TEASPOON = (4.92892159375e0);
  GSL_CONST_CGSM_CANADIAN_GALLON = (4.54609e3);
  GSL_CONST_CGSM_UK_GALLON = (4.546092e3);
  GSL_CONST_CGSM_MILES_PER_HOUR = (4.4704e1);
  GSL_CONST_CGSM_KILOMETERS_PER_HOUR = (2.77777777778e1);
  GSL_CONST_CGSM_KNOT = (5.14444444444e1);
  GSL_CONST_CGSM_POUND_MASS = (4.5359237e2);
  GSL_CONST_CGSM_OUNCE_MASS = (2.8349523125e1);
  GSL_CONST_CGSM_TON = (9.0718474e5);
  GSL_CONST_CGSM_METRIC_TON = (1e6);
  GSL_CONST_CGSM_UK_TON = (1.0160469088e6);
  GSL_CONST_CGSM_TROY_OUNCE = (3.1103475e1);
  GSL_CONST_CGSM_CARAT = (2e-1);
  GSL_CONST_CGSM_UNIFIED_ATOMIC_MASS = (1.660538782e-24);
  GSL_CONST_CGSM_GRAM_FORCE = (9.80665e2);
  GSL_CONST_CGSM_POUND_FORCE = (4.44822161526e5);
  GSL_CONST_CGSM_KILOPOUND_FORCE = (4.44822161526e8);
  GSL_CONST_CGSM_POUNDAL = (1.38255e4);
  GSL_CONST_CGSM_CALORIE = (4.1868e7);
  GSL_CONST_CGSM_BTU = (1.05505585262e10);
  GSL_CONST_CGSM_THERM = (1.05506e15);
  GSL_CONST_CGSM_HORSEPOWER = (7.457e9);
  GSL_CONST_CGSM_BAR = (1e6);
  GSL_CONST_CGSM_STD_ATMOSPHERE = (1.01325e6);
  GSL_CONST_CGSM_TORR = (1.33322368421e3);
  GSL_CONST_CGSM_METER_OF_MERCURY = (1.33322368421e6);
  GSL_CONST_CGSM_INCH_OF_MERCURY = (3.38638815789e4);
  GSL_CONST_CGSM_INCH_OF_WATER = (2.490889e3);
  GSL_CONST_CGSM_PSI = (6.89475729317e4);
  GSL_CONST_CGSM_POISE = (1e0);
  GSL_CONST_CGSM_STOKES = (1e0);
  GSL_CONST_CGSM_STILB = (1e0);
  GSL_CONST_CGSM_LUMEN = (1e0);
  GSL_CONST_CGSM_LUX = (1e-4);
  GSL_CONST_CGSM_PHOT = (1e0);
  GSL_CONST_CGSM_FOOTCANDLE = (1.076e-3);
  GSL_CONST_CGSM_LAMBERT = (1e0);
  GSL_CONST_CGSM_FOOTLAMBERT = (1.07639104e-3);
  GSL_CONST_CGSM_CURIE = (3.7e10);
  GSL_CONST_CGSM_ROENTGEN = (2.58e-8);
  GSL_CONST_CGSM_RAD = (1e2);
  GSL_CONST_CGSM_SOLAR_MASS = (1.98892e33);
  GSL_CONST_CGSM_BOHR_RADIUS = (5.291772083e-9);
  GSL_CONST_CGSM_NEWTON = (1e5);
  GSL_CONST_CGSM_DYNE = (1e0);
  GSL_CONST_CGSM_JOULE = (1e7);
  GSL_CONST_CGSM_ERG = (1e0);
  GSL_CONST_CGSM_STEFAN_BOLTZMANN_CONSTANT = (5.67040047374e-5);
  GSL_CONST_CGSM_THOMSON_CROSS_SECTION = (6.65245893699e-25);
  GSL_CONST_CGSM_BOHR_MAGNETON = (9.27400899e-21);
  GSL_CONST_CGSM_NUCLEAR_MAGNETON = (5.05078317e-24);
  GSL_CONST_CGSM_ELECTRON_MAGNETIC_MOMENT = (9.28476362e-21);
  GSL_CONST_CGSM_PROTON_MAGNETIC_MOMENT = (1.410606633e-23);
  GSL_CONST_CGSM_FARADAY = (9.64853429775e3);
  GSL_CONST_CGSM_ELECTRON_CHARGE = (1.602176487e-20);
  GSL_CONST_MKSA_SPEED_OF_LIGHT = (2.99792458e8);
  GSL_CONST_MKSA_GRAVITATIONAL_CONSTANT = (6.673e-11);
  GSL_CONST_MKSA_PLANCKS_CONSTANT_H = (6.62606896e-34);
  GSL_CONST_MKSA_PLANCKS_CONSTANT_HBAR = (1.05457162825e-34);
  GSL_CONST_MKSA_ASTRONOMICAL_UNIT = (1.49597870691e11);
  GSL_CONST_MKSA_LIGHT_YEAR = (9.46053620707e15);
  GSL_CONST_MKSA_PARSEC = (3.08567758135e16);
  GSL_CONST_MKSA_GRAV_ACCEL = (9.80665e0);
  GSL_CONST_MKSA_ELECTRON_VOLT = (1.602176487e-19);
  GSL_CONST_MKSA_MASS_ELECTRON = (9.10938188e-31);
  GSL_CONST_MKSA_MASS_MUON = (1.88353109e-28);
  GSL_CONST_MKSA_MASS_PROTON = (1.67262158e-27);
  GSL_CONST_MKSA_MASS_NEUTRON = (1.67492716e-27);
  GSL_CONST_MKSA_RYDBERG = (2.17987196968e-18);
  GSL_CONST_MKSA_BOLTZMANN = (1.3806504e-23);
  GSL_CONST_MKSA_MOLAR_GAS = (8.314472e0);
  GSL_CONST_MKSA_STANDARD_GAS_VOLUME = (2.2710981e-2);
  GSL_CONST_MKSA_MINUTE = (6e1);
  GSL_CONST_MKSA_HOUR = (3.6e3);
  GSL_CONST_MKSA_DAY = (8.64e4);
  GSL_CONST_MKSA_WEEK = (6.048e5);
  GSL_CONST_MKSA_INCH = (2.54e-2);
  GSL_CONST_MKSA_FOOT = (3.048e-1);
  GSL_CONST_MKSA_YARD = (9.144e-1);
  GSL_CONST_MKSA_MILE = (1.609344e3);
  GSL_CONST_MKSA_NAUTICAL_MILE = (1.852e3);
  GSL_CONST_MKSA_FATHOM = (1.8288e0);
  GSL_CONST_MKSA_MIL = (2.54e-5);
  GSL_CONST_MKSA_POINT = (3.52777777778e-4);
  GSL_CONST_MKSA_TEXPOINT = (3.51459803515e-4);
  GSL_CONST_MKSA_MICRON = (1e-6);
  GSL_CONST_MKSA_ANGSTROM = (1e-10);
  GSL_CONST_MKSA_HECTARE = (1e4);
  GSL_CONST_MKSA_ACRE = (4.04685642241e3);
  GSL_CONST_MKSA_BARN = (1e-28);
  GSL_CONST_MKSA_LITER = (1e-3);
  GSL_CONST_MKSA_US_GALLON = (3.78541178402e-3);
  GSL_CONST_MKSA_QUART = (9.46352946004e-4);
  GSL_CONST_MKSA_PINT = (4.73176473002e-4);
  GSL_CONST_MKSA_CUP = (2.36588236501e-4);
  GSL_CONST_MKSA_FLUID_OUNCE = (2.95735295626e-5);
  GSL_CONST_MKSA_TABLESPOON = (1.47867647813e-5);
  GSL_CONST_MKSA_TEASPOON = (4.92892159375e-6);
  GSL_CONST_MKSA_CANADIAN_GALLON = (4.54609e-3);
  GSL_CONST_MKSA_UK_GALLON = (4.546092e-3);
  GSL_CONST_MKSA_MILES_PER_HOUR = (4.4704e-1);
  GSL_CONST_MKSA_KILOMETERS_PER_HOUR = (2.77777777778e-1);
  GSL_CONST_MKSA_KNOT = (5.14444444444e-1);
  GSL_CONST_MKSA_POUND_MASS = (4.5359237e-1);
  GSL_CONST_MKSA_OUNCE_MASS = (2.8349523125e-2);
  GSL_CONST_MKSA_TON = (9.0718474e2);
  GSL_CONST_MKSA_METRIC_TON = (1e3);
  GSL_CONST_MKSA_UK_TON = (1.0160469088e3);
  GSL_CONST_MKSA_TROY_OUNCE = (3.1103475e-2);
  GSL_CONST_MKSA_CARAT = (2e-4);
  GSL_CONST_MKSA_UNIFIED_ATOMIC_MASS = (1.660538782e-27);
  GSL_CONST_MKSA_GRAM_FORCE = (9.80665e-3);
  GSL_CONST_MKSA_POUND_FORCE = (4.44822161526e0);
  GSL_CONST_MKSA_KILOPOUND_FORCE = (4.44822161526e3);
  GSL_CONST_MKSA_POUNDAL = (1.38255e-1);
  GSL_CONST_MKSA_CALORIE = (4.1868e0);
  GSL_CONST_MKSA_BTU = (1.05505585262e3);
  GSL_CONST_MKSA_THERM = (1.05506e8);
  GSL_CONST_MKSA_HORSEPOWER = (7.457e2);
  GSL_CONST_MKSA_BAR = (1e5);
  GSL_CONST_MKSA_STD_ATMOSPHERE = (1.01325e5);
  GSL_CONST_MKSA_TORR = (1.33322368421e2);
  GSL_CONST_MKSA_METER_OF_MERCURY = (1.33322368421e5);
  GSL_CONST_MKSA_INCH_OF_MERCURY = (3.38638815789e3);
  GSL_CONST_MKSA_INCH_OF_WATER = (2.490889e2);
  GSL_CONST_MKSA_PSI = (6.89475729317e3);
  GSL_CONST_MKSA_POISE = (1e-1);
  GSL_CONST_MKSA_STOKES = (1e-4);
  GSL_CONST_MKSA_STILB = (1e4);
  GSL_CONST_MKSA_LUMEN = (1e0);
  GSL_CONST_MKSA_LUX = (1e0);
  GSL_CONST_MKSA_PHOT = (1e4);
  GSL_CONST_MKSA_FOOTCANDLE = (1.076e1);
  GSL_CONST_MKSA_LAMBERT = (1e4);
  GSL_CONST_MKSA_FOOTLAMBERT = (1.07639104e1);
  GSL_CONST_MKSA_CURIE = (3.7e10);
  GSL_CONST_MKSA_ROENTGEN = (2.58e-4);
  GSL_CONST_MKSA_RAD = (1e-2);
  GSL_CONST_MKSA_SOLAR_MASS = (1.98892e30);
  GSL_CONST_MKSA_BOHR_RADIUS = (5.291772083e-11);
  GSL_CONST_MKSA_NEWTON = (1e0);
  GSL_CONST_MKSA_DYNE = (1e-5);
  GSL_CONST_MKSA_JOULE = (1e0);
  GSL_CONST_MKSA_ERG = (1e-7);
  GSL_CONST_MKSA_STEFAN_BOLTZMANN_CONSTANT = (5.67040047374e-8);
  GSL_CONST_MKSA_THOMSON_CROSS_SECTION = (6.65245893699e-29);
  GSL_CONST_MKSA_BOHR_MAGNETON = (9.27400899e-24);
  GSL_CONST_MKSA_NUCLEAR_MAGNETON = (5.05078317e-27);
  GSL_CONST_MKSA_ELECTRON_MAGNETIC_MOMENT = (9.28476362e-24);
  GSL_CONST_MKSA_PROTON_MAGNETIC_MOMENT = (1.410606633e-26);
  GSL_CONST_MKSA_FARADAY = (9.64853429775e4);
  GSL_CONST_MKSA_ELECTRON_CHARGE = (1.602176487e-19);
  GSL_CONST_MKSA_VACUUM_PERMITTIVITY = (8.854187817e-12);
  GSL_CONST_MKSA_VACUUM_PERMEABILITY = (1.25663706144e-6);
  GSL_CONST_MKSA_DEBYE = (3.33564095198e-30);
  GSL_CONST_MKSA_GAUSS = (1e-4);
  { TODO : Unable to convert function-like macro: }
  (* GSL_MOVSTAT_FN_EVAL ( F , n , x ) ( * ( ( F ) -> function ) ) ( ( n ) , ( x ) , ( F ) -> params ) *)
  GSL_MESSAGE_MASK = $ffffffff;
  { TODO : Unable to convert function-like macro: }
  (* GSL_MESSAGE ( message , mask ) do { if ( mask & GSL_MESSAGE_MASK ) gsl_message ( message , __FILE__ , __LINE__ , mask ) ; } while ( 0 ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MONTE_FN_EVAL ( F , x ) ( * ( ( F ) -> f ) ) ( x , ( F ) -> dim , ( F ) -> params ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MULTIFIT_FN_EVAL ( F , x , y ) ( * ( ( F ) -> f ) ) ( x , ( F ) -> params , ( y ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MULTIMIN_FN_EVAL ( F , x ) ( * ( ( F ) -> f ) ) ( x , ( F ) -> params ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MULTIMIN_FN_EVAL_F ( F , x ) ( * ( ( F ) -> f ) ) ( x , ( F ) -> params ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MULTIMIN_FN_EVAL_DF ( F , x , g ) ( * ( ( F ) -> df ) ) ( x , ( F ) -> params , ( g ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MULTIMIN_FN_EVAL_F_DF ( F , x , y , g ) ( * ( ( F ) -> fdf ) ) ( x , ( F ) -> params , ( y ) , ( g ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MULTIROOT_FN_EVAL ( F , x , y ) ( * ( ( F ) -> f ) ) ( x , ( F ) -> params , ( y ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MULTIROOT_FN_EVAL_F ( F , x , y ) ( ( * ( ( F ) -> f ) ) ( x , ( F ) -> params , ( y ) ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MULTIROOT_FN_EVAL_DF ( F , x , dy ) ( ( * ( ( F ) -> df ) ) ( x , ( F ) -> params , ( dy ) ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_MULTIROOT_FN_EVAL_F_DF ( F , x , y , dy ) ( ( * ( ( F ) -> fdf ) ) ( x , ( F ) -> params , ( y ) , ( dy ) ) ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ODEIV_FN_EVAL ( S , t , y , f ) ( * ( ( S ) -> function ) ) ( t , y , f , ( S ) -> params ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_ODEIV_JA_EVAL ( S , t , y , dfdy , dfdt ) ( * ( ( S ) -> jacobian ) ) ( t , y , dfdy , dfdt , ( S ) -> params ) *)
  GSL_ODEIV_HADJ_INC = 1;
  GSL_ODEIV_HADJ_NIL = 0;
  GSL_ODEIV_HADJ_DEC = (-1);
  { TODO : Unable to convert function-like macro: }
  (* GSL_SF_RESULT_SET ( r , v , e ) do { ( r ) -> val = ( v ) ; ( r ) -> err = ( e ) ; } while ( 0 ) *)
  GSL_SF_GAMMA_XMAX = 171.0;
  GSL_SF_FACT_NMAX = 170;
  GSL_SF_DOUBLEFACT_NMAX = 297;
  GSL_SF_MATHIEU_COEFF = 100;
  { TODO : Unable to convert function-like macro: }
  (* GSL_SPMATRIX_ISCOO ( m ) ( ( m ) -> sptype == GSL_SPMATRIX_COO ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SPMATRIX_ISCSC ( m ) ( ( m ) -> sptype == GSL_SPMATRIX_CSC ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SPMATRIX_ISCSR ( m ) ( ( m ) -> sptype == GSL_SPMATRIX_CSR ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SPMATRIX_ISTRIPLET ( m ) GSL_SPMATRIX_ISCOO ( m ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SPMATRIX_ISCCS ( m ) GSL_SPMATRIX_ISCSC ( m ) *)
  { TODO : Unable to convert function-like macro: }
  (* GSL_SPMATRIX_ISCRS ( m ) GSL_SPMATRIX_ISCSR ( m ) *)
  GSL_SPMATRIX_FLG_GROW = (1 shl 0);
  GSL_SPMATRIX_FLG_FIXED = (1 shl 1);
  { TODO : Unable to convert function-like macro: }
  (* GSL_SPMATRIX_COMPARE_ROWCOL ( m , ia , ja , ib , jb ) ( ( ia ) < ( ib ) ? - 1 : ( ( ia ) > ( ib ) ? 1 : ( ( ja ) < ( jb ) ? - 1 : ( ( ja ) > ( jb ) ) ) ) ) *)
  GSL_VERSION = '2.5+';
  GSL_MAJOR_VERSION = 2;
  GSL_MINOR_VERSION = 5;

type
  // Forward declarations
  PPDouble = ^PDouble;
  PNativeUInt = ^NativeUInt;
  PPointer = ^Pointer;
  Pgsl_complex_long_double = ^gsl_complex_long_double;
  Pgsl_complex = ^gsl_complex;
  Pgsl_complex_float = ^gsl_complex_float;
  Pgsl_block_long_double_struct = ^gsl_block_long_double_struct;
  Pgsl_vector_long_double = ^gsl_vector_long_double;
  P_gsl_vector_long_double_view = ^_gsl_vector_long_double_view;
  P_gsl_vector_long_double_const_view = ^_gsl_vector_long_double_const_view;
  Pgsl_block_complex_long_double_struct = ^gsl_block_complex_long_double_struct;
  Pgsl_vector_complex_long_double = ^gsl_vector_complex_long_double;
  P_gsl_vector_complex_long_double_view = ^_gsl_vector_complex_long_double_view;
  P_gsl_vector_complex_long_double_const_view = ^_gsl_vector_complex_long_double_const_view;
  Pgsl_block_struct = ^gsl_block_struct;
  Pgsl_vector = ^gsl_vector;
  P_gsl_vector_view = ^_gsl_vector_view;
  P_gsl_vector_const_view = ^_gsl_vector_const_view;
  Pgsl_block_complex_struct = ^gsl_block_complex_struct;
  Pgsl_vector_complex = ^gsl_vector_complex;
  P_gsl_vector_complex_view = ^_gsl_vector_complex_view;
  P_gsl_vector_complex_const_view = ^_gsl_vector_complex_const_view;
  Pgsl_block_float_struct = ^gsl_block_float_struct;
  Pgsl_vector_float = ^gsl_vector_float;
  P_gsl_vector_float_view = ^_gsl_vector_float_view;
  P_gsl_vector_float_const_view = ^_gsl_vector_float_const_view;
  Pgsl_block_complex_float_struct = ^gsl_block_complex_float_struct;
  Pgsl_vector_complex_float = ^gsl_vector_complex_float;
  P_gsl_vector_complex_float_view = ^_gsl_vector_complex_float_view;
  P_gsl_vector_complex_float_const_view = ^_gsl_vector_complex_float_const_view;
  Pgsl_block_ulong_struct = ^gsl_block_ulong_struct;
  Pgsl_vector_ulong = ^gsl_vector_ulong;
  P_gsl_vector_ulong_view = ^_gsl_vector_ulong_view;
  P_gsl_vector_ulong_const_view = ^_gsl_vector_ulong_const_view;
  Pgsl_block_long_struct = ^gsl_block_long_struct;
  Pgsl_vector_long = ^gsl_vector_long;
  P_gsl_vector_long_view = ^_gsl_vector_long_view;
  P_gsl_vector_long_const_view = ^_gsl_vector_long_const_view;
  Pgsl_block_uint_struct = ^gsl_block_uint_struct;
  Pgsl_vector_uint = ^gsl_vector_uint;
  P_gsl_vector_uint_view = ^_gsl_vector_uint_view;
  P_gsl_vector_uint_const_view = ^_gsl_vector_uint_const_view;
  Pgsl_block_int_struct = ^gsl_block_int_struct;
  Pgsl_vector_int = ^gsl_vector_int;
  P_gsl_vector_int_view = ^_gsl_vector_int_view;
  P_gsl_vector_int_const_view = ^_gsl_vector_int_const_view;
  Pgsl_block_ushort_struct = ^gsl_block_ushort_struct;
  Pgsl_vector_ushort = ^gsl_vector_ushort;
  P_gsl_vector_ushort_view = ^_gsl_vector_ushort_view;
  P_gsl_vector_ushort_const_view = ^_gsl_vector_ushort_const_view;
  Pgsl_block_short_struct = ^gsl_block_short_struct;
  Pgsl_vector_short = ^gsl_vector_short;
  P_gsl_vector_short_view = ^_gsl_vector_short_view;
  P_gsl_vector_short_const_view = ^_gsl_vector_short_const_view;
  Pgsl_block_uchar_struct = ^gsl_block_uchar_struct;
  Pgsl_vector_uchar = ^gsl_vector_uchar;
  P_gsl_vector_uchar_view = ^_gsl_vector_uchar_view;
  P_gsl_vector_uchar_const_view = ^_gsl_vector_uchar_const_view;
  Pgsl_block_char_struct = ^gsl_block_char_struct;
  Pgsl_vector_char = ^gsl_vector_char;
  P_gsl_vector_char_view = ^_gsl_vector_char_view;
  P_gsl_vector_char_const_view = ^_gsl_vector_char_const_view;
  Pgsl_matrix_complex_long_double = ^gsl_matrix_complex_long_double;
  P_gsl_matrix_complex_long_double_view = ^_gsl_matrix_complex_long_double_view;
  P_gsl_matrix_complex_long_double_const_view = ^_gsl_matrix_complex_long_double_const_view;
  Pgsl_matrix_complex = ^gsl_matrix_complex;
  P_gsl_matrix_complex_view = ^_gsl_matrix_complex_view;
  P_gsl_matrix_complex_const_view = ^_gsl_matrix_complex_const_view;
  Pgsl_matrix_complex_float = ^gsl_matrix_complex_float;
  P_gsl_matrix_complex_float_view = ^_gsl_matrix_complex_float_view;
  P_gsl_matrix_complex_float_const_view = ^_gsl_matrix_complex_float_const_view;
  Pgsl_matrix_long_double = ^gsl_matrix_long_double;
  P_gsl_matrix_long_double_view = ^_gsl_matrix_long_double_view;
  P_gsl_matrix_long_double_const_view = ^_gsl_matrix_long_double_const_view;
  Pgsl_matrix = ^gsl_matrix;
  P_gsl_matrix_view = ^_gsl_matrix_view;
  P_gsl_matrix_const_view = ^_gsl_matrix_const_view;
  Pgsl_matrix_float = ^gsl_matrix_float;
  P_gsl_matrix_float_view = ^_gsl_matrix_float_view;
  P_gsl_matrix_float_const_view = ^_gsl_matrix_float_const_view;
  Pgsl_matrix_ulong = ^gsl_matrix_ulong;
  P_gsl_matrix_ulong_view = ^_gsl_matrix_ulong_view;
  P_gsl_matrix_ulong_const_view = ^_gsl_matrix_ulong_const_view;
  Pgsl_matrix_long = ^gsl_matrix_long;
  P_gsl_matrix_long_view = ^_gsl_matrix_long_view;
  P_gsl_matrix_long_const_view = ^_gsl_matrix_long_const_view;
  Pgsl_matrix_uint = ^gsl_matrix_uint;
  P_gsl_matrix_uint_view = ^_gsl_matrix_uint_view;
  P_gsl_matrix_uint_const_view = ^_gsl_matrix_uint_const_view;
  Pgsl_matrix_int = ^gsl_matrix_int;
  P_gsl_matrix_int_view = ^_gsl_matrix_int_view;
  P_gsl_matrix_int_const_view = ^_gsl_matrix_int_const_view;
  Pgsl_matrix_ushort = ^gsl_matrix_ushort;
  P_gsl_matrix_ushort_view = ^_gsl_matrix_ushort_view;
  P_gsl_matrix_ushort_const_view = ^_gsl_matrix_ushort_const_view;
  Pgsl_matrix_short = ^gsl_matrix_short;
  P_gsl_matrix_short_view = ^_gsl_matrix_short_view;
  P_gsl_matrix_short_const_view = ^_gsl_matrix_short_const_view;
  Pgsl_matrix_uchar = ^gsl_matrix_uchar;
  P_gsl_matrix_uchar_view = ^_gsl_matrix_uchar_view;
  P_gsl_matrix_uchar_const_view = ^_gsl_matrix_uchar_const_view;
  Pgsl_matrix_char = ^gsl_matrix_char;
  P_gsl_matrix_char_view = ^_gsl_matrix_char_view;
  P_gsl_matrix_char_const_view = ^_gsl_matrix_char_const_view;
  Pgsl_function_struct = ^gsl_function_struct;
  Pgsl_function_fdf_struct = ^gsl_function_fdf_struct;
  Pgsl_function_vec_struct = ^gsl_function_vec_struct;
  Pgsl_bspline_workspace = ^gsl_bspline_workspace;
  Pgsl_bst_allocator = ^gsl_bst_allocator;
  Pgsl_bst_avl_node = ^gsl_bst_avl_node;
  Pgsl_bst_avl_table = ^gsl_bst_avl_table;
  Pgsl_bst_avl_traverser = ^gsl_bst_avl_traverser;
  Pgsl_bst_rb_node = ^gsl_bst_rb_node;
  Pgsl_bst_rb_table = ^gsl_bst_rb_table;
  Pgsl_bst_rb_traverser = ^gsl_bst_rb_traverser;
  Pgsl_bst_type = ^gsl_bst_type;
  Pgsl_bst_workspace = ^gsl_bst_workspace;
  Pgsl_bst_trav = ^gsl_bst_trav;
  Pgsl_cheb_series_struct = ^gsl_cheb_series_struct;
  Pgsl_combination_struct = ^gsl_combination_struct;
  Pgsl_dht_struct = ^gsl_dht_struct;
  Pgsl_eigen_symm_workspace = ^gsl_eigen_symm_workspace;
  Pgsl_eigen_symmv_workspace = ^gsl_eigen_symmv_workspace;
  Pgsl_eigen_herm_workspace = ^gsl_eigen_herm_workspace;
  Pgsl_eigen_hermv_workspace = ^gsl_eigen_hermv_workspace;
  Pgsl_eigen_francis_workspace = ^gsl_eigen_francis_workspace;
  Pgsl_eigen_nonsymm_workspace = ^gsl_eigen_nonsymm_workspace;
  Pgsl_eigen_nonsymmv_workspace = ^gsl_eigen_nonsymmv_workspace;
  Pgsl_eigen_gensymm_workspace = ^gsl_eigen_gensymm_workspace;
  Pgsl_eigen_gensymmv_workspace = ^gsl_eigen_gensymmv_workspace;
  Pgsl_eigen_genherm_workspace = ^gsl_eigen_genherm_workspace;
  Pgsl_eigen_genhermv_workspace = ^gsl_eigen_genhermv_workspace;
  Pgsl_eigen_gen_workspace = ^gsl_eigen_gen_workspace;
  Pgsl_eigen_genv_workspace = ^gsl_eigen_genv_workspace;
  Pgsl_fft_complex_wavetable = ^gsl_fft_complex_wavetable;
  Pgsl_fft_complex_workspace = ^gsl_fft_complex_workspace;
  Pgsl_fft_complex_wavetable_float = ^gsl_fft_complex_wavetable_float;
  Pgsl_fft_complex_workspace_float = ^gsl_fft_complex_workspace_float;
  Pgsl_fft_real_wavetable = ^gsl_fft_real_wavetable;
  Pgsl_fft_real_workspace = ^gsl_fft_real_workspace;
  Pgsl_fft_halfcomplex_wavetable = ^gsl_fft_halfcomplex_wavetable;
  Pgsl_fft_real_wavetable_float = ^gsl_fft_real_wavetable_float;
  Pgsl_fft_real_workspace_float = ^gsl_fft_real_workspace_float;
  Pgsl_fft_halfcomplex_wavetable_float = ^gsl_fft_halfcomplex_wavetable_float;
  Pgsl_movstat_accum = ^gsl_movstat_accum;
  Pgsl_movstat_function = ^gsl_movstat_function;
  Pgsl_movstat_workspace = ^gsl_movstat_workspace;
  Pgsl_filter_gaussian_workspace = ^gsl_filter_gaussian_workspace;
  Pgsl_filter_median_workspace = ^gsl_filter_median_workspace;
  Pgsl_filter_rmedian_workspace = ^gsl_filter_rmedian_workspace;
  Pgsl_filter_impulse_workspace = ^gsl_filter_impulse_workspace;
  Pgsl_permutation_struct = ^gsl_permutation_struct;
  Pgsl_histogram = ^gsl_histogram;
  Pgsl_histogram_pdf = ^gsl_histogram_pdf;
  Pgsl_histogram2d = ^gsl_histogram2d;
  Pgsl_histogram2d_pdf = ^gsl_histogram2d_pdf;
  Pgsl_ieee_float_rep = ^gsl_ieee_float_rep;
  Pgsl_ieee_double_rep = ^gsl_ieee_double_rep;
  Pgsl_integration_workspace = ^gsl_integration_workspace;
  Pgsl_integration_qaws_table = ^gsl_integration_qaws_table;
  Pgsl_integration_qawo_table = ^gsl_integration_qawo_table;
  Pgsl_integration_glfixed_table = ^gsl_integration_glfixed_table;
  Pgsl_integration_cquad_ival = ^gsl_integration_cquad_ival;
  Pgsl_integration_cquad_workspace = ^gsl_integration_cquad_workspace;
  Pgsl_integration_romberg_workspace = ^gsl_integration_romberg_workspace;
  Pgsl_integration_fixed_params = ^gsl_integration_fixed_params;
  Pgsl_integration_fixed_type = ^gsl_integration_fixed_type;
  Pgsl_integration_fixed_workspace = ^gsl_integration_fixed_workspace;
  Pgsl_interp_accel = ^gsl_interp_accel;
  Pgsl_interp_type = ^gsl_interp_type;
  Pgsl_interp = ^gsl_interp;
  Pgsl_interp2d_type = ^gsl_interp2d_type;
  Pgsl_interp2d = ^gsl_interp2d;
  Pgsl_min_fminimizer_type = ^gsl_min_fminimizer_type;
  Pgsl_min_fminimizer = ^gsl_min_fminimizer;
  Pgsl_monte_function_struct = ^gsl_monte_function_struct;
  Pgsl_rng_type = ^gsl_rng_type;
  PPgsl_rng_type = ^Pgsl_rng_type;
  Pgsl_rng = ^gsl_rng;
  Pgsl_monte_plain_state = ^gsl_monte_plain_state;
  Pgsl_monte_miser_state = ^gsl_monte_miser_state;
  Pgsl_monte_miser_params = ^gsl_monte_miser_params;
  Pgsl_monte_vegas_state = ^gsl_monte_vegas_state;
  Pgsl_monte_vegas_params = ^gsl_monte_vegas_params;
  Pgsl_multifit_linear_workspace = ^gsl_multifit_linear_workspace;
  Pgsl_multifit_robust_type = ^gsl_multifit_robust_type;
  Pgsl_multifit_robust_stats = ^gsl_multifit_robust_stats;
  Pgsl_multifit_robust_workspace = ^gsl_multifit_robust_workspace;
  Pgsl_multifit_function_struct = ^gsl_multifit_function_struct;
  Pgsl_multifit_fsolver_type = ^gsl_multifit_fsolver_type;
  Pgsl_multifit_fsolver = ^gsl_multifit_fsolver;
  Pgsl_multifit_function_fdf_struct = ^gsl_multifit_function_fdf_struct;
  Pgsl_multifit_fdfsolver_type = ^gsl_multifit_fdfsolver_type;
  Pgsl_multifit_fdfsolver = ^gsl_multifit_fdfsolver;
  Pgsl_multifit_fdfridge = ^gsl_multifit_fdfridge;
  Pgsl_multifit_nlinear_fdf = ^gsl_multifit_nlinear_fdf;
  Pgsl_multifit_nlinear_trs = ^gsl_multifit_nlinear_trs;
  Pgsl_multifit_nlinear_scale = ^gsl_multifit_nlinear_scale;
  Pgsl_multifit_nlinear_solver = ^gsl_multifit_nlinear_solver;
  Pgsl_multifit_nlinear_parameters = ^gsl_multifit_nlinear_parameters;
  Pgsl_multifit_nlinear_type = ^gsl_multifit_nlinear_type;
  Pgsl_multifit_nlinear_trust_state = ^gsl_multifit_nlinear_trust_state;
  Pgsl_multifit_nlinear_workspace = ^gsl_multifit_nlinear_workspace;
  Pgsl_multilarge_linear_type = ^gsl_multilarge_linear_type;
  Pgsl_multilarge_linear_workspace = ^gsl_multilarge_linear_workspace;
  Pgsl_multilarge_nlinear_fdf = ^gsl_multilarge_nlinear_fdf;
  Pgsl_multilarge_nlinear_trs = ^gsl_multilarge_nlinear_trs;
  Pgsl_multilarge_nlinear_scale = ^gsl_multilarge_nlinear_scale;
  Pgsl_multilarge_nlinear_solver = ^gsl_multilarge_nlinear_solver;
  Pgsl_multilarge_nlinear_parameters = ^gsl_multilarge_nlinear_parameters;
  Pgsl_multilarge_nlinear_type = ^gsl_multilarge_nlinear_type;
  Pgsl_multilarge_nlinear_trust_state = ^gsl_multilarge_nlinear_trust_state;
  Pgsl_multilarge_nlinear_workspace = ^gsl_multilarge_nlinear_workspace;
  Pgsl_multimin_function_struct = ^gsl_multimin_function_struct;
  Pgsl_multimin_function_fdf_struct = ^gsl_multimin_function_fdf_struct;
  Pgsl_multimin_fminimizer_type = ^gsl_multimin_fminimizer_type;
  Pgsl_multimin_fminimizer = ^gsl_multimin_fminimizer;
  Pgsl_multimin_fdfminimizer_type = ^gsl_multimin_fdfminimizer_type;
  Pgsl_multimin_fdfminimizer = ^gsl_multimin_fdfminimizer;
  Pgsl_multiroot_function_struct = ^gsl_multiroot_function_struct;
  Pgsl_multiroot_fsolver_type = ^gsl_multiroot_fsolver_type;
  Pgsl_multiroot_fsolver = ^gsl_multiroot_fsolver;
  Pgsl_multiroot_function_fdf_struct = ^gsl_multiroot_function_fdf_struct;
  Pgsl_multiroot_fdfsolver_type = ^gsl_multiroot_fdfsolver_type;
  Pgsl_multiroot_fdfsolver = ^gsl_multiroot_fdfsolver;
  Pgsl_multiset_struct = ^gsl_multiset_struct;
  Pgsl_ntuple = ^gsl_ntuple;
  Pgsl_ntuple_select_fn = ^gsl_ntuple_select_fn;
  Pgsl_ntuple_value_fn = ^gsl_ntuple_value_fn;
  Pgsl_odeiv_system = ^gsl_odeiv_system;
  Pgsl_odeiv_step_type = ^gsl_odeiv_step_type;
  Pgsl_odeiv_step = ^gsl_odeiv_step;
  Pgsl_odeiv_control_type = ^gsl_odeiv_control_type;
  Pgsl_odeiv_control = ^gsl_odeiv_control;
  Pgsl_odeiv_evolve = ^gsl_odeiv_evolve;
  Pgsl_odeiv2_system = ^gsl_odeiv2_system;
  Pgsl_odeiv2_step_type = ^gsl_odeiv2_step_type;
  Pgsl_odeiv2_step_struct = ^gsl_odeiv2_step_struct;
  Pgsl_odeiv2_control_type = ^gsl_odeiv2_control_type;
  Pgsl_odeiv2_control_struct = ^gsl_odeiv2_control_struct;
  Pgsl_odeiv2_evolve_struct = ^gsl_odeiv2_evolve_struct;
  Pgsl_odeiv2_driver_struct = ^gsl_odeiv2_driver_struct;
  Pgsl_poly_complex_workspace = ^gsl_poly_complex_workspace;
  Pgsl_qrng_type = ^gsl_qrng_type;
  Pgsl_qrng = ^gsl_qrng;
  Pgsl_ran_discrete_t = ^gsl_ran_discrete_t;
  Pgsl_root_fsolver_type = ^gsl_root_fsolver_type;
  Pgsl_root_fsolver = ^gsl_root_fsolver;
  Pgsl_root_fdfsolver_type = ^gsl_root_fdfsolver_type;
  Pgsl_root_fdfsolver = ^gsl_root_fdfsolver;
  Pgsl_rstat_quantile_workspace = ^gsl_rstat_quantile_workspace;
  Pgsl_rstat_workspace = ^gsl_rstat_workspace;
  Pgsl_sf_result_struct = ^gsl_sf_result_struct;
  Pgsl_sf_result_e10_struct = ^gsl_sf_result_e10_struct;
  Pgsl_sf_mathieu_workspace = ^gsl_sf_mathieu_workspace;
  Pgsl_siman_params_t = ^gsl_siman_params_t;
  Pgsl_spmatrix_pool_node = ^gsl_spmatrix_pool_node;
  Pgsl_spmatrix_complex_long_double = ^gsl_spmatrix_complex_long_double;
  Pgsl_spmatrix_complex = ^gsl_spmatrix_complex;
  Pgsl_spmatrix_complex_float = ^gsl_spmatrix_complex_float;
  Pgsl_spmatrix_long_double = ^gsl_spmatrix_long_double;
  Pgsl_spmatrix = ^gsl_spmatrix;
  Pgsl_spmatrix_float = ^gsl_spmatrix_float;
  Pgsl_spmatrix_ulong = ^gsl_spmatrix_ulong;
  Pgsl_spmatrix_long = ^gsl_spmatrix_long;
  Pgsl_spmatrix_uint = ^gsl_spmatrix_uint;
  Pgsl_spmatrix_int = ^gsl_spmatrix_int;
  Pgsl_spmatrix_ushort = ^gsl_spmatrix_ushort;
  Pgsl_spmatrix_short = ^gsl_spmatrix_short;
  Pgsl_spmatrix_uchar = ^gsl_spmatrix_uchar;
  Pgsl_spmatrix_char = ^gsl_spmatrix_char;
  Pgsl_splinalg_itersolve_type = ^gsl_splinalg_itersolve_type;
  Pgsl_splinalg_itersolve = ^gsl_splinalg_itersolve;
  Pgsl_spline = ^gsl_spline;
  Pgsl_spline2d = ^gsl_spline2d;
  Pgsl_sum_levin_u_workspace = ^gsl_sum_levin_u_workspace;
  Pgsl_sum_levin_utrunc_workspace = ^gsl_sum_levin_utrunc_workspace;
  Pgsl_wavelet_type = ^gsl_wavelet_type;
  Pgsl_wavelet = ^gsl_wavelet;
  Pgsl_wavelet_workspace = ^gsl_wavelet_workspace;

  _anonymous_type_1 = (
    GSL_SUCCESS = 0,
    GSL_FAILURE = -1,
    GSL_CONTINUE = -2,
    GSL_EDOM = 1,
    GSL_ERANGE = 2,
    GSL_EFAULT = 3,
    GSL_EINVAL = 4,
    GSL_EFAILED = 5,
    GSL_EFACTOR = 6,
    GSL_ESANITY = 7,
    GSL_ENOMEM = 8,
    GSL_EBADFUNC = 9,
    GSL_ERUNAWAY = 10,
    GSL_EMAXITER = 11,
    GSL_EZERODIV = 12,
    GSL_EBADTOL = 13,
    GSL_ETOL = 14,
    GSL_EUNDRFLW = 15,
    GSL_EOVRFLW = 16,
    GSL_ELOSS = 17,
    GSL_EROUND = 18,
    GSL_EBADLEN = 19,
    GSL_ENOTSQR = 20,
    GSL_ESING = 21,
    GSL_EDIVERGE = 22,
    GSL_EUNSUP = 23,
    GSL_EUNIMPL = 24,
    GSL_ECACHE = 25,
    GSL_ETABLE = 26,
    GSL_ENOPROG = 27,
    GSL_ENOPROGJ = 28,
    GSL_ETOLF = 29,
    GSL_ETOLX = 30,
    GSL_ETOLG = 31,
    GSL_EOF = 32);
  P_anonymous_type_1 = ^_anonymous_type_1;

  Pgsl_error_handler_t = procedure(reason: PUTF8Char; &file: PUTF8Char; line: Integer; gsl_errno: Integer); cdecl;

  Pgsl_stream_handler_t = procedure(&label: PUTF8Char; &file: PUTF8Char; line: Integer; reason: PUTF8Char); cdecl;
  gsl_complex_packed = PDouble;
  gsl_complex_packed_float = PSingle;
  gsl_complex_packed_long_double = PExtended;
  gsl_const_complex_packed = PDouble;
  gsl_const_complex_packed_float = PSingle;
  gsl_const_complex_packed_long_double = PExtended;
  gsl_complex_packed_array = PDouble;
  gsl_complex_packed_array_float = PSingle;
  gsl_complex_packed_array_long_double = PExtended;
  gsl_const_complex_packed_array = PDouble;
  gsl_const_complex_packed_array_float = PSingle;
  gsl_const_complex_packed_array_long_double = PExtended;
  gsl_complex_packed_ptr = PDouble;
  gsl_complex_packed_float_ptr = PSingle;
  gsl_complex_packed_long_double_ptr = PExtended;
  gsl_const_complex_packed_ptr = PDouble;
  gsl_const_complex_packed_float_ptr = PSingle;
  gsl_const_complex_packed_long_double_ptr = PExtended;

  gsl_complex_long_double = record
    dat: array [0..1] of Extended;
  end;

  gsl_complex = record
    dat: array [0..1] of Double;
  end;

  gsl_complex_float = record
    dat: array [0..1] of Single;
  end;

  gsl_block_long_double_struct = record
    size: NativeUInt;
    data: PExtended;
  end;

  gsl_block_long_double = gsl_block_long_double_struct;
  Pgsl_block_long_double = ^gsl_block_long_double;

  gsl_vector_long_double = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PExtended;
    block: Pgsl_block_long_double;
    owner: Integer;
  end;

  _gsl_vector_long_double_view = record
    vector: gsl_vector_long_double;
  end;

  gsl_vector_long_double_view = _gsl_vector_long_double_view;

  _gsl_vector_long_double_const_view = record
    vector: gsl_vector_long_double;
  end;

  gsl_vector_long_double_const_view = _gsl_vector_long_double_const_view;

  gsl_block_complex_long_double_struct = record
    size: NativeUInt;
    data: PExtended;
  end;

  gsl_block_complex_long_double = gsl_block_complex_long_double_struct;
  Pgsl_block_complex_long_double = ^gsl_block_complex_long_double;

  gsl_vector_complex_long_double = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PExtended;
    block: Pgsl_block_complex_long_double;
    owner: Integer;
  end;

  _gsl_vector_complex_long_double_view = record
    vector: gsl_vector_complex_long_double;
  end;

  gsl_vector_complex_long_double_view = _gsl_vector_complex_long_double_view;

  _gsl_vector_complex_long_double_const_view = record
    vector: gsl_vector_complex_long_double;
  end;

  gsl_vector_complex_long_double_const_view = _gsl_vector_complex_long_double_const_view;

  gsl_block_struct = record
    size: NativeUInt;
    data: PDouble;
  end;

  gsl_block = gsl_block_struct;
  Pgsl_block = ^gsl_block;

  gsl_vector = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PDouble;
    block: Pgsl_block;
    owner: Integer;
  end;

  _gsl_vector_view = record
    vector: gsl_vector;
  end;

  gsl_vector_view = _gsl_vector_view;

  _gsl_vector_const_view = record
    vector: gsl_vector;
  end;

  gsl_vector_const_view = _gsl_vector_const_view;

  gsl_block_complex_struct = record
    size: NativeUInt;
    data: PDouble;
  end;

  gsl_block_complex = gsl_block_complex_struct;
  Pgsl_block_complex = ^gsl_block_complex;

  gsl_vector_complex = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PDouble;
    block: Pgsl_block_complex;
    owner: Integer;
  end;

  _gsl_vector_complex_view = record
    vector: gsl_vector_complex;
  end;

  gsl_vector_complex_view = _gsl_vector_complex_view;

  _gsl_vector_complex_const_view = record
    vector: gsl_vector_complex;
  end;

  gsl_vector_complex_const_view = _gsl_vector_complex_const_view;

  gsl_block_float_struct = record
    size: NativeUInt;
    data: PSingle;
  end;

  gsl_block_float = gsl_block_float_struct;
  Pgsl_block_float = ^gsl_block_float;

  gsl_vector_float = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PSingle;
    block: Pgsl_block_float;
    owner: Integer;
  end;

  _gsl_vector_float_view = record
    vector: gsl_vector_float;
  end;

  gsl_vector_float_view = _gsl_vector_float_view;

  _gsl_vector_float_const_view = record
    vector: gsl_vector_float;
  end;

  gsl_vector_float_const_view = _gsl_vector_float_const_view;

  gsl_block_complex_float_struct = record
    size: NativeUInt;
    data: PSingle;
  end;

  gsl_block_complex_float = gsl_block_complex_float_struct;
  Pgsl_block_complex_float = ^gsl_block_complex_float;

  gsl_vector_complex_float = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PSingle;
    block: Pgsl_block_complex_float;
    owner: Integer;
  end;

  _gsl_vector_complex_float_view = record
    vector: gsl_vector_complex_float;
  end;

  gsl_vector_complex_float_view = _gsl_vector_complex_float_view;

  _gsl_vector_complex_float_const_view = record
    vector: gsl_vector_complex_float;
  end;

  gsl_vector_complex_float_const_view = _gsl_vector_complex_float_const_view;

  gsl_block_ulong_struct = record
    size: NativeUInt;
    data: PCardinal;
  end;

  gsl_block_ulong = gsl_block_ulong_struct;
  Pgsl_block_ulong = ^gsl_block_ulong;

  gsl_vector_ulong = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PCardinal;
    block: Pgsl_block_ulong;
    owner: Integer;
  end;

  _gsl_vector_ulong_view = record
    vector: gsl_vector_ulong;
  end;

  gsl_vector_ulong_view = _gsl_vector_ulong_view;

  _gsl_vector_ulong_const_view = record
    vector: gsl_vector_ulong;
  end;

  gsl_vector_ulong_const_view = _gsl_vector_ulong_const_view;

  gsl_block_long_struct = record
    size: NativeUInt;
    data: PInteger;
  end;

  gsl_block_long = gsl_block_long_struct;
  Pgsl_block_long = ^gsl_block_long;

  gsl_vector_long = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PInteger;
    block: Pgsl_block_long;
    owner: Integer;
  end;

  _gsl_vector_long_view = record
    vector: gsl_vector_long;
  end;

  gsl_vector_long_view = _gsl_vector_long_view;

  _gsl_vector_long_const_view = record
    vector: gsl_vector_long;
  end;

  gsl_vector_long_const_view = _gsl_vector_long_const_view;

  gsl_block_uint_struct = record
    size: NativeUInt;
    data: PCardinal;
  end;

  gsl_block_uint = gsl_block_uint_struct;
  Pgsl_block_uint = ^gsl_block_uint;

  gsl_vector_uint = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PCardinal;
    block: Pgsl_block_uint;
    owner: Integer;
  end;

  _gsl_vector_uint_view = record
    vector: gsl_vector_uint;
  end;

  gsl_vector_uint_view = _gsl_vector_uint_view;

  _gsl_vector_uint_const_view = record
    vector: gsl_vector_uint;
  end;

  gsl_vector_uint_const_view = _gsl_vector_uint_const_view;

  gsl_block_int_struct = record
    size: NativeUInt;
    data: PInteger;
  end;

  gsl_block_int = gsl_block_int_struct;
  Pgsl_block_int = ^gsl_block_int;

  gsl_vector_int = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PInteger;
    block: Pgsl_block_int;
    owner: Integer;
  end;

  _gsl_vector_int_view = record
    vector: gsl_vector_int;
  end;

  gsl_vector_int_view = _gsl_vector_int_view;

  _gsl_vector_int_const_view = record
    vector: gsl_vector_int;
  end;

  gsl_vector_int_const_view = _gsl_vector_int_const_view;

  gsl_block_ushort_struct = record
    size: NativeUInt;
    data: PWord;
  end;

  gsl_block_ushort = gsl_block_ushort_struct;
  Pgsl_block_ushort = ^gsl_block_ushort;

  gsl_vector_ushort = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PWord;
    block: Pgsl_block_ushort;
    owner: Integer;
  end;

  _gsl_vector_ushort_view = record
    vector: gsl_vector_ushort;
  end;

  gsl_vector_ushort_view = _gsl_vector_ushort_view;

  _gsl_vector_ushort_const_view = record
    vector: gsl_vector_ushort;
  end;

  gsl_vector_ushort_const_view = _gsl_vector_ushort_const_view;

  gsl_block_short_struct = record
    size: NativeUInt;
    data: PSmallint;
  end;

  gsl_block_short = gsl_block_short_struct;
  Pgsl_block_short = ^gsl_block_short;

  gsl_vector_short = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PSmallint;
    block: Pgsl_block_short;
    owner: Integer;
  end;

  _gsl_vector_short_view = record
    vector: gsl_vector_short;
  end;

  gsl_vector_short_view = _gsl_vector_short_view;

  _gsl_vector_short_const_view = record
    vector: gsl_vector_short;
  end;

  gsl_vector_short_const_view = _gsl_vector_short_const_view;

  gsl_block_uchar_struct = record
    size: NativeUInt;
    data: PByte;
  end;

  gsl_block_uchar = gsl_block_uchar_struct;
  Pgsl_block_uchar = ^gsl_block_uchar;

  gsl_vector_uchar = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PByte;
    block: Pgsl_block_uchar;
    owner: Integer;
  end;

  _gsl_vector_uchar_view = record
    vector: gsl_vector_uchar;
  end;

  gsl_vector_uchar_view = _gsl_vector_uchar_view;

  _gsl_vector_uchar_const_view = record
    vector: gsl_vector_uchar;
  end;

  gsl_vector_uchar_const_view = _gsl_vector_uchar_const_view;

  gsl_block_char_struct = record
    size: NativeUInt;
    data: PUTF8Char;
  end;

  gsl_block_char = gsl_block_char_struct;
  Pgsl_block_char = ^gsl_block_char;

  gsl_vector_char = record
    size: NativeUInt;
    stride: NativeUInt;
    data: PUTF8Char;
    block: Pgsl_block_char;
    owner: Integer;
  end;

  _gsl_vector_char_view = record
    vector: gsl_vector_char;
  end;

  gsl_vector_char_view = _gsl_vector_char_view;

  _gsl_vector_char_const_view = record
    vector: gsl_vector_char;
  end;

  gsl_vector_char_const_view = _gsl_vector_char_const_view;

  gsl_matrix_complex_long_double = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PExtended;
    block: Pgsl_block_complex_long_double;
    owner: Integer;
  end;

  _gsl_matrix_complex_long_double_view = record
    matrix: gsl_matrix_complex_long_double;
  end;

  gsl_matrix_complex_long_double_view = _gsl_matrix_complex_long_double_view;

  _gsl_matrix_complex_long_double_const_view = record
    matrix: gsl_matrix_complex_long_double;
  end;

  gsl_matrix_complex_long_double_const_view = _gsl_matrix_complex_long_double_const_view;

  gsl_matrix_complex = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PDouble;
    block: Pgsl_block_complex;
    owner: Integer;
  end;

  _gsl_matrix_complex_view = record
    matrix: gsl_matrix_complex;
  end;

  gsl_matrix_complex_view = _gsl_matrix_complex_view;

  _gsl_matrix_complex_const_view = record
    matrix: gsl_matrix_complex;
  end;

  gsl_matrix_complex_const_view = _gsl_matrix_complex_const_view;

  gsl_matrix_complex_float = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PSingle;
    block: Pgsl_block_complex_float;
    owner: Integer;
  end;

  _gsl_matrix_complex_float_view = record
    matrix: gsl_matrix_complex_float;
  end;

  gsl_matrix_complex_float_view = _gsl_matrix_complex_float_view;

  _gsl_matrix_complex_float_const_view = record
    matrix: gsl_matrix_complex_float;
  end;

  gsl_matrix_complex_float_const_view = _gsl_matrix_complex_float_const_view;

  gsl_matrix_long_double = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PExtended;
    block: Pgsl_block_long_double;
    owner: Integer;
  end;

  _gsl_matrix_long_double_view = record
    matrix: gsl_matrix_long_double;
  end;

  gsl_matrix_long_double_view = _gsl_matrix_long_double_view;

  _gsl_matrix_long_double_const_view = record
    matrix: gsl_matrix_long_double;
  end;

  gsl_matrix_long_double_const_view = _gsl_matrix_long_double_const_view;

  gsl_matrix = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PDouble;
    block: Pgsl_block;
    owner: Integer;
  end;

  _gsl_matrix_view = record
    matrix: gsl_matrix;
  end;

  gsl_matrix_view = _gsl_matrix_view;

  _gsl_matrix_const_view = record
    matrix: gsl_matrix;
  end;

  gsl_matrix_const_view = _gsl_matrix_const_view;

  gsl_matrix_float = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PSingle;
    block: Pgsl_block_float;
    owner: Integer;
  end;

  _gsl_matrix_float_view = record
    matrix: gsl_matrix_float;
  end;

  gsl_matrix_float_view = _gsl_matrix_float_view;

  _gsl_matrix_float_const_view = record
    matrix: gsl_matrix_float;
  end;

  gsl_matrix_float_const_view = _gsl_matrix_float_const_view;

  gsl_matrix_ulong = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PCardinal;
    block: Pgsl_block_ulong;
    owner: Integer;
  end;

  _gsl_matrix_ulong_view = record
    matrix: gsl_matrix_ulong;
  end;

  gsl_matrix_ulong_view = _gsl_matrix_ulong_view;

  _gsl_matrix_ulong_const_view = record
    matrix: gsl_matrix_ulong;
  end;

  gsl_matrix_ulong_const_view = _gsl_matrix_ulong_const_view;

  gsl_matrix_long = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PInteger;
    block: Pgsl_block_long;
    owner: Integer;
  end;

  _gsl_matrix_long_view = record
    matrix: gsl_matrix_long;
  end;

  gsl_matrix_long_view = _gsl_matrix_long_view;

  _gsl_matrix_long_const_view = record
    matrix: gsl_matrix_long;
  end;

  gsl_matrix_long_const_view = _gsl_matrix_long_const_view;

  gsl_matrix_uint = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PCardinal;
    block: Pgsl_block_uint;
    owner: Integer;
  end;

  _gsl_matrix_uint_view = record
    matrix: gsl_matrix_uint;
  end;

  gsl_matrix_uint_view = _gsl_matrix_uint_view;

  _gsl_matrix_uint_const_view = record
    matrix: gsl_matrix_uint;
  end;

  gsl_matrix_uint_const_view = _gsl_matrix_uint_const_view;

  gsl_matrix_int = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PInteger;
    block: Pgsl_block_int;
    owner: Integer;
  end;

  _gsl_matrix_int_view = record
    matrix: gsl_matrix_int;
  end;

  gsl_matrix_int_view = _gsl_matrix_int_view;

  _gsl_matrix_int_const_view = record
    matrix: gsl_matrix_int;
  end;

  gsl_matrix_int_const_view = _gsl_matrix_int_const_view;

  gsl_matrix_ushort = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PWord;
    block: Pgsl_block_ushort;
    owner: Integer;
  end;

  _gsl_matrix_ushort_view = record
    matrix: gsl_matrix_ushort;
  end;

  gsl_matrix_ushort_view = _gsl_matrix_ushort_view;

  _gsl_matrix_ushort_const_view = record
    matrix: gsl_matrix_ushort;
  end;

  gsl_matrix_ushort_const_view = _gsl_matrix_ushort_const_view;

  gsl_matrix_short = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PSmallint;
    block: Pgsl_block_short;
    owner: Integer;
  end;

  _gsl_matrix_short_view = record
    matrix: gsl_matrix_short;
  end;

  gsl_matrix_short_view = _gsl_matrix_short_view;

  _gsl_matrix_short_const_view = record
    matrix: gsl_matrix_short;
  end;

  gsl_matrix_short_const_view = _gsl_matrix_short_const_view;

  gsl_matrix_uchar = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PByte;
    block: Pgsl_block_uchar;
    owner: Integer;
  end;

  _gsl_matrix_uchar_view = record
    matrix: gsl_matrix_uchar;
  end;

  gsl_matrix_uchar_view = _gsl_matrix_uchar_view;

  _gsl_matrix_uchar_const_view = record
    matrix: gsl_matrix_uchar;
  end;

  gsl_matrix_uchar_const_view = _gsl_matrix_uchar_const_view;

  gsl_matrix_char = record
    size1: NativeUInt;
    size2: NativeUInt;
    tda: NativeUInt;
    data: PUTF8Char;
    block: Pgsl_block_char;
    owner: Integer;
  end;

  _gsl_matrix_char_view = record
    matrix: gsl_matrix_char;
  end;

  gsl_matrix_char_view = _gsl_matrix_char_view;

  _gsl_matrix_char_const_view = record
    matrix: gsl_matrix_char;
  end;

  gsl_matrix_char_const_view = _gsl_matrix_char_const_view;

  CBLAS_ORDER = (
    CblasRowMajor = 101,
    CblasColMajor = 102);
  PCBLAS_ORDER = ^CBLAS_ORDER;

  CBLAS_TRANSPOSE = (
    CblasNoTrans = 111,
    CblasTrans = 112,
    CblasConjTrans = 113);
  PCBLAS_TRANSPOSE = ^CBLAS_TRANSPOSE;

  CBLAS_UPLO = (
    CblasUpper = 121,
    CblasLower = 122);
  PCBLAS_UPLO = ^CBLAS_UPLO;

  CBLAS_DIAG = (
    CblasNonUnit = 131,
    CblasUnit = 132);
  PCBLAS_DIAG = ^CBLAS_DIAG;

  CBLAS_SIDE = (
    CblasLeft = 141,
    CblasRight = 142);
  PCBLAS_SIDE = ^CBLAS_SIDE;
  CBLAS_INDEX_t = NativeUInt;
  CBLAS_ORDER_t = CBLAS_ORDER;
  CBLAS_TRANSPOSE_t = CBLAS_TRANSPOSE;
  CBLAS_UPLO_t = CBLAS_UPLO;
  CBLAS_DIAG_t = CBLAS_DIAG;
  CBLAS_SIDE_t = CBLAS_SIDE;
  gsl_prec_t = Cardinal;

  gsl_function_struct = record
    &function: function(x: Double; params: Pointer): Double; cdecl;
    params: Pointer;
  end;

  gsl_function = gsl_function_struct;
  Pgsl_function = ^gsl_function;

  gsl_function_fdf_struct = record
    f: function(x: Double; params: Pointer): Double; cdecl;
    df: function(x: Double; params: Pointer): Double; cdecl;
    fdf: procedure(x: Double; params: Pointer; f: PDouble; df: PDouble); cdecl;
    params: Pointer;
  end;

  gsl_function_fdf = gsl_function_fdf_struct;
  Pgsl_function_fdf = ^gsl_function_fdf;

  gsl_function_vec_struct = record
    &function: function(x: Double; y: PDouble; params: Pointer): Integer; cdecl;
    params: Pointer;
  end;

  gsl_function_vec = gsl_function_vec_struct;

  gsl_bspline_workspace = record
    k: NativeUInt;
    km1: NativeUInt;
    l: NativeUInt;
    nbreak: NativeUInt;
    n: NativeUInt;
    knots: Pgsl_vector;
    deltal: Pgsl_vector;
    deltar: Pgsl_vector;
    B: Pgsl_vector;
    A: Pgsl_matrix;
    dB: Pgsl_matrix;
  end;

  Pgsl_bst_cmp_function = function(a: Pointer; b: Pointer; params: Pointer): Integer; cdecl;

  gsl_bst_allocator = record
    alloc: function(size: NativeUInt; params: Pointer): Pointer; cdecl;
    free: procedure(block: Pointer; params: Pointer); cdecl;
  end;

  gsl_bst_avl_node = record
    avl_link: array [0..1] of Pgsl_bst_avl_node;
    avl_data: Pointer;
    avl_balance: Shortint;
  end;

  gsl_bst_avl_table = record
    avl_root: Pgsl_bst_avl_node;
    avl_compare: Pgsl_bst_cmp_function;
    avl_param: Pointer;
    avl_alloc: Pgsl_bst_allocator;
    avl_count: NativeUInt;
    avl_generation: Cardinal;
  end;

  gsl_bst_avl_traverser = record
    avl_table: Pgsl_bst_avl_table;
    avl_node: Pgsl_bst_avl_node;
    avl_stack: array [0..31] of Pgsl_bst_avl_node;
    avl_height: NativeUInt;
    avl_generation: Cardinal;
  end;

  gsl_bst_rb_node = record
    rb_link: array [0..1] of Pgsl_bst_rb_node;
    rb_data: Pointer;
    rb_color: Byte;
  end;

  gsl_bst_rb_table = record
    rb_root: Pgsl_bst_rb_node;
    rb_compare: Pgsl_bst_cmp_function;
    rb_param: Pointer;
    rb_alloc: Pgsl_bst_allocator;
    rb_count: NativeUInt;
    rb_generation: Cardinal;
  end;

  gsl_bst_rb_traverser = record
    rb_table: Pgsl_bst_rb_table;
    rb_node: Pgsl_bst_rb_node;
    rb_stack: array [0..47] of Pgsl_bst_rb_node;
    rb_height: NativeUInt;
    rb_generation: Cardinal;
  end;

  gsl_bst_type = record
    name: PUTF8Char;
    node_size: NativeUInt;
    init: function(allocator: Pgsl_bst_allocator; compare: Pgsl_bst_cmp_function; params: Pointer; vtable: Pointer): Integer; cdecl;
    nodes: function(vtable: Pointer): UInt64; cdecl;
    insert: function(item: Pointer; vtable: Pointer): Pointer; cdecl;
    find: function(item: Pointer; vtable: Pointer): Pointer; cdecl;
    remove: function(item: Pointer; vtable: Pointer): Pointer; cdecl;
    empty: function(vtable: Pointer): Integer; cdecl;
    trav_init: function(vtrav: Pointer; vtable: Pointer): Integer; cdecl;
    trav_first: function(vtrav: Pointer; vtable: Pointer): Pointer; cdecl;
    trav_last: function(vtrav: Pointer; vtable: Pointer): Pointer; cdecl;
    trav_find: function(item: Pointer; vtrav: Pointer; vtable: Pointer): Pointer; cdecl;
    trav_insert: function(item: Pointer; vtrav: Pointer; vtable: Pointer): Pointer; cdecl;
    trav_copy: function(vtrav: Pointer; vsrc: Pointer): Pointer; cdecl;
    trav_next: function(vtrav: Pointer): Pointer; cdecl;
    trav_prev: function(vtrav: Pointer): Pointer; cdecl;
    trav_cur: function(vtrav: Pointer): Pointer; cdecl;
    trav_replace: function(vtrav: Pointer; new_item: Pointer): Pointer; cdecl;
  end;

  _anonymous_type_2 = record
    case Integer of
      0: (avl_table: gsl_bst_avl_table);
      1: (rb_table: gsl_bst_rb_table);
  end;
  P_anonymous_type_2 = ^_anonymous_type_2;

  gsl_bst_workspace = record
    &type: Pgsl_bst_type;
    table: _anonymous_type_2;
  end;

  _anonymous_type_3 = record
    case Integer of
      0: (avl_trav: gsl_bst_avl_traverser);
      1: (rb_trav: gsl_bst_rb_traverser);
  end;
  P_anonymous_type_3 = ^_anonymous_type_3;

  gsl_bst_trav = record
    &type: Pgsl_bst_type;
    trav_data: _anonymous_type_3;
  end;

  gsl_mode_t = Cardinal;

  gsl_cheb_series_struct = record
    c: PDouble;
    order: NativeUInt;
    a: Double;
    b: Double;
    order_sp: NativeUInt;
    f: PDouble;
  end;

  gsl_cheb_series = gsl_cheb_series_struct;
  Pgsl_cheb_series = ^gsl_cheb_series;

  gsl_combination_struct = record
    n: NativeUInt;
    k: NativeUInt;
    data: PNativeUInt;
  end;

  gsl_combination = gsl_combination_struct;
  Pgsl_combination = ^gsl_combination;

  gsl_fft_direction = (
    gsl_fft_forward = -1,
    gsl_fft_backward = 1);
  Pgsl_fft_direction = ^gsl_fft_direction;

  gsl_dht_struct = record
    size: NativeUInt;
    nu: Double;
    xmax: Double;
    kmax: Double;
    j: PDouble;
    Jjj: PDouble;
    J2: PDouble;
  end;

  gsl_dht = gsl_dht_struct;
  Pgsl_dht = ^gsl_dht;

  gsl_eigen_symm_workspace = record
    size: NativeUInt;
    d: PDouble;
    sd: PDouble;
  end;

  gsl_eigen_symmv_workspace = record
    size: NativeUInt;
    d: PDouble;
    sd: PDouble;
    gc: PDouble;
    gs: PDouble;
  end;

  gsl_eigen_herm_workspace = record
    size: NativeUInt;
    d: PDouble;
    sd: PDouble;
    tau: PDouble;
  end;

  gsl_eigen_hermv_workspace = record
    size: NativeUInt;
    d: PDouble;
    sd: PDouble;
    tau: PDouble;
    gc: PDouble;
    gs: PDouble;
  end;

  gsl_eigen_francis_workspace = record
    size: NativeUInt;
    max_iterations: NativeUInt;
    n_iter: NativeUInt;
    n_evals: NativeUInt;
    compute_t: Integer;
    H: Pgsl_matrix;
    Z: Pgsl_matrix;
  end;

  gsl_eigen_nonsymm_workspace = record
    size: NativeUInt;
    diag: Pgsl_vector;
    tau: Pgsl_vector;
    Z: Pgsl_matrix;
    do_balance: Integer;
    n_evals: NativeUInt;
    francis_workspace_p: Pgsl_eigen_francis_workspace;
  end;

  gsl_eigen_nonsymmv_workspace = record
    size: NativeUInt;
    work: Pgsl_vector;
    work2: Pgsl_vector;
    work3: Pgsl_vector;
    Z: Pgsl_matrix;
    nonsymm_workspace_p: Pgsl_eigen_nonsymm_workspace;
  end;

  gsl_eigen_gensymm_workspace = record
    size: NativeUInt;
    symm_workspace_p: Pgsl_eigen_symm_workspace;
  end;

  gsl_eigen_gensymmv_workspace = record
    size: NativeUInt;
    symmv_workspace_p: Pgsl_eigen_symmv_workspace;
  end;

  gsl_eigen_genherm_workspace = record
    size: NativeUInt;
    herm_workspace_p: Pgsl_eigen_herm_workspace;
  end;

  gsl_eigen_genhermv_workspace = record
    size: NativeUInt;
    hermv_workspace_p: Pgsl_eigen_hermv_workspace;
  end;

  gsl_eigen_gen_workspace = record
    size: NativeUInt;
    work: Pgsl_vector;
    n_evals: NativeUInt;
    max_iterations: NativeUInt;
    n_iter: NativeUInt;
    eshift: Double;
    needtop: Integer;
    atol: Double;
    btol: Double;
    ascale: Double;
    bscale: Double;
    H: Pgsl_matrix;
    R: Pgsl_matrix;
    compute_s: Integer;
    compute_t: Integer;
    Q: Pgsl_matrix;
    Z: Pgsl_matrix;
  end;

  gsl_eigen_genv_workspace = record
    size: NativeUInt;
    work1: Pgsl_vector;
    work2: Pgsl_vector;
    work3: Pgsl_vector;
    work4: Pgsl_vector;
    work5: Pgsl_vector;
    work6: Pgsl_vector;
    Q: Pgsl_matrix;
    Z: Pgsl_matrix;
    gen_workspace_p: Pgsl_eigen_gen_workspace;
  end;

  gsl_eigen_sort_t = (
    GSL_EIGEN_SORT_VAL_ASC = 0,
    GSL_EIGEN_SORT_VAL_DESC = 1,
    GSL_EIGEN_SORT_ABS_ASC = 2,
    GSL_EIGEN_SORT_ABS_DESC = 3);
  Pgsl_eigen_sort_t = ^gsl_eigen_sort_t;

  gsl_fft_complex_wavetable = record
    n: NativeUInt;
    nf: NativeUInt;
    factor: array [0..63] of NativeUInt;
    twiddle: array [0..63] of Pgsl_complex;
    trig: Pgsl_complex;
  end;

  gsl_fft_complex_workspace = record
    n: NativeUInt;
    scratch: PDouble;
  end;

  gsl_fft_complex_wavetable_float = record
    n: NativeUInt;
    nf: NativeUInt;
    factor: array [0..63] of NativeUInt;
    twiddle: array [0..63] of Pgsl_complex_float;
    trig: Pgsl_complex_float;
  end;

  gsl_fft_complex_workspace_float = record
    n: NativeUInt;
    scratch: PSingle;
  end;

  gsl_fft_real_wavetable = record
    n: NativeUInt;
    nf: NativeUInt;
    factor: array [0..63] of NativeUInt;
    twiddle: array [0..63] of Pgsl_complex;
    trig: Pgsl_complex;
  end;

  gsl_fft_real_workspace = record
    n: NativeUInt;
    scratch: PDouble;
  end;

  gsl_fft_halfcomplex_wavetable = record
    n: NativeUInt;
    nf: NativeUInt;
    factor: array [0..63] of NativeUInt;
    twiddle: array [0..63] of Pgsl_complex;
    trig: Pgsl_complex;
  end;

  gsl_fft_real_wavetable_float = record
    n: NativeUInt;
    nf: NativeUInt;
    factor: array [0..63] of NativeUInt;
    twiddle: array [0..63] of Pgsl_complex_float;
    trig: Pgsl_complex_float;
  end;

  gsl_fft_real_workspace_float = record
    n: NativeUInt;
    scratch: PSingle;
  end;

  gsl_fft_halfcomplex_wavetable_float = record
    n: NativeUInt;
    nf: NativeUInt;
    factor: array [0..63] of NativeUInt;
    twiddle: array [0..63] of Pgsl_complex_float;
    trig: Pgsl_complex_float;
  end;

  gsl_movstat_end_t = (
    GSL_MOVSTAT_END_PADZERO = 0,
    GSL_MOVSTAT_END_PADVALUE = 1,
    GSL_MOVSTAT_END_TRUNCATE = 2);
  Pgsl_movstat_end_t = ^gsl_movstat_end_t;

  gsl_movstat_accum = record
    size: function(n: NativeUInt): UInt64; cdecl;
    init: function(n: NativeUInt; vstate: Pointer): Integer; cdecl;
    insert: function(x: Double; vstate: Pointer): Integer; cdecl;
    delete_oldest: function(vstate: Pointer): Integer; cdecl;
    get: function(params: Pointer; result: PDouble; vstate: Pointer): Integer; cdecl;
  end;

  gsl_movstat_function = record
    &function: function(n: NativeUInt; x: PDouble; params: Pointer): Double; cdecl;
    params: Pointer;
  end;

  gsl_movstat_workspace = record
    H: NativeUInt;
    J: NativeUInt;
    K: NativeUInt;
    work: PDouble;
    state: Pointer;
    state_size: NativeUInt;
  end;

  gsl_filter_end_t = (
    GSL_FILTER_END_PADZERO = 0,
    GSL_FILTER_END_PADVALUE = 1,
    GSL_FILTER_END_TRUNCATE = 2);
  Pgsl_filter_end_t = ^gsl_filter_end_t;

  gsl_filter_scale_t = (
    GSL_FILTER_SCALE_MAD = 0,
    GSL_FILTER_SCALE_IQR = 1,
    GSL_FILTER_SCALE_SN = 2,
    GSL_FILTER_SCALE_QN = 3);
  Pgsl_filter_scale_t = ^gsl_filter_scale_t;

  gsl_filter_gaussian_workspace = record
    K: NativeUInt;
    kernel: PDouble;
    movstat_workspace_p: Pgsl_movstat_workspace;
  end;

  gsl_filter_median_workspace = record
    movstat_workspace_p: Pgsl_movstat_workspace;
  end;

  gsl_filter_rmedian_workspace = record
    H: NativeUInt;
    K: NativeUInt;
    state: Pointer;
    window: PDouble;
    minmaxacc: Pgsl_movstat_accum;
    movstat_workspace_p: Pgsl_movstat_workspace;
  end;

  gsl_filter_impulse_workspace = record
    movstat_workspace_p: Pgsl_movstat_workspace;
  end;

  gsl_permutation_struct = record
    size: NativeUInt;
    data: PNativeUInt;
  end;

  gsl_permutation = gsl_permutation_struct;
  Pgsl_permutation = ^gsl_permutation;

  gsl_comparison_fn_t = function(p1: Pointer; p2: Pointer): Integer; cdecl;

  gsl_histogram = record
    n: NativeUInt;
    range: PDouble;
    bin: PDouble;
  end;

  gsl_histogram_pdf = record
    n: NativeUInt;
    range: PDouble;
    sum: PDouble;
  end;

  gsl_histogram2d = record
    nx: NativeUInt;
    ny: NativeUInt;
    xrange: PDouble;
    yrange: PDouble;
    bin: PDouble;
  end;

  gsl_histogram2d_pdf = record
    nx: NativeUInt;
    ny: NativeUInt;
    xrange: PDouble;
    yrange: PDouble;
    sum: PDouble;
  end;

  _anonymous_type_4 = (
    GSL_IEEE_TYPE_NAN = 1,
    GSL_IEEE_TYPE_INF = 2,
    GSL_IEEE_TYPE_NORMAL = 3,
    GSL_IEEE_TYPE_DENORMAL = 4,
    GSL_IEEE_TYPE_ZERO = 5);
  P_anonymous_type_4 = ^_anonymous_type_4;

  gsl_ieee_float_rep = record
    sign: Integer;
    mantissa: array [0..23] of UTF8Char;
    exponent: Integer;
    &type: Integer;
  end;

  gsl_ieee_double_rep = record
    sign: Integer;
    mantissa: array [0..52] of UTF8Char;
    exponent: Integer;
    &type: Integer;
  end;

  _anonymous_type_5 = (
    GSL_IEEE_SINGLE_PRECISION = 1,
    GSL_IEEE_DOUBLE_PRECISION = 2,
    GSL_IEEE_EXTENDED_PRECISION = 3);
  P_anonymous_type_5 = ^_anonymous_type_5;

  _anonymous_type_6 = (
    GSL_IEEE_ROUND_TO_NEAREST = 1,
    GSL_IEEE_ROUND_DOWN = 2,
    GSL_IEEE_ROUND_UP = 3,
    GSL_IEEE_ROUND_TO_ZERO = 4);
  P_anonymous_type_6 = ^_anonymous_type_6;

  _anonymous_type_7 = (
    GSL_IEEE_MASK_INVALID = 1,
    GSL_IEEE_MASK_DENORMALIZED = 2,
    GSL_IEEE_MASK_DIVISION_BY_ZERO = 4,
    GSL_IEEE_MASK_OVERFLOW = 8,
    GSL_IEEE_MASK_UNDERFLOW = 16,
    GSL_IEEE_MASK_ALL = 31,
    GSL_IEEE_TRAP_INEXACT = 32);
  P_anonymous_type_7 = ^_anonymous_type_7;

  gsl_integration_workspace = record
    limit: NativeUInt;
    size: NativeUInt;
    nrmax: NativeUInt;
    i: NativeUInt;
    maximum_level: NativeUInt;
    alist: PDouble;
    blist: PDouble;
    rlist: PDouble;
    elist: PDouble;
    order: PNativeUInt;
    level: PNativeUInt;
  end;

  gsl_integration_qaws_table = record
    alpha: Double;
    beta: Double;
    mu: Integer;
    nu: Integer;
    ri: array [0..24] of Double;
    rj: array [0..24] of Double;
    rg: array [0..24] of Double;
    rh: array [0..24] of Double;
  end;

  gsl_integration_qawo_enum = (
    GSL_INTEG_COSINE = 0,
    GSL_INTEG_SINE = 1);
  Pgsl_integration_qawo_enum = ^gsl_integration_qawo_enum;

  gsl_integration_qawo_table = record
    n: NativeUInt;
    omega: Double;
    L: Double;
    par: Double;
    sine: gsl_integration_qawo_enum;
    chebmo: PDouble;
  end;

  Pgsl_integration_rule = procedure(f: Pgsl_function; a: Double; b: Double; result: PDouble; abserr: PDouble; defabs: PDouble; resabs: PDouble); cdecl;

  _anonymous_type_8 = (
    GSL_INTEG_GAUSS15 = 1,
    GSL_INTEG_GAUSS21 = 2,
    GSL_INTEG_GAUSS31 = 3,
    GSL_INTEG_GAUSS41 = 4,
    GSL_INTEG_GAUSS51 = 5,
    GSL_INTEG_GAUSS61 = 6);
  P_anonymous_type_8 = ^_anonymous_type_8;

  gsl_integration_glfixed_table = record
    n: NativeUInt;
    x: PDouble;
    w: PDouble;
    precomputed: Integer;
  end;

  gsl_integration_cquad_ival = record
    a: Double;
    b: Double;
    c: array [0..63] of Double;
    fx: array [0..32] of Double;
    igral: Double;
    err: Double;
    depth: Integer;
    rdepth: Integer;
    ndiv: Integer;
  end;

  gsl_integration_cquad_workspace = record
    size: NativeUInt;
    ivals: Pgsl_integration_cquad_ival;
    heap: PNativeUInt;
  end;

  gsl_integration_romberg_workspace = record
    n: NativeUInt;
    work1: PDouble;
    work2: PDouble;
  end;

  gsl_integration_fixed_params = record
    alpha: Double;
    beta: Double;
    a: Double;
    b: Double;
    zemu: Double;
    shft: Double;
    slp: Double;
    al: Double;
    be: Double;
  end;

  gsl_integration_fixed_type = record
    check: function(n: NativeUInt; params: Pgsl_integration_fixed_params): Integer; cdecl;
    init: function(n: NativeUInt; diag: PDouble; subdiag: PDouble; params: Pgsl_integration_fixed_params): Integer; cdecl;
  end;

  gsl_integration_fixed_workspace = record
    n: NativeUInt;
    weights: PDouble;
    x: PDouble;
    diag: PDouble;
    subdiag: PDouble;
    &type: Pgsl_integration_fixed_type;
  end;

  gsl_interp_accel = record
    cache: NativeUInt;
    miss_count: NativeUInt;
    hit_count: NativeUInt;
  end;

  gsl_interp_type = record
    name: PUTF8Char;
    min_size: Cardinal;
    alloc: function(size: NativeUInt): Pointer; cdecl;
    init: function(p1: Pointer; xa: PDouble; ya: PDouble; size: NativeUInt): Integer; cdecl;
    eval: function(p1: Pointer; xa: PDouble; ya: PDouble; size: NativeUInt; x: Double; p6: Pgsl_interp_accel; y: PDouble): Integer; cdecl;
    eval_deriv: function(p1: Pointer; xa: PDouble; ya: PDouble; size: NativeUInt; x: Double; p6: Pgsl_interp_accel; y_p: PDouble): Integer; cdecl;
    eval_deriv2: function(p1: Pointer; xa: PDouble; ya: PDouble; size: NativeUInt; x: Double; p6: Pgsl_interp_accel; y_pp: PDouble): Integer; cdecl;
    eval_integ: function(p1: Pointer; xa: PDouble; ya: PDouble; size: NativeUInt; p5: Pgsl_interp_accel; a: Double; b: Double; result: PDouble): Integer; cdecl;
    free: procedure(p1: Pointer); cdecl;
  end;

  gsl_interp = record
    &type: Pgsl_interp_type;
    xmin: Double;
    xmax: Double;
    size: NativeUInt;
    state: Pointer;
  end;

  gsl_interp2d_type = record
    name: PUTF8Char;
    min_size: Cardinal;
    alloc: function(xsize: NativeUInt; ysize: NativeUInt): Pointer; cdecl;
    init: function(p1: Pointer; xa: PDouble; ya: PDouble; za: PDouble; xsize: NativeUInt; ysize: NativeUInt): Integer; cdecl;
    eval: function(p1: Pointer; xa: PDouble; ya: PDouble; za: PDouble; xsize: NativeUInt; ysize: NativeUInt; x: Double; y: Double; p9: Pgsl_interp_accel; p10: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
    eval_deriv_x: function(p1: Pointer; xa: PDouble; ya: PDouble; za: PDouble; xsize: NativeUInt; ysize: NativeUInt; x: Double; y: Double; p9: Pgsl_interp_accel; p10: Pgsl_interp_accel; z_p: PDouble): Integer; cdecl;
    eval_deriv_y: function(p1: Pointer; xa: PDouble; ya: PDouble; za: PDouble; xsize: NativeUInt; ysize: NativeUInt; x: Double; y: Double; p9: Pgsl_interp_accel; p10: Pgsl_interp_accel; z_p: PDouble): Integer; cdecl;
    eval_deriv_xx: function(p1: Pointer; xa: PDouble; ya: PDouble; za: PDouble; xsize: NativeUInt; ysize: NativeUInt; x: Double; y: Double; p9: Pgsl_interp_accel; p10: Pgsl_interp_accel; z_pp: PDouble): Integer; cdecl;
    eval_deriv_xy: function(p1: Pointer; xa: PDouble; ya: PDouble; za: PDouble; xsize: NativeUInt; ysize: NativeUInt; x: Double; y: Double; p9: Pgsl_interp_accel; p10: Pgsl_interp_accel; z_pp: PDouble): Integer; cdecl;
    eval_deriv_yy: function(p1: Pointer; xa: PDouble; ya: PDouble; za: PDouble; xsize: NativeUInt; ysize: NativeUInt; x: Double; y: Double; p9: Pgsl_interp_accel; p10: Pgsl_interp_accel; z_pp: PDouble): Integer; cdecl;
    free: procedure(p1: Pointer); cdecl;
  end;

  gsl_interp2d = record
    &type: Pgsl_interp2d_type;
    xmin: Double;
    xmax: Double;
    ymin: Double;
    ymax: Double;
    xsize: NativeUInt;
    ysize: NativeUInt;
    state: Pointer;
  end;

  gsl_linalg_matrix_mod_t = (
    GSL_LINALG_MOD_NONE = 0,
    GSL_LINALG_MOD_TRANSPOSE = 1,
    GSL_LINALG_MOD_CONJUGATE = 2);
  Pgsl_linalg_matrix_mod_t = ^gsl_linalg_matrix_mod_t;

  _anonymous_type_9 = (
    GSL_MESSAGE_MASK_A = 1,
    GSL_MESSAGE_MASK_B = 2,
    GSL_MESSAGE_MASK_C = 4,
    GSL_MESSAGE_MASK_D = 8,
    GSL_MESSAGE_MASK_E = 16,
    GSL_MESSAGE_MASK_F = 32,
    GSL_MESSAGE_MASK_G = 64,
    GSL_MESSAGE_MASK_H = 128);
  P_anonymous_type_9 = ^_anonymous_type_9;

  gsl_min_fminimizer_type = record
    name: PUTF8Char;
    size: NativeUInt;
    &set: function(state: Pointer; f: Pgsl_function; x_minimum: Double; f_minimum: Double; x_lower: Double; f_lower: Double; x_upper: Double; f_upper: Double): Integer; cdecl;
    iterate: function(state: Pointer; f: Pgsl_function; x_minimum: PDouble; f_minimum: PDouble; x_lower: PDouble; f_lower: PDouble; x_upper: PDouble; f_upper: PDouble): Integer; cdecl;
  end;

  gsl_min_fminimizer = record
    &type: Pgsl_min_fminimizer_type;
    &function: Pgsl_function;
    x_minimum: Double;
    x_lower: Double;
    x_upper: Double;
    f_minimum: Double;
    f_lower: Double;
    f_upper: Double;
    state: Pointer;
  end;

  gsl_min_bracketing_function = function(f: Pgsl_function; x_minimum: PDouble; f_minimum: PDouble; x_lower: PDouble; f_lower: PDouble; x_upper: PDouble; f_upper: PDouble; eval_max: NativeUInt): Integer; cdecl;

  gsl_monte_function_struct = record
    f: function(x_array: PDouble; dim: NativeUInt; params: Pointer): Double; cdecl;
    dim: NativeUInt;
    params: Pointer;
  end;

  gsl_monte_function = gsl_monte_function_struct;
  Pgsl_monte_function = ^gsl_monte_function;

  gsl_rng_type = record
    name: PUTF8Char;
    max: Cardinal;
    min: Cardinal;
    size: NativeUInt;
    &set: procedure(state: Pointer; seed: Cardinal); cdecl;
    get: function(state: Pointer): Cardinal; cdecl;
    get_double: function(state: Pointer): Double; cdecl;
  end;

  gsl_rng = record
    &type: Pgsl_rng_type;
    state: Pointer;
  end;

  gsl_monte_plain_state = record
    dim: NativeUInt;
    x: PDouble;
  end;

  gsl_monte_miser_state = record
    min_calls: NativeUInt;
    min_calls_per_bisection: NativeUInt;
    dither: Double;
    estimate_frac: Double;
    alpha: Double;
    dim: NativeUInt;
    estimate_style: Integer;
    depth: Integer;
    verbose: Integer;
    x: PDouble;
    xmid: PDouble;
    sigma_l: PDouble;
    sigma_r: PDouble;
    fmax_l: PDouble;
    fmax_r: PDouble;
    fmin_l: PDouble;
    fmin_r: PDouble;
    fsum_l: PDouble;
    fsum_r: PDouble;
    fsum2_l: PDouble;
    fsum2_r: PDouble;
    hits_l: PNativeUInt;
    hits_r: PNativeUInt;
  end;

  gsl_monte_miser_params = record
    estimate_frac: Double;
    min_calls: NativeUInt;
    min_calls_per_bisection: NativeUInt;
    alpha: Double;
    dither: Double;
  end;

  _anonymous_type_10 = (
    GSL_VEGAS_MODE_IMPORTANCE = 1,
    GSL_VEGAS_MODE_IMPORTANCE_ONLY = 0,
    GSL_VEGAS_MODE_STRATIFIED = -1);
  P_anonymous_type_10 = ^_anonymous_type_10;

  gsl_monte_vegas_state = record
    dim: NativeUInt;
    bins_max: NativeUInt;
    bins: Cardinal;
    boxes: Cardinal;
    xi: PDouble;
    xin: PDouble;
    delx: PDouble;
    weight: PDouble;
    vol: Double;
    x: PDouble;
    bin: PInteger;
    box: PInteger;
    d: PDouble;
    alpha: Double;
    mode: Integer;
    verbose: Integer;
    iterations: Cardinal;
    stage: Integer;
    jac: Double;
    wtd_int_sum: Double;
    sum_wgts: Double;
    chi_sum: Double;
    chisq: Double;
    result: Double;
    sigma: Double;
    it_start: Cardinal;
    it_num: Cardinal;
    samples: Cardinal;
    calls_per_box: Cardinal;
    ostream: PPointer;
  end;

  gsl_monte_vegas_params = record
    alpha: Double;
    iterations: NativeUInt;
    stage: Integer;
    mode: Integer;
    verbose: Integer;
    ostream: PPointer;
  end;

  gsl_multifit_linear_workspace = record
    nmax: NativeUInt;
    pmax: NativeUInt;
    n: NativeUInt;
    p: NativeUInt;
    A: Pgsl_matrix;
    Q: Pgsl_matrix;
    QSI: Pgsl_matrix;
    S: Pgsl_vector;
    t: Pgsl_vector;
    xt: Pgsl_vector;
    D: Pgsl_vector;
    rcond: Double;
  end;

  gsl_multifit_robust_type = record
    name: PUTF8Char;
    wfun: function(r: Pgsl_vector; w: Pgsl_vector): Integer; cdecl;
    psi_deriv: function(r: Pgsl_vector; dpsi: Pgsl_vector): Integer; cdecl;
    tuning_default: Double;
  end;

  gsl_multifit_robust_stats = record
    sigma_ols: Double;
    sigma_mad: Double;
    sigma_rob: Double;
    sigma: Double;
    Rsq: Double;
    adj_Rsq: Double;
    rmse: Double;
    sse: Double;
    dof: NativeUInt;
    numit: NativeUInt;
    weights: Pgsl_vector;
    r: Pgsl_vector;
  end;

  gsl_multifit_robust_workspace = record
    n: NativeUInt;
    p: NativeUInt;
    numit: NativeUInt;
    maxiter: NativeUInt;
    &type: Pgsl_multifit_robust_type;
    tune: Double;
    r: Pgsl_vector;
    weights: Pgsl_vector;
    c_prev: Pgsl_vector;
    resfac: Pgsl_vector;
    psi: Pgsl_vector;
    dpsi: Pgsl_vector;
    QSI: Pgsl_matrix;
    D: Pgsl_vector;
    workn: Pgsl_vector;
    stats: gsl_multifit_robust_stats;
    multifit_p: Pgsl_multifit_linear_workspace;
  end;

  gsl_multifit_function_struct = record
    f: function(x: Pgsl_vector; params: Pointer; f: Pgsl_vector): Integer; cdecl;
    n: NativeUInt;
    p: NativeUInt;
    params: Pointer;
  end;

  gsl_multifit_function = gsl_multifit_function_struct;
  Pgsl_multifit_function = ^gsl_multifit_function;

  gsl_multifit_fsolver_type = record
    name: PUTF8Char;
    size: NativeUInt;
    alloc: function(state: Pointer; n: NativeUInt; p: NativeUInt): Integer; cdecl;
    &set: function(state: Pointer; &function: Pgsl_multifit_function; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): Integer; cdecl;
    iterate: function(state: Pointer; &function: Pgsl_multifit_function; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): Integer; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_multifit_fsolver = record
    &type: Pgsl_multifit_fsolver_type;
    &function: Pgsl_multifit_function;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    state: Pointer;
  end;

  gsl_multifit_function_fdf_struct = record
    f: function(x: Pgsl_vector; params: Pointer; f: Pgsl_vector): Integer; cdecl;
    df: function(x: Pgsl_vector; params: Pointer; df: Pgsl_matrix): Integer; cdecl;
    fdf: function(x: Pgsl_vector; params: Pointer; f: Pgsl_vector; df: Pgsl_matrix): Integer; cdecl;
    n: NativeUInt;
    p: NativeUInt;
    params: Pointer;
    nevalf: NativeUInt;
    nevaldf: NativeUInt;
  end;

  gsl_multifit_function_fdf = gsl_multifit_function_fdf_struct;
  Pgsl_multifit_function_fdf = ^gsl_multifit_function_fdf;

  gsl_multifit_fdfsolver_type = record
    name: PUTF8Char;
    size: NativeUInt;
    alloc: function(state: Pointer; n: NativeUInt; p: NativeUInt): Integer; cdecl;
    &set: function(state: Pointer; wts: Pgsl_vector; fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): Integer; cdecl;
    iterate: function(state: Pointer; wts: Pgsl_vector; fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): Integer; cdecl;
    gradient: function(state: Pointer; g: Pgsl_vector): Integer; cdecl;
    jac: function(state: Pointer; J: Pgsl_matrix): Integer; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_multifit_fdfsolver = record
    &type: Pgsl_multifit_fdfsolver_type;
    fdf: Pgsl_multifit_function_fdf;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    g: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    niter: NativeUInt;
    state: Pointer;
  end;

  gsl_multifit_fdfridge = record
    n: NativeUInt;
    p: NativeUInt;
    lambda: Double;
    L_diag: Pgsl_vector;
    L: Pgsl_matrix;
    f: Pgsl_vector;
    wts: Pgsl_vector;
    s: Pgsl_multifit_fdfsolver;
    fdf: Pgsl_multifit_function_fdf;
    fdftik: gsl_multifit_function_fdf;
  end;

  gsl_multifit_nlinear_fdtype = (
    GSL_MULTIFIT_NLINEAR_FWDIFF = 0,
    GSL_MULTIFIT_NLINEAR_CTRDIFF = 1);
  Pgsl_multifit_nlinear_fdtype = ^gsl_multifit_nlinear_fdtype;

  gsl_multifit_nlinear_fdf = record
    f: function(x: Pgsl_vector; params: Pointer; f: Pgsl_vector): Integer; cdecl;
    df: function(x: Pgsl_vector; params: Pointer; df: Pgsl_matrix): Integer; cdecl;
    fvv: function(x: Pgsl_vector; v: Pgsl_vector; params: Pointer; fvv: Pgsl_vector): Integer; cdecl;
    n: NativeUInt;
    p: NativeUInt;
    params: Pointer;
    nevalf: NativeUInt;
    nevaldf: NativeUInt;
    nevalfvv: NativeUInt;
  end;

  gsl_multifit_nlinear_trs = record
    name: PUTF8Char;
    alloc: function(params: Pointer; n: NativeUInt; p: NativeUInt): Pointer; cdecl;
    init: function(vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    preloop: function(vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    step: function(vtrust_state: Pointer; delta: Double; dx: Pgsl_vector; vstate: Pointer): Integer; cdecl;
    preduction: function(vtrust_state: Pointer; dx: Pgsl_vector; pred: PDouble; vstate: Pointer): Integer; cdecl;
    free: procedure(vstate: Pointer); cdecl;
  end;

  gsl_multifit_nlinear_scale = record
    name: PUTF8Char;
    init: function(J: Pgsl_matrix; diag: Pgsl_vector): Integer; cdecl;
    update: function(J: Pgsl_matrix; diag: Pgsl_vector): Integer; cdecl;
  end;

  gsl_multifit_nlinear_solver = record
    name: PUTF8Char;
    alloc: function(n: NativeUInt; p: NativeUInt): Pointer; cdecl;
    init: function(vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    presolve: function(mu: Double; vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    solve: function(f: Pgsl_vector; x: Pgsl_vector; vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    rcond: function(rcond: PDouble; vstate: Pointer): Integer; cdecl;
    free: procedure(vstate: Pointer); cdecl;
  end;

  gsl_multifit_nlinear_parameters = record
    trs: Pgsl_multifit_nlinear_trs;
    scale: Pgsl_multifit_nlinear_scale;
    solver: Pgsl_multifit_nlinear_solver;
    fdtype: gsl_multifit_nlinear_fdtype;
    factor_up: Double;
    factor_down: Double;
    avmax: Double;
    h_df: Double;
    h_fvv: Double;
  end;

  gsl_multifit_nlinear_type = record
    name: PUTF8Char;
    alloc: function(params: Pgsl_multifit_nlinear_parameters; n: NativeUInt; p: NativeUInt): Pointer; cdecl;
    init: function(state: Pointer; wts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; x: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix; g: Pgsl_vector): Integer; cdecl;
    iterate: function(state: Pointer; wts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; x: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix; g: Pgsl_vector; dx: Pgsl_vector): Integer; cdecl;
    rcond: function(rcond: PDouble; state: Pointer): Integer; cdecl;
    avratio: function(state: Pointer): Double; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_multifit_nlinear_trust_state = record
    x: Pgsl_vector;
    f: Pgsl_vector;
    g: Pgsl_vector;
    J: Pgsl_matrix;
    diag: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    mu: PDouble;
    params: Pgsl_multifit_nlinear_parameters;
    solver_state: Pointer;
    fdf: Pgsl_multifit_nlinear_fdf;
    avratio: PDouble;
  end;

  gsl_multifit_nlinear_workspace = record
    &type: Pgsl_multifit_nlinear_type;
    fdf: Pgsl_multifit_nlinear_fdf;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    g: Pgsl_vector;
    J: Pgsl_matrix;
    sqrt_wts_work: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    niter: NativeUInt;
    params: gsl_multifit_nlinear_parameters;
    state: Pointer;
  end;

  gsl_multilarge_linear_type = record
    name: PUTF8Char;
    alloc: function(p: NativeUInt): Pointer; cdecl;
    reset: function(p1: Pointer): Integer; cdecl;
    accumulate: function(X: Pgsl_matrix; y: Pgsl_vector; p3: Pointer): Integer; cdecl;
    solve: function(lambda: Double; c: Pgsl_vector; rnorm: PDouble; snorm: PDouble; p5: Pointer): Integer; cdecl;
    rcond: function(rcond: PDouble; p2: Pointer): Integer; cdecl;
    lcurve: function(reg_param: Pgsl_vector; rho: Pgsl_vector; eta: Pgsl_vector; p4: Pointer): Integer; cdecl;
    free: procedure(p1: Pointer); cdecl;
  end;

  gsl_multilarge_linear_workspace = record
    &type: Pgsl_multilarge_linear_type;
    state: Pointer;
    p: NativeUInt;
  end;

  gsl_multilarge_nlinear_fdtype = (
    GSL_MULTILARGE_NLINEAR_FWDIFF = 0,
    GSL_MULTILARGE_NLINEAR_CTRDIFF = 1);
  Pgsl_multilarge_nlinear_fdtype = ^gsl_multilarge_nlinear_fdtype;

  gsl_multilarge_nlinear_fdf = record
    f: function(x: Pgsl_vector; params: Pointer; f: Pgsl_vector): Integer; cdecl;
    df: function(TransJ: CBLAS_TRANSPOSE_t; x: Pgsl_vector; u: Pgsl_vector; params: Pointer; v: Pgsl_vector; JTJ: Pgsl_matrix): Integer; cdecl;
    fvv: function(x: Pgsl_vector; v: Pgsl_vector; params: Pointer; fvv: Pgsl_vector): Integer; cdecl;
    n: NativeUInt;
    p: NativeUInt;
    params: Pointer;
    nevalf: NativeUInt;
    nevaldfu: NativeUInt;
    nevaldf2: NativeUInt;
    nevalfvv: NativeUInt;
  end;

  gsl_multilarge_nlinear_trs = record
    name: PUTF8Char;
    alloc: function(params: Pointer; n: NativeUInt; p: NativeUInt): Pointer; cdecl;
    init: function(vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    preloop: function(vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    step: function(vtrust_state: Pointer; delta: Double; dx: Pgsl_vector; vstate: Pointer): Integer; cdecl;
    preduction: function(vtrust_state: Pointer; dx: Pgsl_vector; pred: PDouble; vstate: Pointer): Integer; cdecl;
    free: procedure(vstate: Pointer); cdecl;
  end;

  gsl_multilarge_nlinear_scale = record
    name: PUTF8Char;
    init: function(JTJ: Pgsl_matrix; diag: Pgsl_vector): Integer; cdecl;
    update: function(JTJ: Pgsl_matrix; diag: Pgsl_vector): Integer; cdecl;
  end;

  gsl_multilarge_nlinear_solver = record
    name: PUTF8Char;
    alloc: function(n: NativeUInt; p: NativeUInt): Pointer; cdecl;
    init: function(vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    presolve: function(mu: Double; vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    solve: function(g: Pgsl_vector; x: Pgsl_vector; vtrust_state: Pointer; vstate: Pointer): Integer; cdecl;
    rcond: function(rcond: PDouble; JTJ: Pgsl_matrix; vstate: Pointer): Integer; cdecl;
    covar: function(JTJ: Pgsl_matrix; covar: Pgsl_matrix; vstate: Pointer): Integer; cdecl;
    free: procedure(vstate: Pointer); cdecl;
  end;

  gsl_multilarge_nlinear_parameters = record
    trs: Pgsl_multilarge_nlinear_trs;
    scale: Pgsl_multilarge_nlinear_scale;
    solver: Pgsl_multilarge_nlinear_solver;
    fdtype: gsl_multilarge_nlinear_fdtype;
    factor_up: Double;
    factor_down: Double;
    avmax: Double;
    h_df: Double;
    h_fvv: Double;
    max_iter: NativeUInt;
    tol: Double;
  end;

  gsl_multilarge_nlinear_type = record
    name: PUTF8Char;
    alloc: function(params: Pgsl_multilarge_nlinear_parameters; n: NativeUInt; p: NativeUInt): Pointer; cdecl;
    init: function(state: Pointer; wts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; x: Pgsl_vector; f: Pgsl_vector; g: Pgsl_vector; JTJ: Pgsl_matrix): Integer; cdecl;
    iterate: function(state: Pointer; wts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; x: Pgsl_vector; f: Pgsl_vector; g: Pgsl_vector; JTJ: Pgsl_matrix; dx: Pgsl_vector): Integer; cdecl;
    rcond: function(rcond: PDouble; JTJ: Pgsl_matrix; state: Pointer): Integer; cdecl;
    covar: function(JTJ: Pgsl_matrix; covar: Pgsl_matrix; state: Pointer): Integer; cdecl;
    avratio: function(state: Pointer): Double; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_multilarge_nlinear_trust_state = record
    x: Pgsl_vector;
    f: Pgsl_vector;
    g: Pgsl_vector;
    JTJ: Pgsl_matrix;
    diag: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    mu: PDouble;
    params: Pgsl_multilarge_nlinear_parameters;
    solver_state: Pointer;
    fdf: Pgsl_multilarge_nlinear_fdf;
    avratio: PDouble;
  end;

  gsl_multilarge_nlinear_workspace = record
    &type: Pgsl_multilarge_nlinear_type;
    fdf: Pgsl_multilarge_nlinear_fdf;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    g: Pgsl_vector;
    JTJ: Pgsl_matrix;
    sqrt_wts_work: Pgsl_vector;
    sqrt_wts: Pgsl_vector;
    n: NativeUInt;
    p: NativeUInt;
    niter: NativeUInt;
    params: gsl_multilarge_nlinear_parameters;
    state: Pointer;
  end;

  gsl_multimin_function_struct = record
    f: function(x: Pgsl_vector; params: Pointer): Double; cdecl;
    n: NativeUInt;
    params: Pointer;
  end;

  gsl_multimin_function = gsl_multimin_function_struct;
  Pgsl_multimin_function = ^gsl_multimin_function;

  gsl_multimin_function_fdf_struct = record
    f: function(x: Pgsl_vector; params: Pointer): Double; cdecl;
    df: procedure(x: Pgsl_vector; params: Pointer; df: Pgsl_vector); cdecl;
    fdf: procedure(x: Pgsl_vector; params: Pointer; f: PDouble; df: Pgsl_vector); cdecl;
    n: NativeUInt;
    params: Pointer;
  end;

  gsl_multimin_function_fdf = gsl_multimin_function_fdf_struct;
  Pgsl_multimin_function_fdf = ^gsl_multimin_function_fdf;

  gsl_multimin_fminimizer_type = record
    name: PUTF8Char;
    size: NativeUInt;
    alloc: function(state: Pointer; n: NativeUInt): Integer; cdecl;
    &set: function(state: Pointer; f: Pgsl_multimin_function; x: Pgsl_vector; size: PDouble; step_size: Pgsl_vector): Integer; cdecl;
    iterate: function(state: Pointer; f: Pgsl_multimin_function; x: Pgsl_vector; size: PDouble; fval: PDouble): Integer; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_multimin_fminimizer = record
    &type: Pgsl_multimin_fminimizer_type;
    f: Pgsl_multimin_function;
    fval: Double;
    x: Pgsl_vector;
    size: Double;
    state: Pointer;
  end;

  gsl_multimin_fdfminimizer_type = record
    name: PUTF8Char;
    size: NativeUInt;
    alloc: function(state: Pointer; n: NativeUInt): Integer; cdecl;
    &set: function(state: Pointer; fdf: Pgsl_multimin_function_fdf; x: Pgsl_vector; f: PDouble; gradient: Pgsl_vector; step_size: Double; tol: Double): Integer; cdecl;
    iterate: function(state: Pointer; fdf: Pgsl_multimin_function_fdf; x: Pgsl_vector; f: PDouble; gradient: Pgsl_vector; dx: Pgsl_vector): Integer; cdecl;
    restart: function(state: Pointer): Integer; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_multimin_fdfminimizer = record
    &type: Pgsl_multimin_fdfminimizer_type;
    fdf: Pgsl_multimin_function_fdf;
    f: Double;
    x: Pgsl_vector;
    gradient: Pgsl_vector;
    dx: Pgsl_vector;
    state: Pointer;
  end;

  gsl_multiroot_function_struct = record
    f: function(x: Pgsl_vector; params: Pointer; f: Pgsl_vector): Integer; cdecl;
    n: NativeUInt;
    params: Pointer;
  end;

  gsl_multiroot_function = gsl_multiroot_function_struct;
  Pgsl_multiroot_function = ^gsl_multiroot_function;

  gsl_multiroot_fsolver_type = record
    name: PUTF8Char;
    size: NativeUInt;
    alloc: function(state: Pointer; n: NativeUInt): Integer; cdecl;
    &set: function(state: Pointer; &function: Pgsl_multiroot_function; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): Integer; cdecl;
    iterate: function(state: Pointer; &function: Pgsl_multiroot_function; x: Pgsl_vector; f: Pgsl_vector; dx: Pgsl_vector): Integer; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_multiroot_fsolver = record
    &type: Pgsl_multiroot_fsolver_type;
    &function: Pgsl_multiroot_function;
    x: Pgsl_vector;
    f: Pgsl_vector;
    dx: Pgsl_vector;
    state: Pointer;
  end;

  gsl_multiroot_function_fdf_struct = record
    f: function(x: Pgsl_vector; params: Pointer; f: Pgsl_vector): Integer; cdecl;
    df: function(x: Pgsl_vector; params: Pointer; df: Pgsl_matrix): Integer; cdecl;
    fdf: function(x: Pgsl_vector; params: Pointer; f: Pgsl_vector; df: Pgsl_matrix): Integer; cdecl;
    n: NativeUInt;
    params: Pointer;
  end;

  gsl_multiroot_function_fdf = gsl_multiroot_function_fdf_struct;
  Pgsl_multiroot_function_fdf = ^gsl_multiroot_function_fdf;

  gsl_multiroot_fdfsolver_type = record
    name: PUTF8Char;
    size: NativeUInt;
    alloc: function(state: Pointer; n: NativeUInt): Integer; cdecl;
    &set: function(state: Pointer; fdf: Pgsl_multiroot_function_fdf; x: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix; dx: Pgsl_vector): Integer; cdecl;
    iterate: function(state: Pointer; fdf: Pgsl_multiroot_function_fdf; x: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix; dx: Pgsl_vector): Integer; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_multiroot_fdfsolver = record
    &type: Pgsl_multiroot_fdfsolver_type;
    fdf: Pgsl_multiroot_function_fdf;
    x: Pgsl_vector;
    f: Pgsl_vector;
    J: Pgsl_matrix;
    dx: Pgsl_vector;
    state: Pointer;
  end;

  gsl_multiset_struct = record
    n: NativeUInt;
    k: NativeUInt;
    data: PNativeUInt;
  end;

  gsl_multiset = gsl_multiset_struct;
  Pgsl_multiset = ^gsl_multiset;

  gsl_ntuple = record
    &file: PPointer;
    ntuple_data: Pointer;
    size: NativeUInt;
  end;

  gsl_ntuple_select_fn = record
    &function: function(ntuple_data: Pointer; params: Pointer): Integer; cdecl;
    params: Pointer;
  end;

  gsl_ntuple_value_fn = record
    &function: function(ntuple_data: Pointer; params: Pointer): Double; cdecl;
    params: Pointer;
  end;

  gsl_odeiv_system = record
    &function: function(t: Double; y: PDouble; dydt: PDouble; params: Pointer): Integer; cdecl;
    jacobian: function(t: Double; y: PDouble; dfdy: PDouble; dfdt: PDouble; params: Pointer): Integer; cdecl;
    dimension: NativeUInt;
    params: Pointer;
  end;

  gsl_odeiv_step_type = record
    name: PUTF8Char;
    can_use_dydt_in: Integer;
    gives_exact_dydt_out: Integer;
    alloc: function(dim: NativeUInt): Pointer; cdecl;
    apply: function(state: Pointer; dim: NativeUInt; t: Double; h: Double; y: PDouble; yerr: PDouble; dydt_in: PDouble; dydt_out: PDouble; dydt: Pgsl_odeiv_system): Integer; cdecl;
    reset: function(state: Pointer; dim: NativeUInt): Integer; cdecl;
    order: function(state: Pointer): Cardinal; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_odeiv_step = record
    &type: Pgsl_odeiv_step_type;
    dimension: NativeUInt;
    state: Pointer;
  end;

  gsl_odeiv_control_type = record
    name: PUTF8Char;
    alloc: function(): Pointer; cdecl;
    init: function(state: Pointer; eps_abs: Double; eps_rel: Double; a_y: Double; a_dydt: Double): Integer; cdecl;
    hadjust: function(state: Pointer; dim: NativeUInt; ord: Cardinal; y: PDouble; yerr: PDouble; yp: PDouble; h: PDouble): Integer; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_odeiv_control = record
    &type: Pgsl_odeiv_control_type;
    state: Pointer;
  end;

  gsl_odeiv_evolve = record
    dimension: NativeUInt;
    y0: PDouble;
    yerr: PDouble;
    dydt_in: PDouble;
    dydt_out: PDouble;
    last_step: Double;
    count: Cardinal;
    failed_steps: Cardinal;
  end;

  gsl_odeiv2_system = record
    &function: function(t: Double; y: PDouble; dydt: PDouble; params: Pointer): Integer; cdecl;
    jacobian: function(t: Double; y: PDouble; dfdy: PDouble; dfdt: PDouble; params: Pointer): Integer; cdecl;
    dimension: NativeUInt;
    params: Pointer;
  end;

  Pgsl_odeiv2_step = ^gsl_odeiv2_step;
  Pgsl_odeiv2_control = ^gsl_odeiv2_control;
  Pgsl_odeiv2_evolve = ^gsl_odeiv2_evolve;
  Pgsl_odeiv2_driver = ^gsl_odeiv2_driver;

  gsl_odeiv2_step_type = record
    name: PUTF8Char;
    can_use_dydt_in: Integer;
    gives_exact_dydt_out: Integer;
    alloc: function(dim: NativeUInt): Pointer; cdecl;
    apply: function(state: Pointer; dim: NativeUInt; t: Double; h: Double; y: PDouble; yerr: PDouble; dydt_in: PDouble; dydt_out: PDouble; dydt: Pgsl_odeiv2_system): Integer; cdecl;
    set_driver: function(state: Pointer; d: Pgsl_odeiv2_driver): Integer; cdecl;
    reset: function(state: Pointer; dim: NativeUInt): Integer; cdecl;
    order: function(state: Pointer): Cardinal; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_odeiv2_step_struct = record
    &type: Pgsl_odeiv2_step_type;
    dimension: NativeUInt;
    state: Pointer;
  end;
  gsl_odeiv2_step = gsl_odeiv2_step_struct;

  gsl_odeiv2_control_type = record
    name: PUTF8Char;
    alloc: function(): Pointer; cdecl;
    init: function(state: Pointer; eps_abs: Double; eps_rel: Double; a_y: Double; a_dydt: Double): Integer; cdecl;
    hadjust: function(state: Pointer; dim: NativeUInt; ord: Cardinal; y: PDouble; yerr: PDouble; yp: PDouble; h: PDouble): Integer; cdecl;
    errlevel: function(state: Pointer; y: Double; dydt: Double; h: Double; ind: NativeUInt; errlev: PDouble): Integer; cdecl;
    set_driver: function(state: Pointer; d: Pgsl_odeiv2_driver): Integer; cdecl;
    free: procedure(state: Pointer); cdecl;
  end;

  gsl_odeiv2_control_struct = record
    &type: Pgsl_odeiv2_control_type;
    state: Pointer;
  end;
  gsl_odeiv2_control = gsl_odeiv2_control_struct;

  gsl_odeiv2_evolve_struct = record
    dimension: NativeUInt;
    y0: PDouble;
    yerr: PDouble;
    dydt_in: PDouble;
    dydt_out: PDouble;
    last_step: Double;
    count: Cardinal;
    failed_steps: Cardinal;
    driver: Pgsl_odeiv2_driver;
  end;
  gsl_odeiv2_evolve = gsl_odeiv2_evolve_struct;

  gsl_odeiv2_driver_struct = record
    sys: Pgsl_odeiv2_system;
    s: Pgsl_odeiv2_step;
    c: Pgsl_odeiv2_control;
    e: Pgsl_odeiv2_evolve;
    h: Double;
    hmin: Double;
    hmax: Double;
    n: Cardinal;
    nmax: Cardinal;
  end;
  gsl_odeiv2_driver = gsl_odeiv2_driver_struct;

  gsl_poly_complex_workspace = record
    nc: NativeUInt;
    matrix: PDouble;
  end;

  gsl_qrng_type = record
    name: PUTF8Char;
    max_dimension: Cardinal;
    state_size: function(dimension: Cardinal): UInt64; cdecl;
    init_state: function(state: Pointer; dimension: Cardinal): Integer; cdecl;
    get: function(state: Pointer; dimension: Cardinal; x: PDouble): Integer; cdecl;
  end;

  gsl_qrng = record
    &type: Pgsl_qrng_type;
    dimension: Cardinal;
    state_size: NativeUInt;
    state: Pointer;
  end;

  gsl_ran_discrete_t = record
    K: NativeUInt;
    A: PNativeUInt;
    F: PDouble;
  end;

  gsl_root_fsolver_type = record
    name: PUTF8Char;
    size: NativeUInt;
    &set: function(state: Pointer; f: Pgsl_function; root: PDouble; x_lower: Double; x_upper: Double): Integer; cdecl;
    iterate: function(state: Pointer; f: Pgsl_function; root: PDouble; x_lower: PDouble; x_upper: PDouble): Integer; cdecl;
  end;

  gsl_root_fsolver = record
    &type: Pgsl_root_fsolver_type;
    &function: Pgsl_function;
    root: Double;
    x_lower: Double;
    x_upper: Double;
    state: Pointer;
  end;

  gsl_root_fdfsolver_type = record
    name: PUTF8Char;
    size: NativeUInt;
    &set: function(state: Pointer; f: Pgsl_function_fdf; root: PDouble): Integer; cdecl;
    iterate: function(state: Pointer; f: Pgsl_function_fdf; root: PDouble): Integer; cdecl;
  end;

  gsl_root_fdfsolver = record
    &type: Pgsl_root_fdfsolver_type;
    fdf: Pgsl_function_fdf;
    root: Double;
    state: Pointer;
  end;

  gsl_rstat_quantile_workspace = record
    p: Double;
    q: array [0..4] of Double;
    npos: array [0..4] of Integer;
    np: array [0..4] of Double;
    dnp: array [0..4] of Double;
    n: NativeUInt;
  end;

  gsl_rstat_workspace = record
    min: Double;
    max: Double;
    mean: Double;
    M2: Double;
    M3: Double;
    M4: Double;
    n: NativeUInt;
    median_workspace_p: Pgsl_rstat_quantile_workspace;
  end;

  gsl_sf_result_struct = record
    val: Double;
    err: Double;
  end;

  gsl_sf_result = gsl_sf_result_struct;
  Pgsl_sf_result = ^gsl_sf_result;

  gsl_sf_result_e10_struct = record
    val: Double;
    err: Double;
    e10: Integer;
  end;

  gsl_sf_result_e10 = gsl_sf_result_e10_struct;
  Pgsl_sf_result_e10 = ^gsl_sf_result_e10;

  gsl_sf_legendre_t = (
    GSL_SF_LEGENDRE_SCHMIDT = 0,
    GSL_SF_LEGENDRE_SPHARM = 1,
    GSL_SF_LEGENDRE_FULL = 2,
    GSL_SF_LEGENDRE_NONE = 3);
  Pgsl_sf_legendre_t = ^gsl_sf_legendre_t;

  gsl_sf_mathieu_workspace = record
    size: NativeUInt;
    even_order: NativeUInt;
    odd_order: NativeUInt;
    extra_values: Integer;
    qa: Double;
    qb: Double;
    aa: PDouble;
    bb: PDouble;
    dd: PDouble;
    ee: PDouble;
    tt: PDouble;
    e2: PDouble;
    zz: PDouble;
    eval: Pgsl_vector;
    evec: Pgsl_matrix;
    wmat: Pgsl_eigen_symmv_workspace;
  end;

  gsl_siman_Efunc_t = function(xp: Pointer): Double; cdecl;

  gsl_siman_step_t = procedure(r: Pgsl_rng; xp: Pointer; step_size: Double); cdecl;

  gsl_siman_metric_t = function(xp: Pointer; yp: Pointer): Double; cdecl;

  gsl_siman_print_t = procedure(xp: Pointer); cdecl;

  gsl_siman_copy_t = procedure(source: Pointer; dest: Pointer); cdecl;

  gsl_siman_copy_construct_t = function(xp: Pointer): Pointer; cdecl;

  gsl_siman_destroy_t = procedure(xp: Pointer); cdecl;

  gsl_siman_params_t = record
    n_tries: Integer;
    iters_fixed_T: Integer;
    step_size: Double;
    k: Double;
    t_initial: Double;
    mu_t: Double;
    t_min: Double;
  end;

  _anonymous_type_11 = (
    GSL_SPMATRIX_COO = 0,
    GSL_SPMATRIX_CSC = 1,
    GSL_SPMATRIX_CSR = 2,
    GSL_SPMATRIX_TRIPLET = 0,
    GSL_SPMATRIX_CCS = 1,
    GSL_SPMATRIX_CRS = 2);
  P_anonymous_type_11 = ^_anonymous_type_11;

  gsl_spmatrix_pool_node = record
    next: Pgsl_spmatrix_pool_node;
    block_ptr: Pointer;
    free_slot: PByte;
  end;

  gsl_spmatrix_pool = gsl_spmatrix_pool_node;
  Pgsl_spmatrix_pool = ^gsl_spmatrix_pool;

  _anonymous_type_12 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PExtended);
  end;
  P_anonymous_type_12 = ^_anonymous_type_12;

  gsl_spmatrix_complex_long_double = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PExtended;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_12;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_13 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PDouble);
  end;
  P_anonymous_type_13 = ^_anonymous_type_13;

  gsl_spmatrix_complex = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PDouble;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_13;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_14 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PSingle);
  end;
  P_anonymous_type_14 = ^_anonymous_type_14;

  gsl_spmatrix_complex_float = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PSingle;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_14;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_15 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PExtended);
  end;
  P_anonymous_type_15 = ^_anonymous_type_15;

  gsl_spmatrix_long_double = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PExtended;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_15;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_16 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PDouble);
  end;
  P_anonymous_type_16 = ^_anonymous_type_16;

  gsl_spmatrix = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PDouble;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_16;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_17 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PSingle);
  end;
  P_anonymous_type_17 = ^_anonymous_type_17;

  gsl_spmatrix_float = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PSingle;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_17;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_18 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PCardinal);
  end;
  P_anonymous_type_18 = ^_anonymous_type_18;

  gsl_spmatrix_ulong = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PCardinal;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_18;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_19 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PInteger);
  end;
  P_anonymous_type_19 = ^_anonymous_type_19;

  gsl_spmatrix_long = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PInteger;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_19;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_20 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PCardinal);
  end;
  P_anonymous_type_20 = ^_anonymous_type_20;

  gsl_spmatrix_uint = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PCardinal;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_20;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_21 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PInteger);
  end;
  P_anonymous_type_21 = ^_anonymous_type_21;

  gsl_spmatrix_int = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PInteger;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_21;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_22 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PWord);
  end;
  P_anonymous_type_22 = ^_anonymous_type_22;

  gsl_spmatrix_ushort = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PWord;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_22;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_23 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PSmallint);
  end;
  P_anonymous_type_23 = ^_anonymous_type_23;

  gsl_spmatrix_short = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PSmallint;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_23;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_24 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PByte);
  end;
  P_anonymous_type_24 = ^_anonymous_type_24;

  gsl_spmatrix_uchar = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PByte;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_24;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  _anonymous_type_25 = record
    case Integer of
      0: (work_void: Pointer);
      1: (work_int: PInteger);
      2: (work_atomic: PUTF8Char);
  end;
  P_anonymous_type_25 = ^_anonymous_type_25;

  gsl_spmatrix_char = record
    size1: NativeUInt;
    size2: NativeUInt;
    i: PInteger;
    data: PUTF8Char;
    p: PInteger;
    nzmax: NativeUInt;
    nz: NativeUInt;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: NativeUInt;
    work: _anonymous_type_25;
    sptype: Integer;
    spflags: NativeUInt;
  end;

  gsl_splinalg_itersolve_type = record
    name: PUTF8Char;
    alloc: function(n: NativeUInt; m: NativeUInt): Pointer; cdecl;
    iterate: function(A: Pgsl_spmatrix; b: Pgsl_vector; tol: Double; x: Pgsl_vector; p5: Pointer): Integer; cdecl;
    normr: function(p1: Pointer): Double; cdecl;
    free: procedure(p1: Pointer); cdecl;
  end;

  gsl_splinalg_itersolve = record
    &type: Pgsl_splinalg_itersolve_type;
    normr: Double;
    state: Pointer;
  end;

  gsl_spline = record
    interp: Pgsl_interp;
    x: PDouble;
    y: PDouble;
    size: NativeUInt;
  end;

  gsl_spline2d = record
    interp_object: gsl_interp2d;
    xarr: PDouble;
    yarr: PDouble;
    zarr: PDouble;
  end;

  gsl_sum_levin_u_workspace = record
    size: NativeUInt;
    i: NativeUInt;
    terms_used: NativeUInt;
    sum_plain: Double;
    q_num: PDouble;
    q_den: PDouble;
    dq_num: PDouble;
    dq_den: PDouble;
    dsum: PDouble;
  end;

  gsl_sum_levin_utrunc_workspace = record
    size: NativeUInt;
    i: NativeUInt;
    terms_used: NativeUInt;
    sum_plain: Double;
    q_num: PDouble;
    q_den: PDouble;
    dsum: PDouble;
  end;

  gsl_wavelet_direction = (
    gsl_wavelet_forward = 1,
    gsl_wavelet_backward = -1);
  Pgsl_wavelet_direction = ^gsl_wavelet_direction;

  gsl_wavelet_type = record
    name: PUTF8Char;
    init: function(h1: PPDouble; g1: PPDouble; h2: PPDouble; g2: PPDouble; nc: PNativeUInt; offset: PNativeUInt; member: NativeUInt): Integer; cdecl;
  end;

  gsl_wavelet = record
    &type: Pgsl_wavelet_type;
    h1: PDouble;
    g1: PDouble;
    h2: PDouble;
    g2: PDouble;
    nc: NativeUInt;
    offset: NativeUInt;
  end;

  gsl_wavelet_workspace = record
    scratch: PDouble;
    n: NativeUInt;
  end;

procedure gsl_error(reason: PUTF8Char; &file: PUTF8Char; line: Integer; gsl_errno: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_error';

procedure gsl_stream_printf(&label: PUTF8Char; &file: PUTF8Char; line: Integer; reason: PUTF8Char); cdecl;
  external LIBGSL name _PU + 'gsl_stream_printf';

function gsl_strerror(gsl_errno: Integer): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_strerror';

function gsl_set_error_handler(new_handler: Pgsl_error_handler_t): Pgsl_error_handler_t; cdecl;
  external LIBGSL name _PU + 'gsl_set_error_handler';

function gsl_set_error_handler_off(): Pgsl_error_handler_t; cdecl;
  external LIBGSL name _PU + 'gsl_set_error_handler_off';

function gsl_set_stream_handler(new_handler: Pgsl_stream_handler_t): Pgsl_stream_handler_t; cdecl;
  external LIBGSL name _PU + 'gsl_set_stream_handler';

function gsl_set_stream(new_stream: PPointer): PPointer; cdecl;
  external LIBGSL name _PU + 'gsl_set_stream';

function gsl_block_long_double_alloc(n: NativeUInt): Pgsl_block_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_alloc';

function gsl_block_long_double_calloc(n: NativeUInt): Pgsl_block_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_calloc';

procedure gsl_block_long_double_free(b: Pgsl_block_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_free';

function gsl_block_long_double_fread(stream: PPointer; b: Pgsl_block_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_fread';

function gsl_block_long_double_fwrite(stream: PPointer; b: Pgsl_block_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_fwrite';

function gsl_block_long_double_fscanf(stream: PPointer; b: Pgsl_block_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_fscanf';

function gsl_block_long_double_fprintf(stream: PPointer; b: Pgsl_block_long_double; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_fprintf';

function gsl_block_long_double_raw_fread(stream: PPointer; b: PExtended; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_raw_fread';

function gsl_block_long_double_raw_fwrite(stream: PPointer; b: PExtended; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_raw_fwrite';

function gsl_block_long_double_raw_fscanf(stream: PPointer; b: PExtended; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_raw_fscanf';

function gsl_block_long_double_raw_fprintf(stream: PPointer; b: PExtended; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_raw_fprintf';

function gsl_block_long_double_size(b: Pgsl_block_long_double): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_size';

function gsl_block_long_double_data(b: Pgsl_block_long_double): PExtended; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_double_data';

function gsl_vector_long_double_alloc(n: NativeUInt): Pgsl_vector_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_alloc';

function gsl_vector_long_double_calloc(n: NativeUInt): Pgsl_vector_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_calloc';

function gsl_vector_long_double_alloc_from_block(b: Pgsl_block_long_double; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_alloc_from_block';

function gsl_vector_long_double_alloc_from_vector(v: Pgsl_vector_long_double; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_alloc_from_vector';

procedure gsl_vector_long_double_free(v: Pgsl_vector_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_free';

function gsl_vector_long_double_view_array(v: PExtended; n: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_view_array';

function gsl_vector_long_double_view_array_with_stride(base: PExtended; stride: NativeUInt; n: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_view_array_with_stride';

function gsl_vector_long_double_const_view_array(v: PExtended; n: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_const_view_array';

function gsl_vector_long_double_const_view_array_with_stride(base: PExtended; stride: NativeUInt; n: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_const_view_array_with_stride';

function gsl_vector_long_double_subvector(v: Pgsl_vector_long_double; i: NativeUInt; n: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_subvector';

function gsl_vector_long_double_subvector_with_stride(v: Pgsl_vector_long_double; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_subvector_with_stride';

function gsl_vector_long_double_const_subvector(v: Pgsl_vector_long_double; i: NativeUInt; n: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_const_subvector';

function gsl_vector_long_double_const_subvector_with_stride(v: Pgsl_vector_long_double; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_const_subvector_with_stride';

procedure gsl_vector_long_double_set_zero(v: Pgsl_vector_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_set_zero';

procedure gsl_vector_long_double_set_all(v: Pgsl_vector_long_double; x: Extended); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_set_all';

function gsl_vector_long_double_set_basis(v: Pgsl_vector_long_double; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_set_basis';

function gsl_vector_long_double_fread(stream: PPointer; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_fread';

function gsl_vector_long_double_fwrite(stream: PPointer; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_fwrite';

function gsl_vector_long_double_fscanf(stream: PPointer; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_fscanf';

function gsl_vector_long_double_fprintf(stream: PPointer; v: Pgsl_vector_long_double; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_fprintf';

function gsl_vector_long_double_memcpy(dest: Pgsl_vector_long_double; src: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_memcpy';

function gsl_vector_long_double_memcpy_scale(dest: Pgsl_vector_long_double; src: Pgsl_vector_long_double; alpha: Extended): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_memcpy_scale';

function gsl_vector_long_double_reverse(v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_reverse';

function gsl_vector_long_double_swap(v: Pgsl_vector_long_double; w: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_swap';

function gsl_vector_long_double_swap_elements(v: Pgsl_vector_long_double; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_swap_elements';

function gsl_vector_long_double_max(v: Pgsl_vector_long_double): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_max';

function gsl_vector_long_double_min(v: Pgsl_vector_long_double): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_min';

procedure gsl_vector_long_double_minmax(v: Pgsl_vector_long_double; min_out: PExtended; max_out: PExtended); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_minmax';

function gsl_vector_long_double_max_index(v: Pgsl_vector_long_double): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_max_index';

function gsl_vector_long_double_min_index(v: Pgsl_vector_long_double): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_min_index';

procedure gsl_vector_long_double_minmax_index(v: Pgsl_vector_long_double; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_minmax_index';

function gsl_vector_long_double_add(a: Pgsl_vector_long_double; b: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_add';

function gsl_vector_long_double_sub(a: Pgsl_vector_long_double; b: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_sub';

function gsl_vector_long_double_mul(a: Pgsl_vector_long_double; b: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_mul';

function gsl_vector_long_double_div(a: Pgsl_vector_long_double; b: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_div';

function gsl_vector_long_double_scale(a: Pgsl_vector_long_double; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_scale';

function gsl_vector_long_double_add_constant(a: Pgsl_vector_long_double; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_add_constant';

function gsl_vector_long_double_equal(u: Pgsl_vector_long_double; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_equal';

function gsl_vector_long_double_isnull(v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_isnull';

function gsl_vector_long_double_ispos(v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_ispos';

function gsl_vector_long_double_isneg(v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_isneg';

function gsl_vector_long_double_isnonneg(v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_isnonneg';

function gsl_vector_long_double_get(v: Pgsl_vector_long_double; i: NativeUInt): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_get';

procedure gsl_vector_long_double_set(v: Pgsl_vector_long_double; i: NativeUInt; x: Extended); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_set';

function gsl_vector_long_double_ptr(v: Pgsl_vector_long_double; i: NativeUInt): PExtended; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_ptr';

function gsl_vector_long_double_const_ptr(v: Pgsl_vector_long_double; i: NativeUInt): PExtended; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_const_ptr';

function gsl_block_complex_long_double_alloc(n: NativeUInt): Pgsl_block_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_alloc';

function gsl_block_complex_long_double_calloc(n: NativeUInt): Pgsl_block_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_calloc';

procedure gsl_block_complex_long_double_free(b: Pgsl_block_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_free';

function gsl_block_complex_long_double_fread(stream: PPointer; b: Pgsl_block_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_fread';

function gsl_block_complex_long_double_fwrite(stream: PPointer; b: Pgsl_block_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_fwrite';

function gsl_block_complex_long_double_fscanf(stream: PPointer; b: Pgsl_block_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_fscanf';

function gsl_block_complex_long_double_fprintf(stream: PPointer; b: Pgsl_block_complex_long_double; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_fprintf';

function gsl_block_complex_long_double_raw_fread(stream: PPointer; b: PExtended; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_raw_fread';

function gsl_block_complex_long_double_raw_fwrite(stream: PPointer; b: PExtended; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_raw_fwrite';

function gsl_block_complex_long_double_raw_fscanf(stream: PPointer; b: PExtended; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_raw_fscanf';

function gsl_block_complex_long_double_raw_fprintf(stream: PPointer; b: PExtended; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_raw_fprintf';

function gsl_block_complex_long_double_size(b: Pgsl_block_complex_long_double): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_size';

function gsl_block_complex_long_double_data(b: Pgsl_block_complex_long_double): PExtended; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_long_double_data';

function gsl_vector_complex_long_double_alloc(n: NativeUInt): Pgsl_vector_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_alloc';

function gsl_vector_complex_long_double_calloc(n: NativeUInt): Pgsl_vector_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_calloc';

function gsl_vector_complex_long_double_alloc_from_block(b: Pgsl_block_complex_long_double; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_alloc_from_block';

function gsl_vector_complex_long_double_alloc_from_vector(v: Pgsl_vector_complex_long_double; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_alloc_from_vector';

procedure gsl_vector_complex_long_double_free(v: Pgsl_vector_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_free';

function gsl_vector_complex_long_double_view_array(base: PExtended; n: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_view_array';

function gsl_vector_complex_long_double_view_array_with_stride(base: PExtended; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_view_array_with_stride';

function gsl_vector_complex_long_double_const_view_array(base: PExtended; n: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_const_view_array';

function gsl_vector_complex_long_double_const_view_array_with_stride(base: PExtended; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_const_view_array_with_stride';

function gsl_vector_complex_long_double_subvector(base: Pgsl_vector_complex_long_double; i: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_subvector';

function gsl_vector_complex_long_double_subvector_with_stride(v: Pgsl_vector_complex_long_double; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_subvector_with_stride';

function gsl_vector_complex_long_double_const_subvector(base: Pgsl_vector_complex_long_double; i: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_const_subvector';

function gsl_vector_complex_long_double_const_subvector_with_stride(v: Pgsl_vector_complex_long_double; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_const_subvector_with_stride';

function gsl_vector_complex_long_double_real(v: Pgsl_vector_complex_long_double): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_real';

function gsl_vector_complex_long_double_imag(v: Pgsl_vector_complex_long_double): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_imag';

function gsl_vector_complex_long_double_const_real(v: Pgsl_vector_complex_long_double): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_const_real';

function gsl_vector_complex_long_double_const_imag(v: Pgsl_vector_complex_long_double): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_const_imag';

procedure gsl_vector_complex_long_double_set_zero(v: Pgsl_vector_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_set_zero';

procedure gsl_vector_complex_long_double_set_all(v: Pgsl_vector_complex_long_double; z: gsl_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_set_all';

function gsl_vector_complex_long_double_set_basis(v: Pgsl_vector_complex_long_double; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_set_basis';

function gsl_vector_complex_long_double_fread(stream: PPointer; v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_fread';

function gsl_vector_complex_long_double_fwrite(stream: PPointer; v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_fwrite';

function gsl_vector_complex_long_double_fscanf(stream: PPointer; v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_fscanf';

function gsl_vector_complex_long_double_fprintf(stream: PPointer; v: Pgsl_vector_complex_long_double; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_fprintf';

function gsl_vector_complex_long_double_memcpy(dest: Pgsl_vector_complex_long_double; src: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_memcpy';

function gsl_vector_complex_long_double_reverse(v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_reverse';

function gsl_vector_complex_long_double_swap(v: Pgsl_vector_complex_long_double; w: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_swap';

function gsl_vector_complex_long_double_swap_elements(v: Pgsl_vector_complex_long_double; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_swap_elements';

function gsl_vector_complex_long_double_equal(u: Pgsl_vector_complex_long_double; v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_equal';

function gsl_vector_complex_long_double_isnull(v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_isnull';

function gsl_vector_complex_long_double_ispos(v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_ispos';

function gsl_vector_complex_long_double_isneg(v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_isneg';

function gsl_vector_complex_long_double_isnonneg(v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_isnonneg';

function gsl_vector_complex_long_double_add(a: Pgsl_vector_complex_long_double; b: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_add';

function gsl_vector_complex_long_double_sub(a: Pgsl_vector_complex_long_double; b: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_sub';

function gsl_vector_complex_long_double_mul(a: Pgsl_vector_complex_long_double; b: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_mul';

function gsl_vector_complex_long_double_div(a: Pgsl_vector_complex_long_double; b: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_div';

function gsl_vector_complex_long_double_scale(a: Pgsl_vector_complex_long_double; x: gsl_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_scale';

function gsl_vector_complex_long_double_add_constant(a: Pgsl_vector_complex_long_double; x: gsl_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_add_constant';

function gsl_vector_complex_long_double_get(v: Pgsl_vector_complex_long_double; i: NativeUInt): gsl_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_get';

procedure gsl_vector_complex_long_double_set(v: Pgsl_vector_complex_long_double; i: NativeUInt; z: gsl_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_set';

function gsl_vector_complex_long_double_ptr(v: Pgsl_vector_complex_long_double; i: NativeUInt): Pgsl_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_ptr';

function gsl_vector_complex_long_double_const_ptr(v: Pgsl_vector_complex_long_double; i: NativeUInt): Pgsl_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_const_ptr';

function gsl_block_alloc(n: NativeUInt): Pgsl_block; cdecl;
  external LIBGSL name _PU + 'gsl_block_alloc';

function gsl_block_calloc(n: NativeUInt): Pgsl_block; cdecl;
  external LIBGSL name _PU + 'gsl_block_calloc';

procedure gsl_block_free(b: Pgsl_block); cdecl;
  external LIBGSL name _PU + 'gsl_block_free';

function gsl_block_fread(stream: PPointer; b: Pgsl_block): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_fread';

function gsl_block_fwrite(stream: PPointer; b: Pgsl_block): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_fwrite';

function gsl_block_fscanf(stream: PPointer; b: Pgsl_block): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_fscanf';

function gsl_block_fprintf(stream: PPointer; b: Pgsl_block; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_fprintf';

function gsl_block_raw_fread(stream: PPointer; b: PDouble; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_raw_fread';

function gsl_block_raw_fwrite(stream: PPointer; b: PDouble; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_raw_fwrite';

function gsl_block_raw_fscanf(stream: PPointer; b: PDouble; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_raw_fscanf';

function gsl_block_raw_fprintf(stream: PPointer; b: PDouble; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_raw_fprintf';

function gsl_block_size(b: Pgsl_block): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_size';

function gsl_block_data(b: Pgsl_block): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_block_data';

function gsl_vector_alloc(n: NativeUInt): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_vector_alloc';

function gsl_vector_calloc(n: NativeUInt): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_vector_calloc';

function gsl_vector_alloc_from_block(b: Pgsl_block; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_vector_alloc_from_block';

function gsl_vector_alloc_from_vector(v: Pgsl_vector; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_vector_alloc_from_vector';

procedure gsl_vector_free(v: Pgsl_vector); cdecl;
  external LIBGSL name _PU + 'gsl_vector_free';

function gsl_vector_view_array(v: PDouble; n: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_view_array';

function gsl_vector_view_array_with_stride(base: PDouble; stride: NativeUInt; n: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_view_array_with_stride';

function gsl_vector_const_view_array(v: PDouble; n: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_const_view_array';

function gsl_vector_const_view_array_with_stride(base: PDouble; stride: NativeUInt; n: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_const_view_array_with_stride';

function gsl_vector_subvector(v: Pgsl_vector; i: NativeUInt; n: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_subvector';

function gsl_vector_subvector_with_stride(v: Pgsl_vector; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_subvector_with_stride';

function gsl_vector_const_subvector(v: Pgsl_vector; i: NativeUInt; n: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_const_subvector';

function gsl_vector_const_subvector_with_stride(v: Pgsl_vector; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_const_subvector_with_stride';

procedure gsl_vector_set_zero(v: Pgsl_vector); cdecl;
  external LIBGSL name _PU + 'gsl_vector_set_zero';

procedure gsl_vector_set_all(v: Pgsl_vector; x: Double); cdecl;
  external LIBGSL name _PU + 'gsl_vector_set_all';

function gsl_vector_set_basis(v: Pgsl_vector; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_set_basis';

function gsl_vector_fread(stream: PPointer; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_fread';

function gsl_vector_fwrite(stream: PPointer; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_fwrite';

function gsl_vector_fscanf(stream: PPointer; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_fscanf';

function gsl_vector_fprintf(stream: PPointer; v: Pgsl_vector; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_fprintf';

function gsl_vector_memcpy(dest: Pgsl_vector; src: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_memcpy';

function gsl_vector_memcpy_scale(dest: Pgsl_vector; src: Pgsl_vector; alpha: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_memcpy_scale';

function gsl_vector_reverse(v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_reverse';

function gsl_vector_swap(v: Pgsl_vector; w: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_swap';

function gsl_vector_swap_elements(v: Pgsl_vector; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_swap_elements';

function gsl_vector_max(v: Pgsl_vector): Double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_max';

function gsl_vector_min(v: Pgsl_vector): Double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_min';

procedure gsl_vector_minmax(v: Pgsl_vector; min_out: PDouble; max_out: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_vector_minmax';

function gsl_vector_max_index(v: Pgsl_vector): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_max_index';

function gsl_vector_min_index(v: Pgsl_vector): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_min_index';

procedure gsl_vector_minmax_index(v: Pgsl_vector; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_minmax_index';

function gsl_vector_add(a: Pgsl_vector; b: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_add';

function gsl_vector_sub(a: Pgsl_vector; b: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_sub';

function gsl_vector_mul(a: Pgsl_vector; b: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_mul';

function gsl_vector_div(a: Pgsl_vector; b: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_div';

function gsl_vector_scale(a: Pgsl_vector; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_scale';

function gsl_vector_add_constant(a: Pgsl_vector; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_add_constant';

function gsl_vector_equal(u: Pgsl_vector; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_equal';

function gsl_vector_isnull(v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_isnull';

function gsl_vector_ispos(v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ispos';

function gsl_vector_isneg(v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_isneg';

function gsl_vector_isnonneg(v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_isnonneg';

function gsl_vector_get(v: Pgsl_vector; i: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_get';

procedure gsl_vector_set(v: Pgsl_vector; i: NativeUInt; x: Double); cdecl;
  external LIBGSL name _PU + 'gsl_vector_set';

function gsl_vector_ptr(v: Pgsl_vector; i: NativeUInt): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ptr';

function gsl_vector_const_ptr(v: Pgsl_vector; i: NativeUInt): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_vector_const_ptr';

function gsl_block_complex_alloc(n: NativeUInt): Pgsl_block_complex; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_alloc';

function gsl_block_complex_calloc(n: NativeUInt): Pgsl_block_complex; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_calloc';

procedure gsl_block_complex_free(b: Pgsl_block_complex); cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_free';

function gsl_block_complex_fread(stream: PPointer; b: Pgsl_block_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_fread';

function gsl_block_complex_fwrite(stream: PPointer; b: Pgsl_block_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_fwrite';

function gsl_block_complex_fscanf(stream: PPointer; b: Pgsl_block_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_fscanf';

function gsl_block_complex_fprintf(stream: PPointer; b: Pgsl_block_complex; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_fprintf';

function gsl_block_complex_raw_fread(stream: PPointer; b: PDouble; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_raw_fread';

function gsl_block_complex_raw_fwrite(stream: PPointer; b: PDouble; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_raw_fwrite';

function gsl_block_complex_raw_fscanf(stream: PPointer; b: PDouble; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_raw_fscanf';

function gsl_block_complex_raw_fprintf(stream: PPointer; b: PDouble; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_raw_fprintf';

function gsl_block_complex_size(b: Pgsl_block_complex): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_size';

function gsl_block_complex_data(b: Pgsl_block_complex): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_data';

function gsl_vector_complex_alloc(n: NativeUInt): Pgsl_vector_complex; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_alloc';

function gsl_vector_complex_calloc(n: NativeUInt): Pgsl_vector_complex; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_calloc';

function gsl_vector_complex_alloc_from_block(b: Pgsl_block_complex; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_complex; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_alloc_from_block';

function gsl_vector_complex_alloc_from_vector(v: Pgsl_vector_complex; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_complex; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_alloc_from_vector';

procedure gsl_vector_complex_free(v: Pgsl_vector_complex); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_free';

function gsl_vector_complex_view_array(base: PDouble; n: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_view_array';

function gsl_vector_complex_view_array_with_stride(base: PDouble; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_view_array_with_stride';

function gsl_vector_complex_const_view_array(base: PDouble; n: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_const_view_array';

function gsl_vector_complex_const_view_array_with_stride(base: PDouble; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_const_view_array_with_stride';

function gsl_vector_complex_subvector(base: Pgsl_vector_complex; i: NativeUInt; n: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_subvector';

function gsl_vector_complex_subvector_with_stride(v: Pgsl_vector_complex; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_subvector_with_stride';

function gsl_vector_complex_const_subvector(base: Pgsl_vector_complex; i: NativeUInt; n: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_const_subvector';

function gsl_vector_complex_const_subvector_with_stride(v: Pgsl_vector_complex; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_const_subvector_with_stride';

function gsl_vector_complex_real(v: Pgsl_vector_complex): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_real';

function gsl_vector_complex_imag(v: Pgsl_vector_complex): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_imag';

function gsl_vector_complex_const_real(v: Pgsl_vector_complex): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_const_real';

function gsl_vector_complex_const_imag(v: Pgsl_vector_complex): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_const_imag';

procedure gsl_vector_complex_set_zero(v: Pgsl_vector_complex); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_set_zero';

procedure gsl_vector_complex_set_all(v: Pgsl_vector_complex; z: gsl_complex); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_set_all';

function gsl_vector_complex_set_basis(v: Pgsl_vector_complex; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_set_basis';

function gsl_vector_complex_fread(stream: PPointer; v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_fread';

function gsl_vector_complex_fwrite(stream: PPointer; v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_fwrite';

function gsl_vector_complex_fscanf(stream: PPointer; v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_fscanf';

function gsl_vector_complex_fprintf(stream: PPointer; v: Pgsl_vector_complex; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_fprintf';

function gsl_vector_complex_memcpy(dest: Pgsl_vector_complex; src: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_memcpy';

function gsl_vector_complex_reverse(v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_reverse';

function gsl_vector_complex_swap(v: Pgsl_vector_complex; w: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_swap';

function gsl_vector_complex_swap_elements(v: Pgsl_vector_complex; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_swap_elements';

function gsl_vector_complex_equal(u: Pgsl_vector_complex; v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_equal';

function gsl_vector_complex_isnull(v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_isnull';

function gsl_vector_complex_ispos(v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_ispos';

function gsl_vector_complex_isneg(v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_isneg';

function gsl_vector_complex_isnonneg(v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_isnonneg';

function gsl_vector_complex_add(a: Pgsl_vector_complex; b: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_add';

function gsl_vector_complex_sub(a: Pgsl_vector_complex; b: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_sub';

function gsl_vector_complex_mul(a: Pgsl_vector_complex; b: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_mul';

function gsl_vector_complex_div(a: Pgsl_vector_complex; b: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_div';

function gsl_vector_complex_scale(a: Pgsl_vector_complex; x: gsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_scale';

function gsl_vector_complex_add_constant(a: Pgsl_vector_complex; x: gsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_add_constant';

function gsl_vector_complex_get(v: Pgsl_vector_complex; i: NativeUInt): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_get';

procedure gsl_vector_complex_set(v: Pgsl_vector_complex; i: NativeUInt; z: gsl_complex); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_set';

function gsl_vector_complex_ptr(v: Pgsl_vector_complex; i: NativeUInt): Pgsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_ptr';

function gsl_vector_complex_const_ptr(v: Pgsl_vector_complex; i: NativeUInt): Pgsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_const_ptr';

function gsl_block_float_alloc(n: NativeUInt): Pgsl_block_float; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_alloc';

function gsl_block_float_calloc(n: NativeUInt): Pgsl_block_float; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_calloc';

procedure gsl_block_float_free(b: Pgsl_block_float); cdecl;
  external LIBGSL name _PU + 'gsl_block_float_free';

function gsl_block_float_fread(stream: PPointer; b: Pgsl_block_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_fread';

function gsl_block_float_fwrite(stream: PPointer; b: Pgsl_block_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_fwrite';

function gsl_block_float_fscanf(stream: PPointer; b: Pgsl_block_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_fscanf';

function gsl_block_float_fprintf(stream: PPointer; b: Pgsl_block_float; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_fprintf';

function gsl_block_float_raw_fread(stream: PPointer; b: PSingle; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_raw_fread';

function gsl_block_float_raw_fwrite(stream: PPointer; b: PSingle; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_raw_fwrite';

function gsl_block_float_raw_fscanf(stream: PPointer; b: PSingle; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_raw_fscanf';

function gsl_block_float_raw_fprintf(stream: PPointer; b: PSingle; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_raw_fprintf';

function gsl_block_float_size(b: Pgsl_block_float): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_size';

function gsl_block_float_data(b: Pgsl_block_float): PSingle; cdecl;
  external LIBGSL name _PU + 'gsl_block_float_data';

function gsl_vector_float_alloc(n: NativeUInt): Pgsl_vector_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_alloc';

function gsl_vector_float_calloc(n: NativeUInt): Pgsl_vector_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_calloc';

function gsl_vector_float_alloc_from_block(b: Pgsl_block_float; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_alloc_from_block';

function gsl_vector_float_alloc_from_vector(v: Pgsl_vector_float; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_alloc_from_vector';

procedure gsl_vector_float_free(v: Pgsl_vector_float); cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_free';

function gsl_vector_float_view_array(v: PSingle; n: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_view_array';

function gsl_vector_float_view_array_with_stride(base: PSingle; stride: NativeUInt; n: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_view_array_with_stride';

function gsl_vector_float_const_view_array(v: PSingle; n: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_const_view_array';

function gsl_vector_float_const_view_array_with_stride(base: PSingle; stride: NativeUInt; n: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_const_view_array_with_stride';

function gsl_vector_float_subvector(v: Pgsl_vector_float; i: NativeUInt; n: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_subvector';

function gsl_vector_float_subvector_with_stride(v: Pgsl_vector_float; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_subvector_with_stride';

function gsl_vector_float_const_subvector(v: Pgsl_vector_float; i: NativeUInt; n: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_const_subvector';

function gsl_vector_float_const_subvector_with_stride(v: Pgsl_vector_float; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_const_subvector_with_stride';

procedure gsl_vector_float_set_zero(v: Pgsl_vector_float); cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_set_zero';

procedure gsl_vector_float_set_all(v: Pgsl_vector_float; x: Single); cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_set_all';

function gsl_vector_float_set_basis(v: Pgsl_vector_float; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_set_basis';

function gsl_vector_float_fread(stream: PPointer; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_fread';

function gsl_vector_float_fwrite(stream: PPointer; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_fwrite';

function gsl_vector_float_fscanf(stream: PPointer; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_fscanf';

function gsl_vector_float_fprintf(stream: PPointer; v: Pgsl_vector_float; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_fprintf';

function gsl_vector_float_memcpy(dest: Pgsl_vector_float; src: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_memcpy';

function gsl_vector_float_memcpy_scale(dest: Pgsl_vector_float; src: Pgsl_vector_float; alpha: Single): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_memcpy_scale';

function gsl_vector_float_reverse(v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_reverse';

function gsl_vector_float_swap(v: Pgsl_vector_float; w: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_swap';

function gsl_vector_float_swap_elements(v: Pgsl_vector_float; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_swap_elements';

function gsl_vector_float_max(v: Pgsl_vector_float): Single; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_max';

function gsl_vector_float_min(v: Pgsl_vector_float): Single; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_min';

procedure gsl_vector_float_minmax(v: Pgsl_vector_float; min_out: PSingle; max_out: PSingle); cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_minmax';

function gsl_vector_float_max_index(v: Pgsl_vector_float): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_max_index';

function gsl_vector_float_min_index(v: Pgsl_vector_float): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_min_index';

procedure gsl_vector_float_minmax_index(v: Pgsl_vector_float; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_minmax_index';

function gsl_vector_float_add(a: Pgsl_vector_float; b: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_add';

function gsl_vector_float_sub(a: Pgsl_vector_float; b: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_sub';

function gsl_vector_float_mul(a: Pgsl_vector_float; b: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_mul';

function gsl_vector_float_div(a: Pgsl_vector_float; b: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_div';

function gsl_vector_float_scale(a: Pgsl_vector_float; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_scale';

function gsl_vector_float_add_constant(a: Pgsl_vector_float; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_add_constant';

function gsl_vector_float_equal(u: Pgsl_vector_float; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_equal';

function gsl_vector_float_isnull(v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_isnull';

function gsl_vector_float_ispos(v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_ispos';

function gsl_vector_float_isneg(v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_isneg';

function gsl_vector_float_isnonneg(v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_isnonneg';

function gsl_vector_float_get(v: Pgsl_vector_float; i: NativeUInt): Single; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_get';

procedure gsl_vector_float_set(v: Pgsl_vector_float; i: NativeUInt; x: Single); cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_set';

function gsl_vector_float_ptr(v: Pgsl_vector_float; i: NativeUInt): PSingle; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_ptr';

function gsl_vector_float_const_ptr(v: Pgsl_vector_float; i: NativeUInt): PSingle; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_const_ptr';

function gsl_block_complex_float_alloc(n: NativeUInt): Pgsl_block_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_alloc';

function gsl_block_complex_float_calloc(n: NativeUInt): Pgsl_block_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_calloc';

procedure gsl_block_complex_float_free(b: Pgsl_block_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_free';

function gsl_block_complex_float_fread(stream: PPointer; b: Pgsl_block_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_fread';

function gsl_block_complex_float_fwrite(stream: PPointer; b: Pgsl_block_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_fwrite';

function gsl_block_complex_float_fscanf(stream: PPointer; b: Pgsl_block_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_fscanf';

function gsl_block_complex_float_fprintf(stream: PPointer; b: Pgsl_block_complex_float; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_fprintf';

function gsl_block_complex_float_raw_fread(stream: PPointer; b: PSingle; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_raw_fread';

function gsl_block_complex_float_raw_fwrite(stream: PPointer; b: PSingle; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_raw_fwrite';

function gsl_block_complex_float_raw_fscanf(stream: PPointer; b: PSingle; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_raw_fscanf';

function gsl_block_complex_float_raw_fprintf(stream: PPointer; b: PSingle; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_raw_fprintf';

function gsl_block_complex_float_size(b: Pgsl_block_complex_float): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_size';

function gsl_block_complex_float_data(b: Pgsl_block_complex_float): PSingle; cdecl;
  external LIBGSL name _PU + 'gsl_block_complex_float_data';

function gsl_vector_complex_float_alloc(n: NativeUInt): Pgsl_vector_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_alloc';

function gsl_vector_complex_float_calloc(n: NativeUInt): Pgsl_vector_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_calloc';

function gsl_vector_complex_float_alloc_from_block(b: Pgsl_block_complex_float; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_alloc_from_block';

function gsl_vector_complex_float_alloc_from_vector(v: Pgsl_vector_complex_float; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_alloc_from_vector';

procedure gsl_vector_complex_float_free(v: Pgsl_vector_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_free';

function gsl_vector_complex_float_view_array(base: PSingle; n: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_view_array';

function gsl_vector_complex_float_view_array_with_stride(base: PSingle; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_view_array_with_stride';

function gsl_vector_complex_float_const_view_array(base: PSingle; n: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_const_view_array';

function gsl_vector_complex_float_const_view_array_with_stride(base: PSingle; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_const_view_array_with_stride';

function gsl_vector_complex_float_subvector(base: Pgsl_vector_complex_float; i: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_subvector';

function gsl_vector_complex_float_subvector_with_stride(v: Pgsl_vector_complex_float; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_subvector_with_stride';

function gsl_vector_complex_float_const_subvector(base: Pgsl_vector_complex_float; i: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_const_subvector';

function gsl_vector_complex_float_const_subvector_with_stride(v: Pgsl_vector_complex_float; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_const_subvector_with_stride';

function gsl_vector_complex_float_real(v: Pgsl_vector_complex_float): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_real';

function gsl_vector_complex_float_imag(v: Pgsl_vector_complex_float): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_imag';

function gsl_vector_complex_float_const_real(v: Pgsl_vector_complex_float): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_const_real';

function gsl_vector_complex_float_const_imag(v: Pgsl_vector_complex_float): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_const_imag';

procedure gsl_vector_complex_float_set_zero(v: Pgsl_vector_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_set_zero';

procedure gsl_vector_complex_float_set_all(v: Pgsl_vector_complex_float; z: gsl_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_set_all';

function gsl_vector_complex_float_set_basis(v: Pgsl_vector_complex_float; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_set_basis';

function gsl_vector_complex_float_fread(stream: PPointer; v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_fread';

function gsl_vector_complex_float_fwrite(stream: PPointer; v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_fwrite';

function gsl_vector_complex_float_fscanf(stream: PPointer; v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_fscanf';

function gsl_vector_complex_float_fprintf(stream: PPointer; v: Pgsl_vector_complex_float; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_fprintf';

function gsl_vector_complex_float_memcpy(dest: Pgsl_vector_complex_float; src: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_memcpy';

function gsl_vector_complex_float_reverse(v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_reverse';

function gsl_vector_complex_float_swap(v: Pgsl_vector_complex_float; w: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_swap';

function gsl_vector_complex_float_swap_elements(v: Pgsl_vector_complex_float; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_swap_elements';

function gsl_vector_complex_float_equal(u: Pgsl_vector_complex_float; v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_equal';

function gsl_vector_complex_float_isnull(v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_isnull';

function gsl_vector_complex_float_ispos(v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_ispos';

function gsl_vector_complex_float_isneg(v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_isneg';

function gsl_vector_complex_float_isnonneg(v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_isnonneg';

function gsl_vector_complex_float_add(a: Pgsl_vector_complex_float; b: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_add';

function gsl_vector_complex_float_sub(a: Pgsl_vector_complex_float; b: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_sub';

function gsl_vector_complex_float_mul(a: Pgsl_vector_complex_float; b: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_mul';

function gsl_vector_complex_float_div(a: Pgsl_vector_complex_float; b: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_div';

function gsl_vector_complex_float_scale(a: Pgsl_vector_complex_float; x: gsl_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_scale';

function gsl_vector_complex_float_add_constant(a: Pgsl_vector_complex_float; x: gsl_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_add_constant';

function gsl_vector_complex_float_get(v: Pgsl_vector_complex_float; i: NativeUInt): gsl_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_get';

procedure gsl_vector_complex_float_set(v: Pgsl_vector_complex_float; i: NativeUInt; z: gsl_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_set';

function gsl_vector_complex_float_ptr(v: Pgsl_vector_complex_float; i: NativeUInt): Pgsl_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_ptr';

function gsl_vector_complex_float_const_ptr(v: Pgsl_vector_complex_float; i: NativeUInt): Pgsl_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_const_ptr';

function gsl_block_ulong_alloc(n: NativeUInt): Pgsl_block_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_alloc';

function gsl_block_ulong_calloc(n: NativeUInt): Pgsl_block_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_calloc';

procedure gsl_block_ulong_free(b: Pgsl_block_ulong); cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_free';

function gsl_block_ulong_fread(stream: PPointer; b: Pgsl_block_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_fread';

function gsl_block_ulong_fwrite(stream: PPointer; b: Pgsl_block_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_fwrite';

function gsl_block_ulong_fscanf(stream: PPointer; b: Pgsl_block_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_fscanf';

function gsl_block_ulong_fprintf(stream: PPointer; b: Pgsl_block_ulong; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_fprintf';

function gsl_block_ulong_raw_fread(stream: PPointer; b: PCardinal; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_raw_fread';

function gsl_block_ulong_raw_fwrite(stream: PPointer; b: PCardinal; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_raw_fwrite';

function gsl_block_ulong_raw_fscanf(stream: PPointer; b: PCardinal; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_raw_fscanf';

function gsl_block_ulong_raw_fprintf(stream: PPointer; b: PCardinal; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_raw_fprintf';

function gsl_block_ulong_size(b: Pgsl_block_ulong): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_size';

function gsl_block_ulong_data(b: Pgsl_block_ulong): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_block_ulong_data';

function gsl_vector_ulong_alloc(n: NativeUInt): Pgsl_vector_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_alloc';

function gsl_vector_ulong_calloc(n: NativeUInt): Pgsl_vector_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_calloc';

function gsl_vector_ulong_alloc_from_block(b: Pgsl_block_ulong; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_alloc_from_block';

function gsl_vector_ulong_alloc_from_vector(v: Pgsl_vector_ulong; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_alloc_from_vector';

procedure gsl_vector_ulong_free(v: Pgsl_vector_ulong); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_free';

function gsl_vector_ulong_view_array(v: PCardinal; n: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_view_array';

function gsl_vector_ulong_view_array_with_stride(base: PCardinal; stride: NativeUInt; n: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_view_array_with_stride';

function gsl_vector_ulong_const_view_array(v: PCardinal; n: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_const_view_array';

function gsl_vector_ulong_const_view_array_with_stride(base: PCardinal; stride: NativeUInt; n: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_const_view_array_with_stride';

function gsl_vector_ulong_subvector(v: Pgsl_vector_ulong; i: NativeUInt; n: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_subvector';

function gsl_vector_ulong_subvector_with_stride(v: Pgsl_vector_ulong; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_subvector_with_stride';

function gsl_vector_ulong_const_subvector(v: Pgsl_vector_ulong; i: NativeUInt; n: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_const_subvector';

function gsl_vector_ulong_const_subvector_with_stride(v: Pgsl_vector_ulong; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_const_subvector_with_stride';

procedure gsl_vector_ulong_set_zero(v: Pgsl_vector_ulong); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_set_zero';

procedure gsl_vector_ulong_set_all(v: Pgsl_vector_ulong; x: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_set_all';

function gsl_vector_ulong_set_basis(v: Pgsl_vector_ulong; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_set_basis';

function gsl_vector_ulong_fread(stream: PPointer; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_fread';

function gsl_vector_ulong_fwrite(stream: PPointer; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_fwrite';

function gsl_vector_ulong_fscanf(stream: PPointer; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_fscanf';

function gsl_vector_ulong_fprintf(stream: PPointer; v: Pgsl_vector_ulong; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_fprintf';

function gsl_vector_ulong_memcpy(dest: Pgsl_vector_ulong; src: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_memcpy';

function gsl_vector_ulong_memcpy_scale(dest: Pgsl_vector_ulong; src: Pgsl_vector_ulong; alpha: Cardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_memcpy_scale';

function gsl_vector_ulong_reverse(v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_reverse';

function gsl_vector_ulong_swap(v: Pgsl_vector_ulong; w: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_swap';

function gsl_vector_ulong_swap_elements(v: Pgsl_vector_ulong; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_swap_elements';

function gsl_vector_ulong_max(v: Pgsl_vector_ulong): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_max';

function gsl_vector_ulong_min(v: Pgsl_vector_ulong): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_min';

procedure gsl_vector_ulong_minmax(v: Pgsl_vector_ulong; min_out: PCardinal; max_out: PCardinal); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_minmax';

function gsl_vector_ulong_max_index(v: Pgsl_vector_ulong): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_max_index';

function gsl_vector_ulong_min_index(v: Pgsl_vector_ulong): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_min_index';

procedure gsl_vector_ulong_minmax_index(v: Pgsl_vector_ulong; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_minmax_index';

function gsl_vector_ulong_add(a: Pgsl_vector_ulong; b: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_add';

function gsl_vector_ulong_sub(a: Pgsl_vector_ulong; b: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_sub';

function gsl_vector_ulong_mul(a: Pgsl_vector_ulong; b: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_mul';

function gsl_vector_ulong_div(a: Pgsl_vector_ulong; b: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_div';

function gsl_vector_ulong_scale(a: Pgsl_vector_ulong; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_scale';

function gsl_vector_ulong_add_constant(a: Pgsl_vector_ulong; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_add_constant';

function gsl_vector_ulong_equal(u: Pgsl_vector_ulong; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_equal';

function gsl_vector_ulong_isnull(v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_isnull';

function gsl_vector_ulong_ispos(v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_ispos';

function gsl_vector_ulong_isneg(v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_isneg';

function gsl_vector_ulong_isnonneg(v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_isnonneg';

function gsl_vector_ulong_get(v: Pgsl_vector_ulong; i: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_get';

procedure gsl_vector_ulong_set(v: Pgsl_vector_ulong; i: NativeUInt; x: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_set';

function gsl_vector_ulong_ptr(v: Pgsl_vector_ulong; i: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_ptr';

function gsl_vector_ulong_const_ptr(v: Pgsl_vector_ulong; i: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_const_ptr';

function gsl_block_long_alloc(n: NativeUInt): Pgsl_block_long; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_alloc';

function gsl_block_long_calloc(n: NativeUInt): Pgsl_block_long; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_calloc';

procedure gsl_block_long_free(b: Pgsl_block_long); cdecl;
  external LIBGSL name _PU + 'gsl_block_long_free';

function gsl_block_long_fread(stream: PPointer; b: Pgsl_block_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_fread';

function gsl_block_long_fwrite(stream: PPointer; b: Pgsl_block_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_fwrite';

function gsl_block_long_fscanf(stream: PPointer; b: Pgsl_block_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_fscanf';

function gsl_block_long_fprintf(stream: PPointer; b: Pgsl_block_long; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_fprintf';

function gsl_block_long_raw_fread(stream: PPointer; b: PInteger; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_raw_fread';

function gsl_block_long_raw_fwrite(stream: PPointer; b: PInteger; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_raw_fwrite';

function gsl_block_long_raw_fscanf(stream: PPointer; b: PInteger; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_raw_fscanf';

function gsl_block_long_raw_fprintf(stream: PPointer; b: PInteger; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_raw_fprintf';

function gsl_block_long_size(b: Pgsl_block_long): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_size';

function gsl_block_long_data(b: Pgsl_block_long): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_block_long_data';

function gsl_vector_long_alloc(n: NativeUInt): Pgsl_vector_long; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_alloc';

function gsl_vector_long_calloc(n: NativeUInt): Pgsl_vector_long; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_calloc';

function gsl_vector_long_alloc_from_block(b: Pgsl_block_long; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_long; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_alloc_from_block';

function gsl_vector_long_alloc_from_vector(v: Pgsl_vector_long; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_long; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_alloc_from_vector';

procedure gsl_vector_long_free(v: Pgsl_vector_long); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_free';

function gsl_vector_long_view_array(v: PInteger; n: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_view_array';

function gsl_vector_long_view_array_with_stride(base: PInteger; stride: NativeUInt; n: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_view_array_with_stride';

function gsl_vector_long_const_view_array(v: PInteger; n: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_const_view_array';

function gsl_vector_long_const_view_array_with_stride(base: PInteger; stride: NativeUInt; n: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_const_view_array_with_stride';

function gsl_vector_long_subvector(v: Pgsl_vector_long; i: NativeUInt; n: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_subvector';

function gsl_vector_long_subvector_with_stride(v: Pgsl_vector_long; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_subvector_with_stride';

function gsl_vector_long_const_subvector(v: Pgsl_vector_long; i: NativeUInt; n: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_const_subvector';

function gsl_vector_long_const_subvector_with_stride(v: Pgsl_vector_long; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_const_subvector_with_stride';

procedure gsl_vector_long_set_zero(v: Pgsl_vector_long); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_set_zero';

procedure gsl_vector_long_set_all(v: Pgsl_vector_long; x: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_set_all';

function gsl_vector_long_set_basis(v: Pgsl_vector_long; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_set_basis';

function gsl_vector_long_fread(stream: PPointer; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_fread';

function gsl_vector_long_fwrite(stream: PPointer; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_fwrite';

function gsl_vector_long_fscanf(stream: PPointer; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_fscanf';

function gsl_vector_long_fprintf(stream: PPointer; v: Pgsl_vector_long; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_fprintf';

function gsl_vector_long_memcpy(dest: Pgsl_vector_long; src: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_memcpy';

function gsl_vector_long_memcpy_scale(dest: Pgsl_vector_long; src: Pgsl_vector_long; alpha: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_memcpy_scale';

function gsl_vector_long_reverse(v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_reverse';

function gsl_vector_long_swap(v: Pgsl_vector_long; w: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_swap';

function gsl_vector_long_swap_elements(v: Pgsl_vector_long; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_swap_elements';

function gsl_vector_long_max(v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_max';

function gsl_vector_long_min(v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_min';

procedure gsl_vector_long_minmax(v: Pgsl_vector_long; min_out: PInteger; max_out: PInteger); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_minmax';

function gsl_vector_long_max_index(v: Pgsl_vector_long): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_max_index';

function gsl_vector_long_min_index(v: Pgsl_vector_long): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_min_index';

procedure gsl_vector_long_minmax_index(v: Pgsl_vector_long; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_minmax_index';

function gsl_vector_long_add(a: Pgsl_vector_long; b: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_add';

function gsl_vector_long_sub(a: Pgsl_vector_long; b: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_sub';

function gsl_vector_long_mul(a: Pgsl_vector_long; b: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_mul';

function gsl_vector_long_div(a: Pgsl_vector_long; b: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_div';

function gsl_vector_long_scale(a: Pgsl_vector_long; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_scale';

function gsl_vector_long_add_constant(a: Pgsl_vector_long; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_add_constant';

function gsl_vector_long_equal(u: Pgsl_vector_long; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_equal';

function gsl_vector_long_isnull(v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_isnull';

function gsl_vector_long_ispos(v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_ispos';

function gsl_vector_long_isneg(v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_isneg';

function gsl_vector_long_isnonneg(v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_isnonneg';

function gsl_vector_long_get(v: Pgsl_vector_long; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_get';

procedure gsl_vector_long_set(v: Pgsl_vector_long; i: NativeUInt; x: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_set';

function gsl_vector_long_ptr(v: Pgsl_vector_long; i: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_ptr';

function gsl_vector_long_const_ptr(v: Pgsl_vector_long; i: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_const_ptr';

function gsl_block_uint_alloc(n: NativeUInt): Pgsl_block_uint; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_alloc';

function gsl_block_uint_calloc(n: NativeUInt): Pgsl_block_uint; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_calloc';

procedure gsl_block_uint_free(b: Pgsl_block_uint); cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_free';

function gsl_block_uint_fread(stream: PPointer; b: Pgsl_block_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_fread';

function gsl_block_uint_fwrite(stream: PPointer; b: Pgsl_block_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_fwrite';

function gsl_block_uint_fscanf(stream: PPointer; b: Pgsl_block_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_fscanf';

function gsl_block_uint_fprintf(stream: PPointer; b: Pgsl_block_uint; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_fprintf';

function gsl_block_uint_raw_fread(stream: PPointer; b: PCardinal; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_raw_fread';

function gsl_block_uint_raw_fwrite(stream: PPointer; b: PCardinal; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_raw_fwrite';

function gsl_block_uint_raw_fscanf(stream: PPointer; b: PCardinal; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_raw_fscanf';

function gsl_block_uint_raw_fprintf(stream: PPointer; b: PCardinal; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_raw_fprintf';

function gsl_block_uint_size(b: Pgsl_block_uint): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_size';

function gsl_block_uint_data(b: Pgsl_block_uint): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_block_uint_data';

function gsl_vector_uint_alloc(n: NativeUInt): Pgsl_vector_uint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_alloc';

function gsl_vector_uint_calloc(n: NativeUInt): Pgsl_vector_uint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_calloc';

function gsl_vector_uint_alloc_from_block(b: Pgsl_block_uint; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_uint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_alloc_from_block';

function gsl_vector_uint_alloc_from_vector(v: Pgsl_vector_uint; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_uint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_alloc_from_vector';

procedure gsl_vector_uint_free(v: Pgsl_vector_uint); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_free';

function gsl_vector_uint_view_array(v: PCardinal; n: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_view_array';

function gsl_vector_uint_view_array_with_stride(base: PCardinal; stride: NativeUInt; n: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_view_array_with_stride';

function gsl_vector_uint_const_view_array(v: PCardinal; n: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_const_view_array';

function gsl_vector_uint_const_view_array_with_stride(base: PCardinal; stride: NativeUInt; n: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_const_view_array_with_stride';

function gsl_vector_uint_subvector(v: Pgsl_vector_uint; i: NativeUInt; n: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_subvector';

function gsl_vector_uint_subvector_with_stride(v: Pgsl_vector_uint; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_subvector_with_stride';

function gsl_vector_uint_const_subvector(v: Pgsl_vector_uint; i: NativeUInt; n: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_const_subvector';

function gsl_vector_uint_const_subvector_with_stride(v: Pgsl_vector_uint; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_const_subvector_with_stride';

procedure gsl_vector_uint_set_zero(v: Pgsl_vector_uint); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_set_zero';

procedure gsl_vector_uint_set_all(v: Pgsl_vector_uint; x: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_set_all';

function gsl_vector_uint_set_basis(v: Pgsl_vector_uint; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_set_basis';

function gsl_vector_uint_fread(stream: PPointer; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_fread';

function gsl_vector_uint_fwrite(stream: PPointer; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_fwrite';

function gsl_vector_uint_fscanf(stream: PPointer; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_fscanf';

function gsl_vector_uint_fprintf(stream: PPointer; v: Pgsl_vector_uint; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_fprintf';

function gsl_vector_uint_memcpy(dest: Pgsl_vector_uint; src: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_memcpy';

function gsl_vector_uint_memcpy_scale(dest: Pgsl_vector_uint; src: Pgsl_vector_uint; alpha: Cardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_memcpy_scale';

function gsl_vector_uint_reverse(v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_reverse';

function gsl_vector_uint_swap(v: Pgsl_vector_uint; w: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_swap';

function gsl_vector_uint_swap_elements(v: Pgsl_vector_uint; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_swap_elements';

function gsl_vector_uint_max(v: Pgsl_vector_uint): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_max';

function gsl_vector_uint_min(v: Pgsl_vector_uint): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_min';

procedure gsl_vector_uint_minmax(v: Pgsl_vector_uint; min_out: PCardinal; max_out: PCardinal); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_minmax';

function gsl_vector_uint_max_index(v: Pgsl_vector_uint): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_max_index';

function gsl_vector_uint_min_index(v: Pgsl_vector_uint): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_min_index';

procedure gsl_vector_uint_minmax_index(v: Pgsl_vector_uint; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_minmax_index';

function gsl_vector_uint_add(a: Pgsl_vector_uint; b: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_add';

function gsl_vector_uint_sub(a: Pgsl_vector_uint; b: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_sub';

function gsl_vector_uint_mul(a: Pgsl_vector_uint; b: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_mul';

function gsl_vector_uint_div(a: Pgsl_vector_uint; b: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_div';

function gsl_vector_uint_scale(a: Pgsl_vector_uint; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_scale';

function gsl_vector_uint_add_constant(a: Pgsl_vector_uint; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_add_constant';

function gsl_vector_uint_equal(u: Pgsl_vector_uint; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_equal';

function gsl_vector_uint_isnull(v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_isnull';

function gsl_vector_uint_ispos(v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_ispos';

function gsl_vector_uint_isneg(v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_isneg';

function gsl_vector_uint_isnonneg(v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_isnonneg';

function gsl_vector_uint_get(v: Pgsl_vector_uint; i: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_get';

procedure gsl_vector_uint_set(v: Pgsl_vector_uint; i: NativeUInt; x: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_set';

function gsl_vector_uint_ptr(v: Pgsl_vector_uint; i: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_ptr';

function gsl_vector_uint_const_ptr(v: Pgsl_vector_uint; i: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_const_ptr';

function gsl_block_int_alloc(n: NativeUInt): Pgsl_block_int; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_alloc';

function gsl_block_int_calloc(n: NativeUInt): Pgsl_block_int; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_calloc';

procedure gsl_block_int_free(b: Pgsl_block_int); cdecl;
  external LIBGSL name _PU + 'gsl_block_int_free';

function gsl_block_int_fread(stream: PPointer; b: Pgsl_block_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_fread';

function gsl_block_int_fwrite(stream: PPointer; b: Pgsl_block_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_fwrite';

function gsl_block_int_fscanf(stream: PPointer; b: Pgsl_block_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_fscanf';

function gsl_block_int_fprintf(stream: PPointer; b: Pgsl_block_int; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_fprintf';

function gsl_block_int_raw_fread(stream: PPointer; b: PInteger; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_raw_fread';

function gsl_block_int_raw_fwrite(stream: PPointer; b: PInteger; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_raw_fwrite';

function gsl_block_int_raw_fscanf(stream: PPointer; b: PInteger; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_raw_fscanf';

function gsl_block_int_raw_fprintf(stream: PPointer; b: PInteger; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_raw_fprintf';

function gsl_block_int_size(b: Pgsl_block_int): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_size';

function gsl_block_int_data(b: Pgsl_block_int): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_block_int_data';

function gsl_vector_int_alloc(n: NativeUInt): Pgsl_vector_int; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_alloc';

function gsl_vector_int_calloc(n: NativeUInt): Pgsl_vector_int; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_calloc';

function gsl_vector_int_alloc_from_block(b: Pgsl_block_int; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_int; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_alloc_from_block';

function gsl_vector_int_alloc_from_vector(v: Pgsl_vector_int; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_int; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_alloc_from_vector';

procedure gsl_vector_int_free(v: Pgsl_vector_int); cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_free';

function gsl_vector_int_view_array(v: PInteger; n: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_view_array';

function gsl_vector_int_view_array_with_stride(base: PInteger; stride: NativeUInt; n: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_view_array_with_stride';

function gsl_vector_int_const_view_array(v: PInteger; n: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_const_view_array';

function gsl_vector_int_const_view_array_with_stride(base: PInteger; stride: NativeUInt; n: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_const_view_array_with_stride';

function gsl_vector_int_subvector(v: Pgsl_vector_int; i: NativeUInt; n: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_subvector';

function gsl_vector_int_subvector_with_stride(v: Pgsl_vector_int; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_subvector_with_stride';

function gsl_vector_int_const_subvector(v: Pgsl_vector_int; i: NativeUInt; n: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_const_subvector';

function gsl_vector_int_const_subvector_with_stride(v: Pgsl_vector_int; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_const_subvector_with_stride';

procedure gsl_vector_int_set_zero(v: Pgsl_vector_int); cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_set_zero';

procedure gsl_vector_int_set_all(v: Pgsl_vector_int; x: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_set_all';

function gsl_vector_int_set_basis(v: Pgsl_vector_int; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_set_basis';

function gsl_vector_int_fread(stream: PPointer; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_fread';

function gsl_vector_int_fwrite(stream: PPointer; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_fwrite';

function gsl_vector_int_fscanf(stream: PPointer; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_fscanf';

function gsl_vector_int_fprintf(stream: PPointer; v: Pgsl_vector_int; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_fprintf';

function gsl_vector_int_memcpy(dest: Pgsl_vector_int; src: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_memcpy';

function gsl_vector_int_memcpy_scale(dest: Pgsl_vector_int; src: Pgsl_vector_int; alpha: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_memcpy_scale';

function gsl_vector_int_reverse(v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_reverse';

function gsl_vector_int_swap(v: Pgsl_vector_int; w: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_swap';

function gsl_vector_int_swap_elements(v: Pgsl_vector_int; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_swap_elements';

function gsl_vector_int_max(v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_max';

function gsl_vector_int_min(v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_min';

procedure gsl_vector_int_minmax(v: Pgsl_vector_int; min_out: PInteger; max_out: PInteger); cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_minmax';

function gsl_vector_int_max_index(v: Pgsl_vector_int): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_max_index';

function gsl_vector_int_min_index(v: Pgsl_vector_int): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_min_index';

procedure gsl_vector_int_minmax_index(v: Pgsl_vector_int; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_minmax_index';

function gsl_vector_int_add(a: Pgsl_vector_int; b: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_add';

function gsl_vector_int_sub(a: Pgsl_vector_int; b: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_sub';

function gsl_vector_int_mul(a: Pgsl_vector_int; b: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_mul';

function gsl_vector_int_div(a: Pgsl_vector_int; b: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_div';

function gsl_vector_int_scale(a: Pgsl_vector_int; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_scale';

function gsl_vector_int_add_constant(a: Pgsl_vector_int; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_add_constant';

function gsl_vector_int_equal(u: Pgsl_vector_int; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_equal';

function gsl_vector_int_isnull(v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_isnull';

function gsl_vector_int_ispos(v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_ispos';

function gsl_vector_int_isneg(v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_isneg';

function gsl_vector_int_isnonneg(v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_isnonneg';

function gsl_vector_int_get(v: Pgsl_vector_int; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_get';

procedure gsl_vector_int_set(v: Pgsl_vector_int; i: NativeUInt; x: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_set';

function gsl_vector_int_ptr(v: Pgsl_vector_int; i: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_ptr';

function gsl_vector_int_const_ptr(v: Pgsl_vector_int; i: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_const_ptr';

function gsl_block_ushort_alloc(n: NativeUInt): Pgsl_block_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_alloc';

function gsl_block_ushort_calloc(n: NativeUInt): Pgsl_block_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_calloc';

procedure gsl_block_ushort_free(b: Pgsl_block_ushort); cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_free';

function gsl_block_ushort_fread(stream: PPointer; b: Pgsl_block_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_fread';

function gsl_block_ushort_fwrite(stream: PPointer; b: Pgsl_block_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_fwrite';

function gsl_block_ushort_fscanf(stream: PPointer; b: Pgsl_block_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_fscanf';

function gsl_block_ushort_fprintf(stream: PPointer; b: Pgsl_block_ushort; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_fprintf';

function gsl_block_ushort_raw_fread(stream: PPointer; b: PWord; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_raw_fread';

function gsl_block_ushort_raw_fwrite(stream: PPointer; b: PWord; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_raw_fwrite';

function gsl_block_ushort_raw_fscanf(stream: PPointer; b: PWord; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_raw_fscanf';

function gsl_block_ushort_raw_fprintf(stream: PPointer; b: PWord; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_raw_fprintf';

function gsl_block_ushort_size(b: Pgsl_block_ushort): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_size';

function gsl_block_ushort_data(b: Pgsl_block_ushort): PWord; cdecl;
  external LIBGSL name _PU + 'gsl_block_ushort_data';

function gsl_vector_ushort_alloc(n: NativeUInt): Pgsl_vector_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_alloc';

function gsl_vector_ushort_calloc(n: NativeUInt): Pgsl_vector_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_calloc';

function gsl_vector_ushort_alloc_from_block(b: Pgsl_block_ushort; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_alloc_from_block';

function gsl_vector_ushort_alloc_from_vector(v: Pgsl_vector_ushort; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_alloc_from_vector';

procedure gsl_vector_ushort_free(v: Pgsl_vector_ushort); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_free';

function gsl_vector_ushort_view_array(v: PWord; n: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_view_array';

function gsl_vector_ushort_view_array_with_stride(base: PWord; stride: NativeUInt; n: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_view_array_with_stride';

function gsl_vector_ushort_const_view_array(v: PWord; n: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_const_view_array';

function gsl_vector_ushort_const_view_array_with_stride(base: PWord; stride: NativeUInt; n: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_const_view_array_with_stride';

function gsl_vector_ushort_subvector(v: Pgsl_vector_ushort; i: NativeUInt; n: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_subvector';

function gsl_vector_ushort_subvector_with_stride(v: Pgsl_vector_ushort; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_subvector_with_stride';

function gsl_vector_ushort_const_subvector(v: Pgsl_vector_ushort; i: NativeUInt; n: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_const_subvector';

function gsl_vector_ushort_const_subvector_with_stride(v: Pgsl_vector_ushort; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_const_subvector_with_stride';

procedure gsl_vector_ushort_set_zero(v: Pgsl_vector_ushort); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_set_zero';

procedure gsl_vector_ushort_set_all(v: Pgsl_vector_ushort; x: Word); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_set_all';

function gsl_vector_ushort_set_basis(v: Pgsl_vector_ushort; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_set_basis';

function gsl_vector_ushort_fread(stream: PPointer; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_fread';

function gsl_vector_ushort_fwrite(stream: PPointer; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_fwrite';

function gsl_vector_ushort_fscanf(stream: PPointer; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_fscanf';

function gsl_vector_ushort_fprintf(stream: PPointer; v: Pgsl_vector_ushort; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_fprintf';

function gsl_vector_ushort_memcpy(dest: Pgsl_vector_ushort; src: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_memcpy';

function gsl_vector_ushort_memcpy_scale(dest: Pgsl_vector_ushort; src: Pgsl_vector_ushort; alpha: Word): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_memcpy_scale';

function gsl_vector_ushort_reverse(v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_reverse';

function gsl_vector_ushort_swap(v: Pgsl_vector_ushort; w: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_swap';

function gsl_vector_ushort_swap_elements(v: Pgsl_vector_ushort; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_swap_elements';

function gsl_vector_ushort_max(v: Pgsl_vector_ushort): Word; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_max';

function gsl_vector_ushort_min(v: Pgsl_vector_ushort): Word; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_min';

procedure gsl_vector_ushort_minmax(v: Pgsl_vector_ushort; min_out: PWord; max_out: PWord); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_minmax';

function gsl_vector_ushort_max_index(v: Pgsl_vector_ushort): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_max_index';

function gsl_vector_ushort_min_index(v: Pgsl_vector_ushort): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_min_index';

procedure gsl_vector_ushort_minmax_index(v: Pgsl_vector_ushort; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_minmax_index';

function gsl_vector_ushort_add(a: Pgsl_vector_ushort; b: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_add';

function gsl_vector_ushort_sub(a: Pgsl_vector_ushort; b: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_sub';

function gsl_vector_ushort_mul(a: Pgsl_vector_ushort; b: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_mul';

function gsl_vector_ushort_div(a: Pgsl_vector_ushort; b: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_div';

function gsl_vector_ushort_scale(a: Pgsl_vector_ushort; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_scale';

function gsl_vector_ushort_add_constant(a: Pgsl_vector_ushort; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_add_constant';

function gsl_vector_ushort_equal(u: Pgsl_vector_ushort; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_equal';

function gsl_vector_ushort_isnull(v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_isnull';

function gsl_vector_ushort_ispos(v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_ispos';

function gsl_vector_ushort_isneg(v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_isneg';

function gsl_vector_ushort_isnonneg(v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_isnonneg';

function gsl_vector_ushort_get(v: Pgsl_vector_ushort; i: NativeUInt): Word; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_get';

procedure gsl_vector_ushort_set(v: Pgsl_vector_ushort; i: NativeUInt; x: Word); cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_set';

function gsl_vector_ushort_ptr(v: Pgsl_vector_ushort; i: NativeUInt): PWord; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_ptr';

function gsl_vector_ushort_const_ptr(v: Pgsl_vector_ushort; i: NativeUInt): PWord; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_const_ptr';

function gsl_block_short_alloc(n: NativeUInt): Pgsl_block_short; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_alloc';

function gsl_block_short_calloc(n: NativeUInt): Pgsl_block_short; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_calloc';

procedure gsl_block_short_free(b: Pgsl_block_short); cdecl;
  external LIBGSL name _PU + 'gsl_block_short_free';

function gsl_block_short_fread(stream: PPointer; b: Pgsl_block_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_fread';

function gsl_block_short_fwrite(stream: PPointer; b: Pgsl_block_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_fwrite';

function gsl_block_short_fscanf(stream: PPointer; b: Pgsl_block_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_fscanf';

function gsl_block_short_fprintf(stream: PPointer; b: Pgsl_block_short; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_fprintf';

function gsl_block_short_raw_fread(stream: PPointer; b: PSmallint; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_raw_fread';

function gsl_block_short_raw_fwrite(stream: PPointer; b: PSmallint; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_raw_fwrite';

function gsl_block_short_raw_fscanf(stream: PPointer; b: PSmallint; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_raw_fscanf';

function gsl_block_short_raw_fprintf(stream: PPointer; b: PSmallint; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_raw_fprintf';

function gsl_block_short_size(b: Pgsl_block_short): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_size';

function gsl_block_short_data(b: Pgsl_block_short): PSmallint; cdecl;
  external LIBGSL name _PU + 'gsl_block_short_data';

function gsl_vector_short_alloc(n: NativeUInt): Pgsl_vector_short; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_alloc';

function gsl_vector_short_calloc(n: NativeUInt): Pgsl_vector_short; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_calloc';

function gsl_vector_short_alloc_from_block(b: Pgsl_block_short; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_short; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_alloc_from_block';

function gsl_vector_short_alloc_from_vector(v: Pgsl_vector_short; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_short; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_alloc_from_vector';

procedure gsl_vector_short_free(v: Pgsl_vector_short); cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_free';

function gsl_vector_short_view_array(v: PSmallint; n: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_view_array';

function gsl_vector_short_view_array_with_stride(base: PSmallint; stride: NativeUInt; n: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_view_array_with_stride';

function gsl_vector_short_const_view_array(v: PSmallint; n: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_const_view_array';

function gsl_vector_short_const_view_array_with_stride(base: PSmallint; stride: NativeUInt; n: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_const_view_array_with_stride';

function gsl_vector_short_subvector(v: Pgsl_vector_short; i: NativeUInt; n: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_subvector';

function gsl_vector_short_subvector_with_stride(v: Pgsl_vector_short; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_subvector_with_stride';

function gsl_vector_short_const_subvector(v: Pgsl_vector_short; i: NativeUInt; n: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_const_subvector';

function gsl_vector_short_const_subvector_with_stride(v: Pgsl_vector_short; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_const_subvector_with_stride';

procedure gsl_vector_short_set_zero(v: Pgsl_vector_short); cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_set_zero';

procedure gsl_vector_short_set_all(v: Pgsl_vector_short; x: Smallint); cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_set_all';

function gsl_vector_short_set_basis(v: Pgsl_vector_short; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_set_basis';

function gsl_vector_short_fread(stream: PPointer; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_fread';

function gsl_vector_short_fwrite(stream: PPointer; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_fwrite';

function gsl_vector_short_fscanf(stream: PPointer; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_fscanf';

function gsl_vector_short_fprintf(stream: PPointer; v: Pgsl_vector_short; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_fprintf';

function gsl_vector_short_memcpy(dest: Pgsl_vector_short; src: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_memcpy';

function gsl_vector_short_memcpy_scale(dest: Pgsl_vector_short; src: Pgsl_vector_short; alpha: Smallint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_memcpy_scale';

function gsl_vector_short_reverse(v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_reverse';

function gsl_vector_short_swap(v: Pgsl_vector_short; w: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_swap';

function gsl_vector_short_swap_elements(v: Pgsl_vector_short; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_swap_elements';

function gsl_vector_short_max(v: Pgsl_vector_short): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_max';

function gsl_vector_short_min(v: Pgsl_vector_short): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_min';

procedure gsl_vector_short_minmax(v: Pgsl_vector_short; min_out: PSmallint; max_out: PSmallint); cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_minmax';

function gsl_vector_short_max_index(v: Pgsl_vector_short): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_max_index';

function gsl_vector_short_min_index(v: Pgsl_vector_short): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_min_index';

procedure gsl_vector_short_minmax_index(v: Pgsl_vector_short; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_minmax_index';

function gsl_vector_short_add(a: Pgsl_vector_short; b: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_add';

function gsl_vector_short_sub(a: Pgsl_vector_short; b: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_sub';

function gsl_vector_short_mul(a: Pgsl_vector_short; b: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_mul';

function gsl_vector_short_div(a: Pgsl_vector_short; b: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_div';

function gsl_vector_short_scale(a: Pgsl_vector_short; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_scale';

function gsl_vector_short_add_constant(a: Pgsl_vector_short; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_add_constant';

function gsl_vector_short_equal(u: Pgsl_vector_short; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_equal';

function gsl_vector_short_isnull(v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_isnull';

function gsl_vector_short_ispos(v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_ispos';

function gsl_vector_short_isneg(v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_isneg';

function gsl_vector_short_isnonneg(v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_isnonneg';

function gsl_vector_short_get(v: Pgsl_vector_short; i: NativeUInt): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_get';

procedure gsl_vector_short_set(v: Pgsl_vector_short; i: NativeUInt; x: Smallint); cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_set';

function gsl_vector_short_ptr(v: Pgsl_vector_short; i: NativeUInt): PSmallint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_ptr';

function gsl_vector_short_const_ptr(v: Pgsl_vector_short; i: NativeUInt): PSmallint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_const_ptr';

function gsl_block_uchar_alloc(n: NativeUInt): Pgsl_block_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_alloc';

function gsl_block_uchar_calloc(n: NativeUInt): Pgsl_block_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_calloc';

procedure gsl_block_uchar_free(b: Pgsl_block_uchar); cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_free';

function gsl_block_uchar_fread(stream: PPointer; b: Pgsl_block_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_fread';

function gsl_block_uchar_fwrite(stream: PPointer; b: Pgsl_block_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_fwrite';

function gsl_block_uchar_fscanf(stream: PPointer; b: Pgsl_block_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_fscanf';

function gsl_block_uchar_fprintf(stream: PPointer; b: Pgsl_block_uchar; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_fprintf';

function gsl_block_uchar_raw_fread(stream: PPointer; b: PByte; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_raw_fread';

function gsl_block_uchar_raw_fwrite(stream: PPointer; b: PByte; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_raw_fwrite';

function gsl_block_uchar_raw_fscanf(stream: PPointer; b: PByte; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_raw_fscanf';

function gsl_block_uchar_raw_fprintf(stream: PPointer; b: PByte; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_raw_fprintf';

function gsl_block_uchar_size(b: Pgsl_block_uchar): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_size';

function gsl_block_uchar_data(b: Pgsl_block_uchar): PByte; cdecl;
  external LIBGSL name _PU + 'gsl_block_uchar_data';

function gsl_vector_uchar_alloc(n: NativeUInt): Pgsl_vector_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_alloc';

function gsl_vector_uchar_calloc(n: NativeUInt): Pgsl_vector_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_calloc';

function gsl_vector_uchar_alloc_from_block(b: Pgsl_block_uchar; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_alloc_from_block';

function gsl_vector_uchar_alloc_from_vector(v: Pgsl_vector_uchar; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_alloc_from_vector';

procedure gsl_vector_uchar_free(v: Pgsl_vector_uchar); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_free';

function gsl_vector_uchar_view_array(v: PByte; n: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_view_array';

function gsl_vector_uchar_view_array_with_stride(base: PByte; stride: NativeUInt; n: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_view_array_with_stride';

function gsl_vector_uchar_const_view_array(v: PByte; n: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_const_view_array';

function gsl_vector_uchar_const_view_array_with_stride(base: PByte; stride: NativeUInt; n: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_const_view_array_with_stride';

function gsl_vector_uchar_subvector(v: Pgsl_vector_uchar; i: NativeUInt; n: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_subvector';

function gsl_vector_uchar_subvector_with_stride(v: Pgsl_vector_uchar; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_subvector_with_stride';

function gsl_vector_uchar_const_subvector(v: Pgsl_vector_uchar; i: NativeUInt; n: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_const_subvector';

function gsl_vector_uchar_const_subvector_with_stride(v: Pgsl_vector_uchar; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_const_subvector_with_stride';

procedure gsl_vector_uchar_set_zero(v: Pgsl_vector_uchar); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_set_zero';

procedure gsl_vector_uchar_set_all(v: Pgsl_vector_uchar; x: Byte); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_set_all';

function gsl_vector_uchar_set_basis(v: Pgsl_vector_uchar; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_set_basis';

function gsl_vector_uchar_fread(stream: PPointer; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_fread';

function gsl_vector_uchar_fwrite(stream: PPointer; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_fwrite';

function gsl_vector_uchar_fscanf(stream: PPointer; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_fscanf';

function gsl_vector_uchar_fprintf(stream: PPointer; v: Pgsl_vector_uchar; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_fprintf';

function gsl_vector_uchar_memcpy(dest: Pgsl_vector_uchar; src: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_memcpy';

function gsl_vector_uchar_memcpy_scale(dest: Pgsl_vector_uchar; src: Pgsl_vector_uchar; alpha: Byte): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_memcpy_scale';

function gsl_vector_uchar_reverse(v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_reverse';

function gsl_vector_uchar_swap(v: Pgsl_vector_uchar; w: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_swap';

function gsl_vector_uchar_swap_elements(v: Pgsl_vector_uchar; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_swap_elements';

function gsl_vector_uchar_max(v: Pgsl_vector_uchar): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_max';

function gsl_vector_uchar_min(v: Pgsl_vector_uchar): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_min';

procedure gsl_vector_uchar_minmax(v: Pgsl_vector_uchar; min_out: PByte; max_out: PByte); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_minmax';

function gsl_vector_uchar_max_index(v: Pgsl_vector_uchar): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_max_index';

function gsl_vector_uchar_min_index(v: Pgsl_vector_uchar): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_min_index';

procedure gsl_vector_uchar_minmax_index(v: Pgsl_vector_uchar; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_minmax_index';

function gsl_vector_uchar_add(a: Pgsl_vector_uchar; b: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_add';

function gsl_vector_uchar_sub(a: Pgsl_vector_uchar; b: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_sub';

function gsl_vector_uchar_mul(a: Pgsl_vector_uchar; b: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_mul';

function gsl_vector_uchar_div(a: Pgsl_vector_uchar; b: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_div';

function gsl_vector_uchar_scale(a: Pgsl_vector_uchar; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_scale';

function gsl_vector_uchar_add_constant(a: Pgsl_vector_uchar; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_add_constant';

function gsl_vector_uchar_equal(u: Pgsl_vector_uchar; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_equal';

function gsl_vector_uchar_isnull(v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_isnull';

function gsl_vector_uchar_ispos(v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_ispos';

function gsl_vector_uchar_isneg(v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_isneg';

function gsl_vector_uchar_isnonneg(v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_isnonneg';

function gsl_vector_uchar_get(v: Pgsl_vector_uchar; i: NativeUInt): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_get';

procedure gsl_vector_uchar_set(v: Pgsl_vector_uchar; i: NativeUInt; x: Byte); cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_set';

function gsl_vector_uchar_ptr(v: Pgsl_vector_uchar; i: NativeUInt): PByte; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_ptr';

function gsl_vector_uchar_const_ptr(v: Pgsl_vector_uchar; i: NativeUInt): PByte; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_const_ptr';

function gsl_block_char_alloc(n: NativeUInt): Pgsl_block_char; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_alloc';

function gsl_block_char_calloc(n: NativeUInt): Pgsl_block_char; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_calloc';

procedure gsl_block_char_free(b: Pgsl_block_char); cdecl;
  external LIBGSL name _PU + 'gsl_block_char_free';

function gsl_block_char_fread(stream: PPointer; b: Pgsl_block_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_fread';

function gsl_block_char_fwrite(stream: PPointer; b: Pgsl_block_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_fwrite';

function gsl_block_char_fscanf(stream: PPointer; b: Pgsl_block_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_fscanf';

function gsl_block_char_fprintf(stream: PPointer; b: Pgsl_block_char; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_fprintf';

function gsl_block_char_raw_fread(stream: PPointer; b: PUTF8Char; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_raw_fread';

function gsl_block_char_raw_fwrite(stream: PPointer; b: PUTF8Char; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_raw_fwrite';

function gsl_block_char_raw_fscanf(stream: PPointer; b: PUTF8Char; n: NativeUInt; stride: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_raw_fscanf';

function gsl_block_char_raw_fprintf(stream: PPointer; b: PUTF8Char; n: NativeUInt; stride: NativeUInt; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_raw_fprintf';

function gsl_block_char_size(b: Pgsl_block_char): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_size';

function gsl_block_char_data(b: Pgsl_block_char): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_block_char_data';

function gsl_vector_char_alloc(n: NativeUInt): Pgsl_vector_char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_alloc';

function gsl_vector_char_calloc(n: NativeUInt): Pgsl_vector_char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_calloc';

function gsl_vector_char_alloc_from_block(b: Pgsl_block_char; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_alloc_from_block';

function gsl_vector_char_alloc_from_vector(v: Pgsl_vector_char; offset: NativeUInt; n: NativeUInt; stride: NativeUInt): Pgsl_vector_char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_alloc_from_vector';

procedure gsl_vector_char_free(v: Pgsl_vector_char); cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_free';

function gsl_vector_char_view_array(v: PUTF8Char; n: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_view_array';

function gsl_vector_char_view_array_with_stride(base: PUTF8Char; stride: NativeUInt; n: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_view_array_with_stride';

function gsl_vector_char_const_view_array(v: PUTF8Char; n: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_const_view_array';

function gsl_vector_char_const_view_array_with_stride(base: PUTF8Char; stride: NativeUInt; n: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_const_view_array_with_stride';

function gsl_vector_char_subvector(v: Pgsl_vector_char; i: NativeUInt; n: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_subvector';

function gsl_vector_char_subvector_with_stride(v: Pgsl_vector_char; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_subvector_with_stride';

function gsl_vector_char_const_subvector(v: Pgsl_vector_char; i: NativeUInt; n: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_const_subvector';

function gsl_vector_char_const_subvector_with_stride(v: Pgsl_vector_char; i: NativeUInt; stride: NativeUInt; n: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_const_subvector_with_stride';

procedure gsl_vector_char_set_zero(v: Pgsl_vector_char); cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_set_zero';

procedure gsl_vector_char_set_all(v: Pgsl_vector_char; x: UTF8Char); cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_set_all';

function gsl_vector_char_set_basis(v: Pgsl_vector_char; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_set_basis';

function gsl_vector_char_fread(stream: PPointer; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_fread';

function gsl_vector_char_fwrite(stream: PPointer; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_fwrite';

function gsl_vector_char_fscanf(stream: PPointer; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_fscanf';

function gsl_vector_char_fprintf(stream: PPointer; v: Pgsl_vector_char; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_fprintf';

function gsl_vector_char_memcpy(dest: Pgsl_vector_char; src: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_memcpy';

function gsl_vector_char_memcpy_scale(dest: Pgsl_vector_char; src: Pgsl_vector_char; alpha: UTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_memcpy_scale';

function gsl_vector_char_reverse(v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_reverse';

function gsl_vector_char_swap(v: Pgsl_vector_char; w: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_swap';

function gsl_vector_char_swap_elements(v: Pgsl_vector_char; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_swap_elements';

function gsl_vector_char_max(v: Pgsl_vector_char): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_max';

function gsl_vector_char_min(v: Pgsl_vector_char): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_min';

procedure gsl_vector_char_minmax(v: Pgsl_vector_char; min_out: PUTF8Char; max_out: PUTF8Char); cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_minmax';

function gsl_vector_char_max_index(v: Pgsl_vector_char): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_max_index';

function gsl_vector_char_min_index(v: Pgsl_vector_char): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_min_index';

procedure gsl_vector_char_minmax_index(v: Pgsl_vector_char; imin: PNativeUInt; imax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_minmax_index';

function gsl_vector_char_add(a: Pgsl_vector_char; b: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_add';

function gsl_vector_char_sub(a: Pgsl_vector_char; b: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_sub';

function gsl_vector_char_mul(a: Pgsl_vector_char; b: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_mul';

function gsl_vector_char_div(a: Pgsl_vector_char; b: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_div';

function gsl_vector_char_scale(a: Pgsl_vector_char; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_scale';

function gsl_vector_char_add_constant(a: Pgsl_vector_char; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_add_constant';

function gsl_vector_char_equal(u: Pgsl_vector_char; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_equal';

function gsl_vector_char_isnull(v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_isnull';

function gsl_vector_char_ispos(v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_ispos';

function gsl_vector_char_isneg(v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_isneg';

function gsl_vector_char_isnonneg(v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_isnonneg';

function gsl_vector_char_get(v: Pgsl_vector_char; i: NativeUInt): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_get';

procedure gsl_vector_char_set(v: Pgsl_vector_char; i: NativeUInt; x: UTF8Char); cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_set';

function gsl_vector_char_ptr(v: Pgsl_vector_char; i: NativeUInt): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_ptr';

function gsl_vector_char_const_ptr(v: Pgsl_vector_char; i: NativeUInt): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_const_ptr';

function gsl_matrix_complex_long_double_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_alloc';

function gsl_matrix_complex_long_double_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_calloc';

function gsl_matrix_complex_long_double_alloc_from_block(b: Pgsl_block_complex_long_double; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_alloc_from_block';

function gsl_matrix_complex_long_double_alloc_from_matrix(b: Pgsl_matrix_complex_long_double; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_alloc_from_matrix';

function gsl_vector_complex_long_double_alloc_row_from_matrix(m: Pgsl_matrix_complex_long_double; i: NativeUInt): Pgsl_vector_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_alloc_row_from_matrix';

function gsl_vector_complex_long_double_alloc_col_from_matrix(m: Pgsl_matrix_complex_long_double; j: NativeUInt): Pgsl_vector_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_long_double_alloc_col_from_matrix';

procedure gsl_matrix_complex_long_double_free(m: Pgsl_matrix_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_free';

function gsl_matrix_complex_long_double_submatrix(m: Pgsl_matrix_complex_long_double; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_submatrix';

function gsl_matrix_complex_long_double_row(m: Pgsl_matrix_complex_long_double; i: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_row';

function gsl_matrix_complex_long_double_column(m: Pgsl_matrix_complex_long_double; j: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_column';

function gsl_matrix_complex_long_double_diagonal(m: Pgsl_matrix_complex_long_double): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_diagonal';

function gsl_matrix_complex_long_double_subdiagonal(m: Pgsl_matrix_complex_long_double; k: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_subdiagonal';

function gsl_matrix_complex_long_double_superdiagonal(m: Pgsl_matrix_complex_long_double; k: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_superdiagonal';

function gsl_matrix_complex_long_double_subrow(m: Pgsl_matrix_complex_long_double; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_subrow';

function gsl_matrix_complex_long_double_subcolumn(m: Pgsl_matrix_complex_long_double; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_subcolumn';

function gsl_matrix_complex_long_double_view_array(base: PExtended; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_view_array';

function gsl_matrix_complex_long_double_view_array_with_tda(base: PExtended; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_view_array_with_tda';

function gsl_matrix_complex_long_double_view_vector(v: Pgsl_vector_complex_long_double; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_view_vector';

function gsl_matrix_complex_long_double_view_vector_with_tda(v: Pgsl_vector_complex_long_double; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_view_vector_with_tda';

function gsl_matrix_complex_long_double_const_submatrix(m: Pgsl_matrix_complex_long_double; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_submatrix';

function gsl_matrix_complex_long_double_const_row(m: Pgsl_matrix_complex_long_double; i: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_row';

function gsl_matrix_complex_long_double_const_column(m: Pgsl_matrix_complex_long_double; j: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_column';

function gsl_matrix_complex_long_double_const_diagonal(m: Pgsl_matrix_complex_long_double): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_diagonal';

function gsl_matrix_complex_long_double_const_subdiagonal(m: Pgsl_matrix_complex_long_double; k: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_subdiagonal';

function gsl_matrix_complex_long_double_const_superdiagonal(m: Pgsl_matrix_complex_long_double; k: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_superdiagonal';

function gsl_matrix_complex_long_double_const_subrow(m: Pgsl_matrix_complex_long_double; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_subrow';

function gsl_matrix_complex_long_double_const_subcolumn(m: Pgsl_matrix_complex_long_double; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_subcolumn';

function gsl_matrix_complex_long_double_const_view_array(base: PExtended; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_view_array';

function gsl_matrix_complex_long_double_const_view_array_with_tda(base: PExtended; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_view_array_with_tda';

function gsl_matrix_complex_long_double_const_view_vector(v: Pgsl_vector_complex_long_double; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_view_vector';

function gsl_matrix_complex_long_double_const_view_vector_with_tda(v: Pgsl_vector_complex_long_double; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_view_vector_with_tda';

procedure gsl_matrix_complex_long_double_set_zero(m: Pgsl_matrix_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_set_zero';

procedure gsl_matrix_complex_long_double_set_identity(m: Pgsl_matrix_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_set_identity';

procedure gsl_matrix_complex_long_double_set_all(m: Pgsl_matrix_complex_long_double; x: gsl_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_set_all';

function gsl_matrix_complex_long_double_fread(stream: PPointer; m: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_fread';

function gsl_matrix_complex_long_double_fwrite(stream: PPointer; m: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_fwrite';

function gsl_matrix_complex_long_double_fscanf(stream: PPointer; m: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_fscanf';

function gsl_matrix_complex_long_double_fprintf(stream: PPointer; m: Pgsl_matrix_complex_long_double; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_fprintf';

function gsl_matrix_complex_long_double_memcpy(dest: Pgsl_matrix_complex_long_double; src: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_memcpy';

function gsl_matrix_complex_long_double_swap(m1: Pgsl_matrix_complex_long_double; m2: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_swap';

function gsl_matrix_complex_long_double_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_complex_long_double; src: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_tricpy';

function gsl_matrix_complex_long_double_swap_rows(m: Pgsl_matrix_complex_long_double; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_swap_rows';

function gsl_matrix_complex_long_double_swap_columns(m: Pgsl_matrix_complex_long_double; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_swap_columns';

function gsl_matrix_complex_long_double_swap_rowcol(m: Pgsl_matrix_complex_long_double; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_swap_rowcol';

function gsl_matrix_complex_long_double_transpose(m: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_transpose';

function gsl_matrix_complex_long_double_transpose_memcpy(dest: Pgsl_matrix_complex_long_double; src: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_transpose_memcpy';

function gsl_matrix_complex_long_double_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_complex_long_double; src: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_transpose_tricpy';

function gsl_matrix_complex_long_double_equal(a: Pgsl_matrix_complex_long_double; b: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_equal';

function gsl_matrix_complex_long_double_isnull(m: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_isnull';

function gsl_matrix_complex_long_double_ispos(m: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_ispos';

function gsl_matrix_complex_long_double_isneg(m: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_isneg';

function gsl_matrix_complex_long_double_isnonneg(m: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_isnonneg';

function gsl_matrix_complex_long_double_add(a: Pgsl_matrix_complex_long_double; b: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_add';

function gsl_matrix_complex_long_double_sub(a: Pgsl_matrix_complex_long_double; b: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_sub';

function gsl_matrix_complex_long_double_mul_elements(a: Pgsl_matrix_complex_long_double; b: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_mul_elements';

function gsl_matrix_complex_long_double_div_elements(a: Pgsl_matrix_complex_long_double; b: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_div_elements';

function gsl_matrix_complex_long_double_scale(a: Pgsl_matrix_complex_long_double; x: gsl_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_scale';

function gsl_matrix_complex_long_double_add_constant(a: Pgsl_matrix_complex_long_double; x: gsl_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_add_constant';

function gsl_matrix_complex_long_double_add_diagonal(a: Pgsl_matrix_complex_long_double; x: gsl_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_add_diagonal';

(***********************************************************************)
function gsl_matrix_complex_long_double_get_row(v: Pgsl_vector_complex_long_double; m: Pgsl_matrix_complex_long_double; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_get_row';

function gsl_matrix_complex_long_double_get_col(v: Pgsl_vector_complex_long_double; m: Pgsl_matrix_complex_long_double; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_get_col';

function gsl_matrix_complex_long_double_set_row(m: Pgsl_matrix_complex_long_double; i: NativeUInt; v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_set_row';

function gsl_matrix_complex_long_double_set_col(m: Pgsl_matrix_complex_long_double; j: NativeUInt; v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_set_col';

(***********************************************************************)
function gsl_matrix_complex_long_double_get(m: Pgsl_matrix_complex_long_double; i: NativeUInt; j: NativeUInt): gsl_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_get';

procedure gsl_matrix_complex_long_double_set(m: Pgsl_matrix_complex_long_double; i: NativeUInt; j: NativeUInt; x: gsl_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_set';

function gsl_matrix_complex_long_double_ptr(m: Pgsl_matrix_complex_long_double; i: NativeUInt; j: NativeUInt): Pgsl_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_ptr';

function gsl_matrix_complex_long_double_const_ptr(m: Pgsl_matrix_complex_long_double; i: NativeUInt; j: NativeUInt): Pgsl_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_long_double_const_ptr';

function gsl_matrix_complex_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_alloc';

function gsl_matrix_complex_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_calloc';

function gsl_matrix_complex_alloc_from_block(b: Pgsl_block_complex; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_alloc_from_block';

function gsl_matrix_complex_alloc_from_matrix(b: Pgsl_matrix_complex; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_alloc_from_matrix';

function gsl_vector_complex_alloc_row_from_matrix(m: Pgsl_matrix_complex; i: NativeUInt): Pgsl_vector_complex; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_alloc_row_from_matrix';

function gsl_vector_complex_alloc_col_from_matrix(m: Pgsl_matrix_complex; j: NativeUInt): Pgsl_vector_complex; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_alloc_col_from_matrix';

procedure gsl_matrix_complex_free(m: Pgsl_matrix_complex); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_free';

function gsl_matrix_complex_submatrix(m: Pgsl_matrix_complex; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_submatrix';

function gsl_matrix_complex_row(m: Pgsl_matrix_complex; i: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_row';

function gsl_matrix_complex_column(m: Pgsl_matrix_complex; j: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_column';

function gsl_matrix_complex_diagonal(m: Pgsl_matrix_complex): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_diagonal';

function gsl_matrix_complex_subdiagonal(m: Pgsl_matrix_complex; k: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_subdiagonal';

function gsl_matrix_complex_superdiagonal(m: Pgsl_matrix_complex; k: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_superdiagonal';

function gsl_matrix_complex_subrow(m: Pgsl_matrix_complex; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_subrow';

function gsl_matrix_complex_subcolumn(m: Pgsl_matrix_complex; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_subcolumn';

function gsl_matrix_complex_view_array(base: PDouble; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_view_array';

function gsl_matrix_complex_view_array_with_tda(base: PDouble; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_view_array_with_tda';

function gsl_matrix_complex_view_vector(v: Pgsl_vector_complex; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_view_vector';

function gsl_matrix_complex_view_vector_with_tda(v: Pgsl_vector_complex; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_view_vector_with_tda';

function gsl_matrix_complex_const_submatrix(m: Pgsl_matrix_complex; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_submatrix';

function gsl_matrix_complex_const_row(m: Pgsl_matrix_complex; i: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_row';

function gsl_matrix_complex_const_column(m: Pgsl_matrix_complex; j: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_column';

function gsl_matrix_complex_const_diagonal(m: Pgsl_matrix_complex): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_diagonal';

function gsl_matrix_complex_const_subdiagonal(m: Pgsl_matrix_complex; k: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_subdiagonal';

function gsl_matrix_complex_const_superdiagonal(m: Pgsl_matrix_complex; k: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_superdiagonal';

function gsl_matrix_complex_const_subrow(m: Pgsl_matrix_complex; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_subrow';

function gsl_matrix_complex_const_subcolumn(m: Pgsl_matrix_complex; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_subcolumn';

function gsl_matrix_complex_const_view_array(base: PDouble; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_view_array';

function gsl_matrix_complex_const_view_array_with_tda(base: PDouble; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_view_array_with_tda';

function gsl_matrix_complex_const_view_vector(v: Pgsl_vector_complex; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_view_vector';

function gsl_matrix_complex_const_view_vector_with_tda(v: Pgsl_vector_complex; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_view_vector_with_tda';

procedure gsl_matrix_complex_set_zero(m: Pgsl_matrix_complex); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_set_zero';

procedure gsl_matrix_complex_set_identity(m: Pgsl_matrix_complex); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_set_identity';

procedure gsl_matrix_complex_set_all(m: Pgsl_matrix_complex; x: gsl_complex); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_set_all';

function gsl_matrix_complex_fread(stream: PPointer; m: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_fread';

function gsl_matrix_complex_fwrite(stream: PPointer; m: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_fwrite';

function gsl_matrix_complex_fscanf(stream: PPointer; m: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_fscanf';

function gsl_matrix_complex_fprintf(stream: PPointer; m: Pgsl_matrix_complex; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_fprintf';

function gsl_matrix_complex_memcpy(dest: Pgsl_matrix_complex; src: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_memcpy';

function gsl_matrix_complex_swap(m1: Pgsl_matrix_complex; m2: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_swap';

function gsl_matrix_complex_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_complex; src: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_tricpy';

function gsl_matrix_complex_swap_rows(m: Pgsl_matrix_complex; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_swap_rows';

function gsl_matrix_complex_swap_columns(m: Pgsl_matrix_complex; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_swap_columns';

function gsl_matrix_complex_swap_rowcol(m: Pgsl_matrix_complex; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_swap_rowcol';

function gsl_matrix_complex_transpose(m: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_transpose';

function gsl_matrix_complex_transpose_memcpy(dest: Pgsl_matrix_complex; src: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_transpose_memcpy';

function gsl_matrix_complex_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_complex; src: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_transpose_tricpy';

function gsl_matrix_complex_equal(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_equal';

function gsl_matrix_complex_isnull(m: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_isnull';

function gsl_matrix_complex_ispos(m: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_ispos';

function gsl_matrix_complex_isneg(m: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_isneg';

function gsl_matrix_complex_isnonneg(m: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_isnonneg';

function gsl_matrix_complex_add(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_add';

function gsl_matrix_complex_sub(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_sub';

function gsl_matrix_complex_mul_elements(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_mul_elements';

function gsl_matrix_complex_div_elements(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_div_elements';

function gsl_matrix_complex_scale(a: Pgsl_matrix_complex; x: gsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_scale';

function gsl_matrix_complex_add_constant(a: Pgsl_matrix_complex; x: gsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_add_constant';

function gsl_matrix_complex_add_diagonal(a: Pgsl_matrix_complex; x: gsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_add_diagonal';

(***********************************************************************)
function gsl_matrix_complex_get_row(v: Pgsl_vector_complex; m: Pgsl_matrix_complex; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_get_row';

function gsl_matrix_complex_get_col(v: Pgsl_vector_complex; m: Pgsl_matrix_complex; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_get_col';

function gsl_matrix_complex_set_row(m: Pgsl_matrix_complex; i: NativeUInt; v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_set_row';

function gsl_matrix_complex_set_col(m: Pgsl_matrix_complex; j: NativeUInt; v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_set_col';

(***********************************************************************)
function gsl_matrix_complex_get(m: Pgsl_matrix_complex; i: NativeUInt; j: NativeUInt): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_get';

procedure gsl_matrix_complex_set(m: Pgsl_matrix_complex; i: NativeUInt; j: NativeUInt; x: gsl_complex); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_set';

function gsl_matrix_complex_ptr(m: Pgsl_matrix_complex; i: NativeUInt; j: NativeUInt): Pgsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_ptr';

function gsl_matrix_complex_const_ptr(m: Pgsl_matrix_complex; i: NativeUInt; j: NativeUInt): Pgsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_const_ptr';

function gsl_matrix_complex_float_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_alloc';

function gsl_matrix_complex_float_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_calloc';

function gsl_matrix_complex_float_alloc_from_block(b: Pgsl_block_complex_float; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_alloc_from_block';

function gsl_matrix_complex_float_alloc_from_matrix(b: Pgsl_matrix_complex_float; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_alloc_from_matrix';

function gsl_vector_complex_float_alloc_row_from_matrix(m: Pgsl_matrix_complex_float; i: NativeUInt): Pgsl_vector_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_alloc_row_from_matrix';

function gsl_vector_complex_float_alloc_col_from_matrix(m: Pgsl_matrix_complex_float; j: NativeUInt): Pgsl_vector_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_complex_float_alloc_col_from_matrix';

procedure gsl_matrix_complex_float_free(m: Pgsl_matrix_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_free';

function gsl_matrix_complex_float_submatrix(m: Pgsl_matrix_complex_float; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_submatrix';

function gsl_matrix_complex_float_row(m: Pgsl_matrix_complex_float; i: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_row';

function gsl_matrix_complex_float_column(m: Pgsl_matrix_complex_float; j: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_column';

function gsl_matrix_complex_float_diagonal(m: Pgsl_matrix_complex_float): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_diagonal';

function gsl_matrix_complex_float_subdiagonal(m: Pgsl_matrix_complex_float; k: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_subdiagonal';

function gsl_matrix_complex_float_superdiagonal(m: Pgsl_matrix_complex_float; k: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_superdiagonal';

function gsl_matrix_complex_float_subrow(m: Pgsl_matrix_complex_float; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_subrow';

function gsl_matrix_complex_float_subcolumn(m: Pgsl_matrix_complex_float; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_subcolumn';

function gsl_matrix_complex_float_view_array(base: PSingle; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_view_array';

function gsl_matrix_complex_float_view_array_with_tda(base: PSingle; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_view_array_with_tda';

function gsl_matrix_complex_float_view_vector(v: Pgsl_vector_complex_float; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_view_vector';

function gsl_matrix_complex_float_view_vector_with_tda(v: Pgsl_vector_complex_float; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_view_vector_with_tda';

function gsl_matrix_complex_float_const_submatrix(m: Pgsl_matrix_complex_float; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_submatrix';

function gsl_matrix_complex_float_const_row(m: Pgsl_matrix_complex_float; i: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_row';

function gsl_matrix_complex_float_const_column(m: Pgsl_matrix_complex_float; j: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_column';

function gsl_matrix_complex_float_const_diagonal(m: Pgsl_matrix_complex_float): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_diagonal';

function gsl_matrix_complex_float_const_subdiagonal(m: Pgsl_matrix_complex_float; k: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_subdiagonal';

function gsl_matrix_complex_float_const_superdiagonal(m: Pgsl_matrix_complex_float; k: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_superdiagonal';

function gsl_matrix_complex_float_const_subrow(m: Pgsl_matrix_complex_float; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_subrow';

function gsl_matrix_complex_float_const_subcolumn(m: Pgsl_matrix_complex_float; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_subcolumn';

function gsl_matrix_complex_float_const_view_array(base: PSingle; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_view_array';

function gsl_matrix_complex_float_const_view_array_with_tda(base: PSingle; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_view_array_with_tda';

function gsl_matrix_complex_float_const_view_vector(v: Pgsl_vector_complex_float; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_view_vector';

function gsl_matrix_complex_float_const_view_vector_with_tda(v: Pgsl_vector_complex_float; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_complex_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_view_vector_with_tda';

procedure gsl_matrix_complex_float_set_zero(m: Pgsl_matrix_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_set_zero';

procedure gsl_matrix_complex_float_set_identity(m: Pgsl_matrix_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_set_identity';

procedure gsl_matrix_complex_float_set_all(m: Pgsl_matrix_complex_float; x: gsl_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_set_all';

function gsl_matrix_complex_float_fread(stream: PPointer; m: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_fread';

function gsl_matrix_complex_float_fwrite(stream: PPointer; m: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_fwrite';

function gsl_matrix_complex_float_fscanf(stream: PPointer; m: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_fscanf';

function gsl_matrix_complex_float_fprintf(stream: PPointer; m: Pgsl_matrix_complex_float; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_fprintf';

function gsl_matrix_complex_float_memcpy(dest: Pgsl_matrix_complex_float; src: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_memcpy';

function gsl_matrix_complex_float_swap(m1: Pgsl_matrix_complex_float; m2: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_swap';

function gsl_matrix_complex_float_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_complex_float; src: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_tricpy';

function gsl_matrix_complex_float_swap_rows(m: Pgsl_matrix_complex_float; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_swap_rows';

function gsl_matrix_complex_float_swap_columns(m: Pgsl_matrix_complex_float; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_swap_columns';

function gsl_matrix_complex_float_swap_rowcol(m: Pgsl_matrix_complex_float; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_swap_rowcol';

function gsl_matrix_complex_float_transpose(m: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_transpose';

function gsl_matrix_complex_float_transpose_memcpy(dest: Pgsl_matrix_complex_float; src: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_transpose_memcpy';

function gsl_matrix_complex_float_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_complex_float; src: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_transpose_tricpy';

function gsl_matrix_complex_float_equal(a: Pgsl_matrix_complex_float; b: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_equal';

function gsl_matrix_complex_float_isnull(m: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_isnull';

function gsl_matrix_complex_float_ispos(m: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_ispos';

function gsl_matrix_complex_float_isneg(m: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_isneg';

function gsl_matrix_complex_float_isnonneg(m: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_isnonneg';

function gsl_matrix_complex_float_add(a: Pgsl_matrix_complex_float; b: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_add';

function gsl_matrix_complex_float_sub(a: Pgsl_matrix_complex_float; b: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_sub';

function gsl_matrix_complex_float_mul_elements(a: Pgsl_matrix_complex_float; b: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_mul_elements';

function gsl_matrix_complex_float_div_elements(a: Pgsl_matrix_complex_float; b: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_div_elements';

function gsl_matrix_complex_float_scale(a: Pgsl_matrix_complex_float; x: gsl_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_scale';

function gsl_matrix_complex_float_add_constant(a: Pgsl_matrix_complex_float; x: gsl_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_add_constant';

function gsl_matrix_complex_float_add_diagonal(a: Pgsl_matrix_complex_float; x: gsl_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_add_diagonal';

(***********************************************************************)
function gsl_matrix_complex_float_get_row(v: Pgsl_vector_complex_float; m: Pgsl_matrix_complex_float; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_get_row';

function gsl_matrix_complex_float_get_col(v: Pgsl_vector_complex_float; m: Pgsl_matrix_complex_float; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_get_col';

function gsl_matrix_complex_float_set_row(m: Pgsl_matrix_complex_float; i: NativeUInt; v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_set_row';

function gsl_matrix_complex_float_set_col(m: Pgsl_matrix_complex_float; j: NativeUInt; v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_set_col';

(***********************************************************************)
function gsl_matrix_complex_float_get(m: Pgsl_matrix_complex_float; i: NativeUInt; j: NativeUInt): gsl_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_get';

procedure gsl_matrix_complex_float_set(m: Pgsl_matrix_complex_float; i: NativeUInt; j: NativeUInt; x: gsl_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_set';

function gsl_matrix_complex_float_ptr(m: Pgsl_matrix_complex_float; i: NativeUInt; j: NativeUInt): Pgsl_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_ptr';

function gsl_matrix_complex_float_const_ptr(m: Pgsl_matrix_complex_float; i: NativeUInt; j: NativeUInt): Pgsl_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_complex_float_const_ptr';

function gsl_matrix_long_double_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_alloc';

function gsl_matrix_long_double_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_calloc';

function gsl_matrix_long_double_alloc_from_block(b: Pgsl_block_long_double; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_alloc_from_block';

function gsl_matrix_long_double_alloc_from_matrix(m: Pgsl_matrix_long_double; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_alloc_from_matrix';

function gsl_vector_long_double_alloc_row_from_matrix(m: Pgsl_matrix_long_double; i: NativeUInt): Pgsl_vector_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_alloc_row_from_matrix';

function gsl_vector_long_double_alloc_col_from_matrix(m: Pgsl_matrix_long_double; j: NativeUInt): Pgsl_vector_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_double_alloc_col_from_matrix';

procedure gsl_matrix_long_double_free(m: Pgsl_matrix_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_free';

function gsl_matrix_long_double_submatrix(m: Pgsl_matrix_long_double; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_submatrix';

function gsl_matrix_long_double_row(m: Pgsl_matrix_long_double; i: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_row';

function gsl_matrix_long_double_column(m: Pgsl_matrix_long_double; j: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_column';

function gsl_matrix_long_double_diagonal(m: Pgsl_matrix_long_double): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_diagonal';

function gsl_matrix_long_double_subdiagonal(m: Pgsl_matrix_long_double; k: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_subdiagonal';

function gsl_matrix_long_double_superdiagonal(m: Pgsl_matrix_long_double; k: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_superdiagonal';

function gsl_matrix_long_double_subrow(m: Pgsl_matrix_long_double; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_subrow';

function gsl_matrix_long_double_subcolumn(m: Pgsl_matrix_long_double; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_subcolumn';

function gsl_matrix_long_double_view_array(base: PExtended; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_view_array';

function gsl_matrix_long_double_view_array_with_tda(base: PExtended; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_view_array_with_tda';

function gsl_matrix_long_double_view_vector(v: Pgsl_vector_long_double; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_view_vector';

function gsl_matrix_long_double_view_vector_with_tda(v: Pgsl_vector_long_double; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_long_double_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_view_vector_with_tda';

function gsl_matrix_long_double_const_submatrix(m: Pgsl_matrix_long_double; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_submatrix';

function gsl_matrix_long_double_const_row(m: Pgsl_matrix_long_double; i: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_row';

function gsl_matrix_long_double_const_column(m: Pgsl_matrix_long_double; j: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_column';

function gsl_matrix_long_double_const_diagonal(m: Pgsl_matrix_long_double): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_diagonal';

function gsl_matrix_long_double_const_subdiagonal(m: Pgsl_matrix_long_double; k: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_subdiagonal';

function gsl_matrix_long_double_const_superdiagonal(m: Pgsl_matrix_long_double; k: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_superdiagonal';

function gsl_matrix_long_double_const_subrow(m: Pgsl_matrix_long_double; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_subrow';

function gsl_matrix_long_double_const_subcolumn(m: Pgsl_matrix_long_double; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_subcolumn';

function gsl_matrix_long_double_const_view_array(base: PExtended; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_view_array';

function gsl_matrix_long_double_const_view_array_with_tda(base: PExtended; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_view_array_with_tda';

function gsl_matrix_long_double_const_view_vector(v: Pgsl_vector_long_double; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_view_vector';

function gsl_matrix_long_double_const_view_vector_with_tda(v: Pgsl_vector_long_double; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_long_double_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_view_vector_with_tda';

procedure gsl_matrix_long_double_set_zero(m: Pgsl_matrix_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_set_zero';

procedure gsl_matrix_long_double_set_identity(m: Pgsl_matrix_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_set_identity';

procedure gsl_matrix_long_double_set_all(m: Pgsl_matrix_long_double; x: Extended); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_set_all';

function gsl_matrix_long_double_fread(stream: PPointer; m: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_fread';

function gsl_matrix_long_double_fwrite(stream: PPointer; m: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_fwrite';

function gsl_matrix_long_double_fscanf(stream: PPointer; m: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_fscanf';

function gsl_matrix_long_double_fprintf(stream: PPointer; m: Pgsl_matrix_long_double; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_fprintf';

function gsl_matrix_long_double_memcpy(dest: Pgsl_matrix_long_double; src: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_memcpy';

function gsl_matrix_long_double_swap(m1: Pgsl_matrix_long_double; m2: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_swap';

function gsl_matrix_long_double_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_long_double; src: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_tricpy';

function gsl_matrix_long_double_swap_rows(m: Pgsl_matrix_long_double; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_swap_rows';

function gsl_matrix_long_double_swap_columns(m: Pgsl_matrix_long_double; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_swap_columns';

function gsl_matrix_long_double_swap_rowcol(m: Pgsl_matrix_long_double; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_swap_rowcol';

function gsl_matrix_long_double_transpose(m: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_transpose';

function gsl_matrix_long_double_transpose_memcpy(dest: Pgsl_matrix_long_double; src: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_transpose_memcpy';

function gsl_matrix_long_double_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_long_double; src: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_transpose_tricpy';

function gsl_matrix_long_double_max(m: Pgsl_matrix_long_double): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_max';

function gsl_matrix_long_double_min(m: Pgsl_matrix_long_double): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_min';

procedure gsl_matrix_long_double_minmax(m: Pgsl_matrix_long_double; min_out: PExtended; max_out: PExtended); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_minmax';

procedure gsl_matrix_long_double_max_index(m: Pgsl_matrix_long_double; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_max_index';

procedure gsl_matrix_long_double_min_index(m: Pgsl_matrix_long_double; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_min_index';

procedure gsl_matrix_long_double_minmax_index(m: Pgsl_matrix_long_double; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_minmax_index';

function gsl_matrix_long_double_equal(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_equal';

function gsl_matrix_long_double_isnull(m: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_isnull';

function gsl_matrix_long_double_ispos(m: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_ispos';

function gsl_matrix_long_double_isneg(m: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_isneg';

function gsl_matrix_long_double_isnonneg(m: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_isnonneg';

function gsl_matrix_long_double_add(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_add';

function gsl_matrix_long_double_sub(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_sub';

function gsl_matrix_long_double_mul_elements(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_mul_elements';

function gsl_matrix_long_double_div_elements(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_div_elements';

function gsl_matrix_long_double_scale(a: Pgsl_matrix_long_double; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_scale';

function gsl_matrix_long_double_add_constant(a: Pgsl_matrix_long_double; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_add_constant';

function gsl_matrix_long_double_add_diagonal(a: Pgsl_matrix_long_double; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_add_diagonal';

(***********************************************************************)
function gsl_matrix_long_double_get_row(v: Pgsl_vector_long_double; m: Pgsl_matrix_long_double; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_get_row';

function gsl_matrix_long_double_get_col(v: Pgsl_vector_long_double; m: Pgsl_matrix_long_double; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_get_col';

function gsl_matrix_long_double_set_row(m: Pgsl_matrix_long_double; i: NativeUInt; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_set_row';

function gsl_matrix_long_double_set_col(m: Pgsl_matrix_long_double; j: NativeUInt; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_set_col';

(***********************************************************************)
function gsl_matrix_long_double_get(m: Pgsl_matrix_long_double; i: NativeUInt; j: NativeUInt): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_get';

procedure gsl_matrix_long_double_set(m: Pgsl_matrix_long_double; i: NativeUInt; j: NativeUInt; x: Extended); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_set';

function gsl_matrix_long_double_ptr(m: Pgsl_matrix_long_double; i: NativeUInt; j: NativeUInt): PExtended; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_ptr';

function gsl_matrix_long_double_const_ptr(m: Pgsl_matrix_long_double; i: NativeUInt; j: NativeUInt): PExtended; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_double_const_ptr';

function gsl_matrix_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_alloc';

function gsl_matrix_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_calloc';

function gsl_matrix_alloc_from_block(b: Pgsl_block; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_alloc_from_block';

function gsl_matrix_alloc_from_matrix(m: Pgsl_matrix; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_alloc_from_matrix';

function gsl_vector_alloc_row_from_matrix(m: Pgsl_matrix; i: NativeUInt): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_vector_alloc_row_from_matrix';

function gsl_vector_alloc_col_from_matrix(m: Pgsl_matrix; j: NativeUInt): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_vector_alloc_col_from_matrix';

procedure gsl_matrix_free(m: Pgsl_matrix); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_free';

function gsl_matrix_submatrix(m: Pgsl_matrix; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_submatrix';

function gsl_matrix_row(m: Pgsl_matrix; i: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_row';

function gsl_matrix_column(m: Pgsl_matrix; j: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_column';

function gsl_matrix_diagonal(m: Pgsl_matrix): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_diagonal';

function gsl_matrix_subdiagonal(m: Pgsl_matrix; k: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_subdiagonal';

function gsl_matrix_superdiagonal(m: Pgsl_matrix; k: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_superdiagonal';

function gsl_matrix_subrow(m: Pgsl_matrix; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_subrow';

function gsl_matrix_subcolumn(m: Pgsl_matrix; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_subcolumn';

function gsl_matrix_view_array(base: PDouble; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_view_array';

function gsl_matrix_view_array_with_tda(base: PDouble; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_view_array_with_tda';

function gsl_matrix_view_vector(v: Pgsl_vector; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_view_vector';

function gsl_matrix_view_vector_with_tda(v: Pgsl_vector; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_view_vector_with_tda';

function gsl_matrix_const_submatrix(m: Pgsl_matrix; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_submatrix';

function gsl_matrix_const_row(m: Pgsl_matrix; i: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_row';

function gsl_matrix_const_column(m: Pgsl_matrix; j: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_column';

function gsl_matrix_const_diagonal(m: Pgsl_matrix): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_diagonal';

function gsl_matrix_const_subdiagonal(m: Pgsl_matrix; k: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_subdiagonal';

function gsl_matrix_const_superdiagonal(m: Pgsl_matrix; k: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_superdiagonal';

function gsl_matrix_const_subrow(m: Pgsl_matrix; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_subrow';

function gsl_matrix_const_subcolumn(m: Pgsl_matrix; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_subcolumn';

function gsl_matrix_const_view_array(base: PDouble; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_view_array';

function gsl_matrix_const_view_array_with_tda(base: PDouble; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_view_array_with_tda';

function gsl_matrix_const_view_vector(v: Pgsl_vector; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_view_vector';

function gsl_matrix_const_view_vector_with_tda(v: Pgsl_vector; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_view_vector_with_tda';

procedure gsl_matrix_set_zero(m: Pgsl_matrix); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_set_zero';

procedure gsl_matrix_set_identity(m: Pgsl_matrix); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_set_identity';

procedure gsl_matrix_set_all(m: Pgsl_matrix; x: Double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_set_all';

function gsl_matrix_fread(stream: PPointer; m: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_fread';

function gsl_matrix_fwrite(stream: PPointer; m: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_fwrite';

function gsl_matrix_fscanf(stream: PPointer; m: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_fscanf';

function gsl_matrix_fprintf(stream: PPointer; m: Pgsl_matrix; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_fprintf';

function gsl_matrix_memcpy(dest: Pgsl_matrix; src: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_memcpy';

function gsl_matrix_swap(m1: Pgsl_matrix; m2: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_swap';

function gsl_matrix_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix; src: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_tricpy';

function gsl_matrix_swap_rows(m: Pgsl_matrix; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_swap_rows';

function gsl_matrix_swap_columns(m: Pgsl_matrix; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_swap_columns';

function gsl_matrix_swap_rowcol(m: Pgsl_matrix; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_swap_rowcol';

function gsl_matrix_transpose(m: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_transpose';

function gsl_matrix_transpose_memcpy(dest: Pgsl_matrix; src: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_transpose_memcpy';

function gsl_matrix_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix; src: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_transpose_tricpy';

function gsl_matrix_max(m: Pgsl_matrix): Double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_max';

function gsl_matrix_min(m: Pgsl_matrix): Double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_min';

procedure gsl_matrix_minmax(m: Pgsl_matrix; min_out: PDouble; max_out: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_minmax';

procedure gsl_matrix_max_index(m: Pgsl_matrix; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_max_index';

procedure gsl_matrix_min_index(m: Pgsl_matrix; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_min_index';

procedure gsl_matrix_minmax_index(m: Pgsl_matrix; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_minmax_index';

function gsl_matrix_equal(a: Pgsl_matrix; b: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_equal';

function gsl_matrix_isnull(m: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_isnull';

function gsl_matrix_ispos(m: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ispos';

function gsl_matrix_isneg(m: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_isneg';

function gsl_matrix_isnonneg(m: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_isnonneg';

function gsl_matrix_add(a: Pgsl_matrix; b: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_add';

function gsl_matrix_sub(a: Pgsl_matrix; b: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_sub';

function gsl_matrix_mul_elements(a: Pgsl_matrix; b: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_mul_elements';

function gsl_matrix_div_elements(a: Pgsl_matrix; b: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_div_elements';

function gsl_matrix_scale(a: Pgsl_matrix; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_scale';

function gsl_matrix_add_constant(a: Pgsl_matrix; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_add_constant';

function gsl_matrix_add_diagonal(a: Pgsl_matrix; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_add_diagonal';

(***********************************************************************)
function gsl_matrix_get_row(v: Pgsl_vector; m: Pgsl_matrix; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_get_row';

function gsl_matrix_get_col(v: Pgsl_vector; m: Pgsl_matrix; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_get_col';

function gsl_matrix_set_row(m: Pgsl_matrix; i: NativeUInt; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_set_row';

function gsl_matrix_set_col(m: Pgsl_matrix; j: NativeUInt; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_set_col';

(***********************************************************************)
function gsl_matrix_get(m: Pgsl_matrix; i: NativeUInt; j: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_get';

procedure gsl_matrix_set(m: Pgsl_matrix; i: NativeUInt; j: NativeUInt; x: Double); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_set';

function gsl_matrix_ptr(m: Pgsl_matrix; i: NativeUInt; j: NativeUInt): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ptr';

function gsl_matrix_const_ptr(m: Pgsl_matrix; i: NativeUInt; j: NativeUInt): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_const_ptr';

function gsl_matrix_float_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_alloc';

function gsl_matrix_float_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_calloc';

function gsl_matrix_float_alloc_from_block(b: Pgsl_block_float; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_alloc_from_block';

function gsl_matrix_float_alloc_from_matrix(m: Pgsl_matrix_float; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_alloc_from_matrix';

function gsl_vector_float_alloc_row_from_matrix(m: Pgsl_matrix_float; i: NativeUInt): Pgsl_vector_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_alloc_row_from_matrix';

function gsl_vector_float_alloc_col_from_matrix(m: Pgsl_matrix_float; j: NativeUInt): Pgsl_vector_float; cdecl;
  external LIBGSL name _PU + 'gsl_vector_float_alloc_col_from_matrix';

procedure gsl_matrix_float_free(m: Pgsl_matrix_float); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_free';

function gsl_matrix_float_submatrix(m: Pgsl_matrix_float; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_submatrix';

function gsl_matrix_float_row(m: Pgsl_matrix_float; i: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_row';

function gsl_matrix_float_column(m: Pgsl_matrix_float; j: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_column';

function gsl_matrix_float_diagonal(m: Pgsl_matrix_float): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_diagonal';

function gsl_matrix_float_subdiagonal(m: Pgsl_matrix_float; k: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_subdiagonal';

function gsl_matrix_float_superdiagonal(m: Pgsl_matrix_float; k: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_superdiagonal';

function gsl_matrix_float_subrow(m: Pgsl_matrix_float; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_subrow';

function gsl_matrix_float_subcolumn(m: Pgsl_matrix_float; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_subcolumn';

function gsl_matrix_float_view_array(base: PSingle; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_view_array';

function gsl_matrix_float_view_array_with_tda(base: PSingle; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_view_array_with_tda';

function gsl_matrix_float_view_vector(v: Pgsl_vector_float; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_view_vector';

function gsl_matrix_float_view_vector_with_tda(v: Pgsl_vector_float; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_float_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_view_vector_with_tda';

function gsl_matrix_float_const_submatrix(m: Pgsl_matrix_float; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_submatrix';

function gsl_matrix_float_const_row(m: Pgsl_matrix_float; i: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_row';

function gsl_matrix_float_const_column(m: Pgsl_matrix_float; j: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_column';

function gsl_matrix_float_const_diagonal(m: Pgsl_matrix_float): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_diagonal';

function gsl_matrix_float_const_subdiagonal(m: Pgsl_matrix_float; k: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_subdiagonal';

function gsl_matrix_float_const_superdiagonal(m: Pgsl_matrix_float; k: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_superdiagonal';

function gsl_matrix_float_const_subrow(m: Pgsl_matrix_float; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_subrow';

function gsl_matrix_float_const_subcolumn(m: Pgsl_matrix_float; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_subcolumn';

function gsl_matrix_float_const_view_array(base: PSingle; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_view_array';

function gsl_matrix_float_const_view_array_with_tda(base: PSingle; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_view_array_with_tda';

function gsl_matrix_float_const_view_vector(v: Pgsl_vector_float; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_view_vector';

function gsl_matrix_float_const_view_vector_with_tda(v: Pgsl_vector_float; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_float_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_view_vector_with_tda';

procedure gsl_matrix_float_set_zero(m: Pgsl_matrix_float); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_set_zero';

procedure gsl_matrix_float_set_identity(m: Pgsl_matrix_float); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_set_identity';

procedure gsl_matrix_float_set_all(m: Pgsl_matrix_float; x: Single); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_set_all';

function gsl_matrix_float_fread(stream: PPointer; m: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_fread';

function gsl_matrix_float_fwrite(stream: PPointer; m: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_fwrite';

function gsl_matrix_float_fscanf(stream: PPointer; m: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_fscanf';

function gsl_matrix_float_fprintf(stream: PPointer; m: Pgsl_matrix_float; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_fprintf';

function gsl_matrix_float_memcpy(dest: Pgsl_matrix_float; src: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_memcpy';

function gsl_matrix_float_swap(m1: Pgsl_matrix_float; m2: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_swap';

function gsl_matrix_float_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_float; src: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_tricpy';

function gsl_matrix_float_swap_rows(m: Pgsl_matrix_float; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_swap_rows';

function gsl_matrix_float_swap_columns(m: Pgsl_matrix_float; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_swap_columns';

function gsl_matrix_float_swap_rowcol(m: Pgsl_matrix_float; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_swap_rowcol';

function gsl_matrix_float_transpose(m: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_transpose';

function gsl_matrix_float_transpose_memcpy(dest: Pgsl_matrix_float; src: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_transpose_memcpy';

function gsl_matrix_float_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_float; src: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_transpose_tricpy';

function gsl_matrix_float_max(m: Pgsl_matrix_float): Single; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_max';

function gsl_matrix_float_min(m: Pgsl_matrix_float): Single; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_min';

procedure gsl_matrix_float_minmax(m: Pgsl_matrix_float; min_out: PSingle; max_out: PSingle); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_minmax';

procedure gsl_matrix_float_max_index(m: Pgsl_matrix_float; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_max_index';

procedure gsl_matrix_float_min_index(m: Pgsl_matrix_float; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_min_index';

procedure gsl_matrix_float_minmax_index(m: Pgsl_matrix_float; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_minmax_index';

function gsl_matrix_float_equal(a: Pgsl_matrix_float; b: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_equal';

function gsl_matrix_float_isnull(m: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_isnull';

function gsl_matrix_float_ispos(m: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_ispos';

function gsl_matrix_float_isneg(m: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_isneg';

function gsl_matrix_float_isnonneg(m: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_isnonneg';

function gsl_matrix_float_add(a: Pgsl_matrix_float; b: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_add';

function gsl_matrix_float_sub(a: Pgsl_matrix_float; b: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_sub';

function gsl_matrix_float_mul_elements(a: Pgsl_matrix_float; b: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_mul_elements';

function gsl_matrix_float_div_elements(a: Pgsl_matrix_float; b: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_div_elements';

function gsl_matrix_float_scale(a: Pgsl_matrix_float; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_scale';

function gsl_matrix_float_add_constant(a: Pgsl_matrix_float; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_add_constant';

function gsl_matrix_float_add_diagonal(a: Pgsl_matrix_float; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_add_diagonal';

(***********************************************************************)
function gsl_matrix_float_get_row(v: Pgsl_vector_float; m: Pgsl_matrix_float; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_get_row';

function gsl_matrix_float_get_col(v: Pgsl_vector_float; m: Pgsl_matrix_float; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_get_col';

function gsl_matrix_float_set_row(m: Pgsl_matrix_float; i: NativeUInt; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_set_row';

function gsl_matrix_float_set_col(m: Pgsl_matrix_float; j: NativeUInt; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_set_col';

(***********************************************************************)
function gsl_matrix_float_get(m: Pgsl_matrix_float; i: NativeUInt; j: NativeUInt): Single; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_get';

procedure gsl_matrix_float_set(m: Pgsl_matrix_float; i: NativeUInt; j: NativeUInt; x: Single); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_set';

function gsl_matrix_float_ptr(m: Pgsl_matrix_float; i: NativeUInt; j: NativeUInt): PSingle; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_ptr';

function gsl_matrix_float_const_ptr(m: Pgsl_matrix_float; i: NativeUInt; j: NativeUInt): PSingle; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_float_const_ptr';

function gsl_matrix_ulong_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_alloc';

function gsl_matrix_ulong_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_calloc';

function gsl_matrix_ulong_alloc_from_block(b: Pgsl_block_ulong; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_alloc_from_block';

function gsl_matrix_ulong_alloc_from_matrix(m: Pgsl_matrix_ulong; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_alloc_from_matrix';

function gsl_vector_ulong_alloc_row_from_matrix(m: Pgsl_matrix_ulong; i: NativeUInt): Pgsl_vector_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_alloc_row_from_matrix';

function gsl_vector_ulong_alloc_col_from_matrix(m: Pgsl_matrix_ulong; j: NativeUInt): Pgsl_vector_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ulong_alloc_col_from_matrix';

procedure gsl_matrix_ulong_free(m: Pgsl_matrix_ulong); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_free';

function gsl_matrix_ulong_submatrix(m: Pgsl_matrix_ulong; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_submatrix';

function gsl_matrix_ulong_row(m: Pgsl_matrix_ulong; i: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_row';

function gsl_matrix_ulong_column(m: Pgsl_matrix_ulong; j: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_column';

function gsl_matrix_ulong_diagonal(m: Pgsl_matrix_ulong): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_diagonal';

function gsl_matrix_ulong_subdiagonal(m: Pgsl_matrix_ulong; k: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_subdiagonal';

function gsl_matrix_ulong_superdiagonal(m: Pgsl_matrix_ulong; k: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_superdiagonal';

function gsl_matrix_ulong_subrow(m: Pgsl_matrix_ulong; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_subrow';

function gsl_matrix_ulong_subcolumn(m: Pgsl_matrix_ulong; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_subcolumn';

function gsl_matrix_ulong_view_array(base: PCardinal; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_view_array';

function gsl_matrix_ulong_view_array_with_tda(base: PCardinal; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_view_array_with_tda';

function gsl_matrix_ulong_view_vector(v: Pgsl_vector_ulong; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_view_vector';

function gsl_matrix_ulong_view_vector_with_tda(v: Pgsl_vector_ulong; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_ulong_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_view_vector_with_tda';

function gsl_matrix_ulong_const_submatrix(m: Pgsl_matrix_ulong; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_submatrix';

function gsl_matrix_ulong_const_row(m: Pgsl_matrix_ulong; i: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_row';

function gsl_matrix_ulong_const_column(m: Pgsl_matrix_ulong; j: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_column';

function gsl_matrix_ulong_const_diagonal(m: Pgsl_matrix_ulong): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_diagonal';

function gsl_matrix_ulong_const_subdiagonal(m: Pgsl_matrix_ulong; k: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_subdiagonal';

function gsl_matrix_ulong_const_superdiagonal(m: Pgsl_matrix_ulong; k: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_superdiagonal';

function gsl_matrix_ulong_const_subrow(m: Pgsl_matrix_ulong; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_subrow';

function gsl_matrix_ulong_const_subcolumn(m: Pgsl_matrix_ulong; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_subcolumn';

function gsl_matrix_ulong_const_view_array(base: PCardinal; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_view_array';

function gsl_matrix_ulong_const_view_array_with_tda(base: PCardinal; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_view_array_with_tda';

function gsl_matrix_ulong_const_view_vector(v: Pgsl_vector_ulong; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_view_vector';

function gsl_matrix_ulong_const_view_vector_with_tda(v: Pgsl_vector_ulong; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_ulong_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_view_vector_with_tda';

procedure gsl_matrix_ulong_set_zero(m: Pgsl_matrix_ulong); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_set_zero';

procedure gsl_matrix_ulong_set_identity(m: Pgsl_matrix_ulong); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_set_identity';

procedure gsl_matrix_ulong_set_all(m: Pgsl_matrix_ulong; x: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_set_all';

function gsl_matrix_ulong_fread(stream: PPointer; m: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_fread';

function gsl_matrix_ulong_fwrite(stream: PPointer; m: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_fwrite';

function gsl_matrix_ulong_fscanf(stream: PPointer; m: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_fscanf';

function gsl_matrix_ulong_fprintf(stream: PPointer; m: Pgsl_matrix_ulong; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_fprintf';

function gsl_matrix_ulong_memcpy(dest: Pgsl_matrix_ulong; src: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_memcpy';

function gsl_matrix_ulong_swap(m1: Pgsl_matrix_ulong; m2: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_swap';

function gsl_matrix_ulong_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_ulong; src: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_tricpy';

function gsl_matrix_ulong_swap_rows(m: Pgsl_matrix_ulong; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_swap_rows';

function gsl_matrix_ulong_swap_columns(m: Pgsl_matrix_ulong; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_swap_columns';

function gsl_matrix_ulong_swap_rowcol(m: Pgsl_matrix_ulong; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_swap_rowcol';

function gsl_matrix_ulong_transpose(m: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_transpose';

function gsl_matrix_ulong_transpose_memcpy(dest: Pgsl_matrix_ulong; src: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_transpose_memcpy';

function gsl_matrix_ulong_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_ulong; src: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_transpose_tricpy';

function gsl_matrix_ulong_max(m: Pgsl_matrix_ulong): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_max';

function gsl_matrix_ulong_min(m: Pgsl_matrix_ulong): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_min';

procedure gsl_matrix_ulong_minmax(m: Pgsl_matrix_ulong; min_out: PCardinal; max_out: PCardinal); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_minmax';

procedure gsl_matrix_ulong_max_index(m: Pgsl_matrix_ulong; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_max_index';

procedure gsl_matrix_ulong_min_index(m: Pgsl_matrix_ulong; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_min_index';

procedure gsl_matrix_ulong_minmax_index(m: Pgsl_matrix_ulong; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_minmax_index';

function gsl_matrix_ulong_equal(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_equal';

function gsl_matrix_ulong_isnull(m: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_isnull';

function gsl_matrix_ulong_ispos(m: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_ispos';

function gsl_matrix_ulong_isneg(m: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_isneg';

function gsl_matrix_ulong_isnonneg(m: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_isnonneg';

function gsl_matrix_ulong_add(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_add';

function gsl_matrix_ulong_sub(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_sub';

function gsl_matrix_ulong_mul_elements(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_mul_elements';

function gsl_matrix_ulong_div_elements(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_div_elements';

function gsl_matrix_ulong_scale(a: Pgsl_matrix_ulong; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_scale';

function gsl_matrix_ulong_add_constant(a: Pgsl_matrix_ulong; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_add_constant';

function gsl_matrix_ulong_add_diagonal(a: Pgsl_matrix_ulong; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_add_diagonal';

(***********************************************************************)
function gsl_matrix_ulong_get_row(v: Pgsl_vector_ulong; m: Pgsl_matrix_ulong; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_get_row';

function gsl_matrix_ulong_get_col(v: Pgsl_vector_ulong; m: Pgsl_matrix_ulong; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_get_col';

function gsl_matrix_ulong_set_row(m: Pgsl_matrix_ulong; i: NativeUInt; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_set_row';

function gsl_matrix_ulong_set_col(m: Pgsl_matrix_ulong; j: NativeUInt; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_set_col';

(***********************************************************************)
function gsl_matrix_ulong_get(m: Pgsl_matrix_ulong; i: NativeUInt; j: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_get';

procedure gsl_matrix_ulong_set(m: Pgsl_matrix_ulong; i: NativeUInt; j: NativeUInt; x: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_set';

function gsl_matrix_ulong_ptr(m: Pgsl_matrix_ulong; i: NativeUInt; j: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_ptr';

function gsl_matrix_ulong_const_ptr(m: Pgsl_matrix_ulong; i: NativeUInt; j: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ulong_const_ptr';

function gsl_matrix_long_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_alloc';

function gsl_matrix_long_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_calloc';

function gsl_matrix_long_alloc_from_block(b: Pgsl_block_long; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_alloc_from_block';

function gsl_matrix_long_alloc_from_matrix(m: Pgsl_matrix_long; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_alloc_from_matrix';

function gsl_vector_long_alloc_row_from_matrix(m: Pgsl_matrix_long; i: NativeUInt): Pgsl_vector_long; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_alloc_row_from_matrix';

function gsl_vector_long_alloc_col_from_matrix(m: Pgsl_matrix_long; j: NativeUInt): Pgsl_vector_long; cdecl;
  external LIBGSL name _PU + 'gsl_vector_long_alloc_col_from_matrix';

procedure gsl_matrix_long_free(m: Pgsl_matrix_long); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_free';

function gsl_matrix_long_submatrix(m: Pgsl_matrix_long; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_submatrix';

function gsl_matrix_long_row(m: Pgsl_matrix_long; i: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_row';

function gsl_matrix_long_column(m: Pgsl_matrix_long; j: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_column';

function gsl_matrix_long_diagonal(m: Pgsl_matrix_long): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_diagonal';

function gsl_matrix_long_subdiagonal(m: Pgsl_matrix_long; k: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_subdiagonal';

function gsl_matrix_long_superdiagonal(m: Pgsl_matrix_long; k: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_superdiagonal';

function gsl_matrix_long_subrow(m: Pgsl_matrix_long; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_subrow';

function gsl_matrix_long_subcolumn(m: Pgsl_matrix_long; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_subcolumn';

function gsl_matrix_long_view_array(base: PInteger; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_view_array';

function gsl_matrix_long_view_array_with_tda(base: PInteger; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_view_array_with_tda';

function gsl_matrix_long_view_vector(v: Pgsl_vector_long; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_view_vector';

function gsl_matrix_long_view_vector_with_tda(v: Pgsl_vector_long; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_long_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_view_vector_with_tda';

function gsl_matrix_long_const_submatrix(m: Pgsl_matrix_long; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_submatrix';

function gsl_matrix_long_const_row(m: Pgsl_matrix_long; i: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_row';

function gsl_matrix_long_const_column(m: Pgsl_matrix_long; j: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_column';

function gsl_matrix_long_const_diagonal(m: Pgsl_matrix_long): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_diagonal';

function gsl_matrix_long_const_subdiagonal(m: Pgsl_matrix_long; k: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_subdiagonal';

function gsl_matrix_long_const_superdiagonal(m: Pgsl_matrix_long; k: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_superdiagonal';

function gsl_matrix_long_const_subrow(m: Pgsl_matrix_long; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_subrow';

function gsl_matrix_long_const_subcolumn(m: Pgsl_matrix_long; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_subcolumn';

function gsl_matrix_long_const_view_array(base: PInteger; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_view_array';

function gsl_matrix_long_const_view_array_with_tda(base: PInteger; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_view_array_with_tda';

function gsl_matrix_long_const_view_vector(v: Pgsl_vector_long; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_view_vector';

function gsl_matrix_long_const_view_vector_with_tda(v: Pgsl_vector_long; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_long_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_view_vector_with_tda';

procedure gsl_matrix_long_set_zero(m: Pgsl_matrix_long); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_set_zero';

procedure gsl_matrix_long_set_identity(m: Pgsl_matrix_long); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_set_identity';

procedure gsl_matrix_long_set_all(m: Pgsl_matrix_long; x: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_set_all';

function gsl_matrix_long_fread(stream: PPointer; m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_fread';

function gsl_matrix_long_fwrite(stream: PPointer; m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_fwrite';

function gsl_matrix_long_fscanf(stream: PPointer; m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_fscanf';

function gsl_matrix_long_fprintf(stream: PPointer; m: Pgsl_matrix_long; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_fprintf';

function gsl_matrix_long_memcpy(dest: Pgsl_matrix_long; src: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_memcpy';

function gsl_matrix_long_swap(m1: Pgsl_matrix_long; m2: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_swap';

function gsl_matrix_long_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_long; src: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_tricpy';

function gsl_matrix_long_swap_rows(m: Pgsl_matrix_long; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_swap_rows';

function gsl_matrix_long_swap_columns(m: Pgsl_matrix_long; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_swap_columns';

function gsl_matrix_long_swap_rowcol(m: Pgsl_matrix_long; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_swap_rowcol';

function gsl_matrix_long_transpose(m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_transpose';

function gsl_matrix_long_transpose_memcpy(dest: Pgsl_matrix_long; src: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_transpose_memcpy';

function gsl_matrix_long_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_long; src: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_transpose_tricpy';

function gsl_matrix_long_max(m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_max';

function gsl_matrix_long_min(m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_min';

procedure gsl_matrix_long_minmax(m: Pgsl_matrix_long; min_out: PInteger; max_out: PInteger); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_minmax';

procedure gsl_matrix_long_max_index(m: Pgsl_matrix_long; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_max_index';

procedure gsl_matrix_long_min_index(m: Pgsl_matrix_long; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_min_index';

procedure gsl_matrix_long_minmax_index(m: Pgsl_matrix_long; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_minmax_index';

function gsl_matrix_long_equal(a: Pgsl_matrix_long; b: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_equal';

function gsl_matrix_long_isnull(m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_isnull';

function gsl_matrix_long_ispos(m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_ispos';

function gsl_matrix_long_isneg(m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_isneg';

function gsl_matrix_long_isnonneg(m: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_isnonneg';

function gsl_matrix_long_add(a: Pgsl_matrix_long; b: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_add';

function gsl_matrix_long_sub(a: Pgsl_matrix_long; b: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_sub';

function gsl_matrix_long_mul_elements(a: Pgsl_matrix_long; b: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_mul_elements';

function gsl_matrix_long_div_elements(a: Pgsl_matrix_long; b: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_div_elements';

function gsl_matrix_long_scale(a: Pgsl_matrix_long; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_scale';

function gsl_matrix_long_add_constant(a: Pgsl_matrix_long; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_add_constant';

function gsl_matrix_long_add_diagonal(a: Pgsl_matrix_long; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_add_diagonal';

(***********************************************************************)
function gsl_matrix_long_get_row(v: Pgsl_vector_long; m: Pgsl_matrix_long; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_get_row';

function gsl_matrix_long_get_col(v: Pgsl_vector_long; m: Pgsl_matrix_long; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_get_col';

function gsl_matrix_long_set_row(m: Pgsl_matrix_long; i: NativeUInt; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_set_row';

function gsl_matrix_long_set_col(m: Pgsl_matrix_long; j: NativeUInt; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_set_col';

(***********************************************************************)
function gsl_matrix_long_get(m: Pgsl_matrix_long; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_get';

procedure gsl_matrix_long_set(m: Pgsl_matrix_long; i: NativeUInt; j: NativeUInt; x: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_set';

function gsl_matrix_long_ptr(m: Pgsl_matrix_long; i: NativeUInt; j: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_ptr';

function gsl_matrix_long_const_ptr(m: Pgsl_matrix_long; i: NativeUInt; j: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_long_const_ptr';

function gsl_matrix_uint_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_alloc';

function gsl_matrix_uint_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_calloc';

function gsl_matrix_uint_alloc_from_block(b: Pgsl_block_uint; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_alloc_from_block';

function gsl_matrix_uint_alloc_from_matrix(m: Pgsl_matrix_uint; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_alloc_from_matrix';

function gsl_vector_uint_alloc_row_from_matrix(m: Pgsl_matrix_uint; i: NativeUInt): Pgsl_vector_uint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_alloc_row_from_matrix';

function gsl_vector_uint_alloc_col_from_matrix(m: Pgsl_matrix_uint; j: NativeUInt): Pgsl_vector_uint; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uint_alloc_col_from_matrix';

procedure gsl_matrix_uint_free(m: Pgsl_matrix_uint); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_free';

function gsl_matrix_uint_submatrix(m: Pgsl_matrix_uint; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_submatrix';

function gsl_matrix_uint_row(m: Pgsl_matrix_uint; i: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_row';

function gsl_matrix_uint_column(m: Pgsl_matrix_uint; j: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_column';

function gsl_matrix_uint_diagonal(m: Pgsl_matrix_uint): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_diagonal';

function gsl_matrix_uint_subdiagonal(m: Pgsl_matrix_uint; k: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_subdiagonal';

function gsl_matrix_uint_superdiagonal(m: Pgsl_matrix_uint; k: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_superdiagonal';

function gsl_matrix_uint_subrow(m: Pgsl_matrix_uint; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_subrow';

function gsl_matrix_uint_subcolumn(m: Pgsl_matrix_uint; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_subcolumn';

function gsl_matrix_uint_view_array(base: PCardinal; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_view_array';

function gsl_matrix_uint_view_array_with_tda(base: PCardinal; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_view_array_with_tda';

function gsl_matrix_uint_view_vector(v: Pgsl_vector_uint; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_view_vector';

function gsl_matrix_uint_view_vector_with_tda(v: Pgsl_vector_uint; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_uint_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_view_vector_with_tda';

function gsl_matrix_uint_const_submatrix(m: Pgsl_matrix_uint; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_submatrix';

function gsl_matrix_uint_const_row(m: Pgsl_matrix_uint; i: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_row';

function gsl_matrix_uint_const_column(m: Pgsl_matrix_uint; j: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_column';

function gsl_matrix_uint_const_diagonal(m: Pgsl_matrix_uint): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_diagonal';

function gsl_matrix_uint_const_subdiagonal(m: Pgsl_matrix_uint; k: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_subdiagonal';

function gsl_matrix_uint_const_superdiagonal(m: Pgsl_matrix_uint; k: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_superdiagonal';

function gsl_matrix_uint_const_subrow(m: Pgsl_matrix_uint; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_subrow';

function gsl_matrix_uint_const_subcolumn(m: Pgsl_matrix_uint; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_subcolumn';

function gsl_matrix_uint_const_view_array(base: PCardinal; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_view_array';

function gsl_matrix_uint_const_view_array_with_tda(base: PCardinal; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_view_array_with_tda';

function gsl_matrix_uint_const_view_vector(v: Pgsl_vector_uint; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_view_vector';

function gsl_matrix_uint_const_view_vector_with_tda(v: Pgsl_vector_uint; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_uint_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_view_vector_with_tda';

procedure gsl_matrix_uint_set_zero(m: Pgsl_matrix_uint); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_set_zero';

procedure gsl_matrix_uint_set_identity(m: Pgsl_matrix_uint); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_set_identity';

procedure gsl_matrix_uint_set_all(m: Pgsl_matrix_uint; x: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_set_all';

function gsl_matrix_uint_fread(stream: PPointer; m: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_fread';

function gsl_matrix_uint_fwrite(stream: PPointer; m: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_fwrite';

function gsl_matrix_uint_fscanf(stream: PPointer; m: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_fscanf';

function gsl_matrix_uint_fprintf(stream: PPointer; m: Pgsl_matrix_uint; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_fprintf';

function gsl_matrix_uint_memcpy(dest: Pgsl_matrix_uint; src: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_memcpy';

function gsl_matrix_uint_swap(m1: Pgsl_matrix_uint; m2: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_swap';

function gsl_matrix_uint_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_uint; src: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_tricpy';

function gsl_matrix_uint_swap_rows(m: Pgsl_matrix_uint; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_swap_rows';

function gsl_matrix_uint_swap_columns(m: Pgsl_matrix_uint; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_swap_columns';

function gsl_matrix_uint_swap_rowcol(m: Pgsl_matrix_uint; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_swap_rowcol';

function gsl_matrix_uint_transpose(m: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_transpose';

function gsl_matrix_uint_transpose_memcpy(dest: Pgsl_matrix_uint; src: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_transpose_memcpy';

function gsl_matrix_uint_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_uint; src: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_transpose_tricpy';

function gsl_matrix_uint_max(m: Pgsl_matrix_uint): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_max';

function gsl_matrix_uint_min(m: Pgsl_matrix_uint): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_min';

procedure gsl_matrix_uint_minmax(m: Pgsl_matrix_uint; min_out: PCardinal; max_out: PCardinal); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_minmax';

procedure gsl_matrix_uint_max_index(m: Pgsl_matrix_uint; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_max_index';

procedure gsl_matrix_uint_min_index(m: Pgsl_matrix_uint; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_min_index';

procedure gsl_matrix_uint_minmax_index(m: Pgsl_matrix_uint; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_minmax_index';

function gsl_matrix_uint_equal(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_equal';

function gsl_matrix_uint_isnull(m: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_isnull';

function gsl_matrix_uint_ispos(m: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_ispos';

function gsl_matrix_uint_isneg(m: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_isneg';

function gsl_matrix_uint_isnonneg(m: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_isnonneg';

function gsl_matrix_uint_add(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_add';

function gsl_matrix_uint_sub(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_sub';

function gsl_matrix_uint_mul_elements(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_mul_elements';

function gsl_matrix_uint_div_elements(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_div_elements';

function gsl_matrix_uint_scale(a: Pgsl_matrix_uint; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_scale';

function gsl_matrix_uint_add_constant(a: Pgsl_matrix_uint; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_add_constant';

function gsl_matrix_uint_add_diagonal(a: Pgsl_matrix_uint; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_add_diagonal';

(***********************************************************************)
function gsl_matrix_uint_get_row(v: Pgsl_vector_uint; m: Pgsl_matrix_uint; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_get_row';

function gsl_matrix_uint_get_col(v: Pgsl_vector_uint; m: Pgsl_matrix_uint; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_get_col';

function gsl_matrix_uint_set_row(m: Pgsl_matrix_uint; i: NativeUInt; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_set_row';

function gsl_matrix_uint_set_col(m: Pgsl_matrix_uint; j: NativeUInt; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_set_col';

(***********************************************************************)
function gsl_matrix_uint_get(m: Pgsl_matrix_uint; i: NativeUInt; j: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_get';

procedure gsl_matrix_uint_set(m: Pgsl_matrix_uint; i: NativeUInt; j: NativeUInt; x: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_set';

function gsl_matrix_uint_ptr(m: Pgsl_matrix_uint; i: NativeUInt; j: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_ptr';

function gsl_matrix_uint_const_ptr(m: Pgsl_matrix_uint; i: NativeUInt; j: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uint_const_ptr';

function gsl_matrix_int_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_alloc';

function gsl_matrix_int_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_calloc';

function gsl_matrix_int_alloc_from_block(b: Pgsl_block_int; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_alloc_from_block';

function gsl_matrix_int_alloc_from_matrix(m: Pgsl_matrix_int; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_alloc_from_matrix';

function gsl_vector_int_alloc_row_from_matrix(m: Pgsl_matrix_int; i: NativeUInt): Pgsl_vector_int; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_alloc_row_from_matrix';

function gsl_vector_int_alloc_col_from_matrix(m: Pgsl_matrix_int; j: NativeUInt): Pgsl_vector_int; cdecl;
  external LIBGSL name _PU + 'gsl_vector_int_alloc_col_from_matrix';

procedure gsl_matrix_int_free(m: Pgsl_matrix_int); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_free';

function gsl_matrix_int_submatrix(m: Pgsl_matrix_int; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_submatrix';

function gsl_matrix_int_row(m: Pgsl_matrix_int; i: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_row';

function gsl_matrix_int_column(m: Pgsl_matrix_int; j: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_column';

function gsl_matrix_int_diagonal(m: Pgsl_matrix_int): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_diagonal';

function gsl_matrix_int_subdiagonal(m: Pgsl_matrix_int; k: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_subdiagonal';

function gsl_matrix_int_superdiagonal(m: Pgsl_matrix_int; k: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_superdiagonal';

function gsl_matrix_int_subrow(m: Pgsl_matrix_int; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_subrow';

function gsl_matrix_int_subcolumn(m: Pgsl_matrix_int; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_subcolumn';

function gsl_matrix_int_view_array(base: PInteger; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_view_array';

function gsl_matrix_int_view_array_with_tda(base: PInteger; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_view_array_with_tda';

function gsl_matrix_int_view_vector(v: Pgsl_vector_int; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_view_vector';

function gsl_matrix_int_view_vector_with_tda(v: Pgsl_vector_int; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_int_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_view_vector_with_tda';

function gsl_matrix_int_const_submatrix(m: Pgsl_matrix_int; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_submatrix';

function gsl_matrix_int_const_row(m: Pgsl_matrix_int; i: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_row';

function gsl_matrix_int_const_column(m: Pgsl_matrix_int; j: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_column';

function gsl_matrix_int_const_diagonal(m: Pgsl_matrix_int): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_diagonal';

function gsl_matrix_int_const_subdiagonal(m: Pgsl_matrix_int; k: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_subdiagonal';

function gsl_matrix_int_const_superdiagonal(m: Pgsl_matrix_int; k: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_superdiagonal';

function gsl_matrix_int_const_subrow(m: Pgsl_matrix_int; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_subrow';

function gsl_matrix_int_const_subcolumn(m: Pgsl_matrix_int; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_subcolumn';

function gsl_matrix_int_const_view_array(base: PInteger; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_view_array';

function gsl_matrix_int_const_view_array_with_tda(base: PInteger; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_view_array_with_tda';

function gsl_matrix_int_const_view_vector(v: Pgsl_vector_int; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_view_vector';

function gsl_matrix_int_const_view_vector_with_tda(v: Pgsl_vector_int; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_int_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_view_vector_with_tda';

procedure gsl_matrix_int_set_zero(m: Pgsl_matrix_int); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_set_zero';

procedure gsl_matrix_int_set_identity(m: Pgsl_matrix_int); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_set_identity';

procedure gsl_matrix_int_set_all(m: Pgsl_matrix_int; x: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_set_all';

function gsl_matrix_int_fread(stream: PPointer; m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_fread';

function gsl_matrix_int_fwrite(stream: PPointer; m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_fwrite';

function gsl_matrix_int_fscanf(stream: PPointer; m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_fscanf';

function gsl_matrix_int_fprintf(stream: PPointer; m: Pgsl_matrix_int; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_fprintf';

function gsl_matrix_int_memcpy(dest: Pgsl_matrix_int; src: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_memcpy';

function gsl_matrix_int_swap(m1: Pgsl_matrix_int; m2: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_swap';

function gsl_matrix_int_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_int; src: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_tricpy';

function gsl_matrix_int_swap_rows(m: Pgsl_matrix_int; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_swap_rows';

function gsl_matrix_int_swap_columns(m: Pgsl_matrix_int; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_swap_columns';

function gsl_matrix_int_swap_rowcol(m: Pgsl_matrix_int; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_swap_rowcol';

function gsl_matrix_int_transpose(m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_transpose';

function gsl_matrix_int_transpose_memcpy(dest: Pgsl_matrix_int; src: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_transpose_memcpy';

function gsl_matrix_int_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_int; src: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_transpose_tricpy';

function gsl_matrix_int_max(m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_max';

function gsl_matrix_int_min(m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_min';

procedure gsl_matrix_int_minmax(m: Pgsl_matrix_int; min_out: PInteger; max_out: PInteger); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_minmax';

procedure gsl_matrix_int_max_index(m: Pgsl_matrix_int; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_max_index';

procedure gsl_matrix_int_min_index(m: Pgsl_matrix_int; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_min_index';

procedure gsl_matrix_int_minmax_index(m: Pgsl_matrix_int; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_minmax_index';

function gsl_matrix_int_equal(a: Pgsl_matrix_int; b: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_equal';

function gsl_matrix_int_isnull(m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_isnull';

function gsl_matrix_int_ispos(m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_ispos';

function gsl_matrix_int_isneg(m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_isneg';

function gsl_matrix_int_isnonneg(m: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_isnonneg';

function gsl_matrix_int_add(a: Pgsl_matrix_int; b: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_add';

function gsl_matrix_int_sub(a: Pgsl_matrix_int; b: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_sub';

function gsl_matrix_int_mul_elements(a: Pgsl_matrix_int; b: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_mul_elements';

function gsl_matrix_int_div_elements(a: Pgsl_matrix_int; b: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_div_elements';

function gsl_matrix_int_scale(a: Pgsl_matrix_int; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_scale';

function gsl_matrix_int_add_constant(a: Pgsl_matrix_int; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_add_constant';

function gsl_matrix_int_add_diagonal(a: Pgsl_matrix_int; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_add_diagonal';

(***********************************************************************)
function gsl_matrix_int_get_row(v: Pgsl_vector_int; m: Pgsl_matrix_int; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_get_row';

function gsl_matrix_int_get_col(v: Pgsl_vector_int; m: Pgsl_matrix_int; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_get_col';

function gsl_matrix_int_set_row(m: Pgsl_matrix_int; i: NativeUInt; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_set_row';

function gsl_matrix_int_set_col(m: Pgsl_matrix_int; j: NativeUInt; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_set_col';

(***********************************************************************)
function gsl_matrix_int_get(m: Pgsl_matrix_int; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_get';

procedure gsl_matrix_int_set(m: Pgsl_matrix_int; i: NativeUInt; j: NativeUInt; x: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_set';

function gsl_matrix_int_ptr(m: Pgsl_matrix_int; i: NativeUInt; j: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_ptr';

function gsl_matrix_int_const_ptr(m: Pgsl_matrix_int; i: NativeUInt; j: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_int_const_ptr';

function gsl_matrix_ushort_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_alloc';

function gsl_matrix_ushort_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_calloc';

function gsl_matrix_ushort_alloc_from_block(b: Pgsl_block_ushort; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_alloc_from_block';

function gsl_matrix_ushort_alloc_from_matrix(m: Pgsl_matrix_ushort; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_alloc_from_matrix';

function gsl_vector_ushort_alloc_row_from_matrix(m: Pgsl_matrix_ushort; i: NativeUInt): Pgsl_vector_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_alloc_row_from_matrix';

function gsl_vector_ushort_alloc_col_from_matrix(m: Pgsl_matrix_ushort; j: NativeUInt): Pgsl_vector_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_vector_ushort_alloc_col_from_matrix';

procedure gsl_matrix_ushort_free(m: Pgsl_matrix_ushort); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_free';

function gsl_matrix_ushort_submatrix(m: Pgsl_matrix_ushort; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_submatrix';

function gsl_matrix_ushort_row(m: Pgsl_matrix_ushort; i: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_row';

function gsl_matrix_ushort_column(m: Pgsl_matrix_ushort; j: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_column';

function gsl_matrix_ushort_diagonal(m: Pgsl_matrix_ushort): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_diagonal';

function gsl_matrix_ushort_subdiagonal(m: Pgsl_matrix_ushort; k: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_subdiagonal';

function gsl_matrix_ushort_superdiagonal(m: Pgsl_matrix_ushort; k: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_superdiagonal';

function gsl_matrix_ushort_subrow(m: Pgsl_matrix_ushort; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_subrow';

function gsl_matrix_ushort_subcolumn(m: Pgsl_matrix_ushort; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_subcolumn';

function gsl_matrix_ushort_view_array(base: PWord; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_view_array';

function gsl_matrix_ushort_view_array_with_tda(base: PWord; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_view_array_with_tda';

function gsl_matrix_ushort_view_vector(v: Pgsl_vector_ushort; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_view_vector';

function gsl_matrix_ushort_view_vector_with_tda(v: Pgsl_vector_ushort; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_ushort_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_view_vector_with_tda';

function gsl_matrix_ushort_const_submatrix(m: Pgsl_matrix_ushort; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_submatrix';

function gsl_matrix_ushort_const_row(m: Pgsl_matrix_ushort; i: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_row';

function gsl_matrix_ushort_const_column(m: Pgsl_matrix_ushort; j: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_column';

function gsl_matrix_ushort_const_diagonal(m: Pgsl_matrix_ushort): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_diagonal';

function gsl_matrix_ushort_const_subdiagonal(m: Pgsl_matrix_ushort; k: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_subdiagonal';

function gsl_matrix_ushort_const_superdiagonal(m: Pgsl_matrix_ushort; k: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_superdiagonal';

function gsl_matrix_ushort_const_subrow(m: Pgsl_matrix_ushort; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_subrow';

function gsl_matrix_ushort_const_subcolumn(m: Pgsl_matrix_ushort; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_subcolumn';

function gsl_matrix_ushort_const_view_array(base: PWord; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_view_array';

function gsl_matrix_ushort_const_view_array_with_tda(base: PWord; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_view_array_with_tda';

function gsl_matrix_ushort_const_view_vector(v: Pgsl_vector_ushort; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_view_vector';

function gsl_matrix_ushort_const_view_vector_with_tda(v: Pgsl_vector_ushort; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_ushort_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_view_vector_with_tda';

procedure gsl_matrix_ushort_set_zero(m: Pgsl_matrix_ushort); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_set_zero';

procedure gsl_matrix_ushort_set_identity(m: Pgsl_matrix_ushort); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_set_identity';

procedure gsl_matrix_ushort_set_all(m: Pgsl_matrix_ushort; x: Word); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_set_all';

function gsl_matrix_ushort_fread(stream: PPointer; m: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_fread';

function gsl_matrix_ushort_fwrite(stream: PPointer; m: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_fwrite';

function gsl_matrix_ushort_fscanf(stream: PPointer; m: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_fscanf';

function gsl_matrix_ushort_fprintf(stream: PPointer; m: Pgsl_matrix_ushort; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_fprintf';

function gsl_matrix_ushort_memcpy(dest: Pgsl_matrix_ushort; src: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_memcpy';

function gsl_matrix_ushort_swap(m1: Pgsl_matrix_ushort; m2: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_swap';

function gsl_matrix_ushort_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_ushort; src: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_tricpy';

function gsl_matrix_ushort_swap_rows(m: Pgsl_matrix_ushort; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_swap_rows';

function gsl_matrix_ushort_swap_columns(m: Pgsl_matrix_ushort; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_swap_columns';

function gsl_matrix_ushort_swap_rowcol(m: Pgsl_matrix_ushort; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_swap_rowcol';

function gsl_matrix_ushort_transpose(m: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_transpose';

function gsl_matrix_ushort_transpose_memcpy(dest: Pgsl_matrix_ushort; src: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_transpose_memcpy';

function gsl_matrix_ushort_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_ushort; src: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_transpose_tricpy';

function gsl_matrix_ushort_max(m: Pgsl_matrix_ushort): Word; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_max';

function gsl_matrix_ushort_min(m: Pgsl_matrix_ushort): Word; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_min';

procedure gsl_matrix_ushort_minmax(m: Pgsl_matrix_ushort; min_out: PWord; max_out: PWord); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_minmax';

procedure gsl_matrix_ushort_max_index(m: Pgsl_matrix_ushort; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_max_index';

procedure gsl_matrix_ushort_min_index(m: Pgsl_matrix_ushort; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_min_index';

procedure gsl_matrix_ushort_minmax_index(m: Pgsl_matrix_ushort; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_minmax_index';

function gsl_matrix_ushort_equal(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_equal';

function gsl_matrix_ushort_isnull(m: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_isnull';

function gsl_matrix_ushort_ispos(m: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_ispos';

function gsl_matrix_ushort_isneg(m: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_isneg';

function gsl_matrix_ushort_isnonneg(m: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_isnonneg';

function gsl_matrix_ushort_add(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_add';

function gsl_matrix_ushort_sub(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_sub';

function gsl_matrix_ushort_mul_elements(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_mul_elements';

function gsl_matrix_ushort_div_elements(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_div_elements';

function gsl_matrix_ushort_scale(a: Pgsl_matrix_ushort; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_scale';

function gsl_matrix_ushort_add_constant(a: Pgsl_matrix_ushort; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_add_constant';

function gsl_matrix_ushort_add_diagonal(a: Pgsl_matrix_ushort; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_add_diagonal';

(***********************************************************************)
function gsl_matrix_ushort_get_row(v: Pgsl_vector_ushort; m: Pgsl_matrix_ushort; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_get_row';

function gsl_matrix_ushort_get_col(v: Pgsl_vector_ushort; m: Pgsl_matrix_ushort; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_get_col';

function gsl_matrix_ushort_set_row(m: Pgsl_matrix_ushort; i: NativeUInt; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_set_row';

function gsl_matrix_ushort_set_col(m: Pgsl_matrix_ushort; j: NativeUInt; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_set_col';

(***********************************************************************)
function gsl_matrix_ushort_get(m: Pgsl_matrix_ushort; i: NativeUInt; j: NativeUInt): Word; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_get';

procedure gsl_matrix_ushort_set(m: Pgsl_matrix_ushort; i: NativeUInt; j: NativeUInt; x: Word); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_set';

function gsl_matrix_ushort_ptr(m: Pgsl_matrix_ushort; i: NativeUInt; j: NativeUInt): PWord; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_ptr';

function gsl_matrix_ushort_const_ptr(m: Pgsl_matrix_ushort; i: NativeUInt; j: NativeUInt): PWord; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_ushort_const_ptr';

function gsl_matrix_short_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_alloc';

function gsl_matrix_short_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_calloc';

function gsl_matrix_short_alloc_from_block(b: Pgsl_block_short; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_alloc_from_block';

function gsl_matrix_short_alloc_from_matrix(m: Pgsl_matrix_short; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_alloc_from_matrix';

function gsl_vector_short_alloc_row_from_matrix(m: Pgsl_matrix_short; i: NativeUInt): Pgsl_vector_short; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_alloc_row_from_matrix';

function gsl_vector_short_alloc_col_from_matrix(m: Pgsl_matrix_short; j: NativeUInt): Pgsl_vector_short; cdecl;
  external LIBGSL name _PU + 'gsl_vector_short_alloc_col_from_matrix';

procedure gsl_matrix_short_free(m: Pgsl_matrix_short); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_free';

function gsl_matrix_short_submatrix(m: Pgsl_matrix_short; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_submatrix';

function gsl_matrix_short_row(m: Pgsl_matrix_short; i: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_row';

function gsl_matrix_short_column(m: Pgsl_matrix_short; j: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_column';

function gsl_matrix_short_diagonal(m: Pgsl_matrix_short): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_diagonal';

function gsl_matrix_short_subdiagonal(m: Pgsl_matrix_short; k: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_subdiagonal';

function gsl_matrix_short_superdiagonal(m: Pgsl_matrix_short; k: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_superdiagonal';

function gsl_matrix_short_subrow(m: Pgsl_matrix_short; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_subrow';

function gsl_matrix_short_subcolumn(m: Pgsl_matrix_short; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_subcolumn';

function gsl_matrix_short_view_array(base: PSmallint; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_view_array';

function gsl_matrix_short_view_array_with_tda(base: PSmallint; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_view_array_with_tda';

function gsl_matrix_short_view_vector(v: Pgsl_vector_short; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_view_vector';

function gsl_matrix_short_view_vector_with_tda(v: Pgsl_vector_short; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_short_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_view_vector_with_tda';

function gsl_matrix_short_const_submatrix(m: Pgsl_matrix_short; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_submatrix';

function gsl_matrix_short_const_row(m: Pgsl_matrix_short; i: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_row';

function gsl_matrix_short_const_column(m: Pgsl_matrix_short; j: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_column';

function gsl_matrix_short_const_diagonal(m: Pgsl_matrix_short): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_diagonal';

function gsl_matrix_short_const_subdiagonal(m: Pgsl_matrix_short; k: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_subdiagonal';

function gsl_matrix_short_const_superdiagonal(m: Pgsl_matrix_short; k: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_superdiagonal';

function gsl_matrix_short_const_subrow(m: Pgsl_matrix_short; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_subrow';

function gsl_matrix_short_const_subcolumn(m: Pgsl_matrix_short; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_subcolumn';

function gsl_matrix_short_const_view_array(base: PSmallint; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_view_array';

function gsl_matrix_short_const_view_array_with_tda(base: PSmallint; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_view_array_with_tda';

function gsl_matrix_short_const_view_vector(v: Pgsl_vector_short; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_view_vector';

function gsl_matrix_short_const_view_vector_with_tda(v: Pgsl_vector_short; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_short_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_view_vector_with_tda';

procedure gsl_matrix_short_set_zero(m: Pgsl_matrix_short); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_set_zero';

procedure gsl_matrix_short_set_identity(m: Pgsl_matrix_short); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_set_identity';

procedure gsl_matrix_short_set_all(m: Pgsl_matrix_short; x: Smallint); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_set_all';

function gsl_matrix_short_fread(stream: PPointer; m: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_fread';

function gsl_matrix_short_fwrite(stream: PPointer; m: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_fwrite';

function gsl_matrix_short_fscanf(stream: PPointer; m: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_fscanf';

function gsl_matrix_short_fprintf(stream: PPointer; m: Pgsl_matrix_short; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_fprintf';

function gsl_matrix_short_memcpy(dest: Pgsl_matrix_short; src: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_memcpy';

function gsl_matrix_short_swap(m1: Pgsl_matrix_short; m2: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_swap';

function gsl_matrix_short_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_short; src: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_tricpy';

function gsl_matrix_short_swap_rows(m: Pgsl_matrix_short; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_swap_rows';

function gsl_matrix_short_swap_columns(m: Pgsl_matrix_short; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_swap_columns';

function gsl_matrix_short_swap_rowcol(m: Pgsl_matrix_short; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_swap_rowcol';

function gsl_matrix_short_transpose(m: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_transpose';

function gsl_matrix_short_transpose_memcpy(dest: Pgsl_matrix_short; src: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_transpose_memcpy';

function gsl_matrix_short_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_short; src: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_transpose_tricpy';

function gsl_matrix_short_max(m: Pgsl_matrix_short): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_max';

function gsl_matrix_short_min(m: Pgsl_matrix_short): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_min';

procedure gsl_matrix_short_minmax(m: Pgsl_matrix_short; min_out: PSmallint; max_out: PSmallint); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_minmax';

procedure gsl_matrix_short_max_index(m: Pgsl_matrix_short; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_max_index';

procedure gsl_matrix_short_min_index(m: Pgsl_matrix_short; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_min_index';

procedure gsl_matrix_short_minmax_index(m: Pgsl_matrix_short; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_minmax_index';

function gsl_matrix_short_equal(a: Pgsl_matrix_short; b: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_equal';

function gsl_matrix_short_isnull(m: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_isnull';

function gsl_matrix_short_ispos(m: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_ispos';

function gsl_matrix_short_isneg(m: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_isneg';

function gsl_matrix_short_isnonneg(m: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_isnonneg';

function gsl_matrix_short_add(a: Pgsl_matrix_short; b: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_add';

function gsl_matrix_short_sub(a: Pgsl_matrix_short; b: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_sub';

function gsl_matrix_short_mul_elements(a: Pgsl_matrix_short; b: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_mul_elements';

function gsl_matrix_short_div_elements(a: Pgsl_matrix_short; b: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_div_elements';

function gsl_matrix_short_scale(a: Pgsl_matrix_short; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_scale';

function gsl_matrix_short_add_constant(a: Pgsl_matrix_short; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_add_constant';

function gsl_matrix_short_add_diagonal(a: Pgsl_matrix_short; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_add_diagonal';

(***********************************************************************)
function gsl_matrix_short_get_row(v: Pgsl_vector_short; m: Pgsl_matrix_short; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_get_row';

function gsl_matrix_short_get_col(v: Pgsl_vector_short; m: Pgsl_matrix_short; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_get_col';

function gsl_matrix_short_set_row(m: Pgsl_matrix_short; i: NativeUInt; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_set_row';

function gsl_matrix_short_set_col(m: Pgsl_matrix_short; j: NativeUInt; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_set_col';

(***********************************************************************)
function gsl_matrix_short_get(m: Pgsl_matrix_short; i: NativeUInt; j: NativeUInt): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_get';

procedure gsl_matrix_short_set(m: Pgsl_matrix_short; i: NativeUInt; j: NativeUInt; x: Smallint); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_set';

function gsl_matrix_short_ptr(m: Pgsl_matrix_short; i: NativeUInt; j: NativeUInt): PSmallint; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_ptr';

function gsl_matrix_short_const_ptr(m: Pgsl_matrix_short; i: NativeUInt; j: NativeUInt): PSmallint; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_short_const_ptr';

function gsl_matrix_uchar_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_alloc';

function gsl_matrix_uchar_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_calloc';

function gsl_matrix_uchar_alloc_from_block(b: Pgsl_block_uchar; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_alloc_from_block';

function gsl_matrix_uchar_alloc_from_matrix(m: Pgsl_matrix_uchar; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_alloc_from_matrix';

function gsl_vector_uchar_alloc_row_from_matrix(m: Pgsl_matrix_uchar; i: NativeUInt): Pgsl_vector_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_alloc_row_from_matrix';

function gsl_vector_uchar_alloc_col_from_matrix(m: Pgsl_matrix_uchar; j: NativeUInt): Pgsl_vector_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_vector_uchar_alloc_col_from_matrix';

procedure gsl_matrix_uchar_free(m: Pgsl_matrix_uchar); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_free';

function gsl_matrix_uchar_submatrix(m: Pgsl_matrix_uchar; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_submatrix';

function gsl_matrix_uchar_row(m: Pgsl_matrix_uchar; i: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_row';

function gsl_matrix_uchar_column(m: Pgsl_matrix_uchar; j: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_column';

function gsl_matrix_uchar_diagonal(m: Pgsl_matrix_uchar): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_diagonal';

function gsl_matrix_uchar_subdiagonal(m: Pgsl_matrix_uchar; k: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_subdiagonal';

function gsl_matrix_uchar_superdiagonal(m: Pgsl_matrix_uchar; k: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_superdiagonal';

function gsl_matrix_uchar_subrow(m: Pgsl_matrix_uchar; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_subrow';

function gsl_matrix_uchar_subcolumn(m: Pgsl_matrix_uchar; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_subcolumn';

function gsl_matrix_uchar_view_array(base: PByte; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_view_array';

function gsl_matrix_uchar_view_array_with_tda(base: PByte; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_view_array_with_tda';

function gsl_matrix_uchar_view_vector(v: Pgsl_vector_uchar; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_view_vector';

function gsl_matrix_uchar_view_vector_with_tda(v: Pgsl_vector_uchar; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_uchar_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_view_vector_with_tda';

function gsl_matrix_uchar_const_submatrix(m: Pgsl_matrix_uchar; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_submatrix';

function gsl_matrix_uchar_const_row(m: Pgsl_matrix_uchar; i: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_row';

function gsl_matrix_uchar_const_column(m: Pgsl_matrix_uchar; j: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_column';

function gsl_matrix_uchar_const_diagonal(m: Pgsl_matrix_uchar): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_diagonal';

function gsl_matrix_uchar_const_subdiagonal(m: Pgsl_matrix_uchar; k: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_subdiagonal';

function gsl_matrix_uchar_const_superdiagonal(m: Pgsl_matrix_uchar; k: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_superdiagonal';

function gsl_matrix_uchar_const_subrow(m: Pgsl_matrix_uchar; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_subrow';

function gsl_matrix_uchar_const_subcolumn(m: Pgsl_matrix_uchar; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_subcolumn';

function gsl_matrix_uchar_const_view_array(base: PByte; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_view_array';

function gsl_matrix_uchar_const_view_array_with_tda(base: PByte; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_view_array_with_tda';

function gsl_matrix_uchar_const_view_vector(v: Pgsl_vector_uchar; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_view_vector';

function gsl_matrix_uchar_const_view_vector_with_tda(v: Pgsl_vector_uchar; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_uchar_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_view_vector_with_tda';

procedure gsl_matrix_uchar_set_zero(m: Pgsl_matrix_uchar); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_set_zero';

procedure gsl_matrix_uchar_set_identity(m: Pgsl_matrix_uchar); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_set_identity';

procedure gsl_matrix_uchar_set_all(m: Pgsl_matrix_uchar; x: Byte); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_set_all';

function gsl_matrix_uchar_fread(stream: PPointer; m: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_fread';

function gsl_matrix_uchar_fwrite(stream: PPointer; m: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_fwrite';

function gsl_matrix_uchar_fscanf(stream: PPointer; m: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_fscanf';

function gsl_matrix_uchar_fprintf(stream: PPointer; m: Pgsl_matrix_uchar; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_fprintf';

function gsl_matrix_uchar_memcpy(dest: Pgsl_matrix_uchar; src: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_memcpy';

function gsl_matrix_uchar_swap(m1: Pgsl_matrix_uchar; m2: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_swap';

function gsl_matrix_uchar_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_uchar; src: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_tricpy';

function gsl_matrix_uchar_swap_rows(m: Pgsl_matrix_uchar; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_swap_rows';

function gsl_matrix_uchar_swap_columns(m: Pgsl_matrix_uchar; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_swap_columns';

function gsl_matrix_uchar_swap_rowcol(m: Pgsl_matrix_uchar; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_swap_rowcol';

function gsl_matrix_uchar_transpose(m: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_transpose';

function gsl_matrix_uchar_transpose_memcpy(dest: Pgsl_matrix_uchar; src: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_transpose_memcpy';

function gsl_matrix_uchar_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_uchar; src: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_transpose_tricpy';

function gsl_matrix_uchar_max(m: Pgsl_matrix_uchar): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_max';

function gsl_matrix_uchar_min(m: Pgsl_matrix_uchar): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_min';

procedure gsl_matrix_uchar_minmax(m: Pgsl_matrix_uchar; min_out: PByte; max_out: PByte); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_minmax';

procedure gsl_matrix_uchar_max_index(m: Pgsl_matrix_uchar; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_max_index';

procedure gsl_matrix_uchar_min_index(m: Pgsl_matrix_uchar; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_min_index';

procedure gsl_matrix_uchar_minmax_index(m: Pgsl_matrix_uchar; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_minmax_index';

function gsl_matrix_uchar_equal(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_equal';

function gsl_matrix_uchar_isnull(m: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_isnull';

function gsl_matrix_uchar_ispos(m: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_ispos';

function gsl_matrix_uchar_isneg(m: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_isneg';

function gsl_matrix_uchar_isnonneg(m: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_isnonneg';

function gsl_matrix_uchar_add(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_add';

function gsl_matrix_uchar_sub(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_sub';

function gsl_matrix_uchar_mul_elements(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_mul_elements';

function gsl_matrix_uchar_div_elements(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_div_elements';

function gsl_matrix_uchar_scale(a: Pgsl_matrix_uchar; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_scale';

function gsl_matrix_uchar_add_constant(a: Pgsl_matrix_uchar; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_add_constant';

function gsl_matrix_uchar_add_diagonal(a: Pgsl_matrix_uchar; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_add_diagonal';

(***********************************************************************)
function gsl_matrix_uchar_get_row(v: Pgsl_vector_uchar; m: Pgsl_matrix_uchar; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_get_row';

function gsl_matrix_uchar_get_col(v: Pgsl_vector_uchar; m: Pgsl_matrix_uchar; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_get_col';

function gsl_matrix_uchar_set_row(m: Pgsl_matrix_uchar; i: NativeUInt; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_set_row';

function gsl_matrix_uchar_set_col(m: Pgsl_matrix_uchar; j: NativeUInt; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_set_col';

(***********************************************************************)
function gsl_matrix_uchar_get(m: Pgsl_matrix_uchar; i: NativeUInt; j: NativeUInt): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_get';

procedure gsl_matrix_uchar_set(m: Pgsl_matrix_uchar; i: NativeUInt; j: NativeUInt; x: Byte); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_set';

function gsl_matrix_uchar_ptr(m: Pgsl_matrix_uchar; i: NativeUInt; j: NativeUInt): PByte; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_ptr';

function gsl_matrix_uchar_const_ptr(m: Pgsl_matrix_uchar; i: NativeUInt; j: NativeUInt): PByte; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_uchar_const_ptr';

function gsl_matrix_char_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_alloc';

function gsl_matrix_char_calloc(n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_calloc';

function gsl_matrix_char_alloc_from_block(b: Pgsl_block_char; offset: NativeUInt; n1: NativeUInt; n2: NativeUInt; d2: NativeUInt): Pgsl_matrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_alloc_from_block';

function gsl_matrix_char_alloc_from_matrix(m: Pgsl_matrix_char; k1: NativeUInt; k2: NativeUInt; n1: NativeUInt; n2: NativeUInt): Pgsl_matrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_alloc_from_matrix';

function gsl_vector_char_alloc_row_from_matrix(m: Pgsl_matrix_char; i: NativeUInt): Pgsl_vector_char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_alloc_row_from_matrix';

function gsl_vector_char_alloc_col_from_matrix(m: Pgsl_matrix_char; j: NativeUInt): Pgsl_vector_char; cdecl;
  external LIBGSL name _PU + 'gsl_vector_char_alloc_col_from_matrix';

procedure gsl_matrix_char_free(m: Pgsl_matrix_char); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_free';

function gsl_matrix_char_submatrix(m: Pgsl_matrix_char; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_submatrix';

function gsl_matrix_char_row(m: Pgsl_matrix_char; i: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_row';

function gsl_matrix_char_column(m: Pgsl_matrix_char; j: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_column';

function gsl_matrix_char_diagonal(m: Pgsl_matrix_char): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_diagonal';

function gsl_matrix_char_subdiagonal(m: Pgsl_matrix_char; k: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_subdiagonal';

function gsl_matrix_char_superdiagonal(m: Pgsl_matrix_char; k: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_superdiagonal';

function gsl_matrix_char_subrow(m: Pgsl_matrix_char; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_subrow';

function gsl_matrix_char_subcolumn(m: Pgsl_matrix_char; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_subcolumn';

function gsl_matrix_char_view_array(base: PUTF8Char; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_view_array';

function gsl_matrix_char_view_array_with_tda(base: PUTF8Char; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_view_array_with_tda';

function gsl_matrix_char_view_vector(v: Pgsl_vector_char; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_view_vector';

function gsl_matrix_char_view_vector_with_tda(v: Pgsl_vector_char; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_char_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_view_vector_with_tda';

function gsl_matrix_char_const_submatrix(m: Pgsl_matrix_char; i: NativeUInt; j: NativeUInt; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_submatrix';

function gsl_matrix_char_const_row(m: Pgsl_matrix_char; i: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_row';

function gsl_matrix_char_const_column(m: Pgsl_matrix_char; j: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_column';

function gsl_matrix_char_const_diagonal(m: Pgsl_matrix_char): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_diagonal';

function gsl_matrix_char_const_subdiagonal(m: Pgsl_matrix_char; k: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_subdiagonal';

function gsl_matrix_char_const_superdiagonal(m: Pgsl_matrix_char; k: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_superdiagonal';

function gsl_matrix_char_const_subrow(m: Pgsl_matrix_char; i: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_subrow';

function gsl_matrix_char_const_subcolumn(m: Pgsl_matrix_char; j: NativeUInt; offset: NativeUInt; n: NativeUInt): _gsl_vector_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_subcolumn';

function gsl_matrix_char_const_view_array(base: PUTF8Char; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_view_array';

function gsl_matrix_char_const_view_array_with_tda(base: PUTF8Char; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_view_array_with_tda';

function gsl_matrix_char_const_view_vector(v: Pgsl_vector_char; n1: NativeUInt; n2: NativeUInt): _gsl_matrix_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_view_vector';

function gsl_matrix_char_const_view_vector_with_tda(v: Pgsl_vector_char; n1: NativeUInt; n2: NativeUInt; tda: NativeUInt): _gsl_matrix_char_const_view; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_view_vector_with_tda';

procedure gsl_matrix_char_set_zero(m: Pgsl_matrix_char); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_set_zero';

procedure gsl_matrix_char_set_identity(m: Pgsl_matrix_char); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_set_identity';

procedure gsl_matrix_char_set_all(m: Pgsl_matrix_char; x: UTF8Char); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_set_all';

function gsl_matrix_char_fread(stream: PPointer; m: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_fread';

function gsl_matrix_char_fwrite(stream: PPointer; m: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_fwrite';

function gsl_matrix_char_fscanf(stream: PPointer; m: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_fscanf';

function gsl_matrix_char_fprintf(stream: PPointer; m: Pgsl_matrix_char; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_fprintf';

function gsl_matrix_char_memcpy(dest: Pgsl_matrix_char; src: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_memcpy';

function gsl_matrix_char_swap(m1: Pgsl_matrix_char; m2: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_swap';

function gsl_matrix_char_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_char; src: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_tricpy';

function gsl_matrix_char_swap_rows(m: Pgsl_matrix_char; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_swap_rows';

function gsl_matrix_char_swap_columns(m: Pgsl_matrix_char; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_swap_columns';

function gsl_matrix_char_swap_rowcol(m: Pgsl_matrix_char; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_swap_rowcol';

function gsl_matrix_char_transpose(m: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_transpose';

function gsl_matrix_char_transpose_memcpy(dest: Pgsl_matrix_char; src: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_transpose_memcpy';

function gsl_matrix_char_transpose_tricpy(uplo_src: UTF8Char; copy_diag: Integer; dest: Pgsl_matrix_char; src: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_transpose_tricpy';

function gsl_matrix_char_max(m: Pgsl_matrix_char): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_max';

function gsl_matrix_char_min(m: Pgsl_matrix_char): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_min';

procedure gsl_matrix_char_minmax(m: Pgsl_matrix_char; min_out: PUTF8Char; max_out: PUTF8Char); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_minmax';

procedure gsl_matrix_char_max_index(m: Pgsl_matrix_char; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_max_index';

procedure gsl_matrix_char_min_index(m: Pgsl_matrix_char; imin: PNativeUInt; jmin: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_min_index';

procedure gsl_matrix_char_minmax_index(m: Pgsl_matrix_char; imin: PNativeUInt; jmin: PNativeUInt; imax: PNativeUInt; jmax: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_minmax_index';

function gsl_matrix_char_equal(a: Pgsl_matrix_char; b: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_equal';

function gsl_matrix_char_isnull(m: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_isnull';

function gsl_matrix_char_ispos(m: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_ispos';

function gsl_matrix_char_isneg(m: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_isneg';

function gsl_matrix_char_isnonneg(m: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_isnonneg';

function gsl_matrix_char_add(a: Pgsl_matrix_char; b: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_add';

function gsl_matrix_char_sub(a: Pgsl_matrix_char; b: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_sub';

function gsl_matrix_char_mul_elements(a: Pgsl_matrix_char; b: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_mul_elements';

function gsl_matrix_char_div_elements(a: Pgsl_matrix_char; b: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_div_elements';

function gsl_matrix_char_scale(a: Pgsl_matrix_char; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_scale';

function gsl_matrix_char_add_constant(a: Pgsl_matrix_char; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_add_constant';

function gsl_matrix_char_add_diagonal(a: Pgsl_matrix_char; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_add_diagonal';

(***********************************************************************)
function gsl_matrix_char_get_row(v: Pgsl_vector_char; m: Pgsl_matrix_char; i: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_get_row';

function gsl_matrix_char_get_col(v: Pgsl_vector_char; m: Pgsl_matrix_char; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_get_col';

function gsl_matrix_char_set_row(m: Pgsl_matrix_char; i: NativeUInt; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_set_row';

function gsl_matrix_char_set_col(m: Pgsl_matrix_char; j: NativeUInt; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_set_col';

(***********************************************************************)
function gsl_matrix_char_get(m: Pgsl_matrix_char; i: NativeUInt; j: NativeUInt): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_get';

procedure gsl_matrix_char_set(m: Pgsl_matrix_char; i: NativeUInt; j: NativeUInt; x: UTF8Char); cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_set';

function gsl_matrix_char_ptr(m: Pgsl_matrix_char; i: NativeUInt; j: NativeUInt): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_ptr';

function gsl_matrix_char_const_ptr(m: Pgsl_matrix_char; i: NativeUInt; j: NativeUInt): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_matrix_char_const_ptr';

function cblas_sdsdot(N: Integer; alpha: Single; X: PSingle; incX: Integer; Y: PSingle; incY: Integer): Single; cdecl;
  external LIBGSL name _PU + 'cblas_sdsdot';

function cblas_dsdot(N: Integer; X: PSingle; incX: Integer; Y: PSingle; incY: Integer): Double; cdecl;
  external LIBGSL name _PU + 'cblas_dsdot';

function cblas_sdot(N: Integer; X: PSingle; incX: Integer; Y: PSingle; incY: Integer): Single; cdecl;
  external LIBGSL name _PU + 'cblas_sdot';

function cblas_ddot(N: Integer; X: PDouble; incX: Integer; Y: PDouble; incY: Integer): Double; cdecl;
  external LIBGSL name _PU + 'cblas_ddot';

procedure cblas_cdotu_sub(N: Integer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; dotu: Pointer); cdecl;
  external LIBGSL name _PU + 'cblas_cdotu_sub';

procedure cblas_cdotc_sub(N: Integer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; dotc: Pointer); cdecl;
  external LIBGSL name _PU + 'cblas_cdotc_sub';

procedure cblas_zdotu_sub(N: Integer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; dotu: Pointer); cdecl;
  external LIBGSL name _PU + 'cblas_zdotu_sub';

procedure cblas_zdotc_sub(N: Integer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; dotc: Pointer); cdecl;
  external LIBGSL name _PU + 'cblas_zdotc_sub';

function cblas_snrm2(N: Integer; X: PSingle; incX: Integer): Single; cdecl;
  external LIBGSL name _PU + 'cblas_snrm2';

function cblas_sasum(N: Integer; X: PSingle; incX: Integer): Single; cdecl;
  external LIBGSL name _PU + 'cblas_sasum';

function cblas_dnrm2(N: Integer; X: PDouble; incX: Integer): Double; cdecl;
  external LIBGSL name _PU + 'cblas_dnrm2';

function cblas_dasum(N: Integer; X: PDouble; incX: Integer): Double; cdecl;
  external LIBGSL name _PU + 'cblas_dasum';

function cblas_scnrm2(N: Integer; X: Pointer; incX: Integer): Single; cdecl;
  external LIBGSL name _PU + 'cblas_scnrm2';

function cblas_scasum(N: Integer; X: Pointer; incX: Integer): Single; cdecl;
  external LIBGSL name _PU + 'cblas_scasum';

function cblas_dznrm2(N: Integer; X: Pointer; incX: Integer): Double; cdecl;
  external LIBGSL name _PU + 'cblas_dznrm2';

function cblas_dzasum(N: Integer; X: Pointer; incX: Integer): Double; cdecl;
  external LIBGSL name _PU + 'cblas_dzasum';

function cblas_isamax(N: Integer; X: PSingle; incX: Integer): NativeUInt; cdecl;
  external LIBGSL name _PU + 'cblas_isamax';

function cblas_idamax(N: Integer; X: PDouble; incX: Integer): NativeUInt; cdecl;
  external LIBGSL name _PU + 'cblas_idamax';

function cblas_icamax(N: Integer; X: Pointer; incX: Integer): NativeUInt; cdecl;
  external LIBGSL name _PU + 'cblas_icamax';

function cblas_izamax(N: Integer; X: Pointer; incX: Integer): NativeUInt; cdecl;
  external LIBGSL name _PU + 'cblas_izamax';

procedure cblas_sswap(N: Integer; X: PSingle; incX: Integer; Y: PSingle; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_sswap';

procedure cblas_scopy(N: Integer; X: PSingle; incX: Integer; Y: PSingle; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_scopy';

procedure cblas_saxpy(N: Integer; alpha: Single; X: PSingle; incX: Integer; Y: PSingle; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_saxpy';

procedure cblas_dswap(N: Integer; X: PDouble; incX: Integer; Y: PDouble; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dswap';

procedure cblas_dcopy(N: Integer; X: PDouble; incX: Integer; Y: PDouble; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dcopy';

procedure cblas_daxpy(N: Integer; alpha: Double; X: PDouble; incX: Integer; Y: PDouble; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_daxpy';

procedure cblas_cswap(N: Integer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cswap';

procedure cblas_ccopy(N: Integer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ccopy';

procedure cblas_caxpy(N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_caxpy';

procedure cblas_zswap(N: Integer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zswap';

procedure cblas_zcopy(N: Integer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zcopy';

procedure cblas_zaxpy(N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zaxpy';

procedure cblas_srotg(a: PSingle; b: PSingle; c: PSingle; s: PSingle); cdecl;
  external LIBGSL name _PU + 'cblas_srotg';

procedure cblas_srotmg(d1: PSingle; d2: PSingle; b1: PSingle; b2: Single; P: PSingle); cdecl;
  external LIBGSL name _PU + 'cblas_srotmg';

procedure cblas_srot(N: Integer; X: PSingle; incX: Integer; Y: PSingle; incY: Integer; c: Single; s: Single); cdecl;
  external LIBGSL name _PU + 'cblas_srot';

procedure cblas_srotm(N: Integer; X: PSingle; incX: Integer; Y: PSingle; incY: Integer; P: PSingle); cdecl;
  external LIBGSL name _PU + 'cblas_srotm';

procedure cblas_drotg(a: PDouble; b: PDouble; c: PDouble; s: PDouble); cdecl;
  external LIBGSL name _PU + 'cblas_drotg';

procedure cblas_drotmg(d1: PDouble; d2: PDouble; b1: PDouble; b2: Double; P: PDouble); cdecl;
  external LIBGSL name _PU + 'cblas_drotmg';

procedure cblas_drot(N: Integer; X: PDouble; incX: Integer; Y: PDouble; incY: Integer; c: Double; s: Double); cdecl;
  external LIBGSL name _PU + 'cblas_drot';

procedure cblas_drotm(N: Integer; X: PDouble; incX: Integer; Y: PDouble; incY: Integer; P: PDouble); cdecl;
  external LIBGSL name _PU + 'cblas_drotm';

procedure cblas_sscal(N: Integer; alpha: Single; X: PSingle; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_sscal';

procedure cblas_dscal(N: Integer; alpha: Double; X: PDouble; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dscal';

procedure cblas_cscal(N: Integer; alpha: Pointer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cscal';

procedure cblas_zscal(N: Integer; alpha: Pointer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zscal';

procedure cblas_csscal(N: Integer; alpha: Single; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_csscal';

procedure cblas_zdscal(N: Integer; alpha: Double; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zdscal';

procedure cblas_sgemv(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: Integer; N: Integer; alpha: Single; A: PSingle; lda: Integer; X: PSingle; incX: Integer; beta: Single; Y: PSingle; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_sgemv';

procedure cblas_sgbmv(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: Integer; N: Integer; KL: Integer; KU: Integer; alpha: Single; A: PSingle; lda: Integer; X: PSingle; incX: Integer; beta: Single; Y: PSingle; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_sgbmv';

procedure cblas_strmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; A: PSingle; lda: Integer; X: PSingle; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_strmv';

procedure cblas_stbmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; K: Integer; A: PSingle; lda: Integer; X: PSingle; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_stbmv';

procedure cblas_stpmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; Ap: PSingle; X: PSingle; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_stpmv';

procedure cblas_strsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; A: PSingle; lda: Integer; X: PSingle; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_strsv';

procedure cblas_stbsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; K: Integer; A: PSingle; lda: Integer; X: PSingle; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_stbsv';

procedure cblas_stpsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; Ap: PSingle; X: PSingle; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_stpsv';

procedure cblas_dgemv(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: Integer; N: Integer; alpha: Double; A: PDouble; lda: Integer; X: PDouble; incX: Integer; beta: Double; Y: PDouble; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dgemv';

procedure cblas_dgbmv(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: Integer; N: Integer; KL: Integer; KU: Integer; alpha: Double; A: PDouble; lda: Integer; X: PDouble; incX: Integer; beta: Double; Y: PDouble; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dgbmv';

procedure cblas_dtrmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; A: PDouble; lda: Integer; X: PDouble; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dtrmv';

procedure cblas_dtbmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; K: Integer; A: PDouble; lda: Integer; X: PDouble; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dtbmv';

procedure cblas_dtpmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; Ap: PDouble; X: PDouble; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dtpmv';

procedure cblas_dtrsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; A: PDouble; lda: Integer; X: PDouble; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dtrsv';

procedure cblas_dtbsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; K: Integer; A: PDouble; lda: Integer; X: PDouble; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dtbsv';

procedure cblas_dtpsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; Ap: PDouble; X: PDouble; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dtpsv';

procedure cblas_cgemv(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cgemv';

procedure cblas_cgbmv(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: Integer; N: Integer; KL: Integer; KU: Integer; alpha: Pointer; A: Pointer; lda: Integer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cgbmv';

procedure cblas_ctrmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; A: Pointer; lda: Integer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ctrmv';

procedure cblas_ctbmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; K: Integer; A: Pointer; lda: Integer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ctbmv';

procedure cblas_ctpmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; Ap: Pointer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ctpmv';

procedure cblas_ctrsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; A: Pointer; lda: Integer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ctrsv';

procedure cblas_ctbsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; K: Integer; A: Pointer; lda: Integer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ctbsv';

procedure cblas_ctpsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; Ap: Pointer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ctpsv';

procedure cblas_zgemv(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zgemv';

procedure cblas_zgbmv(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: Integer; N: Integer; KL: Integer; KU: Integer; alpha: Pointer; A: Pointer; lda: Integer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zgbmv';

procedure cblas_ztrmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; A: Pointer; lda: Integer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ztrmv';

procedure cblas_ztbmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; K: Integer; A: Pointer; lda: Integer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ztbmv';

procedure cblas_ztpmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; Ap: Pointer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ztpmv';

procedure cblas_ztrsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; A: Pointer; lda: Integer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ztrsv';

procedure cblas_ztbsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; K: Integer; A: Pointer; lda: Integer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ztbsv';

procedure cblas_ztpsv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: Integer; Ap: Pointer; X: Pointer; incX: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ztpsv';

procedure cblas_ssymv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Single; A: PSingle; lda: Integer; X: PSingle; incX: Integer; beta: Single; Y: PSingle; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ssymv';

procedure cblas_ssbmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; K: Integer; alpha: Single; A: PSingle; lda: Integer; X: PSingle; incX: Integer; beta: Single; Y: PSingle; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ssbmv';

procedure cblas_sspmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Single; Ap: PSingle; X: PSingle; incX: Integer; beta: Single; Y: PSingle; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_sspmv';

procedure cblas_sger(order: CBLAS_ORDER; M: Integer; N: Integer; alpha: Single; X: PSingle; incX: Integer; Y: PSingle; incY: Integer; A: PSingle; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_sger';

procedure cblas_ssyr(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Single; X: PSingle; incX: Integer; A: PSingle; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ssyr';

procedure cblas_sspr(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Single; X: PSingle; incX: Integer; Ap: PSingle); cdecl;
  external LIBGSL name _PU + 'cblas_sspr';

procedure cblas_ssyr2(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Single; X: PSingle; incX: Integer; Y: PSingle; incY: Integer; A: PSingle; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ssyr2';

procedure cblas_sspr2(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Single; X: PSingle; incX: Integer; Y: PSingle; incY: Integer; A: PSingle); cdecl;
  external LIBGSL name _PU + 'cblas_sspr2';

procedure cblas_dsymv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Double; A: PDouble; lda: Integer; X: PDouble; incX: Integer; beta: Double; Y: PDouble; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dsymv';

procedure cblas_dsbmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; K: Integer; alpha: Double; A: PDouble; lda: Integer; X: PDouble; incX: Integer; beta: Double; Y: PDouble; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dsbmv';

procedure cblas_dspmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Double; Ap: PDouble; X: PDouble; incX: Integer; beta: Double; Y: PDouble; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dspmv';

procedure cblas_dger(order: CBLAS_ORDER; M: Integer; N: Integer; alpha: Double; X: PDouble; incX: Integer; Y: PDouble; incY: Integer; A: PDouble; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dger';

procedure cblas_dsyr(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Double; X: PDouble; incX: Integer; A: PDouble; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dsyr';

procedure cblas_dspr(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Double; X: PDouble; incX: Integer; Ap: PDouble); cdecl;
  external LIBGSL name _PU + 'cblas_dspr';

procedure cblas_dsyr2(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Double; X: PDouble; incX: Integer; Y: PDouble; incY: Integer; A: PDouble; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dsyr2';

procedure cblas_dspr2(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Double; X: PDouble; incX: Integer; Y: PDouble; incY: Integer; A: PDouble); cdecl;
  external LIBGSL name _PU + 'cblas_dspr2';

procedure cblas_chemv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_chemv';

procedure cblas_chbmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_chbmv';

procedure cblas_chpmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Pointer; Ap: Pointer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_chpmv';

procedure cblas_cgeru(order: CBLAS_ORDER; M: Integer; N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; A: Pointer; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cgeru';

procedure cblas_cgerc(order: CBLAS_ORDER; M: Integer; N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; A: Pointer; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cgerc';

procedure cblas_cher(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Single; X: Pointer; incX: Integer; A: Pointer; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cher';

procedure cblas_chpr(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Single; X: Pointer; incX: Integer; A: Pointer); cdecl;
  external LIBGSL name _PU + 'cblas_chpr';

procedure cblas_cher2(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; A: Pointer; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cher2';

procedure cblas_chpr2(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; Ap: Pointer); cdecl;
  external LIBGSL name _PU + 'cblas_chpr2';

procedure cblas_zhemv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zhemv';

procedure cblas_zhbmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zhbmv';

procedure cblas_zhpmv(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Pointer; Ap: Pointer; X: Pointer; incX: Integer; beta: Pointer; Y: Pointer; incY: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zhpmv';

procedure cblas_zgeru(order: CBLAS_ORDER; M: Integer; N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; A: Pointer; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zgeru';

procedure cblas_zgerc(order: CBLAS_ORDER; M: Integer; N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; A: Pointer; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zgerc';

procedure cblas_zher(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Double; X: Pointer; incX: Integer; A: Pointer; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zher';

procedure cblas_zhpr(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Double; X: Pointer; incX: Integer; A: Pointer); cdecl;
  external LIBGSL name _PU + 'cblas_zhpr';

procedure cblas_zher2(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; A: Pointer; lda: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zher2';

procedure cblas_zhpr2(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: Integer; alpha: Pointer; X: Pointer; incX: Integer; Y: Pointer; incY: Integer; Ap: Pointer); cdecl;
  external LIBGSL name _PU + 'cblas_zhpr2';

procedure cblas_sgemm(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: Integer; N: Integer; K: Integer; alpha: Single; A: PSingle; lda: Integer; B: PSingle; ldb: Integer; beta: Single; C: PSingle; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_sgemm';

procedure cblas_ssymm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: Integer; N: Integer; alpha: Single; A: PSingle; lda: Integer; B: PSingle; ldb: Integer; beta: Single; C: PSingle; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ssymm';

procedure cblas_ssyrk(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Single; A: PSingle; lda: Integer; beta: Single; C: PSingle; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ssyrk';

procedure cblas_ssyr2k(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Single; A: PSingle; lda: Integer; B: PSingle; ldb: Integer; beta: Single; C: PSingle; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ssyr2k';

procedure cblas_strmm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: Integer; N: Integer; alpha: Single; A: PSingle; lda: Integer; B: PSingle; ldb: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_strmm';

procedure cblas_strsm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: Integer; N: Integer; alpha: Single; A: PSingle; lda: Integer; B: PSingle; ldb: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_strsm';

procedure cblas_dgemm(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: Integer; N: Integer; K: Integer; alpha: Double; A: PDouble; lda: Integer; B: PDouble; ldb: Integer; beta: Double; C: PDouble; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dgemm';

procedure cblas_dsymm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: Integer; N: Integer; alpha: Double; A: PDouble; lda: Integer; B: PDouble; ldb: Integer; beta: Double; C: PDouble; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dsymm';

procedure cblas_dsyrk(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Double; A: PDouble; lda: Integer; beta: Double; C: PDouble; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dsyrk';

procedure cblas_dsyr2k(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Double; A: PDouble; lda: Integer; B: PDouble; ldb: Integer; beta: Double; C: PDouble; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dsyr2k';

procedure cblas_dtrmm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: Integer; N: Integer; alpha: Double; A: PDouble; lda: Integer; B: PDouble; ldb: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dtrmm';

procedure cblas_dtrsm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: Integer; N: Integer; alpha: Double; A: PDouble; lda: Integer; B: PDouble; ldb: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_dtrsm';

procedure cblas_cgemm(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: Integer; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cgemm';

procedure cblas_csymm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_csymm';

procedure cblas_csyrk(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_csyrk';

procedure cblas_csyr2k(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_csyr2k';

procedure cblas_ctrmm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ctrmm';

procedure cblas_ctrsm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ctrsm';

procedure cblas_zgemm(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: Integer; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zgemm';

procedure cblas_zsymm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zsymm';

procedure cblas_zsyrk(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zsyrk';

procedure cblas_zsyr2k(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zsyr2k';

procedure cblas_ztrmm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ztrmm';

procedure cblas_ztrsm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_ztrsm';

procedure cblas_chemm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_chemm';

procedure cblas_cherk(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Single; A: Pointer; lda: Integer; beta: Single; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cherk';

procedure cblas_cher2k(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Single; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_cher2k';

procedure cblas_zhemm(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: Integer; N: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Pointer; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zhemm';

procedure cblas_zherk(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Double; A: Pointer; lda: Integer; beta: Double; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zherk';

procedure cblas_zher2k(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: Integer; K: Integer; alpha: Pointer; A: Pointer; lda: Integer; B: Pointer; ldb: Integer; beta: Double; C: Pointer; ldc: Integer); cdecl;
  external LIBGSL name _PU + 'cblas_zher2k';

procedure cblas_xerbla(p: Integer; rout: PUTF8Char; form: PUTF8Char) varargs; cdecl;
  external LIBGSL name _PU + 'cblas_xerbla';

function gsl_blas_sdsdot(alpha: Single; X: Pgsl_vector_float; Y: Pgsl_vector_float; result: PSingle): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_sdsdot';

function gsl_blas_dsdot(X: Pgsl_vector_float; Y: Pgsl_vector_float; result: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dsdot';

function gsl_blas_sdot(X: Pgsl_vector_float; Y: Pgsl_vector_float; result: PSingle): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_sdot';

function gsl_blas_ddot(X: Pgsl_vector; Y: Pgsl_vector; result: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ddot';

function gsl_blas_cdotu(X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; dotu: Pgsl_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cdotu';

function gsl_blas_cdotc(X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; dotc: Pgsl_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cdotc';

function gsl_blas_zdotu(X: Pgsl_vector_complex; Y: Pgsl_vector_complex; dotu: Pgsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zdotu';

function gsl_blas_zdotc(X: Pgsl_vector_complex; Y: Pgsl_vector_complex; dotc: Pgsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zdotc';

function gsl_blas_snrm2(X: Pgsl_vector_float): Single; cdecl;
  external LIBGSL name _PU + 'gsl_blas_snrm2';

function gsl_blas_sasum(X: Pgsl_vector_float): Single; cdecl;
  external LIBGSL name _PU + 'gsl_blas_sasum';

function gsl_blas_dnrm2(X: Pgsl_vector): Double; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dnrm2';

function gsl_blas_dasum(X: Pgsl_vector): Double; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dasum';

function gsl_blas_scnrm2(X: Pgsl_vector_complex_float): Single; cdecl;
  external LIBGSL name _PU + 'gsl_blas_scnrm2';

function gsl_blas_scasum(X: Pgsl_vector_complex_float): Single; cdecl;
  external LIBGSL name _PU + 'gsl_blas_scasum';

function gsl_blas_dznrm2(X: Pgsl_vector_complex): Double; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dznrm2';

function gsl_blas_dzasum(X: Pgsl_vector_complex): Double; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dzasum';

function gsl_blas_isamax(X: Pgsl_vector_float): CBLAS_INDEX_t; cdecl;
  external LIBGSL name _PU + 'gsl_blas_isamax';

function gsl_blas_idamax(X: Pgsl_vector): CBLAS_INDEX_t; cdecl;
  external LIBGSL name _PU + 'gsl_blas_idamax';

function gsl_blas_icamax(X: Pgsl_vector_complex_float): CBLAS_INDEX_t; cdecl;
  external LIBGSL name _PU + 'gsl_blas_icamax';

function gsl_blas_izamax(X: Pgsl_vector_complex): CBLAS_INDEX_t; cdecl;
  external LIBGSL name _PU + 'gsl_blas_izamax';

function gsl_blas_sswap(X: Pgsl_vector_float; Y: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_sswap';

function gsl_blas_scopy(X: Pgsl_vector_float; Y: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_scopy';

function gsl_blas_saxpy(alpha: Single; X: Pgsl_vector_float; Y: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_saxpy';

function gsl_blas_dswap(X: Pgsl_vector; Y: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dswap';

function gsl_blas_dcopy(X: Pgsl_vector; Y: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dcopy';

function gsl_blas_daxpy(alpha: Double; X: Pgsl_vector; Y: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_daxpy';

function gsl_blas_cswap(X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cswap';

function gsl_blas_ccopy(X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ccopy';

function gsl_blas_caxpy(alpha: gsl_complex_float; X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_caxpy';

function gsl_blas_zswap(X: Pgsl_vector_complex; Y: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zswap';

function gsl_blas_zcopy(X: Pgsl_vector_complex; Y: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zcopy';

function gsl_blas_zaxpy(alpha: gsl_complex; X: Pgsl_vector_complex; Y: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zaxpy';

function gsl_blas_srotg(a: PSingle; b: PSingle; c: PSingle; s: PSingle): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_srotg';

function gsl_blas_srotmg(d1: PSingle; d2: PSingle; b1: PSingle; b2: Single; P: PSingle): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_srotmg';

function gsl_blas_srot(X: Pgsl_vector_float; Y: Pgsl_vector_float; c: Single; s: Single): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_srot';

function gsl_blas_srotm(X: Pgsl_vector_float; Y: Pgsl_vector_float; P: PSingle): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_srotm';

function gsl_blas_drotg(a: PDouble; b: PDouble; c: PDouble; s: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_drotg';

function gsl_blas_drotmg(d1: PDouble; d2: PDouble; b1: PDouble; b2: Double; P: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_drotmg';

function gsl_blas_drot(X: Pgsl_vector; Y: Pgsl_vector; c: Double; s: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_drot';

function gsl_blas_drotm(X: Pgsl_vector; Y: Pgsl_vector; P: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_drotm';

procedure gsl_blas_sscal(alpha: Single; X: Pgsl_vector_float); cdecl;
  external LIBGSL name _PU + 'gsl_blas_sscal';

procedure gsl_blas_dscal(alpha: Double; X: Pgsl_vector); cdecl;
  external LIBGSL name _PU + 'gsl_blas_dscal';

procedure gsl_blas_cscal(alpha: gsl_complex_float; X: Pgsl_vector_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_blas_cscal';

procedure gsl_blas_zscal(alpha: gsl_complex; X: Pgsl_vector_complex); cdecl;
  external LIBGSL name _PU + 'gsl_blas_zscal';

procedure gsl_blas_csscal(alpha: Single; X: Pgsl_vector_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_blas_csscal';

procedure gsl_blas_zdscal(alpha: Double; X: Pgsl_vector_complex); cdecl;
  external LIBGSL name _PU + 'gsl_blas_zdscal';

function gsl_blas_sgemv(TransA: CBLAS_TRANSPOSE_t; alpha: Single; A: Pgsl_matrix_float; X: Pgsl_vector_float; beta: Single; Y: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_sgemv';

function gsl_blas_strmv(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; A: Pgsl_matrix_float; X: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_strmv';

function gsl_blas_strsv(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; A: Pgsl_matrix_float; X: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_strsv';

function gsl_blas_dgemv(TransA: CBLAS_TRANSPOSE_t; alpha: Double; A: Pgsl_matrix; X: Pgsl_vector; beta: Double; Y: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dgemv';

function gsl_blas_dtrmv(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; A: Pgsl_matrix; X: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dtrmv';

function gsl_blas_dtrsv(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; A: Pgsl_matrix; X: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dtrsv';

function gsl_blas_cgemv(TransA: CBLAS_TRANSPOSE_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; X: Pgsl_vector_complex_float; beta: gsl_complex_float; Y: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cgemv';

function gsl_blas_ctrmv(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; A: Pgsl_matrix_complex_float; X: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ctrmv';

function gsl_blas_ctrsv(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; A: Pgsl_matrix_complex_float; X: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ctrsv';

function gsl_blas_zgemv(TransA: CBLAS_TRANSPOSE_t; alpha: gsl_complex; A: Pgsl_matrix_complex; X: Pgsl_vector_complex; beta: gsl_complex; Y: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zgemv';

function gsl_blas_ztrmv(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; A: Pgsl_matrix_complex; X: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ztrmv';

function gsl_blas_ztrsv(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; A: Pgsl_matrix_complex; X: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ztrsv';

function gsl_blas_ssymv(Uplo: CBLAS_UPLO_t; alpha: Single; A: Pgsl_matrix_float; X: Pgsl_vector_float; beta: Single; Y: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ssymv';

function gsl_blas_sger(alpha: Single; X: Pgsl_vector_float; Y: Pgsl_vector_float; A: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_sger';

function gsl_blas_ssyr(Uplo: CBLAS_UPLO_t; alpha: Single; X: Pgsl_vector_float; A: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ssyr';

function gsl_blas_ssyr2(Uplo: CBLAS_UPLO_t; alpha: Single; X: Pgsl_vector_float; Y: Pgsl_vector_float; A: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ssyr2';

function gsl_blas_dsymv(Uplo: CBLAS_UPLO_t; alpha: Double; A: Pgsl_matrix; X: Pgsl_vector; beta: Double; Y: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dsymv';

function gsl_blas_dger(alpha: Double; X: Pgsl_vector; Y: Pgsl_vector; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dger';

function gsl_blas_dsyr(Uplo: CBLAS_UPLO_t; alpha: Double; X: Pgsl_vector; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dsyr';

function gsl_blas_dsyr2(Uplo: CBLAS_UPLO_t; alpha: Double; X: Pgsl_vector; Y: Pgsl_vector; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dsyr2';

function gsl_blas_chemv(Uplo: CBLAS_UPLO_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; X: Pgsl_vector_complex_float; beta: gsl_complex_float; Y: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_chemv';

function gsl_blas_cgeru(alpha: gsl_complex_float; X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; A: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cgeru';

function gsl_blas_cgerc(alpha: gsl_complex_float; X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; A: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cgerc';

function gsl_blas_cher(Uplo: CBLAS_UPLO_t; alpha: Single; X: Pgsl_vector_complex_float; A: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cher';

function gsl_blas_cher2(Uplo: CBLAS_UPLO_t; alpha: gsl_complex_float; X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; A: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cher2';

function gsl_blas_zhemv(Uplo: CBLAS_UPLO_t; alpha: gsl_complex; A: Pgsl_matrix_complex; X: Pgsl_vector_complex; beta: gsl_complex; Y: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zhemv';

function gsl_blas_zgeru(alpha: gsl_complex; X: Pgsl_vector_complex; Y: Pgsl_vector_complex; A: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zgeru';

function gsl_blas_zgerc(alpha: gsl_complex; X: Pgsl_vector_complex; Y: Pgsl_vector_complex; A: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zgerc';

function gsl_blas_zher(Uplo: CBLAS_UPLO_t; alpha: Double; X: Pgsl_vector_complex; A: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zher';

function gsl_blas_zher2(Uplo: CBLAS_UPLO_t; alpha: gsl_complex; X: Pgsl_vector_complex; Y: Pgsl_vector_complex; A: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zher2';

function gsl_blas_sgemm(TransA: CBLAS_TRANSPOSE_t; TransB: CBLAS_TRANSPOSE_t; alpha: Single; A: Pgsl_matrix_float; B: Pgsl_matrix_float; beta: Single; C: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_sgemm';

function gsl_blas_ssymm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: Single; A: Pgsl_matrix_float; B: Pgsl_matrix_float; beta: Single; C: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ssymm';

function gsl_blas_ssyrk(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: Single; A: Pgsl_matrix_float; beta: Single; C: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ssyrk';

function gsl_blas_ssyr2k(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: Single; A: Pgsl_matrix_float; B: Pgsl_matrix_float; beta: Single; C: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ssyr2k';

function gsl_blas_strmm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: Single; A: Pgsl_matrix_float; B: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_strmm';

function gsl_blas_strsm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: Single; A: Pgsl_matrix_float; B: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_strsm';

function gsl_blas_dgemm(TransA: CBLAS_TRANSPOSE_t; TransB: CBLAS_TRANSPOSE_t; alpha: Double; A: Pgsl_matrix; B: Pgsl_matrix; beta: Double; C: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dgemm';

function gsl_blas_dsymm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: Double; A: Pgsl_matrix; B: Pgsl_matrix; beta: Double; C: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dsymm';

function gsl_blas_dsyrk(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: Double; A: Pgsl_matrix; beta: Double; C: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dsyrk';

function gsl_blas_dsyr2k(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: Double; A: Pgsl_matrix; B: Pgsl_matrix; beta: Double; C: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dsyr2k';

function gsl_blas_dtrmm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: Double; A: Pgsl_matrix; B: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dtrmm';

function gsl_blas_dtrsm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: Double; A: Pgsl_matrix; B: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_dtrsm';

function gsl_blas_cgemm(TransA: CBLAS_TRANSPOSE_t; TransB: CBLAS_TRANSPOSE_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float; beta: gsl_complex_float; C: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cgemm';

function gsl_blas_csymm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float; beta: gsl_complex_float; C: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_csymm';

function gsl_blas_csyrk(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; beta: gsl_complex_float; C: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_csyrk';

function gsl_blas_csyr2k(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float; beta: gsl_complex_float; C: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_csyr2k';

function gsl_blas_ctrmm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ctrmm';

function gsl_blas_ctrsm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ctrsm';

function gsl_blas_zgemm(TransA: CBLAS_TRANSPOSE_t; TransB: CBLAS_TRANSPOSE_t; alpha: gsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex; beta: gsl_complex; C: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zgemm';

function gsl_blas_zsymm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: gsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex; beta: gsl_complex; C: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zsymm';

function gsl_blas_zsyrk(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex; A: Pgsl_matrix_complex; beta: gsl_complex; C: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zsyrk';

function gsl_blas_zsyr2k(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex; beta: gsl_complex; C: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zsyr2k';

function gsl_blas_ztrmm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: gsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ztrmm';

function gsl_blas_ztrsm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: gsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_ztrsm';

function gsl_blas_chemm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float; beta: gsl_complex_float; C: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_chemm';

function gsl_blas_cherk(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: Single; A: Pgsl_matrix_complex_float; beta: Single; C: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cherk';

function gsl_blas_cher2k(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float; beta: Single; C: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_cher2k';

function gsl_blas_zhemm(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: gsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex; beta: gsl_complex; C: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zhemm';

function gsl_blas_zherk(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: Double; A: Pgsl_matrix_complex; beta: Double; C: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zherk';

function gsl_blas_zher2k(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex; beta: Double; C: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_blas_zher2k';

function gsl_log1p(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_log1p';

function gsl_expm1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_expm1';

function gsl_hypot(x: Double; y: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_hypot';

function gsl_hypot3(x: Double; y: Double; z: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_hypot3';

function gsl_acosh(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_acosh';

function gsl_asinh(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_asinh';

function gsl_atanh(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_atanh';

function gsl_isnan(x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_isnan';

function gsl_isinf(x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_isinf';

function gsl_finite(x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_finite';

function gsl_nan(): Double; cdecl;
  external LIBGSL name _PU + 'gsl_nan';

function gsl_posinf(): Double; cdecl;
  external LIBGSL name _PU + 'gsl_posinf';

function gsl_neginf(): Double; cdecl;
  external LIBGSL name _PU + 'gsl_neginf';

function gsl_fdiv(x: Double; y: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_fdiv';

function gsl_coerce_double(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_coerce_double';

function gsl_coerce_float(x: Single): Single; cdecl;
  external LIBGSL name _PU + 'gsl_coerce_float';

function gsl_coerce_long_double(x: Extended): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_coerce_long_double';

function gsl_ldexp(x: Double; e: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ldexp';

function gsl_frexp(x: Double; e: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_frexp';

function gsl_fcmp(x1: Double; x2: Double; epsilon: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fcmp';

function gsl_pow_2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_2';

function gsl_pow_3(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_3';

function gsl_pow_4(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_4';

function gsl_pow_5(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_5';

function gsl_pow_6(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_6';

function gsl_pow_7(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_7';

function gsl_pow_8(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_8';

function gsl_pow_9(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_9';

function gsl_pow_int(x: Double; n: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_int';

function gsl_pow_uint(x: Double; n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_pow_uint';

function gsl_max(a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_max';

function gsl_min(a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_min';

function gsl_bspline_alloc(k: NativeUInt; nbreak: NativeUInt): Pgsl_bspline_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_alloc';

procedure gsl_bspline_free(w: Pgsl_bspline_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_bspline_free';

function gsl_bspline_ncoeffs(w: Pgsl_bspline_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_ncoeffs';

function gsl_bspline_order(w: Pgsl_bspline_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_order';

function gsl_bspline_nbreak(w: Pgsl_bspline_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_nbreak';

function gsl_bspline_breakpoint(i: NativeUInt; w: Pgsl_bspline_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_breakpoint';

function gsl_bspline_greville_abscissa(i: NativeUInt; w: Pgsl_bspline_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_greville_abscissa';

function gsl_bspline_knots(breakpts: Pgsl_vector; w: Pgsl_bspline_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_knots';

function gsl_bspline_knots_uniform(a: Double; b: Double; w: Pgsl_bspline_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_knots_uniform';

function gsl_bspline_knots_greville(abscissae: Pgsl_vector; w: Pgsl_bspline_workspace; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_knots_greville';

function gsl_bspline_eval(x: Double; B: Pgsl_vector; w: Pgsl_bspline_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_eval';

function gsl_bspline_eval_nonzero(x: Double; Bk: Pgsl_vector; istart: PNativeUInt; iend: PNativeUInt; w: Pgsl_bspline_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_eval_nonzero';

function gsl_bspline_deriv_eval(x: Double; nderiv: NativeUInt; dB: Pgsl_matrix; w: Pgsl_bspline_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_deriv_eval';

function gsl_bspline_deriv_eval_nonzero(x: Double; nderiv: NativeUInt; dB: Pgsl_matrix; istart: PNativeUInt; iend: PNativeUInt; w: Pgsl_bspline_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_bspline_deriv_eval_nonzero';

function gsl_bst_alloc(T: Pgsl_bst_type; allocator: Pgsl_bst_allocator; compare: Pgsl_bst_cmp_function; params: Pointer): Pgsl_bst_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_bst_alloc';

procedure gsl_bst_free(w: Pgsl_bst_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_bst_free';

function gsl_bst_empty(w: Pgsl_bst_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_empty';

function gsl_bst_insert(item: Pointer; w: Pgsl_bst_workspace): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_insert';

function gsl_bst_find(item: Pointer; w: Pgsl_bst_workspace): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_find';

function gsl_bst_remove(item: Pointer; w: Pgsl_bst_workspace): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_remove';

function gsl_bst_nodes(w: Pgsl_bst_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_bst_nodes';

function gsl_bst_node_size(w: Pgsl_bst_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_bst_node_size';

function gsl_bst_name(w: Pgsl_bst_workspace): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_bst_name';

function gsl_bst_trav_init(trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_init';

function gsl_bst_trav_first(trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_first';

function gsl_bst_trav_last(trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_last';

function gsl_bst_trav_find(item: Pointer; trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_find';

function gsl_bst_trav_insert(item: Pointer; trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_insert';

function gsl_bst_trav_copy(dest: Pgsl_bst_trav; src: Pgsl_bst_trav): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_copy';

function gsl_bst_trav_next(trav: Pgsl_bst_trav): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_next';

function gsl_bst_trav_prev(trav: Pgsl_bst_trav): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_prev';

function gsl_bst_trav_cur(trav: Pgsl_bst_trav): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_cur';

function gsl_bst_trav_replace(trav: Pgsl_bst_trav; new_item: Pointer): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_bst_trav_replace';

function gsl_cdf_ugaussian_P(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_ugaussian_P';

function gsl_cdf_ugaussian_Q(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_ugaussian_Q';

function gsl_cdf_ugaussian_Pinv(P: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_ugaussian_Pinv';

function gsl_cdf_ugaussian_Qinv(Q: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_ugaussian_Qinv';

function gsl_cdf_gaussian_P(x: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gaussian_P';

function gsl_cdf_gaussian_Q(x: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gaussian_Q';

function gsl_cdf_gaussian_Pinv(P: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gaussian_Pinv';

function gsl_cdf_gaussian_Qinv(Q: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gaussian_Qinv';

function gsl_cdf_gamma_P(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gamma_P';

function gsl_cdf_gamma_Q(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gamma_Q';

function gsl_cdf_gamma_Pinv(P: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gamma_Pinv';

function gsl_cdf_gamma_Qinv(Q: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gamma_Qinv';

function gsl_cdf_cauchy_P(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_cauchy_P';

function gsl_cdf_cauchy_Q(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_cauchy_Q';

function gsl_cdf_cauchy_Pinv(P: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_cauchy_Pinv';

function gsl_cdf_cauchy_Qinv(Q: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_cauchy_Qinv';

function gsl_cdf_laplace_P(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_laplace_P';

function gsl_cdf_laplace_Q(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_laplace_Q';

function gsl_cdf_laplace_Pinv(P: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_laplace_Pinv';

function gsl_cdf_laplace_Qinv(Q: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_laplace_Qinv';

function gsl_cdf_rayleigh_P(x: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_rayleigh_P';

function gsl_cdf_rayleigh_Q(x: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_rayleigh_Q';

function gsl_cdf_rayleigh_Pinv(P: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_rayleigh_Pinv';

function gsl_cdf_rayleigh_Qinv(Q: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_rayleigh_Qinv';

function gsl_cdf_chisq_P(x: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_chisq_P';

function gsl_cdf_chisq_Q(x: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_chisq_Q';

function gsl_cdf_chisq_Pinv(P: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_chisq_Pinv';

function gsl_cdf_chisq_Qinv(Q: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_chisq_Qinv';

function gsl_cdf_exponential_P(x: Double; mu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_exponential_P';

function gsl_cdf_exponential_Q(x: Double; mu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_exponential_Q';

function gsl_cdf_exponential_Pinv(P: Double; mu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_exponential_Pinv';

function gsl_cdf_exponential_Qinv(Q: Double; mu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_exponential_Qinv';

function gsl_cdf_exppow_P(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_exppow_P';

function gsl_cdf_exppow_Q(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_exppow_Q';

function gsl_cdf_tdist_P(x: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_tdist_P';

function gsl_cdf_tdist_Q(x: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_tdist_Q';

function gsl_cdf_tdist_Pinv(P: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_tdist_Pinv';

function gsl_cdf_tdist_Qinv(Q: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_tdist_Qinv';

function gsl_cdf_fdist_P(x: Double; nu1: Double; nu2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_fdist_P';

function gsl_cdf_fdist_Q(x: Double; nu1: Double; nu2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_fdist_Q';

function gsl_cdf_fdist_Pinv(P: Double; nu1: Double; nu2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_fdist_Pinv';

function gsl_cdf_fdist_Qinv(Q: Double; nu1: Double; nu2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_fdist_Qinv';

function gsl_cdf_beta_P(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_beta_P';

function gsl_cdf_beta_Q(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_beta_Q';

function gsl_cdf_beta_Pinv(P: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_beta_Pinv';

function gsl_cdf_beta_Qinv(Q: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_beta_Qinv';

function gsl_cdf_flat_P(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_flat_P';

function gsl_cdf_flat_Q(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_flat_Q';

function gsl_cdf_flat_Pinv(P: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_flat_Pinv';

function gsl_cdf_flat_Qinv(Q: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_flat_Qinv';

function gsl_cdf_lognormal_P(x: Double; zeta: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_lognormal_P';

function gsl_cdf_lognormal_Q(x: Double; zeta: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_lognormal_Q';

function gsl_cdf_lognormal_Pinv(P: Double; zeta: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_lognormal_Pinv';

function gsl_cdf_lognormal_Qinv(Q: Double; zeta: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_lognormal_Qinv';

function gsl_cdf_gumbel1_P(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gumbel1_P';

function gsl_cdf_gumbel1_Q(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gumbel1_Q';

function gsl_cdf_gumbel1_Pinv(P: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gumbel1_Pinv';

function gsl_cdf_gumbel1_Qinv(Q: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gumbel1_Qinv';

function gsl_cdf_gumbel2_P(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gumbel2_P';

function gsl_cdf_gumbel2_Q(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gumbel2_Q';

function gsl_cdf_gumbel2_Pinv(P: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gumbel2_Pinv';

function gsl_cdf_gumbel2_Qinv(Q: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_gumbel2_Qinv';

function gsl_cdf_weibull_P(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_weibull_P';

function gsl_cdf_weibull_Q(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_weibull_Q';

function gsl_cdf_weibull_Pinv(P: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_weibull_Pinv';

function gsl_cdf_weibull_Qinv(Q: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_weibull_Qinv';

function gsl_cdf_pareto_P(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_pareto_P';

function gsl_cdf_pareto_Q(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_pareto_Q';

function gsl_cdf_pareto_Pinv(P: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_pareto_Pinv';

function gsl_cdf_pareto_Qinv(Q: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_pareto_Qinv';

function gsl_cdf_logistic_P(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_logistic_P';

function gsl_cdf_logistic_Q(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_logistic_Q';

function gsl_cdf_logistic_Pinv(P: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_logistic_Pinv';

function gsl_cdf_logistic_Qinv(Q: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_logistic_Qinv';

function gsl_cdf_binomial_P(k: Cardinal; p: Double; n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_binomial_P';

function gsl_cdf_binomial_Q(k: Cardinal; p: Double; n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_binomial_Q';

function gsl_cdf_poisson_P(k: Cardinal; mu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_poisson_P';

function gsl_cdf_poisson_Q(k: Cardinal; mu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_poisson_Q';

function gsl_cdf_geometric_P(k: Cardinal; p: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_geometric_P';

function gsl_cdf_geometric_Q(k: Cardinal; p: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_geometric_Q';

function gsl_cdf_negative_binomial_P(k: Cardinal; p: Double; n: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_negative_binomial_P';

function gsl_cdf_negative_binomial_Q(k: Cardinal; p: Double; n: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_negative_binomial_Q';

function gsl_cdf_pascal_P(k: Cardinal; p: Double; n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_pascal_P';

function gsl_cdf_pascal_Q(k: Cardinal; p: Double; n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_pascal_Q';

function gsl_cdf_hypergeometric_P(k: Cardinal; n1: Cardinal; n2: Cardinal; t: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_hypergeometric_P';

function gsl_cdf_hypergeometric_Q(k: Cardinal; n1: Cardinal; n2: Cardinal; t: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cdf_hypergeometric_Q';

function gsl_cheb_alloc(order: NativeUInt): Pgsl_cheb_series; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_alloc';

procedure gsl_cheb_free(cs: Pgsl_cheb_series); cdecl;
  external LIBGSL name _PU + 'gsl_cheb_free';

function gsl_cheb_init(cs: Pgsl_cheb_series; func: Pgsl_function; a: Double; b: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_init';

function gsl_cheb_order(cs: Pgsl_cheb_series): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_order';

function gsl_cheb_size(cs: Pgsl_cheb_series): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_size';

function gsl_cheb_coeffs(cs: Pgsl_cheb_series): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_coeffs';

function gsl_cheb_eval(cs: Pgsl_cheb_series; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_eval';

function gsl_cheb_eval_err(cs: Pgsl_cheb_series; x: Double; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_eval_err';

function gsl_cheb_eval_n(cs: Pgsl_cheb_series; order: NativeUInt; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_eval_n';

function gsl_cheb_eval_n_err(cs: Pgsl_cheb_series; order: NativeUInt; x: Double; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_eval_n_err';

function gsl_cheb_eval_mode(cs: Pgsl_cheb_series; x: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_eval_mode';

function gsl_cheb_eval_mode_e(cs: Pgsl_cheb_series; x: Double; mode: gsl_mode_t; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_eval_mode_e';

function gsl_cheb_calc_deriv(deriv: Pgsl_cheb_series; cs: Pgsl_cheb_series): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_calc_deriv';

function gsl_cheb_calc_integ(integ: Pgsl_cheb_series; cs: Pgsl_cheb_series): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_cheb_calc_integ';

function gsl_combination_alloc(n: NativeUInt; k: NativeUInt): Pgsl_combination; cdecl;
  external LIBGSL name _PU + 'gsl_combination_alloc';

function gsl_combination_calloc(n: NativeUInt; k: NativeUInt): Pgsl_combination; cdecl;
  external LIBGSL name _PU + 'gsl_combination_calloc';

procedure gsl_combination_init_first(c: Pgsl_combination); cdecl;
  external LIBGSL name _PU + 'gsl_combination_init_first';

procedure gsl_combination_init_last(c: Pgsl_combination); cdecl;
  external LIBGSL name _PU + 'gsl_combination_init_last';

procedure gsl_combination_free(c: Pgsl_combination); cdecl;
  external LIBGSL name _PU + 'gsl_combination_free';

function gsl_combination_memcpy(dest: Pgsl_combination; src: Pgsl_combination): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_combination_memcpy';

function gsl_combination_fread(stream: PPointer; c: Pgsl_combination): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_combination_fread';

function gsl_combination_fwrite(stream: PPointer; c: Pgsl_combination): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_combination_fwrite';

function gsl_combination_fscanf(stream: PPointer; c: Pgsl_combination): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_combination_fscanf';

function gsl_combination_fprintf(stream: PPointer; c: Pgsl_combination; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_combination_fprintf';

function gsl_combination_n(c: Pgsl_combination): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_combination_n';

function gsl_combination_k(c: Pgsl_combination): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_combination_k';

function gsl_combination_data(c: Pgsl_combination): PNativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_combination_data';

function gsl_combination_valid(c: Pgsl_combination): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_combination_valid';

function gsl_combination_next(c: Pgsl_combination): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_combination_next';

function gsl_combination_prev(c: Pgsl_combination): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_combination_prev';

function gsl_combination_get(c: Pgsl_combination; i: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_combination_get';

function gsl_complex_polar(r: Double; theta: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_polar';

function gsl_complex_rect(x: Double; y: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_rect';

function gsl_complex_arg(z: gsl_complex): Double; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arg';

function gsl_complex_abs(z: gsl_complex): Double; cdecl;
  external LIBGSL name _PU + 'gsl_complex_abs';

function gsl_complex_abs2(z: gsl_complex): Double; cdecl;
  external LIBGSL name _PU + 'gsl_complex_abs2';

function gsl_complex_logabs(z: gsl_complex): Double; cdecl;
  external LIBGSL name _PU + 'gsl_complex_logabs';

function gsl_complex_add(a: gsl_complex; b: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_add';

function gsl_complex_sub(a: gsl_complex; b: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_sub';

function gsl_complex_mul(a: gsl_complex; b: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_mul';

function gsl_complex_div(a: gsl_complex; b: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_div';

function gsl_complex_add_real(a: gsl_complex; x: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_add_real';

function gsl_complex_sub_real(a: gsl_complex; x: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_sub_real';

function gsl_complex_mul_real(a: gsl_complex; x: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_mul_real';

function gsl_complex_div_real(a: gsl_complex; x: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_div_real';

function gsl_complex_add_imag(a: gsl_complex; y: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_add_imag';

function gsl_complex_sub_imag(a: gsl_complex; y: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_sub_imag';

function gsl_complex_mul_imag(a: gsl_complex; y: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_mul_imag';

function gsl_complex_div_imag(a: gsl_complex; y: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_div_imag';

function gsl_complex_conjugate(z: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_conjugate';

function gsl_complex_inverse(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_inverse';

function gsl_complex_negative(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_negative';

function gsl_complex_sqrt(z: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_sqrt';

function gsl_complex_sqrt_real(x: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_sqrt_real';

function gsl_complex_pow(a: gsl_complex; b: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_pow';

function gsl_complex_pow_real(a: gsl_complex; b: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_pow_real';

function gsl_complex_exp(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_exp';

function gsl_complex_log(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_log';

function gsl_complex_log10(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_log10';

function gsl_complex_log_b(a: gsl_complex; b: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_log_b';

function gsl_complex_sin(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_sin';

function gsl_complex_cos(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_cos';

function gsl_complex_sec(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_sec';

function gsl_complex_csc(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_csc';

function gsl_complex_tan(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_tan';

function gsl_complex_cot(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_cot';

function gsl_complex_arcsin(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arcsin';

function gsl_complex_arcsin_real(a: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arcsin_real';

function gsl_complex_arccos(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arccos';

function gsl_complex_arccos_real(a: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arccos_real';

function gsl_complex_arcsec(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arcsec';

function gsl_complex_arcsec_real(a: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arcsec_real';

function gsl_complex_arccsc(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arccsc';

function gsl_complex_arccsc_real(a: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arccsc_real';

function gsl_complex_arctan(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arctan';

function gsl_complex_arccot(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arccot';

function gsl_complex_sinh(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_sinh';

function gsl_complex_cosh(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_cosh';

function gsl_complex_sech(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_sech';

function gsl_complex_csch(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_csch';

function gsl_complex_tanh(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_tanh';

function gsl_complex_coth(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_coth';

function gsl_complex_arcsinh(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arcsinh';

function gsl_complex_arccosh(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arccosh';

function gsl_complex_arccosh_real(a: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arccosh_real';

function gsl_complex_arcsech(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arcsech';

function gsl_complex_arccsch(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arccsch';

function gsl_complex_arctanh(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arctanh';

function gsl_complex_arctanh_real(a: Double): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arctanh_real';

function gsl_complex_arccoth(a: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_arccoth';

function gsl_deriv_central(f: Pgsl_function; x: Double; h: Double; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_deriv_central';

function gsl_deriv_backward(f: Pgsl_function; x: Double; h: Double; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_deriv_backward';

function gsl_deriv_forward(f: Pgsl_function; x: Double; h: Double; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_deriv_forward';

function gsl_dft_complex_forward(data: PDouble; stride: NativeUInt; n: NativeUInt; result: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dft_complex_forward';

function gsl_dft_complex_backward(data: PDouble; stride: NativeUInt; n: NativeUInt; result: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dft_complex_backward';

function gsl_dft_complex_inverse(data: PDouble; stride: NativeUInt; n: NativeUInt; result: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dft_complex_inverse';

function gsl_dft_complex_transform(data: PDouble; stride: NativeUInt; n: NativeUInt; result: PDouble; sign: gsl_fft_direction): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dft_complex_transform';

function gsl_dft_complex_float_forward(data: PSingle; stride: NativeUInt; n: NativeUInt; result: PSingle): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dft_complex_float_forward';

function gsl_dft_complex_float_backward(data: PSingle; stride: NativeUInt; n: NativeUInt; result: PSingle): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dft_complex_float_backward';

function gsl_dft_complex_float_inverse(data: PSingle; stride: NativeUInt; n: NativeUInt; result: PSingle): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dft_complex_float_inverse';

function gsl_dft_complex_float_transform(data: PSingle; stride: NativeUInt; n: NativeUInt; result: PSingle; sign: gsl_fft_direction): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dft_complex_float_transform';

function gsl_dht_alloc(size: NativeUInt): Pgsl_dht; cdecl;
  external LIBGSL name _PU + 'gsl_dht_alloc';

function gsl_dht_new(size: NativeUInt; nu: Double; xmax: Double): Pgsl_dht; cdecl;
  external LIBGSL name _PU + 'gsl_dht_new';

function gsl_dht_init(t: Pgsl_dht; nu: Double; xmax: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dht_init';

function gsl_dht_x_sample(t: Pgsl_dht; n: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_dht_x_sample';

function gsl_dht_k_sample(t: Pgsl_dht; n: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_dht_k_sample';

procedure gsl_dht_free(t: Pgsl_dht); cdecl;
  external LIBGSL name _PU + 'gsl_dht_free';

function gsl_dht_apply(t: Pgsl_dht; f_in: PDouble; f_out: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_dht_apply';

function gsl_diff_central(f: Pgsl_function; x: Double; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_diff_central';

function gsl_diff_backward(f: Pgsl_function; x: Double; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_diff_backward';

function gsl_diff_forward(f: Pgsl_function; x: Double; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_diff_forward';

function gsl_eigen_symm_alloc(n: NativeUInt): Pgsl_eigen_symm_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_symm_alloc';

procedure gsl_eigen_symm_free(w: Pgsl_eigen_symm_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_symm_free';

function gsl_eigen_symm(A: Pgsl_matrix; eval: Pgsl_vector; w: Pgsl_eigen_symm_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_symm';

function gsl_eigen_symmv_alloc(n: NativeUInt): Pgsl_eigen_symmv_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_symmv_alloc';

procedure gsl_eigen_symmv_free(w: Pgsl_eigen_symmv_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_symmv_free';

function gsl_eigen_symmv(A: Pgsl_matrix; eval: Pgsl_vector; evec: Pgsl_matrix; w: Pgsl_eigen_symmv_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_symmv';

function gsl_eigen_herm_alloc(n: NativeUInt): Pgsl_eigen_herm_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_herm_alloc';

procedure gsl_eigen_herm_free(w: Pgsl_eigen_herm_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_herm_free';

function gsl_eigen_herm(A: Pgsl_matrix_complex; eval: Pgsl_vector; w: Pgsl_eigen_herm_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_herm';

function gsl_eigen_hermv_alloc(n: NativeUInt): Pgsl_eigen_hermv_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_hermv_alloc';

procedure gsl_eigen_hermv_free(w: Pgsl_eigen_hermv_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_hermv_free';

function gsl_eigen_hermv(A: Pgsl_matrix_complex; eval: Pgsl_vector; evec: Pgsl_matrix_complex; w: Pgsl_eigen_hermv_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_hermv';

function gsl_eigen_francis_alloc(): Pgsl_eigen_francis_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_francis_alloc';

procedure gsl_eigen_francis_free(w: Pgsl_eigen_francis_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_francis_free';

procedure gsl_eigen_francis_T(compute_t: Integer; w: Pgsl_eigen_francis_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_francis_T';

function gsl_eigen_francis(H: Pgsl_matrix; eval: Pgsl_vector_complex; w: Pgsl_eigen_francis_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_francis';

function gsl_eigen_francis_Z(H: Pgsl_matrix; eval: Pgsl_vector_complex; Z: Pgsl_matrix; w: Pgsl_eigen_francis_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_francis_Z';

function gsl_eigen_nonsymm_alloc(n: NativeUInt): Pgsl_eigen_nonsymm_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymm_alloc';

procedure gsl_eigen_nonsymm_free(w: Pgsl_eigen_nonsymm_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymm_free';

procedure gsl_eigen_nonsymm_params(compute_t: Integer; balance: Integer; w: Pgsl_eigen_nonsymm_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymm_params';

function gsl_eigen_nonsymm(A: Pgsl_matrix; eval: Pgsl_vector_complex; w: Pgsl_eigen_nonsymm_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymm';

function gsl_eigen_nonsymm_Z(A: Pgsl_matrix; eval: Pgsl_vector_complex; Z: Pgsl_matrix; w: Pgsl_eigen_nonsymm_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymm_Z';

function gsl_eigen_nonsymmv_alloc(n: NativeUInt): Pgsl_eigen_nonsymmv_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymmv_alloc';

procedure gsl_eigen_nonsymmv_free(w: Pgsl_eigen_nonsymmv_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymmv_free';

procedure gsl_eigen_nonsymmv_params(balance: Integer; w: Pgsl_eigen_nonsymmv_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymmv_params';

function gsl_eigen_nonsymmv(A: Pgsl_matrix; eval: Pgsl_vector_complex; evec: Pgsl_matrix_complex; w: Pgsl_eigen_nonsymmv_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymmv';

function gsl_eigen_nonsymmv_Z(A: Pgsl_matrix; eval: Pgsl_vector_complex; evec: Pgsl_matrix_complex; Z: Pgsl_matrix; w: Pgsl_eigen_nonsymmv_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymmv_Z';

function gsl_eigen_gensymm_alloc(n: NativeUInt): Pgsl_eigen_gensymm_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gensymm_alloc';

procedure gsl_eigen_gensymm_free(w: Pgsl_eigen_gensymm_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gensymm_free';

function gsl_eigen_gensymm(A: Pgsl_matrix; B: Pgsl_matrix; eval: Pgsl_vector; w: Pgsl_eigen_gensymm_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gensymm';

function gsl_eigen_gensymm_standardize(A: Pgsl_matrix; B: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gensymm_standardize';

function gsl_eigen_gensymmv_alloc(n: NativeUInt): Pgsl_eigen_gensymmv_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gensymmv_alloc';

procedure gsl_eigen_gensymmv_free(w: Pgsl_eigen_gensymmv_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gensymmv_free';

function gsl_eigen_gensymmv(A: Pgsl_matrix; B: Pgsl_matrix; eval: Pgsl_vector; evec: Pgsl_matrix; w: Pgsl_eigen_gensymmv_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gensymmv';

function gsl_eigen_genherm_alloc(n: NativeUInt): Pgsl_eigen_genherm_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genherm_alloc';

procedure gsl_eigen_genherm_free(w: Pgsl_eigen_genherm_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genherm_free';

function gsl_eigen_genherm(A: Pgsl_matrix_complex; B: Pgsl_matrix_complex; eval: Pgsl_vector; w: Pgsl_eigen_genherm_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genherm';

function gsl_eigen_genherm_standardize(A: Pgsl_matrix_complex; B: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genherm_standardize';

function gsl_eigen_genhermv_alloc(n: NativeUInt): Pgsl_eigen_genhermv_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genhermv_alloc';

procedure gsl_eigen_genhermv_free(w: Pgsl_eigen_genhermv_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genhermv_free';

function gsl_eigen_genhermv(A: Pgsl_matrix_complex; B: Pgsl_matrix_complex; eval: Pgsl_vector; evec: Pgsl_matrix_complex; w: Pgsl_eigen_genhermv_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genhermv';

function gsl_eigen_gen_alloc(n: NativeUInt): Pgsl_eigen_gen_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gen_alloc';

procedure gsl_eigen_gen_free(w: Pgsl_eigen_gen_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gen_free';

procedure gsl_eigen_gen_params(compute_s: Integer; compute_t: Integer; balance: Integer; w: Pgsl_eigen_gen_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gen_params';

function gsl_eigen_gen(A: Pgsl_matrix; B: Pgsl_matrix; alpha: Pgsl_vector_complex; beta: Pgsl_vector; w: Pgsl_eigen_gen_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gen';

function gsl_eigen_gen_QZ(A: Pgsl_matrix; B: Pgsl_matrix; alpha: Pgsl_vector_complex; beta: Pgsl_vector; Q: Pgsl_matrix; Z: Pgsl_matrix; w: Pgsl_eigen_gen_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gen_QZ';

function gsl_eigen_genv_alloc(n: NativeUInt): Pgsl_eigen_genv_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genv_alloc';

procedure gsl_eigen_genv_free(w: Pgsl_eigen_genv_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genv_free';

function gsl_eigen_genv(A: Pgsl_matrix; B: Pgsl_matrix; alpha: Pgsl_vector_complex; beta: Pgsl_vector; evec: Pgsl_matrix_complex; w: Pgsl_eigen_genv_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genv';

function gsl_eigen_genv_QZ(A: Pgsl_matrix; B: Pgsl_matrix; alpha: Pgsl_vector_complex; beta: Pgsl_vector; evec: Pgsl_matrix_complex; Q: Pgsl_matrix; Z: Pgsl_matrix; w: Pgsl_eigen_genv_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genv_QZ';

function gsl_eigen_symmv_sort(eval: Pgsl_vector; evec: Pgsl_matrix; sort_type: gsl_eigen_sort_t): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_symmv_sort';

function gsl_eigen_hermv_sort(eval: Pgsl_vector; evec: Pgsl_matrix_complex; sort_type: gsl_eigen_sort_t): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_hermv_sort';

function gsl_eigen_nonsymmv_sort(eval: Pgsl_vector_complex; evec: Pgsl_matrix_complex; sort_type: gsl_eigen_sort_t): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_nonsymmv_sort';

function gsl_eigen_gensymmv_sort(eval: Pgsl_vector; evec: Pgsl_matrix; sort_type: gsl_eigen_sort_t): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_gensymmv_sort';

function gsl_eigen_genhermv_sort(eval: Pgsl_vector; evec: Pgsl_matrix_complex; sort_type: gsl_eigen_sort_t): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genhermv_sort';

function gsl_eigen_genv_sort(alpha: Pgsl_vector_complex; beta: Pgsl_vector; evec: Pgsl_matrix_complex; sort_type: gsl_eigen_sort_t): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_genv_sort';

function gsl_schur_gen_eigvals(A: Pgsl_matrix; B: Pgsl_matrix; wr1: PDouble; wr2: PDouble; wi: PDouble; scale1: PDouble; scale2: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_schur_gen_eigvals';

function gsl_schur_solve_equation(ca: Double; A: Pgsl_matrix; z: Double; d1: Double; d2: Double; b: Pgsl_vector; x: Pgsl_vector; s: PDouble; xnorm: PDouble; smin: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_schur_solve_equation';

function gsl_schur_solve_equation_z(ca: Double; A: Pgsl_matrix; z: Pgsl_complex; d1: Double; d2: Double; b: Pgsl_vector_complex; x: Pgsl_vector_complex; s: PDouble; xnorm: PDouble; smin: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_schur_solve_equation_z';

function gsl_eigen_jacobi(matrix: Pgsl_matrix; eval: Pgsl_vector; evec: Pgsl_matrix; max_rot: Cardinal; nrot: PCardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_jacobi';

function gsl_eigen_invert_jacobi(matrix: Pgsl_matrix; ainv: Pgsl_matrix; max_rot: Cardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_eigen_invert_jacobi';

function gsl_fft_complex_radix2_forward(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_radix2_forward';

function gsl_fft_complex_radix2_backward(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_radix2_backward';

function gsl_fft_complex_radix2_inverse(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_radix2_inverse';

function gsl_fft_complex_radix2_transform(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt; sign: gsl_fft_direction): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_radix2_transform';

function gsl_fft_complex_radix2_dif_forward(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_radix2_dif_forward';

function gsl_fft_complex_radix2_dif_backward(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_radix2_dif_backward';

function gsl_fft_complex_radix2_dif_inverse(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_radix2_dif_inverse';

function gsl_fft_complex_radix2_dif_transform(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt; sign: gsl_fft_direction): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_radix2_dif_transform';

function gsl_fft_complex_wavetable_alloc(n: NativeUInt): Pgsl_fft_complex_wavetable; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_wavetable_alloc';

procedure gsl_fft_complex_wavetable_free(wavetable: Pgsl_fft_complex_wavetable); cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_wavetable_free';

function gsl_fft_complex_workspace_alloc(n: NativeUInt): Pgsl_fft_complex_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_workspace_alloc';

procedure gsl_fft_complex_workspace_free(workspace: Pgsl_fft_complex_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_workspace_free';

function gsl_fft_complex_memcpy(dest: Pgsl_fft_complex_wavetable; src: Pgsl_fft_complex_wavetable): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_memcpy';

function gsl_fft_complex_forward(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_complex_wavetable; work: Pgsl_fft_complex_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_forward';

function gsl_fft_complex_backward(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_complex_wavetable; work: Pgsl_fft_complex_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_backward';

function gsl_fft_complex_inverse(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_complex_wavetable; work: Pgsl_fft_complex_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_inverse';

function gsl_fft_complex_transform(data: gsl_complex_packed_array; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_complex_wavetable; work: Pgsl_fft_complex_workspace; sign: gsl_fft_direction): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_transform';

function gsl_fft_complex_float_radix2_forward(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_radix2_forward';

function gsl_fft_complex_float_radix2_backward(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_radix2_backward';

function gsl_fft_complex_float_radix2_inverse(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_radix2_inverse';

function gsl_fft_complex_float_radix2_transform(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt; sign: gsl_fft_direction): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_radix2_transform';

function gsl_fft_complex_float_radix2_dif_forward(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_radix2_dif_forward';

function gsl_fft_complex_float_radix2_dif_backward(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_radix2_dif_backward';

function gsl_fft_complex_float_radix2_dif_inverse(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_radix2_dif_inverse';

function gsl_fft_complex_float_radix2_dif_transform(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt; sign: gsl_fft_direction): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_radix2_dif_transform';

function gsl_fft_complex_wavetable_float_alloc(n: NativeUInt): Pgsl_fft_complex_wavetable_float; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_wavetable_float_alloc';

procedure gsl_fft_complex_wavetable_float_free(wavetable: Pgsl_fft_complex_wavetable_float); cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_wavetable_float_free';

function gsl_fft_complex_workspace_float_alloc(n: NativeUInt): Pgsl_fft_complex_workspace_float; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_workspace_float_alloc';

procedure gsl_fft_complex_workspace_float_free(workspace: Pgsl_fft_complex_workspace_float); cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_workspace_float_free';

function gsl_fft_complex_float_memcpy(dest: Pgsl_fft_complex_wavetable_float; src: Pgsl_fft_complex_wavetable_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_memcpy';

function gsl_fft_complex_float_forward(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_complex_wavetable_float; work: Pgsl_fft_complex_workspace_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_forward';

function gsl_fft_complex_float_backward(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_complex_wavetable_float; work: Pgsl_fft_complex_workspace_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_backward';

function gsl_fft_complex_float_inverse(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_complex_wavetable_float; work: Pgsl_fft_complex_workspace_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_inverse';

function gsl_fft_complex_float_transform(data: gsl_complex_packed_array_float; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_complex_wavetable_float; work: Pgsl_fft_complex_workspace_float; sign: gsl_fft_direction): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_complex_float_transform';

function gsl_fft_real_radix2_transform(data: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_radix2_transform';

function gsl_fft_real_wavetable_alloc(n: NativeUInt): Pgsl_fft_real_wavetable; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_wavetable_alloc';

procedure gsl_fft_real_wavetable_free(wavetable: Pgsl_fft_real_wavetable); cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_wavetable_free';

function gsl_fft_real_workspace_alloc(n: NativeUInt): Pgsl_fft_real_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_workspace_alloc';

procedure gsl_fft_real_workspace_free(workspace: Pgsl_fft_real_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_workspace_free';

function gsl_fft_real_transform(data: PDouble; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_real_wavetable; work: Pgsl_fft_real_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_transform';

function gsl_fft_real_unpack(real_coefficient: PDouble; complex_coefficient: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_unpack';

function gsl_fft_halfcomplex_radix2_backward(data: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_radix2_backward';

function gsl_fft_halfcomplex_radix2_inverse(data: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_radix2_inverse';

function gsl_fft_halfcomplex_radix2_transform(data: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_radix2_transform';

function gsl_fft_halfcomplex_wavetable_alloc(n: NativeUInt): Pgsl_fft_halfcomplex_wavetable; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_wavetable_alloc';

procedure gsl_fft_halfcomplex_wavetable_free(wavetable: Pgsl_fft_halfcomplex_wavetable); cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_wavetable_free';

function gsl_fft_halfcomplex_backward(data: PDouble; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_halfcomplex_wavetable; work: Pgsl_fft_real_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_backward';

function gsl_fft_halfcomplex_inverse(data: PDouble; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_halfcomplex_wavetable; work: Pgsl_fft_real_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_inverse';

function gsl_fft_halfcomplex_transform(data: PDouble; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_halfcomplex_wavetable; work: Pgsl_fft_real_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_transform';

function gsl_fft_halfcomplex_unpack(halfcomplex_coefficient: PDouble; complex_coefficient: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_unpack';

function gsl_fft_halfcomplex_radix2_unpack(halfcomplex_coefficient: PDouble; complex_coefficient: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_radix2_unpack';

function gsl_fft_real_float_radix2_transform(data: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_float_radix2_transform';

function gsl_fft_real_wavetable_float_alloc(n: NativeUInt): Pgsl_fft_real_wavetable_float; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_wavetable_float_alloc';

procedure gsl_fft_real_wavetable_float_free(wavetable: Pgsl_fft_real_wavetable_float); cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_wavetable_float_free';

function gsl_fft_real_workspace_float_alloc(n: NativeUInt): Pgsl_fft_real_workspace_float; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_workspace_float_alloc';

procedure gsl_fft_real_workspace_float_free(workspace: Pgsl_fft_real_workspace_float); cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_workspace_float_free';

function gsl_fft_real_float_transform(data: PSingle; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_real_wavetable_float; work: Pgsl_fft_real_workspace_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_float_transform';

function gsl_fft_real_float_unpack(real_float_coefficient: PSingle; complex_coefficient: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_real_float_unpack';

function gsl_fft_halfcomplex_float_radix2_backward(data: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_float_radix2_backward';

function gsl_fft_halfcomplex_float_radix2_inverse(data: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_float_radix2_inverse';

function gsl_fft_halfcomplex_float_radix2_transform(data: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_float_radix2_transform';

function gsl_fft_halfcomplex_wavetable_float_alloc(n: NativeUInt): Pgsl_fft_halfcomplex_wavetable_float; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_wavetable_float_alloc';

procedure gsl_fft_halfcomplex_wavetable_float_free(wavetable: Pgsl_fft_halfcomplex_wavetable_float); cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_wavetable_float_free';

function gsl_fft_halfcomplex_float_backward(data: PSingle; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_halfcomplex_wavetable_float; work: Pgsl_fft_real_workspace_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_float_backward';

function gsl_fft_halfcomplex_float_inverse(data: PSingle; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_halfcomplex_wavetable_float; work: Pgsl_fft_real_workspace_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_float_inverse';

function gsl_fft_halfcomplex_float_transform(data: PSingle; stride: NativeUInt; n: NativeUInt; wavetable: Pgsl_fft_halfcomplex_wavetable_float; work: Pgsl_fft_real_workspace_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_float_transform';

function gsl_fft_halfcomplex_float_unpack(halfcomplex_coefficient: PSingle; complex_coefficient: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_float_unpack';

function gsl_fft_halfcomplex_float_radix2_unpack(halfcomplex_coefficient: PSingle; complex_coefficient: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fft_halfcomplex_float_radix2_unpack';

function gsl_movstat_alloc(K: NativeUInt): Pgsl_movstat_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_alloc';

function gsl_movstat_alloc2(H: NativeUInt; J: NativeUInt): Pgsl_movstat_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_alloc2';

function gsl_movstat_alloc_with_size(accum_state_size: NativeUInt; H: NativeUInt; J: NativeUInt): Pgsl_movstat_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_alloc_with_size';

procedure gsl_movstat_free(w: Pgsl_movstat_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_movstat_free';

function gsl_movstat_apply_accum(endtype: gsl_movstat_end_t; x: Pgsl_vector; accum: Pgsl_movstat_accum; accum_params: Pointer; y: Pgsl_vector; z: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_apply_accum';

function gsl_movstat_apply(endtype: gsl_movstat_end_t; F: Pgsl_movstat_function; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_apply';

function gsl_movstat_fill(endtype: gsl_movstat_end_t; x: Pgsl_vector; idx: NativeUInt; H: NativeUInt; J: NativeUInt; window: PDouble): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_fill';

function gsl_movstat_mean(endtype: gsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_mean';

function gsl_movstat_variance(endtype: gsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_variance';

function gsl_movstat_sd(endtype: gsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_sd';

function gsl_movstat_median(endtype: gsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_median';

function gsl_movstat_min(endtype: gsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_min';

function gsl_movstat_max(endtype: gsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_max';

function gsl_movstat_minmax(endtype: gsl_movstat_end_t; x: Pgsl_vector; y_min: Pgsl_vector; y_max: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_minmax';

function gsl_movstat_mad0(endtype: gsl_movstat_end_t; x: Pgsl_vector; xmedian: Pgsl_vector; xmad: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_mad0';

function gsl_movstat_mad(endtype: gsl_movstat_end_t; x: Pgsl_vector; xmedian: Pgsl_vector; xmad: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_mad';

function gsl_movstat_qqr(endtype: gsl_movstat_end_t; x: Pgsl_vector; q: Double; xqqr: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_qqr';

function gsl_movstat_Sn(endtype: gsl_movstat_end_t; x: Pgsl_vector; xscale: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_Sn';

function gsl_movstat_Qn(endtype: gsl_movstat_end_t; x: Pgsl_vector; xscale: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_Qn';

function gsl_movstat_sum(endtype: gsl_movstat_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_movstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_movstat_sum';

function gsl_filter_gaussian_alloc(K: NativeUInt): Pgsl_filter_gaussian_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_filter_gaussian_alloc';

procedure gsl_filter_gaussian_free(w: Pgsl_filter_gaussian_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_filter_gaussian_free';

function gsl_filter_gaussian(endtype: gsl_filter_end_t; alpha: Double; order: NativeUInt; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_filter_gaussian_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_filter_gaussian';

function gsl_filter_gaussian_kernel(alpha: Double; order: NativeUInt; normalize: Integer; kernel: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_filter_gaussian_kernel';

function gsl_filter_median_alloc(K: NativeUInt): Pgsl_filter_median_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_filter_median_alloc';

procedure gsl_filter_median_free(w: Pgsl_filter_median_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_filter_median_free';

function gsl_filter_median(endtype: gsl_filter_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_filter_median_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_filter_median';

function gsl_filter_rmedian_alloc(K: NativeUInt): Pgsl_filter_rmedian_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_filter_rmedian_alloc';

procedure gsl_filter_rmedian_free(w: Pgsl_filter_rmedian_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_filter_rmedian_free';

function gsl_filter_rmedian(p1: gsl_filter_end_t; x: Pgsl_vector; y: Pgsl_vector; w: Pgsl_filter_rmedian_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_filter_rmedian';

function gsl_filter_impulse_alloc(K: NativeUInt): Pgsl_filter_impulse_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_filter_impulse_alloc';

procedure gsl_filter_impulse_free(w: Pgsl_filter_impulse_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_filter_impulse_free';

function gsl_filter_impulse(endtype: gsl_filter_end_t; scale_type: gsl_filter_scale_t; t: Double; x: Pgsl_vector; y: Pgsl_vector; xmedian: Pgsl_vector; xsigma: Pgsl_vector; noutlier: PNativeUInt; ioutlier: Pgsl_vector_int; w: Pgsl_filter_impulse_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_filter_impulse';

function gsl_fit_linear(x: PDouble; xstride: NativeUInt; y: PDouble; ystride: NativeUInt; n: NativeUInt; c0: PDouble; c1: PDouble; cov00: PDouble; cov01: PDouble; cov11: PDouble; sumsq: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fit_linear';

function gsl_fit_wlinear(x: PDouble; xstride: NativeUInt; w: PDouble; wstride: NativeUInt; y: PDouble; ystride: NativeUInt; n: NativeUInt; c0: PDouble; c1: PDouble; cov00: PDouble; cov01: PDouble; cov11: PDouble; chisq: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fit_wlinear';

function gsl_fit_linear_est(x: Double; c0: Double; c1: Double; cov00: Double; cov01: Double; cov11: Double; y: PDouble; y_err: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fit_linear_est';

function gsl_fit_mul(x: PDouble; xstride: NativeUInt; y: PDouble; ystride: NativeUInt; n: NativeUInt; c1: PDouble; cov11: PDouble; sumsq: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fit_mul';

function gsl_fit_wmul(x: PDouble; xstride: NativeUInt; w: PDouble; wstride: NativeUInt; y: PDouble; ystride: NativeUInt; n: NativeUInt; c1: PDouble; cov11: PDouble; sumsq: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fit_wmul';

function gsl_fit_mul_est(x: Double; c1: Double; cov11: Double; y: PDouble; y_err: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_fit_mul_est';

function gsl_permutation_alloc(n: NativeUInt): Pgsl_permutation; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_alloc';

function gsl_permutation_calloc(n: NativeUInt): Pgsl_permutation; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_calloc';

procedure gsl_permutation_init(p: Pgsl_permutation); cdecl;
  external LIBGSL name _PU + 'gsl_permutation_init';

procedure gsl_permutation_free(p: Pgsl_permutation); cdecl;
  external LIBGSL name _PU + 'gsl_permutation_free';

function gsl_permutation_memcpy(dest: Pgsl_permutation; src: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_memcpy';

function gsl_permutation_fread(stream: PPointer; p: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_fread';

function gsl_permutation_fwrite(stream: PPointer; p: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_fwrite';

function gsl_permutation_fscanf(stream: PPointer; p: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_fscanf';

function gsl_permutation_fprintf(stream: PPointer; p: Pgsl_permutation; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_fprintf';

function gsl_permutation_size(p: Pgsl_permutation): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_size';

function gsl_permutation_data(p: Pgsl_permutation): PNativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_data';

function gsl_permutation_swap(p: Pgsl_permutation; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_swap';

function gsl_permutation_valid(p: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_valid';

procedure gsl_permutation_reverse(p: Pgsl_permutation); cdecl;
  external LIBGSL name _PU + 'gsl_permutation_reverse';

function gsl_permutation_inverse(inv: Pgsl_permutation; p: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_inverse';

function gsl_permutation_next(p: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_next';

function gsl_permutation_prev(p: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_prev';

function gsl_permutation_mul(p: Pgsl_permutation; pa: Pgsl_permutation; pb: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_mul';

function gsl_permutation_linear_to_canonical(q: Pgsl_permutation; p: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_linear_to_canonical';

function gsl_permutation_canonical_to_linear(p: Pgsl_permutation; q: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_canonical_to_linear';

function gsl_permutation_inversions(p: Pgsl_permutation): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_inversions';

function gsl_permutation_linear_cycles(p: Pgsl_permutation): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_linear_cycles';

function gsl_permutation_canonical_cycles(q: Pgsl_permutation): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_canonical_cycles';

function gsl_permutation_get(p: Pgsl_permutation; i: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_permutation_get';

procedure gsl_heapsort(&array: Pointer; count: NativeUInt; size: NativeUInt; compare: gsl_comparison_fn_t); cdecl;
  external LIBGSL name _PU + 'gsl_heapsort';

function gsl_heapsort_index(p: PNativeUInt; &array: Pointer; count: NativeUInt; size: NativeUInt; compare: gsl_comparison_fn_t): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_heapsort_index';

function gsl_histogram_alloc(n: NativeUInt): Pgsl_histogram; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_alloc';

function gsl_histogram_calloc(n: NativeUInt): Pgsl_histogram; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_calloc';

function gsl_histogram_calloc_uniform(n: NativeUInt; xmin: Double; xmax: Double): Pgsl_histogram; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_calloc_uniform';

procedure gsl_histogram_free(h: Pgsl_histogram); cdecl;
  external LIBGSL name _PU + 'gsl_histogram_free';

function gsl_histogram_increment(h: Pgsl_histogram; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_increment';

function gsl_histogram_accumulate(h: Pgsl_histogram; x: Double; weight: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_accumulate';

function gsl_histogram_find(h: Pgsl_histogram; x: Double; i: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_find';

function gsl_histogram_get(h: Pgsl_histogram; i: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_get';

function gsl_histogram_get_range(h: Pgsl_histogram; i: NativeUInt; lower: PDouble; upper: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_get_range';

function gsl_histogram_max(h: Pgsl_histogram): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_max';

function gsl_histogram_min(h: Pgsl_histogram): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_min';

function gsl_histogram_bins(h: Pgsl_histogram): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_bins';

procedure gsl_histogram_reset(h: Pgsl_histogram); cdecl;
  external LIBGSL name _PU + 'gsl_histogram_reset';

function gsl_histogram_calloc_range(n: NativeUInt; range: PDouble): Pgsl_histogram; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_calloc_range';

function gsl_histogram_set_ranges(h: Pgsl_histogram; range: PDouble; size: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_set_ranges';

function gsl_histogram_set_ranges_uniform(h: Pgsl_histogram; xmin: Double; xmax: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_set_ranges_uniform';

function gsl_histogram_memcpy(dest: Pgsl_histogram; source: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_memcpy';

function gsl_histogram_clone(source: Pgsl_histogram): Pgsl_histogram; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_clone';

function gsl_histogram_max_val(h: Pgsl_histogram): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_max_val';

function gsl_histogram_max_bin(h: Pgsl_histogram): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_max_bin';

function gsl_histogram_min_val(h: Pgsl_histogram): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_min_val';

function gsl_histogram_min_bin(h: Pgsl_histogram): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_min_bin';

function gsl_histogram_equal_bins_p(h1: Pgsl_histogram; h2: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_equal_bins_p';

function gsl_histogram_add(h1: Pgsl_histogram; h2: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_add';

function gsl_histogram_sub(h1: Pgsl_histogram; h2: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_sub';

function gsl_histogram_mul(h1: Pgsl_histogram; h2: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_mul';

function gsl_histogram_div(h1: Pgsl_histogram; h2: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_div';

function gsl_histogram_scale(h: Pgsl_histogram; scale: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_scale';

function gsl_histogram_shift(h: Pgsl_histogram; shift: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_shift';

function gsl_histogram_sigma(h: Pgsl_histogram): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_sigma';

function gsl_histogram_mean(h: Pgsl_histogram): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_mean';

function gsl_histogram_sum(h: Pgsl_histogram): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_sum';

function gsl_histogram_fwrite(stream: PPointer; h: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_fwrite';

function gsl_histogram_fread(stream: PPointer; h: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_fread';

function gsl_histogram_fprintf(stream: PPointer; h: Pgsl_histogram; range_format: PUTF8Char; bin_format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_fprintf';

function gsl_histogram_fscanf(stream: PPointer; h: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_fscanf';

function gsl_histogram_pdf_alloc(n: NativeUInt): Pgsl_histogram_pdf; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_pdf_alloc';

function gsl_histogram_pdf_init(p: Pgsl_histogram_pdf; h: Pgsl_histogram): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_pdf_init';

procedure gsl_histogram_pdf_free(p: Pgsl_histogram_pdf); cdecl;
  external LIBGSL name _PU + 'gsl_histogram_pdf_free';

function gsl_histogram_pdf_sample(p: Pgsl_histogram_pdf; r: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram_pdf_sample';

function gsl_histogram2d_alloc(nx: NativeUInt; ny: NativeUInt): Pgsl_histogram2d; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_alloc';

function gsl_histogram2d_calloc(nx: NativeUInt; ny: NativeUInt): Pgsl_histogram2d; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_calloc';

function gsl_histogram2d_calloc_uniform(nx: NativeUInt; ny: NativeUInt; xmin: Double; xmax: Double; ymin: Double; ymax: Double): Pgsl_histogram2d; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_calloc_uniform';

procedure gsl_histogram2d_free(h: Pgsl_histogram2d); cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_free';

function gsl_histogram2d_increment(h: Pgsl_histogram2d; x: Double; y: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_increment';

function gsl_histogram2d_accumulate(h: Pgsl_histogram2d; x: Double; y: Double; weight: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_accumulate';

function gsl_histogram2d_find(h: Pgsl_histogram2d; x: Double; y: Double; i: PNativeUInt; j: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_find';

function gsl_histogram2d_get(h: Pgsl_histogram2d; i: NativeUInt; j: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_get';

function gsl_histogram2d_get_xrange(h: Pgsl_histogram2d; i: NativeUInt; xlower: PDouble; xupper: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_get_xrange';

function gsl_histogram2d_get_yrange(h: Pgsl_histogram2d; j: NativeUInt; ylower: PDouble; yupper: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_get_yrange';

function gsl_histogram2d_xmax(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_xmax';

function gsl_histogram2d_xmin(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_xmin';

function gsl_histogram2d_nx(h: Pgsl_histogram2d): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_nx';

function gsl_histogram2d_ymax(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_ymax';

function gsl_histogram2d_ymin(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_ymin';

function gsl_histogram2d_ny(h: Pgsl_histogram2d): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_ny';

procedure gsl_histogram2d_reset(h: Pgsl_histogram2d); cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_reset';

function gsl_histogram2d_calloc_range(nx: NativeUInt; ny: NativeUInt; xrange: PDouble; yrange: PDouble): Pgsl_histogram2d; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_calloc_range';

function gsl_histogram2d_set_ranges_uniform(h: Pgsl_histogram2d; xmin: Double; xmax: Double; ymin: Double; ymax: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_set_ranges_uniform';

function gsl_histogram2d_set_ranges(h: Pgsl_histogram2d; xrange: PDouble; xsize: NativeUInt; yrange: PDouble; ysize: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_set_ranges';

function gsl_histogram2d_memcpy(dest: Pgsl_histogram2d; source: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_memcpy';

function gsl_histogram2d_clone(source: Pgsl_histogram2d): Pgsl_histogram2d; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_clone';

function gsl_histogram2d_max_val(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_max_val';

procedure gsl_histogram2d_max_bin(h: Pgsl_histogram2d; i: PNativeUInt; j: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_max_bin';

function gsl_histogram2d_min_val(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_min_val';

procedure gsl_histogram2d_min_bin(h: Pgsl_histogram2d; i: PNativeUInt; j: PNativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_min_bin';

function gsl_histogram2d_xmean(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_xmean';

function gsl_histogram2d_ymean(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_ymean';

function gsl_histogram2d_xsigma(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_xsigma';

function gsl_histogram2d_ysigma(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_ysigma';

function gsl_histogram2d_cov(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_cov';

function gsl_histogram2d_sum(h: Pgsl_histogram2d): Double; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_sum';

function gsl_histogram2d_equal_bins_p(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_equal_bins_p';

function gsl_histogram2d_add(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_add';

function gsl_histogram2d_sub(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_sub';

function gsl_histogram2d_mul(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_mul';

function gsl_histogram2d_div(h1: Pgsl_histogram2d; h2: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_div';

function gsl_histogram2d_scale(h: Pgsl_histogram2d; scale: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_scale';

function gsl_histogram2d_shift(h: Pgsl_histogram2d; shift: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_shift';

function gsl_histogram2d_fwrite(stream: PPointer; h: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_fwrite';

function gsl_histogram2d_fread(stream: PPointer; h: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_fread';

function gsl_histogram2d_fprintf(stream: PPointer; h: Pgsl_histogram2d; range_format: PUTF8Char; bin_format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_fprintf';

function gsl_histogram2d_fscanf(stream: PPointer; h: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_fscanf';

function gsl_histogram2d_pdf_alloc(nx: NativeUInt; ny: NativeUInt): Pgsl_histogram2d_pdf; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_pdf_alloc';

function gsl_histogram2d_pdf_init(p: Pgsl_histogram2d_pdf; h: Pgsl_histogram2d): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_pdf_init';

procedure gsl_histogram2d_pdf_free(p: Pgsl_histogram2d_pdf); cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_pdf_free';

function gsl_histogram2d_pdf_sample(p: Pgsl_histogram2d_pdf; r1: Double; r2: Double; x: PDouble; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_histogram2d_pdf_sample';

procedure gsl_ieee_printf_float(x: PSingle); cdecl;
  external LIBGSL name _PU + 'gsl_ieee_printf_float';

procedure gsl_ieee_printf_double(x: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_ieee_printf_double';

procedure gsl_ieee_fprintf_float(stream: PPointer; x: PSingle); cdecl;
  external LIBGSL name _PU + 'gsl_ieee_fprintf_float';

procedure gsl_ieee_fprintf_double(stream: PPointer; x: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_ieee_fprintf_double';

procedure gsl_ieee_float_to_rep(x: PSingle; r: Pgsl_ieee_float_rep); cdecl;
  external LIBGSL name _PU + 'gsl_ieee_float_to_rep';

procedure gsl_ieee_double_to_rep(x: PDouble; r: Pgsl_ieee_double_rep); cdecl;
  external LIBGSL name _PU + 'gsl_ieee_double_to_rep';

procedure gsl_ieee_env_setup(); cdecl;
  external LIBGSL name _PU + 'gsl_ieee_env_setup';

function gsl_ieee_read_mode_string(description: PUTF8Char; precision: PInteger; rounding: PInteger; exception_mask: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ieee_read_mode_string';

function gsl_ieee_set_mode(precision: Integer; rounding: Integer; exception_mask: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ieee_set_mode';

function gsl_integration_workspace_alloc(n: NativeUInt): Pgsl_integration_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_integration_workspace_alloc';

procedure gsl_integration_workspace_free(w: Pgsl_integration_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_integration_workspace_free';

function gsl_integration_qaws_table_alloc(alpha: Double; beta: Double; mu: Integer; nu: Integer): Pgsl_integration_qaws_table; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qaws_table_alloc';

function gsl_integration_qaws_table_set(t: Pgsl_integration_qaws_table; alpha: Double; beta: Double; mu: Integer; nu: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qaws_table_set';

procedure gsl_integration_qaws_table_free(t: Pgsl_integration_qaws_table); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qaws_table_free';

function gsl_integration_qawo_table_alloc(omega: Double; L: Double; sine: gsl_integration_qawo_enum; n: NativeUInt): Pgsl_integration_qawo_table; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qawo_table_alloc';

function gsl_integration_qawo_table_set(t: Pgsl_integration_qawo_table; omega: Double; L: Double; sine: gsl_integration_qawo_enum): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qawo_table_set';

function gsl_integration_qawo_table_set_length(t: Pgsl_integration_qawo_table; L: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qawo_table_set_length';

procedure gsl_integration_qawo_table_free(t: Pgsl_integration_qawo_table); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qawo_table_free';

procedure gsl_integration_qk15(f: Pgsl_function; a: Double; b: Double; result: PDouble; abserr: PDouble; resabs: PDouble; resasc: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qk15';

procedure gsl_integration_qk21(f: Pgsl_function; a: Double; b: Double; result: PDouble; abserr: PDouble; resabs: PDouble; resasc: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qk21';

procedure gsl_integration_qk31(f: Pgsl_function; a: Double; b: Double; result: PDouble; abserr: PDouble; resabs: PDouble; resasc: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qk31';

procedure gsl_integration_qk41(f: Pgsl_function; a: Double; b: Double; result: PDouble; abserr: PDouble; resabs: PDouble; resasc: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qk41';

procedure gsl_integration_qk51(f: Pgsl_function; a: Double; b: Double; result: PDouble; abserr: PDouble; resabs: PDouble; resasc: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qk51';

procedure gsl_integration_qk61(f: Pgsl_function; a: Double; b: Double; result: PDouble; abserr: PDouble; resabs: PDouble; resasc: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qk61';

procedure gsl_integration_qcheb(f: Pgsl_function; a: Double; b: Double; cheb12: PDouble; cheb24: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qcheb';

procedure gsl_integration_qk(n: Integer; xgk: PDouble; wg: PDouble; wgk: PDouble; fv1: PDouble; fv2: PDouble; f: Pgsl_function; a: Double; b: Double; result: PDouble; abserr: PDouble; resabs: PDouble; resasc: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_integration_qk';

function gsl_integration_qng(f: Pgsl_function; a: Double; b: Double; epsabs: Double; epsrel: Double; result: PDouble; abserr: PDouble; neval: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qng';

function gsl_integration_qag(f: Pgsl_function; a: Double; b: Double; epsabs: Double; epsrel: Double; limit: NativeUInt; key: Integer; workspace: Pgsl_integration_workspace; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qag';

function gsl_integration_qagi(f: Pgsl_function; epsabs: Double; epsrel: Double; limit: NativeUInt; workspace: Pgsl_integration_workspace; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qagi';

function gsl_integration_qagiu(f: Pgsl_function; a: Double; epsabs: Double; epsrel: Double; limit: NativeUInt; workspace: Pgsl_integration_workspace; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qagiu';

function gsl_integration_qagil(f: Pgsl_function; b: Double; epsabs: Double; epsrel: Double; limit: NativeUInt; workspace: Pgsl_integration_workspace; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qagil';

function gsl_integration_qags(f: Pgsl_function; a: Double; b: Double; epsabs: Double; epsrel: Double; limit: NativeUInt; workspace: Pgsl_integration_workspace; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qags';

function gsl_integration_qagp(f: Pgsl_function; pts: PDouble; npts: NativeUInt; epsabs: Double; epsrel: Double; limit: NativeUInt; workspace: Pgsl_integration_workspace; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qagp';

function gsl_integration_qawc(f: Pgsl_function; a: Double; b: Double; c: Double; epsabs: Double; epsrel: Double; limit: NativeUInt; workspace: Pgsl_integration_workspace; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qawc';

function gsl_integration_qaws(f: Pgsl_function; a: Double; b: Double; t: Pgsl_integration_qaws_table; epsabs: Double; epsrel: Double; limit: NativeUInt; workspace: Pgsl_integration_workspace; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qaws';

function gsl_integration_qawo(f: Pgsl_function; a: Double; epsabs: Double; epsrel: Double; limit: NativeUInt; workspace: Pgsl_integration_workspace; wf: Pgsl_integration_qawo_table; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qawo';

function gsl_integration_qawf(f: Pgsl_function; a: Double; epsabs: Double; limit: NativeUInt; workspace: Pgsl_integration_workspace; cycle_workspace: Pgsl_integration_workspace; wf: Pgsl_integration_qawo_table; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_qawf';

function gsl_integration_glfixed_table_alloc(n: NativeUInt): Pgsl_integration_glfixed_table; cdecl;
  external LIBGSL name _PU + 'gsl_integration_glfixed_table_alloc';

procedure gsl_integration_glfixed_table_free(t: Pgsl_integration_glfixed_table); cdecl;
  external LIBGSL name _PU + 'gsl_integration_glfixed_table_free';

function gsl_integration_glfixed(f: Pgsl_function; a: Double; b: Double; t: Pgsl_integration_glfixed_table): Double; cdecl;
  external LIBGSL name _PU + 'gsl_integration_glfixed';

function gsl_integration_glfixed_point(a: Double; b: Double; i: NativeUInt; xi: PDouble; wi: PDouble; t: Pgsl_integration_glfixed_table): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_glfixed_point';

function gsl_integration_cquad_workspace_alloc(n: NativeUInt): Pgsl_integration_cquad_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_integration_cquad_workspace_alloc';

procedure gsl_integration_cquad_workspace_free(w: Pgsl_integration_cquad_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_integration_cquad_workspace_free';

function gsl_integration_cquad(f: Pgsl_function; a: Double; b: Double; epsabs: Double; epsrel: Double; ws: Pgsl_integration_cquad_workspace; result: PDouble; abserr: PDouble; nevals: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_cquad';

function gsl_integration_romberg_alloc(n: NativeUInt): Pgsl_integration_romberg_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_integration_romberg_alloc';

procedure gsl_integration_romberg_free(w: Pgsl_integration_romberg_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_integration_romberg_free';

function gsl_integration_romberg(f: Pgsl_function; a: Double; b: Double; epsabs: Double; epsrel: Double; result: PDouble; neval: PNativeUInt; w: Pgsl_integration_romberg_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_romberg';

function gsl_integration_fixed_alloc(&type: Pgsl_integration_fixed_type; n: NativeUInt; a: Double; b: Double; alpha: Double; beta: Double): Pgsl_integration_fixed_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_integration_fixed_alloc';

procedure gsl_integration_fixed_free(w: Pgsl_integration_fixed_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_integration_fixed_free';

function gsl_integration_fixed_n(w: Pgsl_integration_fixed_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_integration_fixed_n';

function gsl_integration_fixed_nodes(w: Pgsl_integration_fixed_workspace): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_integration_fixed_nodes';

function gsl_integration_fixed_weights(w: Pgsl_integration_fixed_workspace): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_integration_fixed_weights';

function gsl_integration_fixed(func: Pgsl_function; result: PDouble; w: Pgsl_integration_fixed_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_integration_fixed';

function gsl_interp_accel_alloc(): Pgsl_interp_accel; cdecl;
  external LIBGSL name _PU + 'gsl_interp_accel_alloc';

function gsl_interp_accel_reset(a: Pgsl_interp_accel): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp_accel_reset';

procedure gsl_interp_accel_free(a: Pgsl_interp_accel); cdecl;
  external LIBGSL name _PU + 'gsl_interp_accel_free';

function gsl_interp_alloc(T: Pgsl_interp_type; n: NativeUInt): Pgsl_interp; cdecl;
  external LIBGSL name _PU + 'gsl_interp_alloc';

function gsl_interp_init(obj: Pgsl_interp; xa: PDouble; ya: PDouble; size: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp_init';

function gsl_interp_name(interp: Pgsl_interp): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_interp_name';

function gsl_interp_min_size(interp: Pgsl_interp): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_interp_min_size';

function gsl_interp_type_min_size(T: Pgsl_interp_type): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_interp_type_min_size';

function gsl_interp_eval_e(obj: Pgsl_interp; xa: PDouble; ya: PDouble; x: Double; a: Pgsl_interp_accel; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp_eval_e';

function gsl_interp_eval(obj: Pgsl_interp; xa: PDouble; ya: PDouble; x: Double; a: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp_eval';

function gsl_interp_eval_deriv_e(obj: Pgsl_interp; xa: PDouble; ya: PDouble; x: Double; a: Pgsl_interp_accel; d: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp_eval_deriv_e';

function gsl_interp_eval_deriv(obj: Pgsl_interp; xa: PDouble; ya: PDouble; x: Double; a: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp_eval_deriv';

function gsl_interp_eval_deriv2_e(obj: Pgsl_interp; xa: PDouble; ya: PDouble; x: Double; a: Pgsl_interp_accel; d2: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp_eval_deriv2_e';

function gsl_interp_eval_deriv2(obj: Pgsl_interp; xa: PDouble; ya: PDouble; x: Double; a: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp_eval_deriv2';

function gsl_interp_eval_integ_e(obj: Pgsl_interp; xa: PDouble; ya: PDouble; a: Double; b: Double; acc: Pgsl_interp_accel; result: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp_eval_integ_e';

function gsl_interp_eval_integ(obj: Pgsl_interp; xa: PDouble; ya: PDouble; a: Double; b: Double; acc: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp_eval_integ';

procedure gsl_interp_free(interp: Pgsl_interp); cdecl;
  external LIBGSL name _PU + 'gsl_interp_free';

function gsl_interp_bsearch(x_array: PDouble; x: Double; index_lo: NativeUInt; index_hi: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_interp_bsearch';

function gsl_interp_accel_find(a: Pgsl_interp_accel; x_array: PDouble; size: NativeUInt; x: Double): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_interp_accel_find';

function gsl_interp2d_alloc(T: Pgsl_interp2d_type; xsize: NativeUInt; ysize: NativeUInt): Pgsl_interp2d; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_alloc';

function gsl_interp2d_name(interp: Pgsl_interp2d): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_name';

function gsl_interp2d_min_size(interp: Pgsl_interp2d): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_min_size';

function gsl_interp2d_type_min_size(T: Pgsl_interp2d_type): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_type_min_size';

function gsl_interp2d_set(interp: Pgsl_interp2d; zarr: PDouble; i: NativeUInt; j: NativeUInt; z: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_set';

function gsl_interp2d_get(interp: Pgsl_interp2d; zarr: PDouble; i: NativeUInt; j: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_get';

function gsl_interp2d_idx(interp: Pgsl_interp2d; i: NativeUInt; j: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_idx';

function gsl_interp2d_init(interp: Pgsl_interp2d; xa: PDouble; ya: PDouble; za: PDouble; xsize: NativeUInt; ysize: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_init';

procedure gsl_interp2d_free(interp: Pgsl_interp2d); cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_free';

function gsl_interp2d_eval(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval';

function gsl_interp2d_eval_extrap(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_extrap';

function gsl_interp2d_eval_e(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_e';

function gsl_interp2d_eval_e_extrap(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_e_extrap';

function gsl_interp2d_eval_extrap_e(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_extrap_e';

function gsl_interp2d_eval_deriv_x(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_x';

function gsl_interp2d_eval_deriv_x_e(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_x_e';

function gsl_interp2d_eval_deriv_y(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_y';

function gsl_interp2d_eval_deriv_y_e(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_y_e';

function gsl_interp2d_eval_deriv_xx(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_xx';

function gsl_interp2d_eval_deriv_xx_e(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_xx_e';

function gsl_interp2d_eval_deriv_yy(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_yy';

function gsl_interp2d_eval_deriv_yy_e(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_yy_e';

function gsl_interp2d_eval_deriv_xy(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_xy';

function gsl_interp2d_eval_deriv_xy_e(interp: Pgsl_interp2d; xarr: PDouble; yarr: PDouble; zarr: PDouble; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_interp2d_eval_deriv_xy_e';

function gsl_linalg_matmult(A: Pgsl_matrix; B: Pgsl_matrix; C: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_matmult';

function gsl_linalg_matmult_mod(A: Pgsl_matrix; modA: gsl_linalg_matrix_mod_t; B: Pgsl_matrix; modB: gsl_linalg_matrix_mod_t; C: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_matmult_mod';

function gsl_linalg_exponential_ss(A: Pgsl_matrix; eA: Pgsl_matrix; mode: gsl_mode_t): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_exponential_ss';

function gsl_linalg_householder_transform(v: Pgsl_vector): Double; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_householder_transform';

function gsl_linalg_complex_householder_transform(v: Pgsl_vector_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_householder_transform';

function gsl_linalg_householder_hm(tau: Double; v: Pgsl_vector; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_householder_hm';

function gsl_linalg_householder_mh(tau: Double; v: Pgsl_vector; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_householder_mh';

function gsl_linalg_householder_hv(tau: Double; v: Pgsl_vector; w: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_householder_hv';

function gsl_linalg_householder_hm1(tau: Double; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_householder_hm1';

function gsl_linalg_complex_householder_hm(tau: gsl_complex; v: Pgsl_vector_complex; A: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_householder_hm';

function gsl_linalg_complex_householder_mh(tau: gsl_complex; v: Pgsl_vector_complex; A: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_householder_mh';

function gsl_linalg_complex_householder_hv(tau: gsl_complex; v: Pgsl_vector_complex; w: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_householder_hv';

function gsl_linalg_hessenberg_decomp(A: Pgsl_matrix; tau: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_hessenberg_decomp';

function gsl_linalg_hessenberg_unpack(H: Pgsl_matrix; tau: Pgsl_vector; U: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_hessenberg_unpack';

function gsl_linalg_hessenberg_unpack_accum(H: Pgsl_matrix; tau: Pgsl_vector; U: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_hessenberg_unpack_accum';

function gsl_linalg_hessenberg_set_zero(H: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_hessenberg_set_zero';

function gsl_linalg_hessenberg_submatrix(M: Pgsl_matrix; A: Pgsl_matrix; top: NativeUInt; tau: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_hessenberg_submatrix';

function gsl_linalg_hesstri_decomp(A: Pgsl_matrix; B: Pgsl_matrix; U: Pgsl_matrix; V: Pgsl_matrix; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_hesstri_decomp';

function gsl_linalg_SV_decomp(A: Pgsl_matrix; V: Pgsl_matrix; S: Pgsl_vector; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_SV_decomp';

function gsl_linalg_SV_decomp_mod(A: Pgsl_matrix; X: Pgsl_matrix; V: Pgsl_matrix; S: Pgsl_vector; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_SV_decomp_mod';

function gsl_linalg_SV_decomp_jacobi(A: Pgsl_matrix; Q: Pgsl_matrix; S: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_SV_decomp_jacobi';

function gsl_linalg_SV_solve(U: Pgsl_matrix; Q: Pgsl_matrix; S: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_SV_solve';

function gsl_linalg_SV_leverage(U: Pgsl_matrix; h: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_SV_leverage';

function gsl_linalg_LU_decomp(A: Pgsl_matrix; p: Pgsl_permutation; signum: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LU_decomp';

function gsl_linalg_LU_solve(LU: Pgsl_matrix; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LU_solve';

function gsl_linalg_LU_svx(LU: Pgsl_matrix; p: Pgsl_permutation; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LU_svx';

function gsl_linalg_LU_refine(A: Pgsl_matrix; LU: Pgsl_matrix; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LU_refine';

function gsl_linalg_LU_invert(LU: Pgsl_matrix; p: Pgsl_permutation; inverse: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LU_invert';

function gsl_linalg_LU_det(LU: Pgsl_matrix; signum: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LU_det';

function gsl_linalg_LU_lndet(LU: Pgsl_matrix): Double; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LU_lndet';

function gsl_linalg_LU_sgndet(lu: Pgsl_matrix; signum: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LU_sgndet';

function gsl_linalg_complex_LU_decomp(A: Pgsl_matrix_complex; p: Pgsl_permutation; signum: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_LU_decomp';

function gsl_linalg_complex_LU_solve(LU: Pgsl_matrix_complex; p: Pgsl_permutation; b: Pgsl_vector_complex; x: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_LU_solve';

function gsl_linalg_complex_LU_svx(LU: Pgsl_matrix_complex; p: Pgsl_permutation; x: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_LU_svx';

function gsl_linalg_complex_LU_refine(A: Pgsl_matrix_complex; LU: Pgsl_matrix_complex; p: Pgsl_permutation; b: Pgsl_vector_complex; x: Pgsl_vector_complex; work: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_LU_refine';

function gsl_linalg_complex_LU_invert(LU: Pgsl_matrix_complex; p: Pgsl_permutation; inverse: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_LU_invert';

function gsl_linalg_complex_LU_det(LU: Pgsl_matrix_complex; signum: Integer): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_LU_det';

function gsl_linalg_complex_LU_lndet(LU: Pgsl_matrix_complex): Double; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_LU_lndet';

function gsl_linalg_complex_LU_sgndet(LU: Pgsl_matrix_complex; signum: Integer): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_LU_sgndet';

function gsl_linalg_QR_decomp(A: Pgsl_matrix; tau: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_decomp';

function gsl_linalg_QR_solve(QR: Pgsl_matrix; tau: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_solve';

function gsl_linalg_QR_svx(QR: Pgsl_matrix; tau: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_svx';

function gsl_linalg_QR_lssolve(QR: Pgsl_matrix; tau: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector; residual: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_lssolve';

function gsl_linalg_QR_QRsolve(Q: Pgsl_matrix; R: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_QRsolve';

function gsl_linalg_QR_Rsolve(QR: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_Rsolve';

function gsl_linalg_QR_Rsvx(QR: Pgsl_matrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_Rsvx';

function gsl_linalg_QR_update(Q: Pgsl_matrix; R: Pgsl_matrix; w: Pgsl_vector; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_update';

function gsl_linalg_QR_QTvec(QR: Pgsl_matrix; tau: Pgsl_vector; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_QTvec';

function gsl_linalg_QR_Qvec(QR: Pgsl_matrix; tau: Pgsl_vector; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_Qvec';

function gsl_linalg_QR_QTmat(QR: Pgsl_matrix; tau: Pgsl_vector; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_QTmat';

function gsl_linalg_QR_matQ(QR: Pgsl_matrix; tau: Pgsl_vector; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_matQ';

function gsl_linalg_QR_unpack(QR: Pgsl_matrix; tau: Pgsl_vector; Q: Pgsl_matrix; R: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QR_unpack';

function gsl_linalg_R_solve(R: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_R_solve';

function gsl_linalg_R_svx(R: Pgsl_matrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_R_svx';

function gsl_linalg_QRPT_decomp(A: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; signum: PInteger; norm: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_decomp';

function gsl_linalg_QRPT_decomp2(A: Pgsl_matrix; q: Pgsl_matrix; r: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; signum: PInteger; norm: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_decomp2';

function gsl_linalg_QRPT_solve(QR: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_solve';

function gsl_linalg_QRPT_lssolve(QR: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector; residual: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_lssolve';

function gsl_linalg_QRPT_lssolve2(QR: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; b: Pgsl_vector; rank: NativeUInt; x: Pgsl_vector; residual: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_lssolve2';

function gsl_linalg_QRPT_svx(QR: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_svx';

function gsl_linalg_QRPT_QRsolve(Q: Pgsl_matrix; R: Pgsl_matrix; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_QRsolve';

function gsl_linalg_QRPT_Rsolve(QR: Pgsl_matrix; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_Rsolve';

function gsl_linalg_QRPT_Rsvx(QR: Pgsl_matrix; p: Pgsl_permutation; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_Rsvx';

function gsl_linalg_QRPT_update(Q: Pgsl_matrix; R: Pgsl_matrix; p: Pgsl_permutation; u: Pgsl_vector; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_update';

function gsl_linalg_QRPT_rank(QR: Pgsl_matrix; tol: Double): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_rank';

function gsl_linalg_QRPT_rcond(QR: Pgsl_matrix; rcond: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_QRPT_rcond';

function gsl_linalg_COD_decomp(A: Pgsl_matrix; tau_Q: Pgsl_vector; tau_Z: Pgsl_vector; p: Pgsl_permutation; rank: PNativeUInt; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_COD_decomp';

function gsl_linalg_COD_decomp_e(A: Pgsl_matrix; tau_Q: Pgsl_vector; tau_Z: Pgsl_vector; p: Pgsl_permutation; tol: Double; rank: PNativeUInt; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_COD_decomp_e';

function gsl_linalg_COD_lssolve(QRZT: Pgsl_matrix; tau_Q: Pgsl_vector; tau_Z: Pgsl_vector; perm: Pgsl_permutation; rank: NativeUInt; b: Pgsl_vector; x: Pgsl_vector; residual: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_COD_lssolve';

function gsl_linalg_COD_lssolve2(lambda: Double; QRZT: Pgsl_matrix; tau_Q: Pgsl_vector; tau_Z: Pgsl_vector; perm: Pgsl_permutation; rank: NativeUInt; b: Pgsl_vector; x: Pgsl_vector; residual: Pgsl_vector; S: Pgsl_matrix; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_COD_lssolve2';

function gsl_linalg_COD_unpack(QRZT: Pgsl_matrix; tau_Q: Pgsl_vector; tau_Z: Pgsl_vector; rank: NativeUInt; Q: Pgsl_matrix; R: Pgsl_matrix; Z: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_COD_unpack';

function gsl_linalg_COD_matZ(QRZT: Pgsl_matrix; tau_Z: Pgsl_vector; rank: NativeUInt; A: Pgsl_matrix; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_COD_matZ';

function gsl_linalg_LQ_decomp(A: Pgsl_matrix; tau: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_decomp';

function gsl_linalg_LQ_lssolve(LQ: Pgsl_matrix; tau: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector; residual: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_lssolve';

function gsl_linalg_LQ_QTvec(LQ: Pgsl_matrix; tau: Pgsl_vector; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_QTvec';

function gsl_linalg_LQ_solve_T(LQ: Pgsl_matrix; tau: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_solve_T';

function gsl_linalg_LQ_svx_T(LQ: Pgsl_matrix; tau: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_svx_T';

function gsl_linalg_LQ_lssolve_T(LQ: Pgsl_matrix; tau: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector; residual: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_lssolve_T';

function gsl_linalg_LQ_Lsolve_T(LQ: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_Lsolve_T';

function gsl_linalg_LQ_Lsvx_T(LQ: Pgsl_matrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_Lsvx_T';

function gsl_linalg_L_solve_T(L: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_L_solve_T';

function gsl_linalg_LQ_vecQ(LQ: Pgsl_matrix; tau: Pgsl_vector; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_vecQ';

function gsl_linalg_LQ_vecQT(LQ: Pgsl_matrix; tau: Pgsl_vector; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_vecQT';

function gsl_linalg_LQ_unpack(LQ: Pgsl_matrix; tau: Pgsl_vector; Q: Pgsl_matrix; L: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_unpack';

function gsl_linalg_LQ_update(Q: Pgsl_matrix; R: Pgsl_matrix; v: Pgsl_vector; w: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_update';

function gsl_linalg_LQ_LQsolve(Q: Pgsl_matrix; L: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_LQ_LQsolve';

function gsl_linalg_PTLQ_decomp(A: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; signum: PInteger; norm: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_PTLQ_decomp';

function gsl_linalg_PTLQ_decomp2(A: Pgsl_matrix; q: Pgsl_matrix; r: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; signum: PInteger; norm: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_PTLQ_decomp2';

function gsl_linalg_PTLQ_solve_T(QR: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_PTLQ_solve_T';

function gsl_linalg_PTLQ_svx_T(LQ: Pgsl_matrix; tau: Pgsl_vector; p: Pgsl_permutation; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_PTLQ_svx_T';

function gsl_linalg_PTLQ_LQsolve_T(Q: Pgsl_matrix; L: Pgsl_matrix; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_PTLQ_LQsolve_T';

function gsl_linalg_PTLQ_Lsolve_T(LQ: Pgsl_matrix; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_PTLQ_Lsolve_T';

function gsl_linalg_PTLQ_Lsvx_T(LQ: Pgsl_matrix; p: Pgsl_permutation; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_PTLQ_Lsvx_T';

function gsl_linalg_PTLQ_update(Q: Pgsl_matrix; L: Pgsl_matrix; p: Pgsl_permutation; v: Pgsl_vector; w: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_PTLQ_update';

function gsl_linalg_cholesky_decomp(A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_decomp';

function gsl_linalg_cholesky_decomp1(A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_decomp1';

function gsl_linalg_cholesky_decomp_L2(A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_decomp_L2';

function gsl_linalg_cholesky_decomp_L3(A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_decomp_L3';

function gsl_linalg_cholesky_solve(cholesky: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_solve';

function gsl_linalg_cholesky_solve_mat(cholesky: Pgsl_matrix; B: Pgsl_matrix; X: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_solve_mat';

function gsl_linalg_cholesky_svx(cholesky: Pgsl_matrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_svx';

function gsl_linalg_cholesky_svx_mat(cholesky: Pgsl_matrix; X: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_svx_mat';

function gsl_linalg_cholesky_invert(cholesky: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_invert';

function gsl_linalg_cholesky_decomp_unit(A: Pgsl_matrix; D: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_decomp_unit';

function gsl_linalg_cholesky_scale(A: Pgsl_matrix; S: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_scale';

function gsl_linalg_cholesky_scale_apply(A: Pgsl_matrix; S: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_scale_apply';

function gsl_linalg_cholesky_decomp2(A: Pgsl_matrix; S: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_decomp2';

function gsl_linalg_cholesky_svx2(LLT: Pgsl_matrix; S: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_svx2';

function gsl_linalg_cholesky_solve2(LLT: Pgsl_matrix; S: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_solve2';

function gsl_linalg_cholesky_rcond(LLT: Pgsl_matrix; rcond: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_rcond';

function gsl_linalg_complex_cholesky_decomp(A: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_cholesky_decomp';

function gsl_linalg_complex_cholesky_solve(cholesky: Pgsl_matrix_complex; b: Pgsl_vector_complex; x: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_cholesky_solve';

function gsl_linalg_complex_cholesky_svx(cholesky: Pgsl_matrix_complex; x: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_cholesky_svx';

function gsl_linalg_complex_cholesky_invert(cholesky: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_complex_cholesky_invert';

function gsl_linalg_pcholesky_decomp(A: Pgsl_matrix; p: Pgsl_permutation): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_pcholesky_decomp';

function gsl_linalg_pcholesky_solve(LDLT: Pgsl_matrix; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_pcholesky_solve';

function gsl_linalg_pcholesky_svx(LDLT: Pgsl_matrix; p: Pgsl_permutation; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_pcholesky_svx';

function gsl_linalg_pcholesky_decomp2(A: Pgsl_matrix; p: Pgsl_permutation; S: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_pcholesky_decomp2';

function gsl_linalg_pcholesky_solve2(LDLT: Pgsl_matrix; p: Pgsl_permutation; S: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_pcholesky_solve2';

function gsl_linalg_pcholesky_svx2(LDLT: Pgsl_matrix; p: Pgsl_permutation; S: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_pcholesky_svx2';

function gsl_linalg_pcholesky_invert(LDLT: Pgsl_matrix; p: Pgsl_permutation; Ainv: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_pcholesky_invert';

function gsl_linalg_pcholesky_rcond(LDLT: Pgsl_matrix; p: Pgsl_permutation; rcond: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_pcholesky_rcond';

function gsl_linalg_mcholesky_decomp(A: Pgsl_matrix; p: Pgsl_permutation; E: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_mcholesky_decomp';

function gsl_linalg_mcholesky_solve(LDLT: Pgsl_matrix; p: Pgsl_permutation; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_mcholesky_solve';

function gsl_linalg_mcholesky_svx(LDLT: Pgsl_matrix; p: Pgsl_permutation; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_mcholesky_svx';

function gsl_linalg_mcholesky_rcond(LDLT: Pgsl_matrix; p: Pgsl_permutation; rcond: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_mcholesky_rcond';

function gsl_linalg_mcholesky_invert(LDLT: Pgsl_matrix; p: Pgsl_permutation; Ainv: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_mcholesky_invert';

function gsl_linalg_cholesky_band_decomp(A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_band_decomp';

function gsl_linalg_cholesky_band_solve(LLT: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_band_solve';

function gsl_linalg_cholesky_band_svx(LLT: Pgsl_matrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_band_svx';

function gsl_linalg_cholesky_band_invert(LLT: Pgsl_matrix; Ainv: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_band_invert';

function gsl_linalg_cholesky_band_unpack(LLT: Pgsl_matrix; L: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_band_unpack';

function gsl_linalg_cholesky_band_rcond(LLT: Pgsl_matrix; rcond: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_cholesky_band_rcond';

function gsl_linalg_ldlt_decomp(A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_ldlt_decomp';

function gsl_linalg_ldlt_solve(LDLT: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_ldlt_solve';

function gsl_linalg_ldlt_svx(LDLT: Pgsl_matrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_ldlt_svx';

function gsl_linalg_ldlt_rcond(LDLT: Pgsl_matrix; rcond: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_ldlt_rcond';

function gsl_linalg_ldlt_band_decomp(A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_ldlt_band_decomp';

function gsl_linalg_ldlt_band_solve(LDLT: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_ldlt_band_solve';

function gsl_linalg_ldlt_band_svx(LDLT: Pgsl_matrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_ldlt_band_svx';

function gsl_linalg_ldlt_band_unpack(LDLT: Pgsl_matrix; L: Pgsl_matrix; D: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_ldlt_band_unpack';

function gsl_linalg_ldlt_band_rcond(LDLT: Pgsl_matrix; rcond: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_ldlt_band_rcond';

function gsl_linalg_symmtd_decomp(A: Pgsl_matrix; tau: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_symmtd_decomp';

function gsl_linalg_symmtd_unpack(A: Pgsl_matrix; tau: Pgsl_vector; Q: Pgsl_matrix; diag: Pgsl_vector; subdiag: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_symmtd_unpack';

function gsl_linalg_symmtd_unpack_T(A: Pgsl_matrix; diag: Pgsl_vector; subdiag: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_symmtd_unpack_T';

function gsl_linalg_hermtd_decomp(A: Pgsl_matrix_complex; tau: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_hermtd_decomp';

function gsl_linalg_hermtd_unpack(A: Pgsl_matrix_complex; tau: Pgsl_vector_complex; U: Pgsl_matrix_complex; diag: Pgsl_vector; sudiag: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_hermtd_unpack';

function gsl_linalg_hermtd_unpack_T(A: Pgsl_matrix_complex; diag: Pgsl_vector; subdiag: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_hermtd_unpack_T';

function gsl_linalg_HH_solve(A: Pgsl_matrix; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_HH_solve';

function gsl_linalg_HH_svx(A: Pgsl_matrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_HH_svx';

function gsl_linalg_solve_symm_tridiag(diag: Pgsl_vector; offdiag: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_solve_symm_tridiag';

function gsl_linalg_solve_tridiag(diag: Pgsl_vector; abovediag: Pgsl_vector; belowdiag: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_solve_tridiag';

function gsl_linalg_solve_symm_cyc_tridiag(diag: Pgsl_vector; offdiag: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_solve_symm_cyc_tridiag';

function gsl_linalg_solve_cyc_tridiag(diag: Pgsl_vector; abovediag: Pgsl_vector; belowdiag: Pgsl_vector; b: Pgsl_vector; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_solve_cyc_tridiag';

function gsl_linalg_bidiag_decomp(A: Pgsl_matrix; tau_U: Pgsl_vector; tau_V: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_bidiag_decomp';

function gsl_linalg_bidiag_unpack(A: Pgsl_matrix; tau_U: Pgsl_vector; U: Pgsl_matrix; tau_V: Pgsl_vector; V: Pgsl_matrix; diag: Pgsl_vector; superdiag: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_bidiag_unpack';

function gsl_linalg_bidiag_unpack2(A: Pgsl_matrix; tau_U: Pgsl_vector; tau_V: Pgsl_vector; V: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_bidiag_unpack2';

function gsl_linalg_bidiag_unpack_B(A: Pgsl_matrix; diag: Pgsl_vector; superdiag: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_bidiag_unpack_B';

function gsl_linalg_balance_matrix(A: Pgsl_matrix; D: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_balance_matrix';

function gsl_linalg_balance_accum(A: Pgsl_matrix; D: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_balance_accum';

function gsl_linalg_balance_columns(A: Pgsl_matrix; D: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_balance_columns';

function gsl_linalg_tri_upper_rcond(A: Pgsl_matrix; rcond: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_tri_upper_rcond';

function gsl_linalg_tri_lower_rcond(A: Pgsl_matrix; rcond: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_tri_lower_rcond';

type
  gsl_linalg_invnorm1_Ainvx = function(TransA: CBLAS_TRANSPOSE_t; x: Pgsl_vector; params: Pointer): Integer; cdecl;

function gsl_linalg_invnorm1(N: NativeUInt; Ainvx: gsl_linalg_invnorm1_Ainvx; params: Pointer; Ainvnorm: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_invnorm1';

function gsl_linalg_tri_upper_invert(T: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_tri_upper_invert';

function gsl_linalg_tri_lower_invert(T: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_tri_lower_invert';

function gsl_linalg_tri_upper_unit_invert(T: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_tri_upper_unit_invert';

function gsl_linalg_tri_lower_unit_invert(T: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_linalg_tri_lower_unit_invert';

procedure gsl_linalg_givens(a: Double; b: Double; c: PDouble; s: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_linalg_givens';

procedure gsl_linalg_givens_gv(v: Pgsl_vector; i: NativeUInt; j: NativeUInt; c: Double; s: Double); cdecl;
  external LIBGSL name _PU + 'gsl_linalg_givens_gv';

procedure gsl_message(&message: PUTF8Char; &file: PUTF8Char; line: Integer; mask: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_message';

function gsl_min_fminimizer_alloc(T: Pgsl_min_fminimizer_type): Pgsl_min_fminimizer; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_alloc';

procedure gsl_min_fminimizer_free(s: Pgsl_min_fminimizer); cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_free';

function gsl_min_fminimizer_set(s: Pgsl_min_fminimizer; f: Pgsl_function; x_minimum: Double; x_lower: Double; x_upper: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_set';

function gsl_min_fminimizer_set_with_values(s: Pgsl_min_fminimizer; f: Pgsl_function; x_minimum: Double; f_minimum: Double; x_lower: Double; f_lower: Double; x_upper: Double; f_upper: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_set_with_values';

function gsl_min_fminimizer_iterate(s: Pgsl_min_fminimizer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_iterate';

function gsl_min_fminimizer_name(s: Pgsl_min_fminimizer): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_name';

function gsl_min_fminimizer_x_minimum(s: Pgsl_min_fminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_x_minimum';

function gsl_min_fminimizer_x_lower(s: Pgsl_min_fminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_x_lower';

function gsl_min_fminimizer_x_upper(s: Pgsl_min_fminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_x_upper';

function gsl_min_fminimizer_f_minimum(s: Pgsl_min_fminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_f_minimum';

function gsl_min_fminimizer_f_lower(s: Pgsl_min_fminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_f_lower';

function gsl_min_fminimizer_f_upper(s: Pgsl_min_fminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_f_upper';

function gsl_min_fminimizer_minimum(s: Pgsl_min_fminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_min_fminimizer_minimum';

function gsl_min_test_interval(x_lower: Double; x_upper: Double; epsabs: Double; epsrel: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_min_test_interval';

function gsl_min_find_bracket(f: Pgsl_function; x_minimum: PDouble; f_minimum: PDouble; x_lower: PDouble; f_lower: PDouble; x_upper: PDouble; f_upper: PDouble; eval_max: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_min_find_bracket';

function gsl_rng_types_setup(): PPgsl_rng_type; cdecl;
  external LIBGSL name _PU + 'gsl_rng_types_setup';

function gsl_rng_alloc(T: Pgsl_rng_type): Pgsl_rng; cdecl;
  external LIBGSL name _PU + 'gsl_rng_alloc';

function gsl_rng_memcpy(dest: Pgsl_rng; src: Pgsl_rng): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_rng_memcpy';

function gsl_rng_clone(r: Pgsl_rng): Pgsl_rng; cdecl;
  external LIBGSL name _PU + 'gsl_rng_clone';

procedure gsl_rng_free(r: Pgsl_rng); cdecl;
  external LIBGSL name _PU + 'gsl_rng_free';

procedure gsl_rng_set(r: Pgsl_rng; seed: Cardinal); cdecl;
  external LIBGSL name _PU + 'gsl_rng_set';

function gsl_rng_max(r: Pgsl_rng): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_rng_max';

function gsl_rng_min(r: Pgsl_rng): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_rng_min';

function gsl_rng_name(r: Pgsl_rng): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_rng_name';

function gsl_rng_fread(stream: PPointer; r: Pgsl_rng): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_rng_fread';

function gsl_rng_fwrite(stream: PPointer; r: Pgsl_rng): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_rng_fwrite';

function gsl_rng_size(r: Pgsl_rng): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_rng_size';

function gsl_rng_state(r: Pgsl_rng): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_rng_state';

procedure gsl_rng_print_state(r: Pgsl_rng); cdecl;
  external LIBGSL name _PU + 'gsl_rng_print_state';

function gsl_rng_env_setup(): Pgsl_rng_type; cdecl;
  external LIBGSL name _PU + 'gsl_rng_env_setup';

function gsl_rng_get(r: Pgsl_rng): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_rng_get';

function gsl_rng_uniform(r: Pgsl_rng): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rng_uniform';

function gsl_rng_uniform_pos(r: Pgsl_rng): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rng_uniform_pos';

function gsl_rng_uniform_int(r: Pgsl_rng; n: Cardinal): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_rng_uniform_int';

function gsl_monte_plain_integrate(f: Pgsl_monte_function; xl: PDouble; xu: PDouble; dim: NativeUInt; calls: NativeUInt; r: Pgsl_rng; state: Pgsl_monte_plain_state; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_monte_plain_integrate';

function gsl_monte_plain_alloc(dim: NativeUInt): Pgsl_monte_plain_state; cdecl;
  external LIBGSL name _PU + 'gsl_monte_plain_alloc';

function gsl_monte_plain_init(state: Pgsl_monte_plain_state): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_monte_plain_init';

procedure gsl_monte_plain_free(state: Pgsl_monte_plain_state); cdecl;
  external LIBGSL name _PU + 'gsl_monte_plain_free';

function gsl_monte_miser_integrate(f: Pgsl_monte_function; xl: PDouble; xh: PDouble; dim: NativeUInt; calls: NativeUInt; r: Pgsl_rng; state: Pgsl_monte_miser_state; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_monte_miser_integrate';

function gsl_monte_miser_alloc(dim: NativeUInt): Pgsl_monte_miser_state; cdecl;
  external LIBGSL name _PU + 'gsl_monte_miser_alloc';

function gsl_monte_miser_init(state: Pgsl_monte_miser_state): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_monte_miser_init';

procedure gsl_monte_miser_free(state: Pgsl_monte_miser_state); cdecl;
  external LIBGSL name _PU + 'gsl_monte_miser_free';

procedure gsl_monte_miser_params_get(state: Pgsl_monte_miser_state; params: Pgsl_monte_miser_params); cdecl;
  external LIBGSL name _PU + 'gsl_monte_miser_params_get';

procedure gsl_monte_miser_params_set(state: Pgsl_monte_miser_state; params: Pgsl_monte_miser_params); cdecl;
  external LIBGSL name _PU + 'gsl_monte_miser_params_set';

function gsl_monte_vegas_integrate(f: Pgsl_monte_function; xl: PDouble; xu: PDouble; dim: NativeUInt; calls: NativeUInt; r: Pgsl_rng; state: Pgsl_monte_vegas_state; result: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_monte_vegas_integrate';

function gsl_monte_vegas_alloc(dim: NativeUInt): Pgsl_monte_vegas_state; cdecl;
  external LIBGSL name _PU + 'gsl_monte_vegas_alloc';

function gsl_monte_vegas_init(state: Pgsl_monte_vegas_state): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_monte_vegas_init';

procedure gsl_monte_vegas_free(state: Pgsl_monte_vegas_state); cdecl;
  external LIBGSL name _PU + 'gsl_monte_vegas_free';

function gsl_monte_vegas_chisq(state: Pgsl_monte_vegas_state): Double; cdecl;
  external LIBGSL name _PU + 'gsl_monte_vegas_chisq';

procedure gsl_monte_vegas_runval(state: Pgsl_monte_vegas_state; result: PDouble; sigma: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_monte_vegas_runval';

procedure gsl_monte_vegas_params_get(state: Pgsl_monte_vegas_state; params: Pgsl_monte_vegas_params); cdecl;
  external LIBGSL name _PU + 'gsl_monte_vegas_params_get';

procedure gsl_monte_vegas_params_set(state: Pgsl_monte_vegas_state; params: Pgsl_monte_vegas_params); cdecl;
  external LIBGSL name _PU + 'gsl_monte_vegas_params_set';

function gsl_multifit_linear_alloc(n: NativeUInt; p: NativeUInt): Pgsl_multifit_linear_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_alloc';

procedure gsl_multifit_linear_free(w: Pgsl_multifit_linear_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_free';

function gsl_multifit_linear(X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix; chisq: PDouble; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear';

function gsl_multifit_linear_tsvd(X: Pgsl_matrix; y: Pgsl_vector; tol: Double; c: Pgsl_vector; cov: Pgsl_matrix; chisq: PDouble; rank: PNativeUInt; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_tsvd';

function gsl_multifit_linear_svd(X: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_svd';

function gsl_multifit_linear_bsvd(X: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_bsvd';

function gsl_multifit_linear_rank(tol: Double; work: Pgsl_multifit_linear_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_rank';

function gsl_multifit_linear_solve(lambda: Double; X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; rnorm: PDouble; snorm: PDouble; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_solve';

function gsl_multifit_linear_applyW(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; WX: Pgsl_matrix; Wy: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_applyW';

function gsl_multifit_linear_stdform1(L: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_stdform1';

function gsl_multifit_linear_wstdform1(L: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_wstdform1';

function gsl_multifit_linear_L_decomp(L: Pgsl_matrix; tau: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_L_decomp';

function gsl_multifit_linear_stdform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector; M: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_stdform2';

function gsl_multifit_linear_wstdform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector; M: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_wstdform2';

function gsl_multifit_linear_genform1(L: Pgsl_vector; cs: Pgsl_vector; c: Pgsl_vector; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_genform1';

function gsl_multifit_linear_genform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; cs: Pgsl_vector; M: Pgsl_matrix; c: Pgsl_vector; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_genform2';

function gsl_multifit_linear_wgenform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; cs: Pgsl_vector; M: Pgsl_matrix; c: Pgsl_vector; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_wgenform2';

function gsl_multifit_linear_lreg(smin: Double; smax: Double; reg_param: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_lreg';

function gsl_multifit_linear_lcurve(y: Pgsl_vector; reg_param: Pgsl_vector; rho: Pgsl_vector; eta: Pgsl_vector; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_lcurve';

function gsl_multifit_linear_lcorner(rho: Pgsl_vector; eta: Pgsl_vector; idx: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_lcorner';

function gsl_multifit_linear_lcorner2(reg_param: Pgsl_vector; eta: Pgsl_vector; idx: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_lcorner2';

function gsl_multifit_linear_Lk(p: NativeUInt; k: NativeUInt; L: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_Lk';

function gsl_multifit_linear_Lsobolev(p: NativeUInt; kmax: NativeUInt; alpha: Pgsl_vector; L: Pgsl_matrix; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_Lsobolev';

function gsl_multifit_wlinear(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix; chisq: PDouble; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_wlinear';

function gsl_multifit_wlinear_tsvd(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; tol: Double; c: Pgsl_vector; cov: Pgsl_matrix; chisq: PDouble; rank: PNativeUInt; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_wlinear_tsvd';

function gsl_multifit_wlinear_svd(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; tol: Double; rank: PNativeUInt; c: Pgsl_vector; cov: Pgsl_matrix; chisq: PDouble; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_wlinear_svd';

function gsl_multifit_wlinear_usvd(X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; tol: Double; rank: PNativeUInt; c: Pgsl_vector; cov: Pgsl_matrix; chisq: PDouble; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_wlinear_usvd';

function gsl_multifit_linear_est(x: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix; y: PDouble; y_err: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_est';

function gsl_multifit_linear_rcond(w: Pgsl_multifit_linear_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_rcond';

function gsl_multifit_linear_residuals(X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; r: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_residuals';

function gsl_multifit_linear_gcv_init(y: Pgsl_vector; reg_param: Pgsl_vector; UTy: Pgsl_vector; delta0: PDouble; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_gcv_init';

function gsl_multifit_linear_gcv_curve(reg_param: Pgsl_vector; UTy: Pgsl_vector; delta0: Double; G: Pgsl_vector; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_gcv_curve';

function gsl_multifit_linear_gcv_min(reg_param: Pgsl_vector; UTy: Pgsl_vector; G: Pgsl_vector; delta0: Double; lambda: PDouble; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_gcv_min';

function gsl_multifit_linear_gcv_calc(lambda: Double; UTy: Pgsl_vector; delta0: Double; work: Pgsl_multifit_linear_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_gcv_calc';

function gsl_multifit_linear_gcv(y: Pgsl_vector; reg_param: Pgsl_vector; G: Pgsl_vector; lambda: PDouble; G_lambda: PDouble; work: Pgsl_multifit_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_linear_gcv';

function gsl_multifit_robust_alloc(T: Pgsl_multifit_robust_type; n: NativeUInt; p: NativeUInt): Pgsl_multifit_robust_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust_alloc';

procedure gsl_multifit_robust_free(w: Pgsl_multifit_robust_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust_free';

function gsl_multifit_robust_tune(tune: Double; w: Pgsl_multifit_robust_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust_tune';

function gsl_multifit_robust_maxiter(maxiter: NativeUInt; w: Pgsl_multifit_robust_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust_maxiter';

function gsl_multifit_robust_name(w: Pgsl_multifit_robust_workspace): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust_name';

function gsl_multifit_robust_statistics(w: Pgsl_multifit_robust_workspace): gsl_multifit_robust_stats; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust_statistics';

function gsl_multifit_robust_weights(r: Pgsl_vector; wts: Pgsl_vector; w: Pgsl_multifit_robust_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust_weights';

function gsl_multifit_robust(X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix; w: Pgsl_multifit_robust_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust';

function gsl_multifit_robust_est(x: Pgsl_vector; c: Pgsl_vector; cov: Pgsl_matrix; y: PDouble; y_err: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust_est';

function gsl_multifit_robust_residuals(X: Pgsl_matrix; y: Pgsl_vector; c: Pgsl_vector; r: Pgsl_vector; w: Pgsl_multifit_robust_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_robust_residuals';

function gsl_multifit_gradient(J: Pgsl_matrix; f: Pgsl_vector; g: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_gradient';

function gsl_multifit_covar(J: Pgsl_matrix; epsrel: Double; covar: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_covar';

function gsl_multifit_covar_QRPT(r: Pgsl_matrix; perm: Pgsl_permutation; epsrel: Double; covar: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_covar_QRPT';

function gsl_multifit_fsolver_alloc(T: Pgsl_multifit_fsolver_type; n: NativeUInt; p: NativeUInt): Pgsl_multifit_fsolver; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fsolver_alloc';

procedure gsl_multifit_fsolver_free(s: Pgsl_multifit_fsolver); cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fsolver_free';

function gsl_multifit_fsolver_set(s: Pgsl_multifit_fsolver; f: Pgsl_multifit_function; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fsolver_set';

function gsl_multifit_fsolver_iterate(s: Pgsl_multifit_fsolver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fsolver_iterate';

function gsl_multifit_fsolver_driver(s: Pgsl_multifit_fsolver; maxiter: NativeUInt; epsabs: Double; epsrel: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fsolver_driver';

function gsl_multifit_fsolver_name(s: Pgsl_multifit_fsolver): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fsolver_name';

function gsl_multifit_fsolver_position(s: Pgsl_multifit_fsolver): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fsolver_position';

function gsl_multifit_fdfsolver_alloc(T: Pgsl_multifit_fdfsolver_type; n: NativeUInt; p: NativeUInt): Pgsl_multifit_fdfsolver; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_alloc';

function gsl_multifit_fdfsolver_set(s: Pgsl_multifit_fdfsolver; fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_set';

function gsl_multifit_fdfsolver_wset(s: Pgsl_multifit_fdfsolver; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; wts: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_wset';

function gsl_multifit_fdfsolver_iterate(s: Pgsl_multifit_fdfsolver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_iterate';

function gsl_multifit_fdfsolver_driver(s: Pgsl_multifit_fdfsolver; maxiter: NativeUInt; xtol: Double; gtol: Double; ftol: Double; info: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_driver';

function gsl_multifit_fdfsolver_jac(s: Pgsl_multifit_fdfsolver; J: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_jac';

procedure gsl_multifit_fdfsolver_free(s: Pgsl_multifit_fdfsolver); cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_free';

function gsl_multifit_fdfsolver_name(s: Pgsl_multifit_fdfsolver): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_name';

function gsl_multifit_fdfsolver_position(s: Pgsl_multifit_fdfsolver): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_position';

function gsl_multifit_fdfsolver_residual(s: Pgsl_multifit_fdfsolver): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_residual';

function gsl_multifit_fdfsolver_niter(s: Pgsl_multifit_fdfsolver): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_niter';

function gsl_multifit_eval_wf(fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector; wts: Pgsl_vector; y: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_eval_wf';

function gsl_multifit_eval_wdf(fdf: Pgsl_multifit_function_fdf; x: Pgsl_vector; wts: Pgsl_vector; dy: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_eval_wdf';

function gsl_multifit_fdfsolver_test(s: Pgsl_multifit_fdfsolver; xtol: Double; gtol: Double; ftol: Double; info: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_test';

function gsl_multifit_test_delta(dx: Pgsl_vector; x: Pgsl_vector; epsabs: Double; epsrel: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_test_delta';

function gsl_multifit_test_gradient(g: Pgsl_vector; epsabs: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_test_gradient';

function gsl_multifit_fdfsolver_dif_df(x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multifit_function_fdf; f: Pgsl_vector; J: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_dif_df';

function gsl_multifit_fdfsolver_dif_fdf(x: Pgsl_vector; fdf: Pgsl_multifit_function_fdf; f: Pgsl_vector; J: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfsolver_dif_fdf';

function gsl_multifit_fdfridge_alloc(T: Pgsl_multifit_fdfsolver_type; n: NativeUInt; p: NativeUInt): Pgsl_multifit_fdfridge; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_alloc';

procedure gsl_multifit_fdfridge_free(work: Pgsl_multifit_fdfridge); cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_free';

function gsl_multifit_fdfridge_name(w: Pgsl_multifit_fdfridge): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_name';

function gsl_multifit_fdfridge_position(w: Pgsl_multifit_fdfridge): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_position';

function gsl_multifit_fdfridge_residual(w: Pgsl_multifit_fdfridge): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_residual';

function gsl_multifit_fdfridge_niter(w: Pgsl_multifit_fdfridge): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_niter';

function gsl_multifit_fdfridge_set(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; lambda: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_set';

function gsl_multifit_fdfridge_wset(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; lambda: Double; wts: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_wset';

function gsl_multifit_fdfridge_set2(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; lambda: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_set2';

function gsl_multifit_fdfridge_wset2(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; lambda: Pgsl_vector; wts: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_wset2';

function gsl_multifit_fdfridge_set3(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; L: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_set3';

function gsl_multifit_fdfridge_wset3(w: Pgsl_multifit_fdfridge; f: Pgsl_multifit_function_fdf; x: Pgsl_vector; L: Pgsl_matrix; wts: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_wset3';

function gsl_multifit_fdfridge_iterate(w: Pgsl_multifit_fdfridge): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_iterate';

function gsl_multifit_fdfridge_driver(w: Pgsl_multifit_fdfridge; maxiter: NativeUInt; xtol: Double; gtol: Double; ftol: Double; info: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_fdfridge_driver';

function gsl_multifit_nlinear_alloc(T: Pgsl_multifit_nlinear_type; params: Pgsl_multifit_nlinear_parameters; n: NativeUInt; p: NativeUInt): Pgsl_multifit_nlinear_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_alloc';

procedure gsl_multifit_nlinear_free(w: Pgsl_multifit_nlinear_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_free';

function gsl_multifit_nlinear_default_parameters(): gsl_multifit_nlinear_parameters; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_default_parameters';

function gsl_multifit_nlinear_init(x: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; w: Pgsl_multifit_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_init';

function gsl_multifit_nlinear_winit(x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; w: Pgsl_multifit_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_winit';

function gsl_multifit_nlinear_iterate(w: Pgsl_multifit_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_iterate';

function gsl_multifit_nlinear_avratio(w: Pgsl_multifit_nlinear_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_avratio';

type
  gsl_multifit_nlinear_driver_callback = procedure(iter: NativeUInt; params: Pointer; w: Pgsl_multifit_nlinear_workspace); cdecl;

function gsl_multifit_nlinear_driver(maxiter: NativeUInt; xtol: Double; gtol: Double; ftol: Double; callback: gsl_multifit_nlinear_driver_callback; callback_params: Pointer; info: PInteger; w: Pgsl_multifit_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_driver';

function gsl_multifit_nlinear_jac(w: Pgsl_multifit_nlinear_workspace): Pgsl_matrix; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_jac';

function gsl_multifit_nlinear_name(w: Pgsl_multifit_nlinear_workspace): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_name';

function gsl_multifit_nlinear_position(w: Pgsl_multifit_nlinear_workspace): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_position';

function gsl_multifit_nlinear_residual(w: Pgsl_multifit_nlinear_workspace): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_residual';

function gsl_multifit_nlinear_niter(w: Pgsl_multifit_nlinear_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_niter';

function gsl_multifit_nlinear_rcond(rcond: PDouble; w: Pgsl_multifit_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_rcond';

function gsl_multifit_nlinear_trs_name(w: Pgsl_multifit_nlinear_workspace): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_trs_name';

function gsl_multifit_nlinear_eval_f(fdf: Pgsl_multifit_nlinear_fdf; x: Pgsl_vector; swts: Pgsl_vector; y: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_eval_f';

function gsl_multifit_nlinear_eval_df(x: Pgsl_vector; f: Pgsl_vector; swts: Pgsl_vector; h: Double; fdtype: gsl_multifit_nlinear_fdtype; fdf: Pgsl_multifit_nlinear_fdf; df: Pgsl_matrix; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_eval_df';

function gsl_multifit_nlinear_eval_fvv(h: Double; x: Pgsl_vector; v: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix; swts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; yvv: Pgsl_vector; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_eval_fvv';

function gsl_multifit_nlinear_covar(J: Pgsl_matrix; epsrel: Double; covar: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_covar';

function gsl_multifit_nlinear_test(xtol: Double; gtol: Double; ftol: Double; info: PInteger; w: Pgsl_multifit_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_test';

function gsl_multifit_nlinear_df(h: Double; fdtype: gsl_multifit_nlinear_fdtype; x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; f: Pgsl_vector; J: Pgsl_matrix; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_df';

function gsl_multifit_nlinear_fdfvv(h: Double; x: Pgsl_vector; v: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix; swts: Pgsl_vector; fdf: Pgsl_multifit_nlinear_fdf; fvv: Pgsl_vector; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multifit_nlinear_fdfvv';

function gsl_multilarge_linear_alloc(T: Pgsl_multilarge_linear_type; p: NativeUInt): Pgsl_multilarge_linear_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_alloc';

procedure gsl_multilarge_linear_free(w: Pgsl_multilarge_linear_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_free';

function gsl_multilarge_linear_name(w: Pgsl_multilarge_linear_workspace): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_name';

function gsl_multilarge_linear_reset(w: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_reset';

function gsl_multilarge_linear_accumulate(X: Pgsl_matrix; y: Pgsl_vector; w: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_accumulate';

function gsl_multilarge_linear_solve(lambda: Double; c: Pgsl_vector; rnorm: PDouble; snorm: PDouble; w: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_solve';

function gsl_multilarge_linear_rcond(rcond: PDouble; w: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_rcond';

function gsl_multilarge_linear_lcurve(reg_param: Pgsl_vector; rho: Pgsl_vector; eta: Pgsl_vector; w: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_lcurve';

function gsl_multilarge_linear_wstdform1(L: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_wstdform1';

function gsl_multilarge_linear_stdform1(L: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_stdform1';

function gsl_multilarge_linear_L_decomp(L: Pgsl_matrix; tau: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_L_decomp';

function gsl_multilarge_linear_wstdform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; w: Pgsl_vector; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_wstdform2';

function gsl_multilarge_linear_stdform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; X: Pgsl_matrix; y: Pgsl_vector; Xs: Pgsl_matrix; ys: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_stdform2';

function gsl_multilarge_linear_genform1(L: Pgsl_vector; cs: Pgsl_vector; c: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_genform1';

function gsl_multilarge_linear_genform2(LQR: Pgsl_matrix; Ltau: Pgsl_vector; cs: Pgsl_vector; c: Pgsl_vector; work: Pgsl_multilarge_linear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_linear_genform2';

function gsl_multilarge_nlinear_alloc(T: Pgsl_multilarge_nlinear_type; params: Pgsl_multilarge_nlinear_parameters; n: NativeUInt; p: NativeUInt): Pgsl_multilarge_nlinear_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_alloc';

procedure gsl_multilarge_nlinear_free(w: Pgsl_multilarge_nlinear_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_free';

function gsl_multilarge_nlinear_default_parameters(): gsl_multilarge_nlinear_parameters; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_default_parameters';

function gsl_multilarge_nlinear_init(x: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; w: Pgsl_multilarge_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_init';

function gsl_multilarge_nlinear_winit(x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; w: Pgsl_multilarge_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_winit';

function gsl_multilarge_nlinear_iterate(w: Pgsl_multilarge_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_iterate';

function gsl_multilarge_nlinear_avratio(w: Pgsl_multilarge_nlinear_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_avratio';

function gsl_multilarge_nlinear_rcond(rcond: PDouble; w: Pgsl_multilarge_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_rcond';

function gsl_multilarge_nlinear_covar(covar: Pgsl_matrix; w: Pgsl_multilarge_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_covar';

type
  gsl_multilarge_nlinear_driver_callback = procedure(iter: NativeUInt; params: Pointer; w: Pgsl_multilarge_nlinear_workspace); cdecl;

function gsl_multilarge_nlinear_driver(maxiter: NativeUInt; xtol: Double; gtol: Double; ftol: Double; callback: gsl_multilarge_nlinear_driver_callback; callback_params: Pointer; info: PInteger; w: Pgsl_multilarge_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_driver';

function gsl_multilarge_nlinear_name(w: Pgsl_multilarge_nlinear_workspace): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_name';

function gsl_multilarge_nlinear_position(w: Pgsl_multilarge_nlinear_workspace): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_position';

function gsl_multilarge_nlinear_residual(w: Pgsl_multilarge_nlinear_workspace): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_residual';

function gsl_multilarge_nlinear_step(w: Pgsl_multilarge_nlinear_workspace): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_step';

function gsl_multilarge_nlinear_niter(w: Pgsl_multilarge_nlinear_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_niter';

function gsl_multilarge_nlinear_trs_name(w: Pgsl_multilarge_nlinear_workspace): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_trs_name';

function gsl_multilarge_nlinear_eval_f(fdf: Pgsl_multilarge_nlinear_fdf; x: Pgsl_vector; swts: Pgsl_vector; y: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_eval_f';

function gsl_multilarge_nlinear_eval_df(TransJ: CBLAS_TRANSPOSE_t; x: Pgsl_vector; f: Pgsl_vector; u: Pgsl_vector; swts: Pgsl_vector; h: Double; fdtype: gsl_multilarge_nlinear_fdtype; fdf: Pgsl_multilarge_nlinear_fdf; v: Pgsl_vector; JTJ: Pgsl_matrix; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_eval_df';

function gsl_multilarge_nlinear_eval_fvv(h: Double; x: Pgsl_vector; v: Pgsl_vector; f: Pgsl_vector; swts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; yvv: Pgsl_vector; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_eval_fvv';

function gsl_multilarge_nlinear_test(xtol: Double; gtol: Double; ftol: Double; info: PInteger; w: Pgsl_multilarge_nlinear_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_test';

function gsl_multilarge_nlinear_df(h: Double; fdtype: gsl_multilarge_nlinear_fdtype; x: Pgsl_vector; wts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; f: Pgsl_vector; J: Pgsl_matrix; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_df';

function gsl_multilarge_nlinear_fdfvv(h: Double; x: Pgsl_vector; v: Pgsl_vector; f: Pgsl_vector; J: Pgsl_matrix; swts: Pgsl_vector; fdf: Pgsl_multilarge_nlinear_fdf; fvv: Pgsl_vector; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multilarge_nlinear_fdfvv';

function gsl_multimin_diff(f: Pgsl_multimin_function; x: Pgsl_vector; g: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_diff';

function gsl_multimin_fminimizer_alloc(T: Pgsl_multimin_fminimizer_type; n: NativeUInt): Pgsl_multimin_fminimizer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fminimizer_alloc';

function gsl_multimin_fminimizer_set(s: Pgsl_multimin_fminimizer; f: Pgsl_multimin_function; x: Pgsl_vector; step_size: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fminimizer_set';

procedure gsl_multimin_fminimizer_free(s: Pgsl_multimin_fminimizer); cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fminimizer_free';

function gsl_multimin_fminimizer_name(s: Pgsl_multimin_fminimizer): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fminimizer_name';

function gsl_multimin_fminimizer_iterate(s: Pgsl_multimin_fminimizer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fminimizer_iterate';

function gsl_multimin_fminimizer_x(s: Pgsl_multimin_fminimizer): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fminimizer_x';

function gsl_multimin_fminimizer_minimum(s: Pgsl_multimin_fminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fminimizer_minimum';

function gsl_multimin_fminimizer_size(s: Pgsl_multimin_fminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fminimizer_size';

function gsl_multimin_test_gradient(g: Pgsl_vector; epsabs: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_test_gradient';

function gsl_multimin_test_size(size: Double; epsabs: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_test_size';

function gsl_multimin_fdfminimizer_alloc(T: Pgsl_multimin_fdfminimizer_type; n: NativeUInt): Pgsl_multimin_fdfminimizer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_alloc';

function gsl_multimin_fdfminimizer_set(s: Pgsl_multimin_fdfminimizer; fdf: Pgsl_multimin_function_fdf; x: Pgsl_vector; step_size: Double; tol: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_set';

procedure gsl_multimin_fdfminimizer_free(s: Pgsl_multimin_fdfminimizer); cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_free';

function gsl_multimin_fdfminimizer_name(s: Pgsl_multimin_fdfminimizer): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_name';

function gsl_multimin_fdfminimizer_iterate(s: Pgsl_multimin_fdfminimizer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_iterate';

function gsl_multimin_fdfminimizer_restart(s: Pgsl_multimin_fdfminimizer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_restart';

function gsl_multimin_fdfminimizer_x(s: Pgsl_multimin_fdfminimizer): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_x';

function gsl_multimin_fdfminimizer_dx(s: Pgsl_multimin_fdfminimizer): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_dx';

function gsl_multimin_fdfminimizer_gradient(s: Pgsl_multimin_fdfminimizer): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_gradient';

function gsl_multimin_fdfminimizer_minimum(s: Pgsl_multimin_fdfminimizer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_multimin_fdfminimizer_minimum';

function gsl_multiroot_fdjacobian(F: Pgsl_multiroot_function; x: Pgsl_vector; f2: Pgsl_vector; epsrel: Double; jacobian: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fdjacobian';

function gsl_multiroot_fsolver_alloc(T: Pgsl_multiroot_fsolver_type; n: NativeUInt): Pgsl_multiroot_fsolver; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fsolver_alloc';

procedure gsl_multiroot_fsolver_free(s: Pgsl_multiroot_fsolver); cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fsolver_free';

function gsl_multiroot_fsolver_set(s: Pgsl_multiroot_fsolver; f: Pgsl_multiroot_function; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fsolver_set';

function gsl_multiroot_fsolver_iterate(s: Pgsl_multiroot_fsolver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fsolver_iterate';

function gsl_multiroot_fsolver_name(s: Pgsl_multiroot_fsolver): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fsolver_name';

function gsl_multiroot_fsolver_root(s: Pgsl_multiroot_fsolver): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fsolver_root';

function gsl_multiroot_fsolver_dx(s: Pgsl_multiroot_fsolver): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fsolver_dx';

function gsl_multiroot_fsolver_f(s: Pgsl_multiroot_fsolver): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fsolver_f';

function gsl_multiroot_fdfsolver_alloc(T: Pgsl_multiroot_fdfsolver_type; n: NativeUInt): Pgsl_multiroot_fdfsolver; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fdfsolver_alloc';

function gsl_multiroot_fdfsolver_set(s: Pgsl_multiroot_fdfsolver; fdf: Pgsl_multiroot_function_fdf; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fdfsolver_set';

function gsl_multiroot_fdfsolver_iterate(s: Pgsl_multiroot_fdfsolver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fdfsolver_iterate';

procedure gsl_multiroot_fdfsolver_free(s: Pgsl_multiroot_fdfsolver); cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fdfsolver_free';

function gsl_multiroot_fdfsolver_name(s: Pgsl_multiroot_fdfsolver): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fdfsolver_name';

function gsl_multiroot_fdfsolver_root(s: Pgsl_multiroot_fdfsolver): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fdfsolver_root';

function gsl_multiroot_fdfsolver_dx(s: Pgsl_multiroot_fdfsolver): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fdfsolver_dx';

function gsl_multiroot_fdfsolver_f(s: Pgsl_multiroot_fdfsolver): Pgsl_vector; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_fdfsolver_f';

function gsl_multiroot_test_delta(dx: Pgsl_vector; x: Pgsl_vector; epsabs: Double; epsrel: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_test_delta';

function gsl_multiroot_test_residual(f: Pgsl_vector; epsabs: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiroot_test_residual';

function gsl_multiset_alloc(n: NativeUInt; k: NativeUInt): Pgsl_multiset; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_alloc';

function gsl_multiset_calloc(n: NativeUInt; k: NativeUInt): Pgsl_multiset; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_calloc';

procedure gsl_multiset_init_first(c: Pgsl_multiset); cdecl;
  external LIBGSL name _PU + 'gsl_multiset_init_first';

procedure gsl_multiset_init_last(c: Pgsl_multiset); cdecl;
  external LIBGSL name _PU + 'gsl_multiset_init_last';

procedure gsl_multiset_free(c: Pgsl_multiset); cdecl;
  external LIBGSL name _PU + 'gsl_multiset_free';

function gsl_multiset_memcpy(dest: Pgsl_multiset; src: Pgsl_multiset): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_memcpy';

function gsl_multiset_fread(stream: PPointer; c: Pgsl_multiset): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_fread';

function gsl_multiset_fwrite(stream: PPointer; c: Pgsl_multiset): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_fwrite';

function gsl_multiset_fscanf(stream: PPointer; c: Pgsl_multiset): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_fscanf';

function gsl_multiset_fprintf(stream: PPointer; c: Pgsl_multiset; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_fprintf';

function gsl_multiset_n(c: Pgsl_multiset): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_n';

function gsl_multiset_k(c: Pgsl_multiset): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_k';

function gsl_multiset_data(c: Pgsl_multiset): PNativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_data';

function gsl_multiset_valid(c: Pgsl_multiset): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_valid';

function gsl_multiset_next(c: Pgsl_multiset): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_next';

function gsl_multiset_prev(c: Pgsl_multiset): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_prev';

function gsl_multiset_get(c: Pgsl_multiset; i: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_multiset_get';

function gsl_ntuple_open(filename: PUTF8Char; ntuple_data: Pointer; size: NativeUInt): Pgsl_ntuple; cdecl;
  external LIBGSL name _PU + 'gsl_ntuple_open';

function gsl_ntuple_create(filename: PUTF8Char; ntuple_data: Pointer; size: NativeUInt): Pgsl_ntuple; cdecl;
  external LIBGSL name _PU + 'gsl_ntuple_create';

function gsl_ntuple_write(ntuple: Pgsl_ntuple): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ntuple_write';

function gsl_ntuple_read(ntuple: Pgsl_ntuple): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ntuple_read';

function gsl_ntuple_bookdata(ntuple: Pgsl_ntuple): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ntuple_bookdata';

function gsl_ntuple_project(h: Pgsl_histogram; ntuple: Pgsl_ntuple; value_func: Pgsl_ntuple_value_fn; select_func: Pgsl_ntuple_select_fn): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ntuple_project';

function gsl_ntuple_close(ntuple: Pgsl_ntuple): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ntuple_close';

function gsl_odeiv_step_alloc(T: Pgsl_odeiv_step_type; dim: NativeUInt): Pgsl_odeiv_step; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_step_alloc';

function gsl_odeiv_step_reset(s: Pgsl_odeiv_step): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_step_reset';

procedure gsl_odeiv_step_free(s: Pgsl_odeiv_step); cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_step_free';

function gsl_odeiv_step_name(s: Pgsl_odeiv_step): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_step_name';

function gsl_odeiv_step_order(s: Pgsl_odeiv_step): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_step_order';

function gsl_odeiv_step_apply(s: Pgsl_odeiv_step; t: Double; h: Double; y: PDouble; yerr: PDouble; dydt_in: PDouble; dydt_out: PDouble; dydt: Pgsl_odeiv_system): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_step_apply';

function gsl_odeiv_control_alloc(T: Pgsl_odeiv_control_type): Pgsl_odeiv_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_control_alloc';

function gsl_odeiv_control_init(c: Pgsl_odeiv_control; eps_abs: Double; eps_rel: Double; a_y: Double; a_dydt: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_control_init';

procedure gsl_odeiv_control_free(c: Pgsl_odeiv_control); cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_control_free';

function gsl_odeiv_control_hadjust(c: Pgsl_odeiv_control; s: Pgsl_odeiv_step; y: PDouble; yerr: PDouble; dydt: PDouble; h: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_control_hadjust';

function gsl_odeiv_control_name(c: Pgsl_odeiv_control): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_control_name';

function gsl_odeiv_control_standard_new(eps_abs: Double; eps_rel: Double; a_y: Double; a_dydt: Double): Pgsl_odeiv_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_control_standard_new';

function gsl_odeiv_control_y_new(eps_abs: Double; eps_rel: Double): Pgsl_odeiv_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_control_y_new';

function gsl_odeiv_control_yp_new(eps_abs: Double; eps_rel: Double): Pgsl_odeiv_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_control_yp_new';

function gsl_odeiv_control_scaled_new(eps_abs: Double; eps_rel: Double; a_y: Double; a_dydt: Double; scale_abs: PDouble; dim: NativeUInt): Pgsl_odeiv_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_control_scaled_new';

function gsl_odeiv_evolve_alloc(dim: NativeUInt): Pgsl_odeiv_evolve; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_evolve_alloc';

function gsl_odeiv_evolve_apply(e: Pgsl_odeiv_evolve; con: Pgsl_odeiv_control; step: Pgsl_odeiv_step; dydt: Pgsl_odeiv_system; t: PDouble; t1: Double; h: PDouble; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_evolve_apply';

function gsl_odeiv_evolve_reset(e: Pgsl_odeiv_evolve): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_evolve_reset';

procedure gsl_odeiv_evolve_free(e: Pgsl_odeiv_evolve); cdecl;
  external LIBGSL name _PU + 'gsl_odeiv_evolve_free';

function gsl_odeiv2_step_alloc(T: Pgsl_odeiv2_step_type; dim: NativeUInt): Pgsl_odeiv2_step; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_step_alloc';

function gsl_odeiv2_step_reset(s: Pgsl_odeiv2_step): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_step_reset';

procedure gsl_odeiv2_step_free(s: Pgsl_odeiv2_step); cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_step_free';

function gsl_odeiv2_step_name(s: Pgsl_odeiv2_step): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_step_name';

function gsl_odeiv2_step_order(s: Pgsl_odeiv2_step): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_step_order';

function gsl_odeiv2_step_apply(s: Pgsl_odeiv2_step; t: Double; h: Double; y: PDouble; yerr: PDouble; dydt_in: PDouble; dydt_out: PDouble; dydt: Pgsl_odeiv2_system): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_step_apply';

function gsl_odeiv2_step_set_driver(s: Pgsl_odeiv2_step; d: Pgsl_odeiv2_driver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_step_set_driver';

function gsl_odeiv2_control_alloc(T: Pgsl_odeiv2_control_type): Pgsl_odeiv2_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_alloc';

function gsl_odeiv2_control_init(c: Pgsl_odeiv2_control; eps_abs: Double; eps_rel: Double; a_y: Double; a_dydt: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_init';

procedure gsl_odeiv2_control_free(c: Pgsl_odeiv2_control); cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_free';

function gsl_odeiv2_control_hadjust(c: Pgsl_odeiv2_control; s: Pgsl_odeiv2_step; y: PDouble; yerr: PDouble; dydt: PDouble; h: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_hadjust';

function gsl_odeiv2_control_name(c: Pgsl_odeiv2_control): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_name';

function gsl_odeiv2_control_errlevel(c: Pgsl_odeiv2_control; y: Double; dydt: Double; h: Double; ind: NativeUInt; errlev: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_errlevel';

function gsl_odeiv2_control_set_driver(c: Pgsl_odeiv2_control; d: Pgsl_odeiv2_driver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_set_driver';

function gsl_odeiv2_control_standard_new(eps_abs: Double; eps_rel: Double; a_y: Double; a_dydt: Double): Pgsl_odeiv2_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_standard_new';

function gsl_odeiv2_control_y_new(eps_abs: Double; eps_rel: Double): Pgsl_odeiv2_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_y_new';

function gsl_odeiv2_control_yp_new(eps_abs: Double; eps_rel: Double): Pgsl_odeiv2_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_yp_new';

function gsl_odeiv2_control_scaled_new(eps_abs: Double; eps_rel: Double; a_y: Double; a_dydt: Double; scale_abs: PDouble; dim: NativeUInt): Pgsl_odeiv2_control; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_control_scaled_new';

function gsl_odeiv2_evolve_alloc(dim: NativeUInt): Pgsl_odeiv2_evolve; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_evolve_alloc';

function gsl_odeiv2_evolve_apply(e: Pgsl_odeiv2_evolve; con: Pgsl_odeiv2_control; step: Pgsl_odeiv2_step; dydt: Pgsl_odeiv2_system; t: PDouble; t1: Double; h: PDouble; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_evolve_apply';

function gsl_odeiv2_evolve_apply_fixed_step(e: Pgsl_odeiv2_evolve; con: Pgsl_odeiv2_control; step: Pgsl_odeiv2_step; dydt: Pgsl_odeiv2_system; t: PDouble; h0: Double; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_evolve_apply_fixed_step';

function gsl_odeiv2_evolve_reset(e: Pgsl_odeiv2_evolve): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_evolve_reset';

procedure gsl_odeiv2_evolve_free(e: Pgsl_odeiv2_evolve); cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_evolve_free';

function gsl_odeiv2_evolve_set_driver(e: Pgsl_odeiv2_evolve; d: Pgsl_odeiv2_driver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_evolve_set_driver';

function gsl_odeiv2_driver_alloc_y_new(sys: Pgsl_odeiv2_system; T: Pgsl_odeiv2_step_type; hstart: Double; epsabs: Double; epsrel: Double): Pgsl_odeiv2_driver; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_alloc_y_new';

function gsl_odeiv2_driver_alloc_yp_new(sys: Pgsl_odeiv2_system; T: Pgsl_odeiv2_step_type; hstart: Double; epsabs: Double; epsrel: Double): Pgsl_odeiv2_driver; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_alloc_yp_new';

function gsl_odeiv2_driver_alloc_scaled_new(sys: Pgsl_odeiv2_system; T: Pgsl_odeiv2_step_type; hstart: Double; epsabs: Double; epsrel: Double; a_y: Double; a_dydt: Double; scale_abs: PDouble): Pgsl_odeiv2_driver; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_alloc_scaled_new';

function gsl_odeiv2_driver_alloc_standard_new(sys: Pgsl_odeiv2_system; T: Pgsl_odeiv2_step_type; hstart: Double; epsabs: Double; epsrel: Double; a_y: Double; a_dydt: Double): Pgsl_odeiv2_driver; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_alloc_standard_new';

function gsl_odeiv2_driver_set_hmin(d: Pgsl_odeiv2_driver; hmin: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_set_hmin';

function gsl_odeiv2_driver_set_hmax(d: Pgsl_odeiv2_driver; hmax: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_set_hmax';

function gsl_odeiv2_driver_set_nmax(d: Pgsl_odeiv2_driver; nmax: Cardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_set_nmax';

function gsl_odeiv2_driver_apply(d: Pgsl_odeiv2_driver; t: PDouble; t1: Double; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_apply';

function gsl_odeiv2_driver_apply_fixed_step(d: Pgsl_odeiv2_driver; t: PDouble; h: Double; n: Cardinal; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_apply_fixed_step';

function gsl_odeiv2_driver_reset(d: Pgsl_odeiv2_driver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_reset';

function gsl_odeiv2_driver_reset_hstart(d: Pgsl_odeiv2_driver; hstart: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_reset_hstart';

procedure gsl_odeiv2_driver_free(state: Pgsl_odeiv2_driver); cdecl;
  external LIBGSL name _PU + 'gsl_odeiv2_driver_free';

function gsl_permute_complex_long_double(p: PNativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_complex_long_double';

function gsl_permute_complex_long_double_inverse(p: PNativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_complex_long_double_inverse';

function gsl_permute_complex(p: PNativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_complex';

function gsl_permute_complex_inverse(p: PNativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_complex_inverse';

function gsl_permute_complex_float(p: PNativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_complex_float';

function gsl_permute_complex_float_inverse(p: PNativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_complex_float_inverse';

function gsl_permute_long_double(p: PNativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_long_double';

function gsl_permute_long_double_inverse(p: PNativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_long_double_inverse';

function gsl_permute(p: PNativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute';

function gsl_permute_inverse(p: PNativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_inverse';

function gsl_permute_float(p: PNativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_float';

function gsl_permute_float_inverse(p: PNativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_float_inverse';

function gsl_permute_ulong(p: PNativeUInt; data: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_ulong';

function gsl_permute_ulong_inverse(p: PNativeUInt; data: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_ulong_inverse';

function gsl_permute_long(p: PNativeUInt; data: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_long';

function gsl_permute_long_inverse(p: PNativeUInt; data: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_long_inverse';

function gsl_permute_uint(p: PNativeUInt; data: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_uint';

function gsl_permute_uint_inverse(p: PNativeUInt; data: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_uint_inverse';

function gsl_permute_int(p: PNativeUInt; data: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_int';

function gsl_permute_int_inverse(p: PNativeUInt; data: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_int_inverse';

function gsl_permute_ushort(p: PNativeUInt; data: PWord; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_ushort';

function gsl_permute_ushort_inverse(p: PNativeUInt; data: PWord; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_ushort_inverse';

function gsl_permute_short(p: PNativeUInt; data: PSmallint; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_short';

function gsl_permute_short_inverse(p: PNativeUInt; data: PSmallint; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_short_inverse';

function gsl_permute_uchar(p: PNativeUInt; data: PByte; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_uchar';

function gsl_permute_uchar_inverse(p: PNativeUInt; data: PByte; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_uchar_inverse';

function gsl_permute_char(p: PNativeUInt; data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_char';

function gsl_permute_char_inverse(p: PNativeUInt; data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_char_inverse';

function gsl_permute_matrix_complex_long_double(p: Pgsl_permutation; A: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_complex_long_double';

function gsl_permute_matrix_complex(p: Pgsl_permutation; A: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_complex';

function gsl_permute_matrix_complex_float(p: Pgsl_permutation; A: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_complex_float';

function gsl_permute_matrix_long_double(p: Pgsl_permutation; A: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_long_double';

function gsl_permute_matrix(p: Pgsl_permutation; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix';

function gsl_permute_matrix_float(p: Pgsl_permutation; A: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_float';

function gsl_permute_matrix_ulong(p: Pgsl_permutation; A: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_ulong';

function gsl_permute_matrix_long(p: Pgsl_permutation; A: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_long';

function gsl_permute_matrix_uint(p: Pgsl_permutation; A: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_uint';

function gsl_permute_matrix_int(p: Pgsl_permutation; A: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_int';

function gsl_permute_matrix_ushort(p: Pgsl_permutation; A: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_ushort';

function gsl_permute_matrix_short(p: Pgsl_permutation; A: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_short';

function gsl_permute_matrix_uchar(p: Pgsl_permutation; A: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_uchar';

function gsl_permute_matrix_char(p: Pgsl_permutation; A: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_matrix_char';

function gsl_permute_vector_complex_long_double(p: Pgsl_permutation; v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_complex_long_double';

function gsl_permute_vector_complex_long_double_inverse(p: Pgsl_permutation; v: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_complex_long_double_inverse';

function gsl_permute_vector_complex(p: Pgsl_permutation; v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_complex';

function gsl_permute_vector_complex_inverse(p: Pgsl_permutation; v: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_complex_inverse';

function gsl_permute_vector_complex_float(p: Pgsl_permutation; v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_complex_float';

function gsl_permute_vector_complex_float_inverse(p: Pgsl_permutation; v: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_complex_float_inverse';

function gsl_permute_vector_long_double(p: Pgsl_permutation; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_long_double';

function gsl_permute_vector_long_double_inverse(p: Pgsl_permutation; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_long_double_inverse';

function gsl_permute_vector(p: Pgsl_permutation; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector';

function gsl_permute_vector_inverse(p: Pgsl_permutation; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_inverse';

function gsl_permute_vector_float(p: Pgsl_permutation; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_float';

function gsl_permute_vector_float_inverse(p: Pgsl_permutation; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_float_inverse';

function gsl_permute_vector_ulong(p: Pgsl_permutation; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_ulong';

function gsl_permute_vector_ulong_inverse(p: Pgsl_permutation; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_ulong_inverse';

function gsl_permute_vector_long(p: Pgsl_permutation; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_long';

function gsl_permute_vector_long_inverse(p: Pgsl_permutation; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_long_inverse';

function gsl_permute_vector_uint(p: Pgsl_permutation; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_uint';

function gsl_permute_vector_uint_inverse(p: Pgsl_permutation; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_uint_inverse';

function gsl_permute_vector_int(p: Pgsl_permutation; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_int';

function gsl_permute_vector_int_inverse(p: Pgsl_permutation; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_int_inverse';

function gsl_permute_vector_ushort(p: Pgsl_permutation; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_ushort';

function gsl_permute_vector_ushort_inverse(p: Pgsl_permutation; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_ushort_inverse';

function gsl_permute_vector_short(p: Pgsl_permutation; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_short';

function gsl_permute_vector_short_inverse(p: Pgsl_permutation; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_short_inverse';

function gsl_permute_vector_uchar(p: Pgsl_permutation; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_uchar';

function gsl_permute_vector_uchar_inverse(p: Pgsl_permutation; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_uchar_inverse';

function gsl_permute_vector_char(p: Pgsl_permutation; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_char';

function gsl_permute_vector_char_inverse(p: Pgsl_permutation; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_permute_vector_char_inverse';

function gsl_poly_eval(c: PDouble; len: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_poly_eval';

function gsl_poly_complex_eval(c: PDouble; len: Integer; z: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_poly_complex_eval';

function gsl_complex_poly_complex_eval(c: Pgsl_complex; len: Integer; z: gsl_complex): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_complex_poly_complex_eval';

function gsl_poly_eval_derivs(c: PDouble; lenc: NativeUInt; x: Double; res: PDouble; lenres: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_poly_eval_derivs';

function gsl_poly_dd_init(dd: PDouble; x: PDouble; y: PDouble; size: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_poly_dd_init';

function gsl_poly_dd_eval(dd: PDouble; xa: PDouble; size: NativeUInt; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_poly_dd_eval';

function gsl_poly_dd_taylor(c: PDouble; xp: Double; dd: PDouble; x: PDouble; size: NativeUInt; w: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_poly_dd_taylor';

function gsl_poly_dd_hermite_init(dd: PDouble; z: PDouble; xa: PDouble; ya: PDouble; dya: PDouble; size: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_poly_dd_hermite_init';

function gsl_poly_solve_quadratic(a: Double; b: Double; c: Double; x0: PDouble; x1: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_poly_solve_quadratic';

function gsl_poly_complex_solve_quadratic(a: Double; b: Double; c: Double; z0: Pgsl_complex; z1: Pgsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_poly_complex_solve_quadratic';

function gsl_poly_solve_cubic(a: Double; b: Double; c: Double; x0: PDouble; x1: PDouble; x2: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_poly_solve_cubic';

function gsl_poly_complex_solve_cubic(a: Double; b: Double; c: Double; z0: Pgsl_complex; z1: Pgsl_complex; z2: Pgsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_poly_complex_solve_cubic';

function gsl_poly_complex_workspace_alloc(n: NativeUInt): Pgsl_poly_complex_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_poly_complex_workspace_alloc';

procedure gsl_poly_complex_workspace_free(w: Pgsl_poly_complex_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_poly_complex_workspace_free';

function gsl_poly_complex_solve(a: PDouble; n: NativeUInt; w: Pgsl_poly_complex_workspace; z: gsl_complex_packed_ptr): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_poly_complex_solve';

function gsl_qrng_alloc(T: Pgsl_qrng_type; dimension: Cardinal): Pgsl_qrng; cdecl;
  external LIBGSL name _PU + 'gsl_qrng_alloc';

function gsl_qrng_memcpy(dest: Pgsl_qrng; src: Pgsl_qrng): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_qrng_memcpy';

function gsl_qrng_clone(q: Pgsl_qrng): Pgsl_qrng; cdecl;
  external LIBGSL name _PU + 'gsl_qrng_clone';

procedure gsl_qrng_free(q: Pgsl_qrng); cdecl;
  external LIBGSL name _PU + 'gsl_qrng_free';

procedure gsl_qrng_init(q: Pgsl_qrng); cdecl;
  external LIBGSL name _PU + 'gsl_qrng_init';

function gsl_qrng_name(q: Pgsl_qrng): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_qrng_name';

function gsl_qrng_size(q: Pgsl_qrng): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_qrng_size';

function gsl_qrng_state(q: Pgsl_qrng): Pointer; cdecl;
  external LIBGSL name _PU + 'gsl_qrng_state';

function gsl_qrng_get(q: Pgsl_qrng; x: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_qrng_get';

function gsl_ran_bernoulli(r: Pgsl_rng; p: Double): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_bernoulli';

function gsl_ran_bernoulli_pdf(k: Cardinal; p: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_bernoulli_pdf';

function gsl_ran_beta(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_beta';

function gsl_ran_beta_pdf(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_beta_pdf';

function gsl_ran_binomial(r: Pgsl_rng; p: Double; n: Cardinal): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_binomial';

function gsl_ran_binomial_knuth(r: Pgsl_rng; p: Double; n: Cardinal): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_binomial_knuth';

function gsl_ran_binomial_tpe(r: Pgsl_rng; p: Double; n: Cardinal): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_binomial_tpe';

function gsl_ran_binomial_pdf(k: Cardinal; p: Double; n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_binomial_pdf';

function gsl_ran_exponential(r: Pgsl_rng; mu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_exponential';

function gsl_ran_exponential_pdf(x: Double; mu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_exponential_pdf';

function gsl_ran_exppow(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_exppow';

function gsl_ran_exppow_pdf(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_exppow_pdf';

function gsl_ran_cauchy(r: Pgsl_rng; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_cauchy';

function gsl_ran_cauchy_pdf(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_cauchy_pdf';

function gsl_ran_chisq(r: Pgsl_rng; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_chisq';

function gsl_ran_chisq_pdf(x: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_chisq_pdf';

procedure gsl_ran_dirichlet(r: Pgsl_rng; K: NativeUInt; alpha: PDouble; theta: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_ran_dirichlet';

function gsl_ran_dirichlet_pdf(K: NativeUInt; alpha: PDouble; theta: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_dirichlet_pdf';

function gsl_ran_dirichlet_lnpdf(K: NativeUInt; alpha: PDouble; theta: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_dirichlet_lnpdf';

function gsl_ran_erlang(r: Pgsl_rng; a: Double; n: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_erlang';

function gsl_ran_erlang_pdf(x: Double; a: Double; n: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_erlang_pdf';

function gsl_ran_fdist(r: Pgsl_rng; nu1: Double; nu2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_fdist';

function gsl_ran_fdist_pdf(x: Double; nu1: Double; nu2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_fdist_pdf';

function gsl_ran_flat(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_flat';

function gsl_ran_flat_pdf(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_flat_pdf';

function gsl_ran_gamma(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gamma';

function gsl_ran_gamma_int(r: Pgsl_rng; a: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gamma_int';

function gsl_ran_gamma_pdf(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gamma_pdf';

function gsl_ran_gamma_mt(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gamma_mt';

function gsl_ran_gamma_knuth(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gamma_knuth';

function gsl_ran_gaussian(r: Pgsl_rng; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gaussian';

function gsl_ran_gaussian_ratio_method(r: Pgsl_rng; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gaussian_ratio_method';

function gsl_ran_gaussian_ziggurat(r: Pgsl_rng; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gaussian_ziggurat';

function gsl_ran_gaussian_pdf(x: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gaussian_pdf';

function gsl_ran_ugaussian(r: Pgsl_rng): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_ugaussian';

function gsl_ran_ugaussian_ratio_method(r: Pgsl_rng): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_ugaussian_ratio_method';

function gsl_ran_ugaussian_pdf(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_ugaussian_pdf';

function gsl_ran_gaussian_tail(r: Pgsl_rng; a: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gaussian_tail';

function gsl_ran_gaussian_tail_pdf(x: Double; a: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gaussian_tail_pdf';

function gsl_ran_ugaussian_tail(r: Pgsl_rng; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_ugaussian_tail';

function gsl_ran_ugaussian_tail_pdf(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_ugaussian_tail_pdf';

procedure gsl_ran_bivariate_gaussian(r: Pgsl_rng; sigma_x: Double; sigma_y: Double; rho: Double; x: PDouble; y: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_ran_bivariate_gaussian';

function gsl_ran_bivariate_gaussian_pdf(x: Double; y: Double; sigma_x: Double; sigma_y: Double; rho: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_bivariate_gaussian_pdf';

function gsl_ran_multivariate_gaussian(r: Pgsl_rng; mu: Pgsl_vector; L: Pgsl_matrix; result: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ran_multivariate_gaussian';

function gsl_ran_multivariate_gaussian_log_pdf(x: Pgsl_vector; mu: Pgsl_vector; L: Pgsl_matrix; result: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ran_multivariate_gaussian_log_pdf';

function gsl_ran_multivariate_gaussian_pdf(x: Pgsl_vector; mu: Pgsl_vector; L: Pgsl_matrix; result: PDouble; work: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ran_multivariate_gaussian_pdf';

function gsl_ran_multivariate_gaussian_mean(X: Pgsl_matrix; mu_hat: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ran_multivariate_gaussian_mean';

function gsl_ran_multivariate_gaussian_vcov(X: Pgsl_matrix; sigma_hat: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ran_multivariate_gaussian_vcov';

function gsl_ran_wishart(r: Pgsl_rng; df: Double; L: Pgsl_matrix; result: Pgsl_matrix; work: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ran_wishart';

function gsl_ran_wishart_log_pdf(X: Pgsl_matrix; L_X: Pgsl_matrix; df: Double; L: Pgsl_matrix; result: PDouble; work: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ran_wishart_log_pdf';

function gsl_ran_wishart_pdf(X: Pgsl_matrix; L_X: Pgsl_matrix; df: Double; L: Pgsl_matrix; result: PDouble; work: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ran_wishart_pdf';

function gsl_ran_landau(r: Pgsl_rng): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_landau';

function gsl_ran_landau_pdf(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_landau_pdf';

function gsl_ran_geometric(r: Pgsl_rng; p: Double): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_geometric';

function gsl_ran_geometric_pdf(k: Cardinal; p: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_geometric_pdf';

function gsl_ran_hypergeometric(r: Pgsl_rng; n1: Cardinal; n2: Cardinal; t: Cardinal): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_hypergeometric';

function gsl_ran_hypergeometric_pdf(k: Cardinal; n1: Cardinal; n2: Cardinal; t: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_hypergeometric_pdf';

function gsl_ran_gumbel1(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gumbel1';

function gsl_ran_gumbel1_pdf(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gumbel1_pdf';

function gsl_ran_gumbel2(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gumbel2';

function gsl_ran_gumbel2_pdf(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_gumbel2_pdf';

function gsl_ran_logistic(r: Pgsl_rng; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_logistic';

function gsl_ran_logistic_pdf(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_logistic_pdf';

function gsl_ran_lognormal(r: Pgsl_rng; zeta: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_lognormal';

function gsl_ran_lognormal_pdf(x: Double; zeta: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_lognormal_pdf';

function gsl_ran_logarithmic(r: Pgsl_rng; p: Double): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_logarithmic';

function gsl_ran_logarithmic_pdf(k: Cardinal; p: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_logarithmic_pdf';

procedure gsl_ran_multinomial(r: Pgsl_rng; K: NativeUInt; N: Cardinal; p: PDouble; n2: PCardinal); cdecl;
  external LIBGSL name _PU + 'gsl_ran_multinomial';

function gsl_ran_multinomial_pdf(K: NativeUInt; p: PDouble; n: PCardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_multinomial_pdf';

function gsl_ran_multinomial_lnpdf(K: NativeUInt; p: PDouble; n: PCardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_multinomial_lnpdf';

function gsl_ran_negative_binomial(r: Pgsl_rng; p: Double; n: Double): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_negative_binomial';

function gsl_ran_negative_binomial_pdf(k: Cardinal; p: Double; n: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_negative_binomial_pdf';

function gsl_ran_pascal(r: Pgsl_rng; p: Double; n: Cardinal): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_pascal';

function gsl_ran_pascal_pdf(k: Cardinal; p: Double; n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_pascal_pdf';

function gsl_ran_pareto(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_pareto';

function gsl_ran_pareto_pdf(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_pareto_pdf';

function gsl_ran_poisson(r: Pgsl_rng; mu: Double): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_ran_poisson';

procedure gsl_ran_poisson_array(r: Pgsl_rng; n: NativeUInt; &array: PCardinal; mu: Double); cdecl;
  external LIBGSL name _PU + 'gsl_ran_poisson_array';

function gsl_ran_poisson_pdf(k: Cardinal; mu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_poisson_pdf';

function gsl_ran_rayleigh(r: Pgsl_rng; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_rayleigh';

function gsl_ran_rayleigh_pdf(x: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_rayleigh_pdf';

function gsl_ran_rayleigh_tail(r: Pgsl_rng; a: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_rayleigh_tail';

function gsl_ran_rayleigh_tail_pdf(x: Double; a: Double; sigma: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_rayleigh_tail_pdf';

function gsl_ran_tdist(r: Pgsl_rng; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_tdist';

function gsl_ran_tdist_pdf(x: Double; nu: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_tdist_pdf';

function gsl_ran_laplace(r: Pgsl_rng; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_laplace';

function gsl_ran_laplace_pdf(x: Double; a: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_laplace_pdf';

function gsl_ran_levy(r: Pgsl_rng; c: Double; alpha: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_levy';

function gsl_ran_levy_skew(r: Pgsl_rng; c: Double; alpha: Double; beta: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_levy_skew';

function gsl_ran_weibull(r: Pgsl_rng; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_weibull';

function gsl_ran_weibull_pdf(x: Double; a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_weibull_pdf';

procedure gsl_ran_dir_2d(r: Pgsl_rng; x: PDouble; y: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_ran_dir_2d';

procedure gsl_ran_dir_2d_trig_method(r: Pgsl_rng; x: PDouble; y: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_ran_dir_2d_trig_method';

procedure gsl_ran_dir_3d(r: Pgsl_rng; x: PDouble; y: PDouble; z: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_ran_dir_3d';

procedure gsl_ran_dir_nd(r: Pgsl_rng; n: NativeUInt; x: PDouble); cdecl;
  external LIBGSL name _PU + 'gsl_ran_dir_nd';

procedure gsl_ran_shuffle(r: Pgsl_rng; base: Pointer; nmembm: NativeUInt; size: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_ran_shuffle';

function gsl_ran_choose(r: Pgsl_rng; dest: Pointer; k: NativeUInt; src: Pointer; n: NativeUInt; size: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_ran_choose';

procedure gsl_ran_sample(r: Pgsl_rng; dest: Pointer; k: NativeUInt; src: Pointer; n: NativeUInt; size: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_ran_sample';

function gsl_ran_discrete_preproc(K: NativeUInt; P: PDouble): Pgsl_ran_discrete_t; cdecl;
  external LIBGSL name _PU + 'gsl_ran_discrete_preproc';

procedure gsl_ran_discrete_free(g: Pgsl_ran_discrete_t); cdecl;
  external LIBGSL name _PU + 'gsl_ran_discrete_free';

function gsl_ran_discrete(r: Pgsl_rng; g: Pgsl_ran_discrete_t): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_ran_discrete';

function gsl_ran_discrete_pdf(k: NativeUInt; g: Pgsl_ran_discrete_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_ran_discrete_pdf';

function gsl_root_fsolver_alloc(T: Pgsl_root_fsolver_type): Pgsl_root_fsolver; cdecl;
  external LIBGSL name _PU + 'gsl_root_fsolver_alloc';

procedure gsl_root_fsolver_free(s: Pgsl_root_fsolver); cdecl;
  external LIBGSL name _PU + 'gsl_root_fsolver_free';

function gsl_root_fsolver_set(s: Pgsl_root_fsolver; f: Pgsl_function; x_lower: Double; x_upper: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_root_fsolver_set';

function gsl_root_fsolver_iterate(s: Pgsl_root_fsolver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_root_fsolver_iterate';

function gsl_root_fsolver_name(s: Pgsl_root_fsolver): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_root_fsolver_name';

function gsl_root_fsolver_root(s: Pgsl_root_fsolver): Double; cdecl;
  external LIBGSL name _PU + 'gsl_root_fsolver_root';

function gsl_root_fsolver_x_lower(s: Pgsl_root_fsolver): Double; cdecl;
  external LIBGSL name _PU + 'gsl_root_fsolver_x_lower';

function gsl_root_fsolver_x_upper(s: Pgsl_root_fsolver): Double; cdecl;
  external LIBGSL name _PU + 'gsl_root_fsolver_x_upper';

function gsl_root_fdfsolver_alloc(T: Pgsl_root_fdfsolver_type): Pgsl_root_fdfsolver; cdecl;
  external LIBGSL name _PU + 'gsl_root_fdfsolver_alloc';

function gsl_root_fdfsolver_set(s: Pgsl_root_fdfsolver; fdf: Pgsl_function_fdf; root: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_root_fdfsolver_set';

function gsl_root_fdfsolver_iterate(s: Pgsl_root_fdfsolver): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_root_fdfsolver_iterate';

procedure gsl_root_fdfsolver_free(s: Pgsl_root_fdfsolver); cdecl;
  external LIBGSL name _PU + 'gsl_root_fdfsolver_free';

function gsl_root_fdfsolver_name(s: Pgsl_root_fdfsolver): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_root_fdfsolver_name';

function gsl_root_fdfsolver_root(s: Pgsl_root_fdfsolver): Double; cdecl;
  external LIBGSL name _PU + 'gsl_root_fdfsolver_root';

function gsl_root_test_interval(x_lower: Double; x_upper: Double; epsabs: Double; epsrel: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_root_test_interval';

function gsl_root_test_residual(f: Double; epsabs: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_root_test_residual';

function gsl_root_test_delta(x1: Double; x0: Double; epsabs: Double; epsrel: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_root_test_delta';

function gsl_rstat_quantile_alloc(p: Double): Pgsl_rstat_quantile_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_quantile_alloc';

procedure gsl_rstat_quantile_free(w: Pgsl_rstat_quantile_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_rstat_quantile_free';

function gsl_rstat_quantile_reset(w: Pgsl_rstat_quantile_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_quantile_reset';

function gsl_rstat_quantile_add(x: Double; w: Pgsl_rstat_quantile_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_quantile_add';

function gsl_rstat_quantile_get(w: Pgsl_rstat_quantile_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_quantile_get';

function gsl_rstat_alloc(): Pgsl_rstat_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_alloc';

procedure gsl_rstat_free(w: Pgsl_rstat_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_rstat_free';

function gsl_rstat_n(w: Pgsl_rstat_workspace): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_n';

function gsl_rstat_add(x: Double; w: Pgsl_rstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_add';

function gsl_rstat_min(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_min';

function gsl_rstat_max(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_max';

function gsl_rstat_mean(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_mean';

function gsl_rstat_variance(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_variance';

function gsl_rstat_sd(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_sd';

function gsl_rstat_rms(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_rms';

function gsl_rstat_sd_mean(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_sd_mean';

function gsl_rstat_median(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_median';

function gsl_rstat_skew(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_skew';

function gsl_rstat_kurtosis(w: Pgsl_rstat_workspace): Double; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_kurtosis';

function gsl_rstat_reset(w: Pgsl_rstat_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_rstat_reset';

function gsl_sf_result_smash_e(re: Pgsl_sf_result_e10; r: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_result_smash_e';

function gsl_sf_airy_Ai_e(x: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Ai_e';

function gsl_sf_airy_Ai(x: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Ai';

function gsl_sf_airy_Bi_e(x: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Bi_e';

function gsl_sf_airy_Bi(x: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Bi';

function gsl_sf_airy_Ai_scaled_e(x: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Ai_scaled_e';

function gsl_sf_airy_Ai_scaled(x: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Ai_scaled';

function gsl_sf_airy_Bi_scaled_e(x: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Bi_scaled_e';

function gsl_sf_airy_Bi_scaled(x: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Bi_scaled';

function gsl_sf_airy_Ai_deriv_e(x: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Ai_deriv_e';

function gsl_sf_airy_Ai_deriv(x: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Ai_deriv';

function gsl_sf_airy_Bi_deriv_e(x: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Bi_deriv_e';

function gsl_sf_airy_Bi_deriv(x: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Bi_deriv';

function gsl_sf_airy_Ai_deriv_scaled_e(x: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Ai_deriv_scaled_e';

function gsl_sf_airy_Ai_deriv_scaled(x: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Ai_deriv_scaled';

function gsl_sf_airy_Bi_deriv_scaled_e(x: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Bi_deriv_scaled_e';

function gsl_sf_airy_Bi_deriv_scaled(x: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_Bi_deriv_scaled';

function gsl_sf_airy_zero_Ai_e(s: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_zero_Ai_e';

function gsl_sf_airy_zero_Ai(s: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_zero_Ai';

function gsl_sf_airy_zero_Bi_e(s: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_zero_Bi_e';

function gsl_sf_airy_zero_Bi(s: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_zero_Bi';

function gsl_sf_airy_zero_Ai_deriv_e(s: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_zero_Ai_deriv_e';

function gsl_sf_airy_zero_Ai_deriv(s: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_zero_Ai_deriv';

function gsl_sf_airy_zero_Bi_deriv_e(s: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_zero_Bi_deriv_e';

function gsl_sf_airy_zero_Bi_deriv(s: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_airy_zero_Bi_deriv';

function gsl_sf_bessel_J0_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_J0_e';

function gsl_sf_bessel_J0(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_J0';

function gsl_sf_bessel_J1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_J1_e';

function gsl_sf_bessel_J1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_J1';

function gsl_sf_bessel_Jn_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Jn_e';

function gsl_sf_bessel_Jn(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Jn';

function gsl_sf_bessel_Jn_array(nmin: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Jn_array';

function gsl_sf_bessel_Y0_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Y0_e';

function gsl_sf_bessel_Y0(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Y0';

function gsl_sf_bessel_Y1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Y1_e';

function gsl_sf_bessel_Y1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Y1';

function gsl_sf_bessel_Yn_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Yn_e';

function gsl_sf_bessel_Yn(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Yn';

function gsl_sf_bessel_Yn_array(nmin: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Yn_array';

function gsl_sf_bessel_I0_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_I0_e';

function gsl_sf_bessel_I0(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_I0';

function gsl_sf_bessel_I1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_I1_e';

function gsl_sf_bessel_I1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_I1';

function gsl_sf_bessel_In_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_In_e';

function gsl_sf_bessel_In(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_In';

function gsl_sf_bessel_In_array(nmin: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_In_array';

function gsl_sf_bessel_I0_scaled_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_I0_scaled_e';

function gsl_sf_bessel_I0_scaled(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_I0_scaled';

function gsl_sf_bessel_I1_scaled_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_I1_scaled_e';

function gsl_sf_bessel_I1_scaled(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_I1_scaled';

function gsl_sf_bessel_In_scaled_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_In_scaled_e';

function gsl_sf_bessel_In_scaled(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_In_scaled';

function gsl_sf_bessel_In_scaled_array(nmin: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_In_scaled_array';

function gsl_sf_bessel_K0_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_K0_e';

function gsl_sf_bessel_K0(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_K0';

function gsl_sf_bessel_K1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_K1_e';

function gsl_sf_bessel_K1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_K1';

function gsl_sf_bessel_Kn_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Kn_e';

function gsl_sf_bessel_Kn(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Kn';

function gsl_sf_bessel_Kn_array(nmin: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Kn_array';

function gsl_sf_bessel_K0_scaled_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_K0_scaled_e';

function gsl_sf_bessel_K0_scaled(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_K0_scaled';

function gsl_sf_bessel_K1_scaled_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_K1_scaled_e';

function gsl_sf_bessel_K1_scaled(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_K1_scaled';

function gsl_sf_bessel_Kn_scaled_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Kn_scaled_e';

function gsl_sf_bessel_Kn_scaled(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Kn_scaled';

function gsl_sf_bessel_Kn_scaled_array(nmin: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Kn_scaled_array';

function gsl_sf_bessel_j2_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_j2_e';

function gsl_sf_bessel_j2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_j2';

function gsl_sf_bessel_jl_e(l: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_jl_e';

function gsl_sf_bessel_jl(l: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_jl';

function gsl_sf_bessel_jl_array(lmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_jl_array';

function gsl_sf_bessel_jl_steed_array(lmax: Integer; x: Double; jl_x_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_jl_steed_array';

function gsl_sf_bessel_y2_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_y2_e';

function gsl_sf_bessel_y2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_y2';

function gsl_sf_bessel_yl_e(l: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_yl_e';

function gsl_sf_bessel_yl(l: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_yl';

function gsl_sf_bessel_yl_array(lmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_yl_array';

function gsl_sf_bessel_i2_scaled_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_i2_scaled_e';

function gsl_sf_bessel_i2_scaled(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_i2_scaled';

function gsl_sf_bessel_il_scaled_e(l: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_il_scaled_e';

function gsl_sf_bessel_il_scaled(l: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_il_scaled';

function gsl_sf_bessel_il_scaled_array(lmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_il_scaled_array';

function gsl_sf_bessel_k2_scaled_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_k2_scaled_e';

function gsl_sf_bessel_k2_scaled(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_k2_scaled';

function gsl_sf_bessel_kl_scaled_e(l: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_kl_scaled_e';

function gsl_sf_bessel_kl_scaled(l: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_kl_scaled';

function gsl_sf_bessel_kl_scaled_array(lmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_kl_scaled_array';

function gsl_sf_bessel_Jnu_e(nu: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Jnu_e';

function gsl_sf_bessel_Jnu(nu: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Jnu';

function gsl_sf_bessel_Ynu_e(nu: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Ynu_e';

function gsl_sf_bessel_Ynu(nu: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Ynu';

function gsl_sf_bessel_sequence_Jnu_e(nu: Double; mode: gsl_mode_t; size: NativeUInt; v: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_sequence_Jnu_e';

function gsl_sf_bessel_Inu_scaled_e(nu: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Inu_scaled_e';

function gsl_sf_bessel_Inu_scaled(nu: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Inu_scaled';

function gsl_sf_bessel_Inu_e(nu: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Inu_e';

function gsl_sf_bessel_Inu(nu: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Inu';

function gsl_sf_bessel_Knu_scaled_e(nu: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Knu_scaled_e';

function gsl_sf_bessel_Knu_scaled(nu: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Knu_scaled';

function gsl_sf_bessel_Knu_scaled_e10_e(nu: Double; x: Double; result: Pgsl_sf_result_e10): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Knu_scaled_e10_e';

function gsl_sf_bessel_Knu_e(nu: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Knu_e';

function gsl_sf_bessel_Knu(nu: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_Knu';

function gsl_sf_bessel_lnKnu_e(nu: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_lnKnu_e';

function gsl_sf_bessel_lnKnu(nu: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_lnKnu';

function gsl_sf_bessel_zero_J0_e(s: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_zero_J0_e';

function gsl_sf_bessel_zero_J0(s: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_zero_J0';

function gsl_sf_bessel_zero_J1_e(s: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_zero_J1_e';

function gsl_sf_bessel_zero_J1(s: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_zero_J1';

function gsl_sf_bessel_zero_Jnu_e(nu: Double; s: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_zero_Jnu_e';

function gsl_sf_bessel_zero_Jnu(nu: Double; s: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_bessel_zero_Jnu';

function gsl_sf_clausen_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_clausen_e';

function gsl_sf_clausen(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_clausen';

function gsl_sf_coupling_3j_e(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_ma: Integer; two_mb: Integer; two_mc: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_3j_e';

function gsl_sf_coupling_3j(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_ma: Integer; two_mb: Integer; two_mc: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_3j';

function gsl_sf_coupling_6j_e(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_jd: Integer; two_je: Integer; two_jf: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_6j_e';

function gsl_sf_coupling_6j(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_jd: Integer; two_je: Integer; two_jf: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_6j';

function gsl_sf_coupling_RacahW_e(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_jd: Integer; two_je: Integer; two_jf: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_RacahW_e';

function gsl_sf_coupling_RacahW(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_jd: Integer; two_je: Integer; two_jf: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_RacahW';

function gsl_sf_coupling_9j_e(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_jd: Integer; two_je: Integer; two_jf: Integer; two_jg: Integer; two_jh: Integer; two_ji: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_9j_e';

function gsl_sf_coupling_9j(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_jd: Integer; two_je: Integer; two_jf: Integer; two_jg: Integer; two_jh: Integer; two_ji: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_9j';

function gsl_sf_coupling_6j_INCORRECT_e(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_jd: Integer; two_je: Integer; two_jf: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_6j_INCORRECT_e';

function gsl_sf_coupling_6j_INCORRECT(two_ja: Integer; two_jb: Integer; two_jc: Integer; two_jd: Integer; two_je: Integer; two_jf: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coupling_6j_INCORRECT';

function gsl_sf_hydrogenicR_1_e(Z: Double; r: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hydrogenicR_1_e';

function gsl_sf_hydrogenicR_1(Z: Double; r: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hydrogenicR_1';

function gsl_sf_hydrogenicR_e(n: Integer; l: Integer; Z: Double; r: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hydrogenicR_e';

function gsl_sf_hydrogenicR(n: Integer; l: Integer; Z: Double; r: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hydrogenicR';

function gsl_sf_coulomb_wave_FG_e(eta: Double; x: Double; lam_F: Double; k_lam_G: Integer; F: Pgsl_sf_result; Fp: Pgsl_sf_result; G: Pgsl_sf_result; Gp: Pgsl_sf_result; exp_F: PDouble; exp_G: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coulomb_wave_FG_e';

function gsl_sf_coulomb_wave_F_array(lam_min: Double; kmax: Integer; eta: Double; x: Double; fc_array: PDouble; F_exponent: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coulomb_wave_F_array';

function gsl_sf_coulomb_wave_FG_array(lam_min: Double; kmax: Integer; eta: Double; x: Double; fc_array: PDouble; gc_array: PDouble; F_exponent: PDouble; G_exponent: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coulomb_wave_FG_array';

function gsl_sf_coulomb_wave_FGp_array(lam_min: Double; kmax: Integer; eta: Double; x: Double; fc_array: PDouble; fcp_array: PDouble; gc_array: PDouble; gcp_array: PDouble; F_exponent: PDouble; G_exponent: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coulomb_wave_FGp_array';

function gsl_sf_coulomb_wave_sphF_array(lam_min: Double; kmax: Integer; eta: Double; x: Double; fc_array: PDouble; F_exponent: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coulomb_wave_sphF_array';

function gsl_sf_coulomb_CL_e(L: Double; eta: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coulomb_CL_e';

function gsl_sf_coulomb_CL_array(Lmin: Double; kmax: Integer; eta: Double; cl: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_coulomb_CL_array';

function gsl_sf_dawson_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_dawson_e';

function gsl_sf_dawson(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_dawson';

function gsl_sf_debye_1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_1_e';

function gsl_sf_debye_1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_1';

function gsl_sf_debye_2_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_2_e';

function gsl_sf_debye_2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_2';

function gsl_sf_debye_3_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_3_e';

function gsl_sf_debye_3(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_3';

function gsl_sf_debye_4_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_4_e';

function gsl_sf_debye_4(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_4';

function gsl_sf_debye_5_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_5_e';

function gsl_sf_debye_5(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_5';

function gsl_sf_debye_6_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_6_e';

function gsl_sf_debye_6(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_debye_6';

function gsl_sf_dilog_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_dilog_e';

function gsl_sf_dilog(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_dilog';

function gsl_sf_complex_dilog_xy_e(x: Double; y: Double; result_re: Pgsl_sf_result; result_im: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_complex_dilog_xy_e';

function gsl_sf_complex_dilog_e(r: Double; theta: Double; result_re: Pgsl_sf_result; result_im: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_complex_dilog_e';

function gsl_sf_complex_spence_xy_e(x: Double; y: Double; real_sp: Pgsl_sf_result; imag_sp: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_complex_spence_xy_e';

function gsl_sf_multiply_e(x: Double; y: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_multiply_e';

function gsl_sf_multiply(x: Double; y: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_multiply';

function gsl_sf_multiply_err_e(x: Double; dx: Double; y: Double; dy: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_multiply_err_e';

function gsl_sf_ellint_Kcomp_e(k: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_Kcomp_e';

function gsl_sf_ellint_Kcomp(k: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_Kcomp';

function gsl_sf_ellint_Ecomp_e(k: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_Ecomp_e';

function gsl_sf_ellint_Ecomp(k: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_Ecomp';

function gsl_sf_ellint_Pcomp_e(k: Double; n: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_Pcomp_e';

function gsl_sf_ellint_Pcomp(k: Double; n: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_Pcomp';

function gsl_sf_ellint_Dcomp_e(k: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_Dcomp_e';

function gsl_sf_ellint_Dcomp(k: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_Dcomp';

function gsl_sf_ellint_F_e(phi: Double; k: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_F_e';

function gsl_sf_ellint_F(phi: Double; k: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_F';

function gsl_sf_ellint_E_e(phi: Double; k: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_E_e';

function gsl_sf_ellint_E(phi: Double; k: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_E';

function gsl_sf_ellint_P_e(phi: Double; k: Double; n: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_P_e';

function gsl_sf_ellint_P(phi: Double; k: Double; n: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_P';

function gsl_sf_ellint_D_e(phi: Double; k: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_D_e';

function gsl_sf_ellint_D(phi: Double; k: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_D';

function gsl_sf_ellint_RC_e(x: Double; y: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_RC_e';

function gsl_sf_ellint_RC(x: Double; y: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_RC';

function gsl_sf_ellint_RD_e(x: Double; y: Double; z: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_RD_e';

function gsl_sf_ellint_RD(x: Double; y: Double; z: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_RD';

function gsl_sf_ellint_RF_e(x: Double; y: Double; z: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_RF_e';

function gsl_sf_ellint_RF(x: Double; y: Double; z: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_RF';

function gsl_sf_ellint_RJ_e(x: Double; y: Double; z: Double; p: Double; mode: gsl_mode_t; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_RJ_e';

function gsl_sf_ellint_RJ(x: Double; y: Double; z: Double; p: Double; mode: gsl_mode_t): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_ellint_RJ';

function gsl_sf_elljac_e(u: Double; m: Double; sn: PDouble; cn: PDouble; dn: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_elljac_e';

function gsl_sf_erfc_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_erfc_e';

function gsl_sf_erfc(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_erfc';

function gsl_sf_log_erfc_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log_erfc_e';

function gsl_sf_log_erfc(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log_erfc';

function gsl_sf_erf_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_erf_e';

function gsl_sf_erf(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_erf';

function gsl_sf_erf_Z_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_erf_Z_e';

function gsl_sf_erf_Q_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_erf_Q_e';

function gsl_sf_erf_Z(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_erf_Z';

function gsl_sf_erf_Q(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_erf_Q';

function gsl_sf_hazard_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hazard_e';

function gsl_sf_hazard(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hazard';

function gsl_sf_exp_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp_e';

function gsl_sf_exp(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp';

function gsl_sf_exp_e10_e(x: Double; result: Pgsl_sf_result_e10): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp_e10_e';

function gsl_sf_exp_mult_e(x: Double; y: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp_mult_e';

function gsl_sf_exp_mult(x: Double; y: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp_mult';

function gsl_sf_exp_mult_e10_e(x: Double; y: Double; result: Pgsl_sf_result_e10): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp_mult_e10_e';

function gsl_sf_expm1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expm1_e';

function gsl_sf_expm1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expm1';

function gsl_sf_exprel_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exprel_e';

function gsl_sf_exprel(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exprel';

function gsl_sf_exprel_2_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exprel_2_e';

function gsl_sf_exprel_2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exprel_2';

function gsl_sf_exprel_n_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exprel_n_e';

function gsl_sf_exprel_n(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exprel_n';

function gsl_sf_exprel_n_CF_e(n: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exprel_n_CF_e';

function gsl_sf_exp_err_e(x: Double; dx: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp_err_e';

function gsl_sf_exp_err_e10_e(x: Double; dx: Double; result: Pgsl_sf_result_e10): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp_err_e10_e';

function gsl_sf_exp_mult_err_e(x: Double; dx: Double; y: Double; dy: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp_mult_err_e';

function gsl_sf_exp_mult_err_e10_e(x: Double; dx: Double; y: Double; dy: Double; result: Pgsl_sf_result_e10): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_exp_mult_err_e10_e';

function gsl_sf_expint_E1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_E1_e';

function gsl_sf_expint_E1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_E1';

function gsl_sf_expint_E2_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_E2_e';

function gsl_sf_expint_E2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_E2';

function gsl_sf_expint_En_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_En_e';

function gsl_sf_expint_En(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_En';

function gsl_sf_expint_E1_scaled_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_E1_scaled_e';

function gsl_sf_expint_E1_scaled(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_E1_scaled';

function gsl_sf_expint_E2_scaled_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_E2_scaled_e';

function gsl_sf_expint_E2_scaled(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_E2_scaled';

function gsl_sf_expint_En_scaled_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_En_scaled_e';

function gsl_sf_expint_En_scaled(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_En_scaled';

function gsl_sf_expint_Ei_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_Ei_e';

function gsl_sf_expint_Ei(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_Ei';

function gsl_sf_expint_Ei_scaled_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_Ei_scaled_e';

function gsl_sf_expint_Ei_scaled(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_Ei_scaled';

function gsl_sf_Shi_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_Shi_e';

function gsl_sf_Shi(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_Shi';

function gsl_sf_Chi_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_Chi_e';

function gsl_sf_Chi(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_Chi';

function gsl_sf_expint_3_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_3_e';

function gsl_sf_expint_3(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_expint_3';

function gsl_sf_Si_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_Si_e';

function gsl_sf_Si(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_Si';

function gsl_sf_Ci_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_Ci_e';

function gsl_sf_Ci(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_Ci';

function gsl_sf_atanint_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_atanint_e';

function gsl_sf_atanint(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_atanint';

function gsl_sf_fermi_dirac_m1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_m1_e';

function gsl_sf_fermi_dirac_m1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_m1';

function gsl_sf_fermi_dirac_0_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_0_e';

function gsl_sf_fermi_dirac_0(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_0';

function gsl_sf_fermi_dirac_1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_1_e';

function gsl_sf_fermi_dirac_1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_1';

function gsl_sf_fermi_dirac_2_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_2_e';

function gsl_sf_fermi_dirac_2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_2';

function gsl_sf_fermi_dirac_int_e(j: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_int_e';

function gsl_sf_fermi_dirac_int(j: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_int';

function gsl_sf_fermi_dirac_mhalf_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_mhalf_e';

function gsl_sf_fermi_dirac_mhalf(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_mhalf';

function gsl_sf_fermi_dirac_half_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_half_e';

function gsl_sf_fermi_dirac_half(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_half';

function gsl_sf_fermi_dirac_3half_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_3half_e';

function gsl_sf_fermi_dirac_3half(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_3half';

function gsl_sf_fermi_dirac_inc_0_e(x: Double; b: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_inc_0_e';

function gsl_sf_fermi_dirac_inc_0(x: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fermi_dirac_inc_0';

function gsl_sf_lngamma_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lngamma_e';

function gsl_sf_lngamma(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lngamma';

function gsl_sf_lngamma_sgn_e(x: Double; result_lg: Pgsl_sf_result; sgn: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lngamma_sgn_e';

function gsl_sf_gamma_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gamma_e';

function gsl_sf_gamma(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gamma';

function gsl_sf_gammastar_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gammastar_e';

function gsl_sf_gammastar(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gammastar';

function gsl_sf_gammainv_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gammainv_e';

function gsl_sf_gammainv(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gammainv';

function gsl_sf_lngamma_complex_e(zr: Double; zi: Double; lnr: Pgsl_sf_result; arg: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lngamma_complex_e';

function gsl_sf_taylorcoeff_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_taylorcoeff_e';

function gsl_sf_taylorcoeff(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_taylorcoeff';

function gsl_sf_fact_e(n: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fact_e';

function gsl_sf_fact(n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_fact';

function gsl_sf_doublefact_e(n: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_doublefact_e';

function gsl_sf_doublefact(n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_doublefact';

function gsl_sf_lnfact_e(n: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnfact_e';

function gsl_sf_lnfact(n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnfact';

function gsl_sf_lndoublefact_e(n: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lndoublefact_e';

function gsl_sf_lndoublefact(n: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lndoublefact';

function gsl_sf_lnchoose_e(n: Cardinal; m: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnchoose_e';

function gsl_sf_lnchoose(n: Cardinal; m: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnchoose';

function gsl_sf_choose_e(n: Cardinal; m: Cardinal; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_choose_e';

function gsl_sf_choose(n: Cardinal; m: Cardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_choose';

function gsl_sf_lnpoch_e(a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnpoch_e';

function gsl_sf_lnpoch(a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnpoch';

function gsl_sf_lnpoch_sgn_e(a: Double; x: Double; result: Pgsl_sf_result; sgn: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnpoch_sgn_e';

function gsl_sf_poch_e(a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_poch_e';

function gsl_sf_poch(a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_poch';

function gsl_sf_pochrel_e(a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_pochrel_e';

function gsl_sf_pochrel(a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_pochrel';

function gsl_sf_gamma_inc_Q_e(a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gamma_inc_Q_e';

function gsl_sf_gamma_inc_Q(a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gamma_inc_Q';

function gsl_sf_gamma_inc_P_e(a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gamma_inc_P_e';

function gsl_sf_gamma_inc_P(a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gamma_inc_P';

function gsl_sf_gamma_inc_e(a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gamma_inc_e';

function gsl_sf_gamma_inc(a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gamma_inc';

function gsl_sf_lnbeta_e(a: Double; b: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnbeta_e';

function gsl_sf_lnbeta(a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnbeta';

function gsl_sf_lnbeta_sgn_e(x: Double; y: Double; result: Pgsl_sf_result; sgn: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnbeta_sgn_e';

function gsl_sf_beta_e(a: Double; b: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_beta_e';

function gsl_sf_beta(a: Double; b: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_beta';

function gsl_sf_beta_inc_e(a: Double; b: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_beta_inc_e';

function gsl_sf_beta_inc(a: Double; b: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_beta_inc';

function gsl_sf_gegenpoly_1_e(lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gegenpoly_1_e';

function gsl_sf_gegenpoly_2_e(lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gegenpoly_2_e';

function gsl_sf_gegenpoly_3_e(lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gegenpoly_3_e';

function gsl_sf_gegenpoly_1(lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gegenpoly_1';

function gsl_sf_gegenpoly_2(lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gegenpoly_2';

function gsl_sf_gegenpoly_3(lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gegenpoly_3';

function gsl_sf_gegenpoly_n_e(n: Integer; lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gegenpoly_n_e';

function gsl_sf_gegenpoly_n(n: Integer; lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gegenpoly_n';

function gsl_sf_gegenpoly_array(nmax: Integer; lambda: Double; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_gegenpoly_array';

function gsl_sf_hermite_prob_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_e';

function gsl_sf_hermite_prob(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob';

function gsl_sf_hermite_prob_deriv_e(m: Integer; n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_deriv_e';

function gsl_sf_hermite_prob_deriv(m: Integer; n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_deriv';

function gsl_sf_hermite_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_e';

function gsl_sf_hermite(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite';

function gsl_sf_hermite_deriv_e(m: Integer; n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_deriv_e';

function gsl_sf_hermite_deriv(m: Integer; n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_deriv';

function gsl_sf_hermite_func_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_e';

function gsl_sf_hermite_func(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func';

function gsl_sf_hermite_func_fast_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_fast_e';

function gsl_sf_hermite_func_fast(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_fast';

function gsl_sf_hermite_prob_array(nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_array';

function gsl_sf_hermite_prob_array_deriv(m: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_array_deriv';

function gsl_sf_hermite_prob_deriv_array(mmax: Integer; n: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_deriv_array';

function gsl_sf_hermite_prob_series_e(n: Integer; x: Double; a: PDouble; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_series_e';

function gsl_sf_hermite_prob_series(n: Integer; x: Double; a: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_series';

function gsl_sf_hermite_array(nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_array';

function gsl_sf_hermite_array_deriv(m: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_array_deriv';

function gsl_sf_hermite_deriv_array(mmax: Integer; n: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_deriv_array';

function gsl_sf_hermite_series_e(n: Integer; x: Double; a: PDouble; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_series_e';

function gsl_sf_hermite_series(n: Integer; x: Double; a: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_series';

function gsl_sf_hermite_func_array(nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_array';

function gsl_sf_hermite_func_series_e(n: Integer; x: Double; a: PDouble; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_series_e';

function gsl_sf_hermite_func_series(n: Integer; x: Double; a: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_series';

function gsl_sf_hermite_func_der_e(m: Integer; n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_der_e';

function gsl_sf_hermite_func_der(m: Integer; n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_der';

function gsl_sf_hermite_prob_zero_e(n: Integer; s: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_zero_e';

function gsl_sf_hermite_prob_zero(n: Integer; s: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_zero';

function gsl_sf_hermite_zero_e(n: Integer; s: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_zero_e';

function gsl_sf_hermite_zero(n: Integer; s: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_zero';

function gsl_sf_hermite_func_zero_e(n: Integer; s: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_zero_e';

function gsl_sf_hermite_func_zero(n: Integer; s: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_func_zero';

function gsl_sf_hermite_phys_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_e';

function gsl_sf_hermite_phys(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys';

function gsl_sf_hermite_phys_der_e(m: Integer; n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_der_e';

function gsl_sf_hermite_phys_der(m: Integer; n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_der';

function gsl_sf_hermite_phys_array(nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_array';

function gsl_sf_hermite_phys_series_e(n: Integer; x: Double; a: PDouble; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_series_e';

function gsl_sf_hermite_phys_series(n: Integer; x: Double; a: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_series';

function gsl_sf_hermite_phys_array_der(m: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_array_der';

function gsl_sf_hermite_phys_der_array(mmax: Integer; n: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_der_array';

function gsl_sf_hermite_phys_zero_e(n: Integer; s: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_zero_e';

function gsl_sf_hermite_phys_zero(n: Integer; s: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_phys_zero';

function gsl_sf_hermite_prob_array_der(m: Integer; nmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_array_der';

function gsl_sf_hermite_prob_der_array(mmax: Integer; n: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_der_array';

function gsl_sf_hermite_prob_der_e(m: Integer; n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_der_e';

function gsl_sf_hermite_prob_der(m: Integer; n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hermite_prob_der';

function gsl_sf_hyperg_0F1_e(c: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_0F1_e';

function gsl_sf_hyperg_0F1(c: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_0F1';

function gsl_sf_hyperg_1F1_int_e(m: Integer; n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_1F1_int_e';

function gsl_sf_hyperg_1F1_int(m: Integer; n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_1F1_int';

function gsl_sf_hyperg_1F1_e(a: Double; b: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_1F1_e';

function gsl_sf_hyperg_1F1(a: Double; b: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_1F1';

function gsl_sf_hyperg_U_int_e(m: Integer; n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_U_int_e';

function gsl_sf_hyperg_U_int(m: Integer; n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_U_int';

function gsl_sf_hyperg_U_int_e10_e(m: Integer; n: Integer; x: Double; result: Pgsl_sf_result_e10): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_U_int_e10_e';

function gsl_sf_hyperg_U_e(a: Double; b: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_U_e';

function gsl_sf_hyperg_U(a: Double; b: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_U';

function gsl_sf_hyperg_U_e10_e(a: Double; b: Double; x: Double; result: Pgsl_sf_result_e10): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_U_e10_e';

function gsl_sf_hyperg_2F1_e(a: Double; b: Double; c: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F1_e';

function gsl_sf_hyperg_2F1(a: Double; b: Double; c: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F1';

function gsl_sf_hyperg_2F1_conj_e(aR: Double; aI: Double; c: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F1_conj_e';

function gsl_sf_hyperg_2F1_conj(aR: Double; aI: Double; c: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F1_conj';

function gsl_sf_hyperg_2F1_renorm_e(a: Double; b: Double; c: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F1_renorm_e';

function gsl_sf_hyperg_2F1_renorm(a: Double; b: Double; c: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F1_renorm';

function gsl_sf_hyperg_2F1_conj_renorm_e(aR: Double; aI: Double; c: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F1_conj_renorm_e';

function gsl_sf_hyperg_2F1_conj_renorm(aR: Double; aI: Double; c: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F1_conj_renorm';

function gsl_sf_hyperg_2F0_e(a: Double; b: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F0_e';

function gsl_sf_hyperg_2F0(a: Double; b: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hyperg_2F0';

function gsl_sf_laguerre_1_e(a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_laguerre_1_e';

function gsl_sf_laguerre_2_e(a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_laguerre_2_e';

function gsl_sf_laguerre_3_e(a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_laguerre_3_e';

function gsl_sf_laguerre_1(a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_laguerre_1';

function gsl_sf_laguerre_2(a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_laguerre_2';

function gsl_sf_laguerre_3(a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_laguerre_3';

function gsl_sf_laguerre_n_e(n: Integer; a: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_laguerre_n_e';

function gsl_sf_laguerre_n(n: Integer; a: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_laguerre_n';

function gsl_sf_lambert_W0_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lambert_W0_e';

function gsl_sf_lambert_W0(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lambert_W0';

function gsl_sf_lambert_Wm1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lambert_Wm1_e';

function gsl_sf_lambert_Wm1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lambert_Wm1';

function gsl_sf_legendre_Pl_e(l: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Pl_e';

function gsl_sf_legendre_Pl(l: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Pl';

function gsl_sf_legendre_Pl_array(lmax: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Pl_array';

function gsl_sf_legendre_Pl_deriv_array(lmax: Integer; x: Double; result_array: PDouble; result_deriv_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Pl_deriv_array';

function gsl_sf_legendre_P1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_P1_e';

function gsl_sf_legendre_P2_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_P2_e';

function gsl_sf_legendre_P3_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_P3_e';

function gsl_sf_legendre_P1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_P1';

function gsl_sf_legendre_P2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_P2';

function gsl_sf_legendre_P3(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_P3';

function gsl_sf_legendre_Q0_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Q0_e';

function gsl_sf_legendre_Q0(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Q0';

function gsl_sf_legendre_Q1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Q1_e';

function gsl_sf_legendre_Q1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Q1';

function gsl_sf_legendre_Ql_e(l: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Ql_e';

function gsl_sf_legendre_Ql(l: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Ql';

function gsl_sf_legendre_Plm_e(l: Integer; m: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Plm_e';

function gsl_sf_legendre_Plm(l: Integer; m: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Plm';

function gsl_sf_legendre_Plm_array(lmax: Integer; m: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Plm_array';

function gsl_sf_legendre_Plm_deriv_array(lmax: Integer; m: Integer; x: Double; result_array: PDouble; result_deriv_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_Plm_deriv_array';

function gsl_sf_legendre_sphPlm_e(l: Integer; m: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_sphPlm_e';

function gsl_sf_legendre_sphPlm(l: Integer; m: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_sphPlm';

function gsl_sf_legendre_sphPlm_array(lmax: Integer; m: Integer; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_sphPlm_array';

function gsl_sf_legendre_sphPlm_deriv_array(lmax: Integer; m: Integer; x: Double; result_array: PDouble; result_deriv_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_sphPlm_deriv_array';

function gsl_sf_legendre_array_size(lmax: Integer; m: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_array_size';

function gsl_sf_conicalP_half_e(lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_half_e';

function gsl_sf_conicalP_half(lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_half';

function gsl_sf_conicalP_mhalf_e(lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_mhalf_e';

function gsl_sf_conicalP_mhalf(lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_mhalf';

function gsl_sf_conicalP_0_e(lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_0_e';

function gsl_sf_conicalP_0(lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_0';

function gsl_sf_conicalP_1_e(lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_1_e';

function gsl_sf_conicalP_1(lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_1';

function gsl_sf_conicalP_sph_reg_e(l: Integer; lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_sph_reg_e';

function gsl_sf_conicalP_sph_reg(l: Integer; lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_sph_reg';

function gsl_sf_conicalP_cyl_reg_e(m: Integer; lambda: Double; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_cyl_reg_e';

function gsl_sf_conicalP_cyl_reg(m: Integer; lambda: Double; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_conicalP_cyl_reg';

function gsl_sf_legendre_H3d_0_e(lambda: Double; eta: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_H3d_0_e';

function gsl_sf_legendre_H3d_0(lambda: Double; eta: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_H3d_0';

function gsl_sf_legendre_H3d_1_e(lambda: Double; eta: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_H3d_1_e';

function gsl_sf_legendre_H3d_1(lambda: Double; eta: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_H3d_1';

function gsl_sf_legendre_H3d_e(l: Integer; lambda: Double; eta: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_H3d_e';

function gsl_sf_legendre_H3d(l: Integer; lambda: Double; eta: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_H3d';

function gsl_sf_legendre_H3d_array(lmax: Integer; lambda: Double; eta: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_H3d_array';

function gsl_sf_legendre_array(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_array';

function gsl_sf_legendre_array_e(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; csphase: Double; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_array_e';

function gsl_sf_legendre_deriv_array(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; result_array: PDouble; result_deriv_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_deriv_array';

function gsl_sf_legendre_deriv_array_e(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; csphase: Double; result_array: PDouble; result_deriv_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_deriv_array_e';

function gsl_sf_legendre_deriv_alt_array(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; result_array: PDouble; result_deriv_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_deriv_alt_array';

function gsl_sf_legendre_deriv_alt_array_e(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; csphase: Double; result_array: PDouble; result_deriv_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_deriv_alt_array_e';

function gsl_sf_legendre_deriv2_array(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; result_array: PDouble; result_deriv_array: PDouble; result_deriv2_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_deriv2_array';

function gsl_sf_legendre_deriv2_array_e(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; csphase: Double; result_array: PDouble; result_deriv_array: PDouble; result_deriv2_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_deriv2_array_e';

function gsl_sf_legendre_deriv2_alt_array(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; result_array: PDouble; result_deriv_array: PDouble; result_deriv2_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_deriv2_alt_array';

function gsl_sf_legendre_deriv2_alt_array_e(norm: gsl_sf_legendre_t; lmax: NativeUInt; x: Double; csphase: Double; result_array: PDouble; result_deriv_array: PDouble; result_deriv2_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_deriv2_alt_array_e';

function gsl_sf_legendre_array_n(lmax: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_array_n';

function gsl_sf_legendre_array_index(l: NativeUInt; m: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_array_index';

function gsl_sf_legendre_nlm(lmax: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_sf_legendre_nlm';

function gsl_sf_log_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log_e';

function gsl_sf_log(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log';

function gsl_sf_log_abs_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log_abs_e';

function gsl_sf_log_abs(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log_abs';

function gsl_sf_complex_log_e(zr: Double; zi: Double; lnr: Pgsl_sf_result; theta: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_complex_log_e';

function gsl_sf_log_1plusx_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log_1plusx_e';

function gsl_sf_log_1plusx(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log_1plusx';

function gsl_sf_log_1plusx_mx_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log_1plusx_mx_e';

function gsl_sf_log_1plusx_mx(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_log_1plusx_mx';

function gsl_sf_mathieu_a_array(order_min: Integer; order_max: Integer; qq: Double; work: Pgsl_sf_mathieu_workspace; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_a_array';

function gsl_sf_mathieu_b_array(order_min: Integer; order_max: Integer; qq: Double; work: Pgsl_sf_mathieu_workspace; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_b_array';

function gsl_sf_mathieu_a_e(order: Integer; qq: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_a_e';

function gsl_sf_mathieu_a(order: Integer; qq: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_a';

function gsl_sf_mathieu_b_e(order: Integer; qq: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_b_e';

function gsl_sf_mathieu_b(order: Integer; qq: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_b';

function gsl_sf_mathieu_a_coeff(order: Integer; qq: Double; aa: Double; coeff: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_a_coeff';

function gsl_sf_mathieu_b_coeff(order: Integer; qq: Double; aa: Double; coeff: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_b_coeff';

function gsl_sf_mathieu_alloc(nn: NativeUInt; qq: Double): Pgsl_sf_mathieu_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_alloc';

procedure gsl_sf_mathieu_free(workspace: Pgsl_sf_mathieu_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_free';

function gsl_sf_mathieu_ce_e(order: Integer; qq: Double; zz: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_ce_e';

function gsl_sf_mathieu_ce(order: Integer; qq: Double; zz: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_ce';

function gsl_sf_mathieu_se_e(order: Integer; qq: Double; zz: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_se_e';

function gsl_sf_mathieu_se(order: Integer; qq: Double; zz: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_se';

function gsl_sf_mathieu_ce_array(nmin: Integer; nmax: Integer; qq: Double; zz: Double; work: Pgsl_sf_mathieu_workspace; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_ce_array';

function gsl_sf_mathieu_se_array(nmin: Integer; nmax: Integer; qq: Double; zz: Double; work: Pgsl_sf_mathieu_workspace; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_se_array';

function gsl_sf_mathieu_Mc_e(kind: Integer; order: Integer; qq: Double; zz: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_Mc_e';

function gsl_sf_mathieu_Mc(kind: Integer; order: Integer; qq: Double; zz: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_Mc';

function gsl_sf_mathieu_Ms_e(kind: Integer; order: Integer; qq: Double; zz: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_Ms_e';

function gsl_sf_mathieu_Ms(kind: Integer; order: Integer; qq: Double; zz: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_Ms';

function gsl_sf_mathieu_Mc_array(kind: Integer; nmin: Integer; nmax: Integer; qq: Double; zz: Double; work: Pgsl_sf_mathieu_workspace; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_Mc_array';

function gsl_sf_mathieu_Ms_array(kind: Integer; nmin: Integer; nmax: Integer; qq: Double; zz: Double; work: Pgsl_sf_mathieu_workspace; result_array: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_mathieu_Ms_array';

function gsl_sf_pow_int_e(x: Double; n: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_pow_int_e';

function gsl_sf_pow_int(x: Double; n: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_pow_int';

function gsl_sf_psi_int_e(n: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_int_e';

function gsl_sf_psi_int(n: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_int';

function gsl_sf_psi_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_e';

function gsl_sf_psi(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi';

function gsl_sf_psi_1piy_e(y: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_1piy_e';

function gsl_sf_psi_1piy(y: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_1piy';

function gsl_sf_complex_psi_e(x: Double; y: Double; result_re: Pgsl_sf_result; result_im: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_complex_psi_e';

function gsl_sf_psi_1_int_e(n: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_1_int_e';

function gsl_sf_psi_1_int(n: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_1_int';

function gsl_sf_psi_1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_1_e';

function gsl_sf_psi_1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_1';

function gsl_sf_psi_n_e(n: Integer; x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_n_e';

function gsl_sf_psi_n(n: Integer; x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_psi_n';

function gsl_sf_sin_pi_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_sin_pi_e';

function gsl_sf_sin_pi(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_sin_pi';

function gsl_sf_cos_pi_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_cos_pi_e';

function gsl_sf_cos_pi(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_cos_pi';

function gsl_sf_synchrotron_1_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_synchrotron_1_e';

function gsl_sf_synchrotron_1(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_synchrotron_1';

function gsl_sf_synchrotron_2_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_synchrotron_2_e';

function gsl_sf_synchrotron_2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_synchrotron_2';

function gsl_sf_transport_2_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_transport_2_e';

function gsl_sf_transport_2(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_transport_2';

function gsl_sf_transport_3_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_transport_3_e';

function gsl_sf_transport_3(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_transport_3';

function gsl_sf_transport_4_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_transport_4_e';

function gsl_sf_transport_4(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_transport_4';

function gsl_sf_transport_5_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_transport_5_e';

function gsl_sf_transport_5(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_transport_5';

function gsl_sf_sin_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_sin_e';

function gsl_sf_sin(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_sin';

function gsl_sf_cos_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_cos_e';

function gsl_sf_cos(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_cos';

function gsl_sf_hypot_e(x: Double; y: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hypot_e';

function gsl_sf_hypot(x: Double; y: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hypot';

function gsl_sf_complex_sin_e(zr: Double; zi: Double; szr: Pgsl_sf_result; szi: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_complex_sin_e';

function gsl_sf_complex_cos_e(zr: Double; zi: Double; czr: Pgsl_sf_result; czi: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_complex_cos_e';

function gsl_sf_complex_logsin_e(zr: Double; zi: Double; lszr: Pgsl_sf_result; lszi: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_complex_logsin_e';

function gsl_sf_sinc_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_sinc_e';

function gsl_sf_sinc(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_sinc';

function gsl_sf_lnsinh_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnsinh_e';

function gsl_sf_lnsinh(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lnsinh';

function gsl_sf_lncosh_e(x: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lncosh_e';

function gsl_sf_lncosh(x: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_lncosh';

function gsl_sf_polar_to_rect(r: Double; theta: Double; x: Pgsl_sf_result; y: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_polar_to_rect';

function gsl_sf_rect_to_polar(x: Double; y: Double; r: Pgsl_sf_result; theta: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_rect_to_polar';

function gsl_sf_sin_err_e(x: Double; dx: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_sin_err_e';

function gsl_sf_cos_err_e(x: Double; dx: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_cos_err_e';

function gsl_sf_angle_restrict_symm_e(theta: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_angle_restrict_symm_e';

function gsl_sf_angle_restrict_symm(theta: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_angle_restrict_symm';

function gsl_sf_angle_restrict_pos_e(theta: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_angle_restrict_pos_e';

function gsl_sf_angle_restrict_pos(theta: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_angle_restrict_pos';

function gsl_sf_angle_restrict_symm_err_e(theta: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_angle_restrict_symm_err_e';

function gsl_sf_angle_restrict_pos_err_e(theta: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_angle_restrict_pos_err_e';

function gsl_sf_zeta_int_e(n: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_zeta_int_e';

function gsl_sf_zeta_int(n: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_zeta_int';

function gsl_sf_zeta_e(s: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_zeta_e';

function gsl_sf_zeta(s: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_zeta';

function gsl_sf_zetam1_e(s: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_zetam1_e';

function gsl_sf_zetam1(s: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_zetam1';

function gsl_sf_zetam1_int_e(s: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_zetam1_int_e';

function gsl_sf_zetam1_int(s: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_zetam1_int';

function gsl_sf_hzeta_e(s: Double; q: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hzeta_e';

function gsl_sf_hzeta(s: Double; q: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_hzeta';

function gsl_sf_eta_int_e(n: Integer; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_eta_int_e';

function gsl_sf_eta_int(n: Integer): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_eta_int';

function gsl_sf_eta_e(s: Double; result: Pgsl_sf_result): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sf_eta_e';

function gsl_sf_eta(s: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_sf_eta';

procedure gsl_siman_solve(r: Pgsl_rng; x0_p: Pointer; Ef: gsl_siman_Efunc_t; take_step: gsl_siman_step_t; distance: gsl_siman_metric_t; print_position: gsl_siman_print_t; copyfunc: gsl_siman_copy_t; copy_constructor: gsl_siman_copy_construct_t; &destructor: gsl_siman_destroy_t; element_size: NativeUInt; params: gsl_siman_params_t); cdecl;
  external LIBGSL name _PU + 'gsl_siman_solve';

procedure gsl_siman_solve_many(r: Pgsl_rng; x0_p: Pointer; Ef: gsl_siman_Efunc_t; take_step: gsl_siman_step_t; distance: gsl_siman_metric_t; print_position: gsl_siman_print_t; element_size: NativeUInt; params: gsl_siman_params_t); cdecl;
  external LIBGSL name _PU + 'gsl_siman_solve_many';

procedure gsl_sort_long_double(data: PExtended; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_double';

procedure gsl_sort2_long_double(data1: PExtended; stride1: NativeUInt; data2: PExtended; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_long_double';

procedure gsl_sort_long_double_index(p: PNativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_double_index';

function gsl_sort_long_double_smallest(dest: PExtended; k: NativeUInt; src: PExtended; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_double_smallest';

function gsl_sort_long_double_smallest_index(p: PNativeUInt; k: NativeUInt; src: PExtended; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_double_smallest_index';

function gsl_sort_long_double_largest(dest: PExtended; k: NativeUInt; src: PExtended; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_double_largest';

function gsl_sort_long_double_largest_index(p: PNativeUInt; k: NativeUInt; src: PExtended; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_double_largest_index';

procedure gsl_sort(data: PDouble; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort';

procedure gsl_sort2(data1: PDouble; stride1: NativeUInt; data2: PDouble; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2';

procedure gsl_sort_index(p: PNativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_index';

function gsl_sort_smallest(dest: PDouble; k: NativeUInt; src: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_smallest';

function gsl_sort_smallest_index(p: PNativeUInt; k: NativeUInt; src: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_smallest_index';

function gsl_sort_largest(dest: PDouble; k: NativeUInt; src: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_largest';

function gsl_sort_largest_index(p: PNativeUInt; k: NativeUInt; src: PDouble; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_largest_index';

procedure gsl_sort_float(data: PSingle; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_float';

procedure gsl_sort2_float(data1: PSingle; stride1: NativeUInt; data2: PSingle; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_float';

procedure gsl_sort_float_index(p: PNativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_float_index';

function gsl_sort_float_smallest(dest: PSingle; k: NativeUInt; src: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_float_smallest';

function gsl_sort_float_smallest_index(p: PNativeUInt; k: NativeUInt; src: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_float_smallest_index';

function gsl_sort_float_largest(dest: PSingle; k: NativeUInt; src: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_float_largest';

function gsl_sort_float_largest_index(p: PNativeUInt; k: NativeUInt; src: PSingle; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_float_largest_index';

procedure gsl_sort_ulong(data: PCardinal; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_ulong';

procedure gsl_sort2_ulong(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_ulong';

procedure gsl_sort_ulong_index(p: PNativeUInt; data: PCardinal; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_ulong_index';

function gsl_sort_ulong_smallest(dest: PCardinal; k: NativeUInt; src: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_ulong_smallest';

function gsl_sort_ulong_smallest_index(p: PNativeUInt; k: NativeUInt; src: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_ulong_smallest_index';

function gsl_sort_ulong_largest(dest: PCardinal; k: NativeUInt; src: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_ulong_largest';

function gsl_sort_ulong_largest_index(p: PNativeUInt; k: NativeUInt; src: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_ulong_largest_index';

procedure gsl_sort_long(data: PInteger; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_long';

procedure gsl_sort2_long(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_long';

procedure gsl_sort_long_index(p: PNativeUInt; data: PInteger; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_index';

function gsl_sort_long_smallest(dest: PInteger; k: NativeUInt; src: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_smallest';

function gsl_sort_long_smallest_index(p: PNativeUInt; k: NativeUInt; src: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_smallest_index';

function gsl_sort_long_largest(dest: PInteger; k: NativeUInt; src: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_largest';

function gsl_sort_long_largest_index(p: PNativeUInt; k: NativeUInt; src: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_long_largest_index';

procedure gsl_sort_uint(data: PCardinal; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_uint';

procedure gsl_sort2_uint(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_uint';

procedure gsl_sort_uint_index(p: PNativeUInt; data: PCardinal; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_uint_index';

function gsl_sort_uint_smallest(dest: PCardinal; k: NativeUInt; src: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_uint_smallest';

function gsl_sort_uint_smallest_index(p: PNativeUInt; k: NativeUInt; src: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_uint_smallest_index';

function gsl_sort_uint_largest(dest: PCardinal; k: NativeUInt; src: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_uint_largest';

function gsl_sort_uint_largest_index(p: PNativeUInt; k: NativeUInt; src: PCardinal; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_uint_largest_index';

procedure gsl_sort_int(data: PInteger; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_int';

procedure gsl_sort2_int(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_int';

procedure gsl_sort_int_index(p: PNativeUInt; data: PInteger; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_int_index';

function gsl_sort_int_smallest(dest: PInteger; k: NativeUInt; src: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_int_smallest';

function gsl_sort_int_smallest_index(p: PNativeUInt; k: NativeUInt; src: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_int_smallest_index';

function gsl_sort_int_largest(dest: PInteger; k: NativeUInt; src: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_int_largest';

function gsl_sort_int_largest_index(p: PNativeUInt; k: NativeUInt; src: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_int_largest_index';

procedure gsl_sort_ushort(data: PWord; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_ushort';

procedure gsl_sort2_ushort(data1: PWord; stride1: NativeUInt; data2: PWord; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_ushort';

procedure gsl_sort_ushort_index(p: PNativeUInt; data: PWord; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_ushort_index';

function gsl_sort_ushort_smallest(dest: PWord; k: NativeUInt; src: PWord; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_ushort_smallest';

function gsl_sort_ushort_smallest_index(p: PNativeUInt; k: NativeUInt; src: PWord; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_ushort_smallest_index';

function gsl_sort_ushort_largest(dest: PWord; k: NativeUInt; src: PWord; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_ushort_largest';

function gsl_sort_ushort_largest_index(p: PNativeUInt; k: NativeUInt; src: PWord; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_ushort_largest_index';

procedure gsl_sort_short(data: PSmallint; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_short';

procedure gsl_sort2_short(data1: PSmallint; stride1: NativeUInt; data2: PSmallint; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_short';

procedure gsl_sort_short_index(p: PNativeUInt; data: PSmallint; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_short_index';

function gsl_sort_short_smallest(dest: PSmallint; k: NativeUInt; src: PSmallint; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_short_smallest';

function gsl_sort_short_smallest_index(p: PNativeUInt; k: NativeUInt; src: PSmallint; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_short_smallest_index';

function gsl_sort_short_largest(dest: PSmallint; k: NativeUInt; src: PSmallint; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_short_largest';

function gsl_sort_short_largest_index(p: PNativeUInt; k: NativeUInt; src: PSmallint; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_short_largest_index';

procedure gsl_sort_uchar(data: PByte; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_uchar';

procedure gsl_sort2_uchar(data1: PByte; stride1: NativeUInt; data2: PByte; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_uchar';

procedure gsl_sort_uchar_index(p: PNativeUInt; data: PByte; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_uchar_index';

function gsl_sort_uchar_smallest(dest: PByte; k: NativeUInt; src: PByte; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_uchar_smallest';

function gsl_sort_uchar_smallest_index(p: PNativeUInt; k: NativeUInt; src: PByte; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_uchar_smallest_index';

function gsl_sort_uchar_largest(dest: PByte; k: NativeUInt; src: PByte; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_uchar_largest';

function gsl_sort_uchar_largest_index(p: PNativeUInt; k: NativeUInt; src: PByte; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_uchar_largest_index';

procedure gsl_sort_char(data: PUTF8Char; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_char';

procedure gsl_sort2_char(data1: PUTF8Char; stride1: NativeUInt; data2: PUTF8Char; stride2: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort2_char';

procedure gsl_sort_char_index(p: PNativeUInt; data: PUTF8Char; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_sort_char_index';

function gsl_sort_char_smallest(dest: PUTF8Char; k: NativeUInt; src: PUTF8Char; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_char_smallest';

function gsl_sort_char_smallest_index(p: PNativeUInt; k: NativeUInt; src: PUTF8Char; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_char_smallest_index';

function gsl_sort_char_largest(dest: PUTF8Char; k: NativeUInt; src: PUTF8Char; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_char_largest';

function gsl_sort_char_largest_index(p: PNativeUInt; k: NativeUInt; src: PUTF8Char; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_char_largest_index';

procedure gsl_sort_vector_long_double(v: Pgsl_vector_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_double';

procedure gsl_sort_vector2_long_double(v1: Pgsl_vector_long_double; v2: Pgsl_vector_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_long_double';

function gsl_sort_vector_long_double_index(p: Pgsl_permutation; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_double_index';

function gsl_sort_vector_long_double_smallest(dest: PExtended; k: NativeUInt; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_double_smallest';

function gsl_sort_vector_long_double_largest(dest: PExtended; k: NativeUInt; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_double_largest';

function gsl_sort_vector_long_double_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_double_smallest_index';

function gsl_sort_vector_long_double_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_double_largest_index';

procedure gsl_sort_vector(v: Pgsl_vector); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector';

procedure gsl_sort_vector2(v1: Pgsl_vector; v2: Pgsl_vector); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2';

function gsl_sort_vector_index(p: Pgsl_permutation; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_index';

function gsl_sort_vector_smallest(dest: PDouble; k: NativeUInt; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_smallest';

function gsl_sort_vector_largest(dest: PDouble; k: NativeUInt; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_largest';

function gsl_sort_vector_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_smallest_index';

function gsl_sort_vector_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_largest_index';

procedure gsl_sort_vector_float(v: Pgsl_vector_float); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_float';

procedure gsl_sort_vector2_float(v1: Pgsl_vector_float; v2: Pgsl_vector_float); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_float';

function gsl_sort_vector_float_index(p: Pgsl_permutation; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_float_index';

function gsl_sort_vector_float_smallest(dest: PSingle; k: NativeUInt; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_float_smallest';

function gsl_sort_vector_float_largest(dest: PSingle; k: NativeUInt; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_float_largest';

function gsl_sort_vector_float_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_float_smallest_index';

function gsl_sort_vector_float_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_float_largest_index';

procedure gsl_sort_vector_ulong(v: Pgsl_vector_ulong); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ulong';

procedure gsl_sort_vector2_ulong(v1: Pgsl_vector_ulong; v2: Pgsl_vector_ulong); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_ulong';

function gsl_sort_vector_ulong_index(p: Pgsl_permutation; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ulong_index';

function gsl_sort_vector_ulong_smallest(dest: PCardinal; k: NativeUInt; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ulong_smallest';

function gsl_sort_vector_ulong_largest(dest: PCardinal; k: NativeUInt; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ulong_largest';

function gsl_sort_vector_ulong_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ulong_smallest_index';

function gsl_sort_vector_ulong_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ulong_largest_index';

procedure gsl_sort_vector_long(v: Pgsl_vector_long); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long';

procedure gsl_sort_vector2_long(v1: Pgsl_vector_long; v2: Pgsl_vector_long); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_long';

function gsl_sort_vector_long_index(p: Pgsl_permutation; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_index';

function gsl_sort_vector_long_smallest(dest: PInteger; k: NativeUInt; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_smallest';

function gsl_sort_vector_long_largest(dest: PInteger; k: NativeUInt; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_largest';

function gsl_sort_vector_long_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_smallest_index';

function gsl_sort_vector_long_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_long_largest_index';

procedure gsl_sort_vector_uint(v: Pgsl_vector_uint); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uint';

procedure gsl_sort_vector2_uint(v1: Pgsl_vector_uint; v2: Pgsl_vector_uint); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_uint';

function gsl_sort_vector_uint_index(p: Pgsl_permutation; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uint_index';

function gsl_sort_vector_uint_smallest(dest: PCardinal; k: NativeUInt; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uint_smallest';

function gsl_sort_vector_uint_largest(dest: PCardinal; k: NativeUInt; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uint_largest';

function gsl_sort_vector_uint_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uint_smallest_index';

function gsl_sort_vector_uint_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uint_largest_index';

procedure gsl_sort_vector_int(v: Pgsl_vector_int); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_int';

procedure gsl_sort_vector2_int(v1: Pgsl_vector_int; v2: Pgsl_vector_int); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_int';

function gsl_sort_vector_int_index(p: Pgsl_permutation; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_int_index';

function gsl_sort_vector_int_smallest(dest: PInteger; k: NativeUInt; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_int_smallest';

function gsl_sort_vector_int_largest(dest: PInteger; k: NativeUInt; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_int_largest';

function gsl_sort_vector_int_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_int_smallest_index';

function gsl_sort_vector_int_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_int_largest_index';

procedure gsl_sort_vector_ushort(v: Pgsl_vector_ushort); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ushort';

procedure gsl_sort_vector2_ushort(v1: Pgsl_vector_ushort; v2: Pgsl_vector_ushort); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_ushort';

function gsl_sort_vector_ushort_index(p: Pgsl_permutation; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ushort_index';

function gsl_sort_vector_ushort_smallest(dest: PWord; k: NativeUInt; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ushort_smallest';

function gsl_sort_vector_ushort_largest(dest: PWord; k: NativeUInt; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ushort_largest';

function gsl_sort_vector_ushort_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ushort_smallest_index';

function gsl_sort_vector_ushort_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_ushort_largest_index';

procedure gsl_sort_vector_short(v: Pgsl_vector_short); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_short';

procedure gsl_sort_vector2_short(v1: Pgsl_vector_short; v2: Pgsl_vector_short); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_short';

function gsl_sort_vector_short_index(p: Pgsl_permutation; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_short_index';

function gsl_sort_vector_short_smallest(dest: PSmallint; k: NativeUInt; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_short_smallest';

function gsl_sort_vector_short_largest(dest: PSmallint; k: NativeUInt; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_short_largest';

function gsl_sort_vector_short_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_short_smallest_index';

function gsl_sort_vector_short_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_short_largest_index';

procedure gsl_sort_vector_uchar(v: Pgsl_vector_uchar); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uchar';

procedure gsl_sort_vector2_uchar(v1: Pgsl_vector_uchar; v2: Pgsl_vector_uchar); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_uchar';

function gsl_sort_vector_uchar_index(p: Pgsl_permutation; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uchar_index';

function gsl_sort_vector_uchar_smallest(dest: PByte; k: NativeUInt; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uchar_smallest';

function gsl_sort_vector_uchar_largest(dest: PByte; k: NativeUInt; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uchar_largest';

function gsl_sort_vector_uchar_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uchar_smallest_index';

function gsl_sort_vector_uchar_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_uchar_largest_index';

procedure gsl_sort_vector_char(v: Pgsl_vector_char); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_char';

procedure gsl_sort_vector2_char(v1: Pgsl_vector_char; v2: Pgsl_vector_char); cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector2_char';

function gsl_sort_vector_char_index(p: Pgsl_permutation; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_char_index';

function gsl_sort_vector_char_smallest(dest: PUTF8Char; k: NativeUInt; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_char_smallest';

function gsl_sort_vector_char_largest(dest: PUTF8Char; k: NativeUInt; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_char_largest';

function gsl_sort_vector_char_smallest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_char_smallest_index';

function gsl_sort_vector_char_largest_index(p: PNativeUInt; k: NativeUInt; v: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sort_vector_char_largest_index';

procedure gsl_spmatrix_cumsum(n: NativeUInt; c: PInteger); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_cumsum';

function gsl_spmatrix_complex_long_double_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_alloc';

function gsl_spmatrix_complex_long_double_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_alloc_nzmax';

procedure gsl_spmatrix_complex_long_double_free(m: Pgsl_spmatrix_complex_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_free';

function gsl_spmatrix_complex_long_double_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_realloc';

function gsl_spmatrix_complex_long_double_nnz(m: Pgsl_spmatrix_complex_long_double): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_nnz';

function gsl_spmatrix_complex_long_double_type(m: Pgsl_spmatrix_complex_long_double): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_type';

function gsl_spmatrix_complex_long_double_set_zero(m: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_set_zero';

function gsl_spmatrix_complex_long_double_tree_rebuild(m: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_tree_rebuild';

function gsl_spmatrix_complex_long_double_csc(dest: Pgsl_spmatrix_complex_long_double; src: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_csc';

function gsl_spmatrix_complex_long_double_csr(dest: Pgsl_spmatrix_complex_long_double; src: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_csr';

function gsl_spmatrix_complex_long_double_compress(src: Pgsl_spmatrix_complex_long_double; sptype: Integer): Pgsl_spmatrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_compress';

function gsl_spmatrix_complex_long_double_compcol(src: Pgsl_spmatrix_complex_long_double): Pgsl_spmatrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_compcol';

function gsl_spmatrix_complex_long_double_ccs(src: Pgsl_spmatrix_complex_long_double): Pgsl_spmatrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_ccs';

function gsl_spmatrix_complex_long_double_crs(src: Pgsl_spmatrix_complex_long_double): Pgsl_spmatrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_crs';

function gsl_spmatrix_complex_long_double_memcpy(dest: Pgsl_spmatrix_complex_long_double; src: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_memcpy';

function gsl_spmatrix_complex_long_double_fprintf(stream: PPointer; m: Pgsl_spmatrix_complex_long_double; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_fprintf';

function gsl_spmatrix_complex_long_double_fscanf(stream: PPointer): Pgsl_spmatrix_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_fscanf';

function gsl_spmatrix_complex_long_double_fwrite(stream: PPointer; m: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_fwrite';

function gsl_spmatrix_complex_long_double_fread(stream: PPointer; m: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_fread';

function gsl_spmatrix_complex_long_double_get(m: Pgsl_spmatrix_complex_long_double; i: NativeUInt; j: NativeUInt): gsl_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_get';

function gsl_spmatrix_complex_long_double_set(m: Pgsl_spmatrix_complex_long_double; i: NativeUInt; j: NativeUInt; x: gsl_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_set';

function gsl_spmatrix_complex_long_double_ptr(m: Pgsl_spmatrix_complex_long_double; i: NativeUInt; j: NativeUInt): Pgsl_complex_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_ptr';

function gsl_spmatrix_complex_long_double_scale(m: Pgsl_spmatrix_complex_long_double; x: gsl_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_scale';

function gsl_spmatrix_complex_long_double_scale_columns(m: Pgsl_spmatrix_complex_long_double; x: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_scale_columns';

function gsl_spmatrix_complex_long_double_scale_rows(m: Pgsl_spmatrix_complex_long_double; x: Pgsl_vector_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_scale_rows';

function gsl_spmatrix_complex_long_double_add(c: Pgsl_spmatrix_complex_long_double; a: Pgsl_spmatrix_complex_long_double; b: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_add';

function gsl_spmatrix_complex_long_double_add_to_dense(a: Pgsl_matrix_complex_long_double; b: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_add_to_dense';

function gsl_spmatrix_complex_long_double_d2sp(T: Pgsl_spmatrix_complex_long_double; A: Pgsl_matrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_d2sp';

function gsl_spmatrix_complex_long_double_sp2d(A: Pgsl_matrix_complex_long_double; S: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_sp2d';

function gsl_spmatrix_complex_long_double_equal(a: Pgsl_spmatrix_complex_long_double; b: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_equal';

function gsl_spmatrix_complex_long_double_transpose(m: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_transpose';

function gsl_spmatrix_complex_long_double_transpose2(m: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_transpose2';

function gsl_spmatrix_complex_long_double_transpose_memcpy(dest: Pgsl_spmatrix_complex_long_double; src: Pgsl_spmatrix_complex_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_long_double_transpose_memcpy';

function gsl_spmatrix_complex_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_alloc';

function gsl_spmatrix_complex_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_alloc_nzmax';

procedure gsl_spmatrix_complex_free(m: Pgsl_spmatrix_complex); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_free';

function gsl_spmatrix_complex_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_realloc';

function gsl_spmatrix_complex_nnz(m: Pgsl_spmatrix_complex): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_nnz';

function gsl_spmatrix_complex_type(m: Pgsl_spmatrix_complex): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_type';

function gsl_spmatrix_complex_set_zero(m: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_set_zero';

function gsl_spmatrix_complex_tree_rebuild(m: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_tree_rebuild';

function gsl_spmatrix_complex_csc(dest: Pgsl_spmatrix_complex; src: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_csc';

function gsl_spmatrix_complex_csr(dest: Pgsl_spmatrix_complex; src: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_csr';

function gsl_spmatrix_complex_compress(src: Pgsl_spmatrix_complex; sptype: Integer): Pgsl_spmatrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_compress';

function gsl_spmatrix_complex_compcol(src: Pgsl_spmatrix_complex): Pgsl_spmatrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_compcol';

function gsl_spmatrix_complex_ccs(src: Pgsl_spmatrix_complex): Pgsl_spmatrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_ccs';

function gsl_spmatrix_complex_crs(src: Pgsl_spmatrix_complex): Pgsl_spmatrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_crs';

function gsl_spmatrix_complex_memcpy(dest: Pgsl_spmatrix_complex; src: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_memcpy';

function gsl_spmatrix_complex_fprintf(stream: PPointer; m: Pgsl_spmatrix_complex; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_fprintf';

function gsl_spmatrix_complex_fscanf(stream: PPointer): Pgsl_spmatrix_complex; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_fscanf';

function gsl_spmatrix_complex_fwrite(stream: PPointer; m: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_fwrite';

function gsl_spmatrix_complex_fread(stream: PPointer; m: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_fread';

function gsl_spmatrix_complex_get(m: Pgsl_spmatrix_complex; i: NativeUInt; j: NativeUInt): gsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_get';

function gsl_spmatrix_complex_set(m: Pgsl_spmatrix_complex; i: NativeUInt; j: NativeUInt; x: gsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_set';

function gsl_spmatrix_complex_ptr(m: Pgsl_spmatrix_complex; i: NativeUInt; j: NativeUInt): Pgsl_complex; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_ptr';

function gsl_spmatrix_complex_scale(m: Pgsl_spmatrix_complex; x: gsl_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_scale';

function gsl_spmatrix_complex_scale_columns(m: Pgsl_spmatrix_complex; x: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_scale_columns';

function gsl_spmatrix_complex_scale_rows(m: Pgsl_spmatrix_complex; x: Pgsl_vector_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_scale_rows';

function gsl_spmatrix_complex_add(c: Pgsl_spmatrix_complex; a: Pgsl_spmatrix_complex; b: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_add';

function gsl_spmatrix_complex_add_to_dense(a: Pgsl_matrix_complex; b: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_add_to_dense';

function gsl_spmatrix_complex_d2sp(T: Pgsl_spmatrix_complex; A: Pgsl_matrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_d2sp';

function gsl_spmatrix_complex_sp2d(A: Pgsl_matrix_complex; S: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_sp2d';

function gsl_spmatrix_complex_equal(a: Pgsl_spmatrix_complex; b: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_equal';

function gsl_spmatrix_complex_transpose(m: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_transpose';

function gsl_spmatrix_complex_transpose2(m: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_transpose2';

function gsl_spmatrix_complex_transpose_memcpy(dest: Pgsl_spmatrix_complex; src: Pgsl_spmatrix_complex): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_transpose_memcpy';

function gsl_spmatrix_complex_float_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_alloc';

function gsl_spmatrix_complex_float_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_alloc_nzmax';

procedure gsl_spmatrix_complex_float_free(m: Pgsl_spmatrix_complex_float); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_free';

function gsl_spmatrix_complex_float_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_realloc';

function gsl_spmatrix_complex_float_nnz(m: Pgsl_spmatrix_complex_float): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_nnz';

function gsl_spmatrix_complex_float_type(m: Pgsl_spmatrix_complex_float): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_type';

function gsl_spmatrix_complex_float_set_zero(m: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_set_zero';

function gsl_spmatrix_complex_float_tree_rebuild(m: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_tree_rebuild';

function gsl_spmatrix_complex_float_csc(dest: Pgsl_spmatrix_complex_float; src: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_csc';

function gsl_spmatrix_complex_float_csr(dest: Pgsl_spmatrix_complex_float; src: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_csr';

function gsl_spmatrix_complex_float_compress(src: Pgsl_spmatrix_complex_float; sptype: Integer): Pgsl_spmatrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_compress';

function gsl_spmatrix_complex_float_compcol(src: Pgsl_spmatrix_complex_float): Pgsl_spmatrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_compcol';

function gsl_spmatrix_complex_float_ccs(src: Pgsl_spmatrix_complex_float): Pgsl_spmatrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_ccs';

function gsl_spmatrix_complex_float_crs(src: Pgsl_spmatrix_complex_float): Pgsl_spmatrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_crs';

function gsl_spmatrix_complex_float_memcpy(dest: Pgsl_spmatrix_complex_float; src: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_memcpy';

function gsl_spmatrix_complex_float_fprintf(stream: PPointer; m: Pgsl_spmatrix_complex_float; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_fprintf';

function gsl_spmatrix_complex_float_fscanf(stream: PPointer): Pgsl_spmatrix_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_fscanf';

function gsl_spmatrix_complex_float_fwrite(stream: PPointer; m: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_fwrite';

function gsl_spmatrix_complex_float_fread(stream: PPointer; m: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_fread';

function gsl_spmatrix_complex_float_get(m: Pgsl_spmatrix_complex_float; i: NativeUInt; j: NativeUInt): gsl_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_get';

function gsl_spmatrix_complex_float_set(m: Pgsl_spmatrix_complex_float; i: NativeUInt; j: NativeUInt; x: gsl_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_set';

function gsl_spmatrix_complex_float_ptr(m: Pgsl_spmatrix_complex_float; i: NativeUInt; j: NativeUInt): Pgsl_complex_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_ptr';

function gsl_spmatrix_complex_float_scale(m: Pgsl_spmatrix_complex_float; x: gsl_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_scale';

function gsl_spmatrix_complex_float_scale_columns(m: Pgsl_spmatrix_complex_float; x: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_scale_columns';

function gsl_spmatrix_complex_float_scale_rows(m: Pgsl_spmatrix_complex_float; x: Pgsl_vector_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_scale_rows';

function gsl_spmatrix_complex_float_add(c: Pgsl_spmatrix_complex_float; a: Pgsl_spmatrix_complex_float; b: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_add';

function gsl_spmatrix_complex_float_add_to_dense(a: Pgsl_matrix_complex_float; b: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_add_to_dense';

function gsl_spmatrix_complex_float_d2sp(T: Pgsl_spmatrix_complex_float; A: Pgsl_matrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_d2sp';

function gsl_spmatrix_complex_float_sp2d(A: Pgsl_matrix_complex_float; S: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_sp2d';

function gsl_spmatrix_complex_float_equal(a: Pgsl_spmatrix_complex_float; b: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_equal';

function gsl_spmatrix_complex_float_transpose(m: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_transpose';

function gsl_spmatrix_complex_float_transpose2(m: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_transpose2';

function gsl_spmatrix_complex_float_transpose_memcpy(dest: Pgsl_spmatrix_complex_float; src: Pgsl_spmatrix_complex_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_complex_float_transpose_memcpy';

function gsl_spmatrix_long_double_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_alloc';

function gsl_spmatrix_long_double_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_alloc_nzmax';

procedure gsl_spmatrix_long_double_free(m: Pgsl_spmatrix_long_double); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_free';

function gsl_spmatrix_long_double_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_realloc';

function gsl_spmatrix_long_double_nnz(m: Pgsl_spmatrix_long_double): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_nnz';

function gsl_spmatrix_long_double_type(m: Pgsl_spmatrix_long_double): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_type';

function gsl_spmatrix_long_double_set_zero(m: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_set_zero';

function gsl_spmatrix_long_double_tree_rebuild(m: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_tree_rebuild';

function gsl_spmatrix_long_double_csc(dest: Pgsl_spmatrix_long_double; src: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_csc';

function gsl_spmatrix_long_double_csr(dest: Pgsl_spmatrix_long_double; src: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_csr';

function gsl_spmatrix_long_double_compress(src: Pgsl_spmatrix_long_double; sptype: Integer): Pgsl_spmatrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_compress';

function gsl_spmatrix_long_double_compcol(src: Pgsl_spmatrix_long_double): Pgsl_spmatrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_compcol';

function gsl_spmatrix_long_double_ccs(src: Pgsl_spmatrix_long_double): Pgsl_spmatrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_ccs';

function gsl_spmatrix_long_double_crs(src: Pgsl_spmatrix_long_double): Pgsl_spmatrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_crs';

function gsl_spmatrix_long_double_memcpy(dest: Pgsl_spmatrix_long_double; src: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_memcpy';

function gsl_spmatrix_long_double_fprintf(stream: PPointer; m: Pgsl_spmatrix_long_double; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_fprintf';

function gsl_spmatrix_long_double_fscanf(stream: PPointer): Pgsl_spmatrix_long_double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_fscanf';

function gsl_spmatrix_long_double_fwrite(stream: PPointer; m: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_fwrite';

function gsl_spmatrix_long_double_fread(stream: PPointer; m: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_fread';

function gsl_spmatrix_long_double_get(m: Pgsl_spmatrix_long_double; i: NativeUInt; j: NativeUInt): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_get';

function gsl_spmatrix_long_double_set(m: Pgsl_spmatrix_long_double; i: NativeUInt; j: NativeUInt; x: Extended): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_set';

function gsl_spmatrix_long_double_ptr(m: Pgsl_spmatrix_long_double; i: NativeUInt; j: NativeUInt): PExtended; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_ptr';

function gsl_spmatrix_long_double_minmax(m: Pgsl_spmatrix_long_double; min_out: PExtended; max_out: PExtended): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_minmax';

function gsl_spmatrix_long_double_min_index(m: Pgsl_spmatrix_long_double; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_min_index';

function gsl_spmatrix_long_double_scale(m: Pgsl_spmatrix_long_double; x: Extended): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_scale';

function gsl_spmatrix_long_double_scale_columns(m: Pgsl_spmatrix_long_double; x: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_scale_columns';

function gsl_spmatrix_long_double_scale_rows(m: Pgsl_spmatrix_long_double; x: Pgsl_vector_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_scale_rows';

function gsl_spmatrix_long_double_add(c: Pgsl_spmatrix_long_double; a: Pgsl_spmatrix_long_double; b: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_add';

function gsl_spmatrix_long_double_add_to_dense(a: Pgsl_matrix_long_double; b: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_add_to_dense';

function gsl_spmatrix_long_double_d2sp(T: Pgsl_spmatrix_long_double; A: Pgsl_matrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_d2sp';

function gsl_spmatrix_long_double_sp2d(A: Pgsl_matrix_long_double; S: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_sp2d';

function gsl_spmatrix_long_double_equal(a: Pgsl_spmatrix_long_double; b: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_equal';

function gsl_spmatrix_long_double_transpose(m: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_transpose';

function gsl_spmatrix_long_double_transpose2(m: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_transpose2';

function gsl_spmatrix_long_double_transpose_memcpy(dest: Pgsl_spmatrix_long_double; src: Pgsl_spmatrix_long_double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_double_transpose_memcpy';

function gsl_spmatrix_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_alloc';

function gsl_spmatrix_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_alloc_nzmax';

procedure gsl_spmatrix_free(m: Pgsl_spmatrix); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_free';

function gsl_spmatrix_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_realloc';

function gsl_spmatrix_nnz(m: Pgsl_spmatrix): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_nnz';

function gsl_spmatrix_type(m: Pgsl_spmatrix): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_type';

function gsl_spmatrix_set_zero(m: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_set_zero';

function gsl_spmatrix_tree_rebuild(m: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_tree_rebuild';

function gsl_spmatrix_compress(src: Pgsl_spmatrix; sptype: Integer): Pgsl_spmatrix; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_compress';

function gsl_spmatrix_compcol(src: Pgsl_spmatrix): Pgsl_spmatrix; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_compcol';

function gsl_spmatrix_memcpy(dest: Pgsl_spmatrix; src: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_memcpy';

function gsl_spmatrix_fprintf(stream: PPointer; m: Pgsl_spmatrix; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_fprintf';

function gsl_spmatrix_fscanf(stream: PPointer): Pgsl_spmatrix; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_fscanf';

function gsl_spmatrix_fwrite(stream: PPointer; m: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_fwrite';

function gsl_spmatrix_fread(stream: PPointer; m: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_fread';

function gsl_spmatrix_get(m: Pgsl_spmatrix; i: NativeUInt; j: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_get';

function gsl_spmatrix_set(m: Pgsl_spmatrix; i: NativeUInt; j: NativeUInt; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_set';

function gsl_spmatrix_ptr(m: Pgsl_spmatrix; i: NativeUInt; j: NativeUInt): PDouble; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ptr';

function gsl_spmatrix_minmax(m: Pgsl_spmatrix; min_out: PDouble; max_out: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_minmax';

function gsl_spmatrix_min_index(m: Pgsl_spmatrix; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_min_index';

function gsl_spmatrix_scale(m: Pgsl_spmatrix; x: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_scale';

function gsl_spmatrix_scale_columns(m: Pgsl_spmatrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_scale_columns';

function gsl_spmatrix_scale_rows(m: Pgsl_spmatrix; x: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_scale_rows';

function gsl_spmatrix_add(c: Pgsl_spmatrix; a: Pgsl_spmatrix; b: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_add';

function gsl_spmatrix_add_to_dense(a: Pgsl_matrix; b: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_add_to_dense';

function gsl_spmatrix_d2sp(T: Pgsl_spmatrix; A: Pgsl_matrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_d2sp';

function gsl_spmatrix_sp2d(A: Pgsl_matrix; S: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_sp2d';

function gsl_spmatrix_equal(a: Pgsl_spmatrix; b: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_equal';

function gsl_spmatrix_transpose(m: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_transpose';

function gsl_spmatrix_transpose2(m: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_transpose2';

function gsl_spmatrix_transpose_memcpy(dest: Pgsl_spmatrix; src: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_transpose_memcpy';

function gsl_spmatrix_float_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_alloc';

function gsl_spmatrix_float_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_alloc_nzmax';

procedure gsl_spmatrix_float_free(m: Pgsl_spmatrix_float); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_free';

function gsl_spmatrix_float_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_realloc';

function gsl_spmatrix_float_nnz(m: Pgsl_spmatrix_float): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_nnz';

function gsl_spmatrix_float_type(m: Pgsl_spmatrix_float): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_type';

function gsl_spmatrix_float_set_zero(m: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_set_zero';

function gsl_spmatrix_float_tree_rebuild(m: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_tree_rebuild';

function gsl_spmatrix_float_csc(dest: Pgsl_spmatrix_float; src: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_csc';

function gsl_spmatrix_float_csr(dest: Pgsl_spmatrix_float; src: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_csr';

function gsl_spmatrix_float_compress(src: Pgsl_spmatrix_float; sptype: Integer): Pgsl_spmatrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_compress';

function gsl_spmatrix_float_compcol(src: Pgsl_spmatrix_float): Pgsl_spmatrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_compcol';

function gsl_spmatrix_float_ccs(src: Pgsl_spmatrix_float): Pgsl_spmatrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_ccs';

function gsl_spmatrix_float_crs(src: Pgsl_spmatrix_float): Pgsl_spmatrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_crs';

function gsl_spmatrix_float_memcpy(dest: Pgsl_spmatrix_float; src: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_memcpy';

function gsl_spmatrix_float_fprintf(stream: PPointer; m: Pgsl_spmatrix_float; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_fprintf';

function gsl_spmatrix_float_fscanf(stream: PPointer): Pgsl_spmatrix_float; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_fscanf';

function gsl_spmatrix_float_fwrite(stream: PPointer; m: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_fwrite';

function gsl_spmatrix_float_fread(stream: PPointer; m: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_fread';

function gsl_spmatrix_float_get(m: Pgsl_spmatrix_float; i: NativeUInt; j: NativeUInt): Single; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_get';

function gsl_spmatrix_float_set(m: Pgsl_spmatrix_float; i: NativeUInt; j: NativeUInt; x: Single): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_set';

function gsl_spmatrix_float_ptr(m: Pgsl_spmatrix_float; i: NativeUInt; j: NativeUInt): PSingle; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_ptr';

function gsl_spmatrix_float_minmax(m: Pgsl_spmatrix_float; min_out: PSingle; max_out: PSingle): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_minmax';

function gsl_spmatrix_float_min_index(m: Pgsl_spmatrix_float; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_min_index';

function gsl_spmatrix_float_scale(m: Pgsl_spmatrix_float; x: Single): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_scale';

function gsl_spmatrix_float_scale_columns(m: Pgsl_spmatrix_float; x: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_scale_columns';

function gsl_spmatrix_float_scale_rows(m: Pgsl_spmatrix_float; x: Pgsl_vector_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_scale_rows';

function gsl_spmatrix_float_add(c: Pgsl_spmatrix_float; a: Pgsl_spmatrix_float; b: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_add';

function gsl_spmatrix_float_add_to_dense(a: Pgsl_matrix_float; b: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_add_to_dense';

function gsl_spmatrix_float_d2sp(T: Pgsl_spmatrix_float; A: Pgsl_matrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_d2sp';

function gsl_spmatrix_float_sp2d(A: Pgsl_matrix_float; S: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_sp2d';

function gsl_spmatrix_float_equal(a: Pgsl_spmatrix_float; b: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_equal';

function gsl_spmatrix_float_transpose(m: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_transpose';

function gsl_spmatrix_float_transpose2(m: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_transpose2';

function gsl_spmatrix_float_transpose_memcpy(dest: Pgsl_spmatrix_float; src: Pgsl_spmatrix_float): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_float_transpose_memcpy';

function gsl_spmatrix_ulong_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_alloc';

function gsl_spmatrix_ulong_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_alloc_nzmax';

procedure gsl_spmatrix_ulong_free(m: Pgsl_spmatrix_ulong); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_free';

function gsl_spmatrix_ulong_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_realloc';

function gsl_spmatrix_ulong_nnz(m: Pgsl_spmatrix_ulong): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_nnz';

function gsl_spmatrix_ulong_type(m: Pgsl_spmatrix_ulong): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_type';

function gsl_spmatrix_ulong_set_zero(m: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_set_zero';

function gsl_spmatrix_ulong_tree_rebuild(m: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_tree_rebuild';

function gsl_spmatrix_ulong_csc(dest: Pgsl_spmatrix_ulong; src: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_csc';

function gsl_spmatrix_ulong_csr(dest: Pgsl_spmatrix_ulong; src: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_csr';

function gsl_spmatrix_ulong_compress(src: Pgsl_spmatrix_ulong; sptype: Integer): Pgsl_spmatrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_compress';

function gsl_spmatrix_ulong_compcol(src: Pgsl_spmatrix_ulong): Pgsl_spmatrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_compcol';

function gsl_spmatrix_ulong_ccs(src: Pgsl_spmatrix_ulong): Pgsl_spmatrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_ccs';

function gsl_spmatrix_ulong_crs(src: Pgsl_spmatrix_ulong): Pgsl_spmatrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_crs';

function gsl_spmatrix_ulong_memcpy(dest: Pgsl_spmatrix_ulong; src: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_memcpy';

function gsl_spmatrix_ulong_fprintf(stream: PPointer; m: Pgsl_spmatrix_ulong; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_fprintf';

function gsl_spmatrix_ulong_fscanf(stream: PPointer): Pgsl_spmatrix_ulong; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_fscanf';

function gsl_spmatrix_ulong_fwrite(stream: PPointer; m: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_fwrite';

function gsl_spmatrix_ulong_fread(stream: PPointer; m: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_fread';

function gsl_spmatrix_ulong_get(m: Pgsl_spmatrix_ulong; i: NativeUInt; j: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_get';

function gsl_spmatrix_ulong_set(m: Pgsl_spmatrix_ulong; i: NativeUInt; j: NativeUInt; x: Cardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_set';

function gsl_spmatrix_ulong_ptr(m: Pgsl_spmatrix_ulong; i: NativeUInt; j: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_ptr';

function gsl_spmatrix_ulong_minmax(m: Pgsl_spmatrix_ulong; min_out: PCardinal; max_out: PCardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_minmax';

function gsl_spmatrix_ulong_min_index(m: Pgsl_spmatrix_ulong; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_min_index';

function gsl_spmatrix_ulong_scale(m: Pgsl_spmatrix_ulong; x: Cardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_scale';

function gsl_spmatrix_ulong_scale_columns(m: Pgsl_spmatrix_ulong; x: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_scale_columns';

function gsl_spmatrix_ulong_scale_rows(m: Pgsl_spmatrix_ulong; x: Pgsl_vector_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_scale_rows';

function gsl_spmatrix_ulong_add(c: Pgsl_spmatrix_ulong; a: Pgsl_spmatrix_ulong; b: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_add';

function gsl_spmatrix_ulong_add_to_dense(a: Pgsl_matrix_ulong; b: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_add_to_dense';

function gsl_spmatrix_ulong_d2sp(T: Pgsl_spmatrix_ulong; A: Pgsl_matrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_d2sp';

function gsl_spmatrix_ulong_sp2d(A: Pgsl_matrix_ulong; S: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_sp2d';

function gsl_spmatrix_ulong_equal(a: Pgsl_spmatrix_ulong; b: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_equal';

function gsl_spmatrix_ulong_transpose(m: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_transpose';

function gsl_spmatrix_ulong_transpose2(m: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_transpose2';

function gsl_spmatrix_ulong_transpose_memcpy(dest: Pgsl_spmatrix_ulong; src: Pgsl_spmatrix_ulong): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ulong_transpose_memcpy';

function gsl_spmatrix_long_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_alloc';

function gsl_spmatrix_long_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_alloc_nzmax';

procedure gsl_spmatrix_long_free(m: Pgsl_spmatrix_long); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_free';

function gsl_spmatrix_long_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_realloc';

function gsl_spmatrix_long_nnz(m: Pgsl_spmatrix_long): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_nnz';

function gsl_spmatrix_long_type(m: Pgsl_spmatrix_long): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_type';

function gsl_spmatrix_long_set_zero(m: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_set_zero';

function gsl_spmatrix_long_tree_rebuild(m: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_tree_rebuild';

function gsl_spmatrix_long_csc(dest: Pgsl_spmatrix_long; src: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_csc';

function gsl_spmatrix_long_csr(dest: Pgsl_spmatrix_long; src: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_csr';

function gsl_spmatrix_long_compress(src: Pgsl_spmatrix_long; sptype: Integer): Pgsl_spmatrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_compress';

function gsl_spmatrix_long_compcol(src: Pgsl_spmatrix_long): Pgsl_spmatrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_compcol';

function gsl_spmatrix_long_ccs(src: Pgsl_spmatrix_long): Pgsl_spmatrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_ccs';

function gsl_spmatrix_long_crs(src: Pgsl_spmatrix_long): Pgsl_spmatrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_crs';

function gsl_spmatrix_long_memcpy(dest: Pgsl_spmatrix_long; src: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_memcpy';

function gsl_spmatrix_long_fprintf(stream: PPointer; m: Pgsl_spmatrix_long; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_fprintf';

function gsl_spmatrix_long_fscanf(stream: PPointer): Pgsl_spmatrix_long; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_fscanf';

function gsl_spmatrix_long_fwrite(stream: PPointer; m: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_fwrite';

function gsl_spmatrix_long_fread(stream: PPointer; m: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_fread';

function gsl_spmatrix_long_get(m: Pgsl_spmatrix_long; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_get';

function gsl_spmatrix_long_set(m: Pgsl_spmatrix_long; i: NativeUInt; j: NativeUInt; x: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_set';

function gsl_spmatrix_long_ptr(m: Pgsl_spmatrix_long; i: NativeUInt; j: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_ptr';

function gsl_spmatrix_long_minmax(m: Pgsl_spmatrix_long; min_out: PInteger; max_out: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_minmax';

function gsl_spmatrix_long_min_index(m: Pgsl_spmatrix_long; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_min_index';

function gsl_spmatrix_long_scale(m: Pgsl_spmatrix_long; x: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_scale';

function gsl_spmatrix_long_scale_columns(m: Pgsl_spmatrix_long; x: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_scale_columns';

function gsl_spmatrix_long_scale_rows(m: Pgsl_spmatrix_long; x: Pgsl_vector_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_scale_rows';

function gsl_spmatrix_long_add(c: Pgsl_spmatrix_long; a: Pgsl_spmatrix_long; b: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_add';

function gsl_spmatrix_long_add_to_dense(a: Pgsl_matrix_long; b: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_add_to_dense';

function gsl_spmatrix_long_d2sp(T: Pgsl_spmatrix_long; A: Pgsl_matrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_d2sp';

function gsl_spmatrix_long_sp2d(A: Pgsl_matrix_long; S: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_sp2d';

function gsl_spmatrix_long_equal(a: Pgsl_spmatrix_long; b: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_equal';

function gsl_spmatrix_long_transpose(m: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_transpose';

function gsl_spmatrix_long_transpose2(m: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_transpose2';

function gsl_spmatrix_long_transpose_memcpy(dest: Pgsl_spmatrix_long; src: Pgsl_spmatrix_long): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_long_transpose_memcpy';

function gsl_spmatrix_uint_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_alloc';

function gsl_spmatrix_uint_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_alloc_nzmax';

procedure gsl_spmatrix_uint_free(m: Pgsl_spmatrix_uint); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_free';

function gsl_spmatrix_uint_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_realloc';

function gsl_spmatrix_uint_nnz(m: Pgsl_spmatrix_uint): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_nnz';

function gsl_spmatrix_uint_type(m: Pgsl_spmatrix_uint): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_type';

function gsl_spmatrix_uint_set_zero(m: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_set_zero';

function gsl_spmatrix_uint_tree_rebuild(m: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_tree_rebuild';

function gsl_spmatrix_uint_csc(dest: Pgsl_spmatrix_uint; src: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_csc';

function gsl_spmatrix_uint_csr(dest: Pgsl_spmatrix_uint; src: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_csr';

function gsl_spmatrix_uint_compress(src: Pgsl_spmatrix_uint; sptype: Integer): Pgsl_spmatrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_compress';

function gsl_spmatrix_uint_compcol(src: Pgsl_spmatrix_uint): Pgsl_spmatrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_compcol';

function gsl_spmatrix_uint_ccs(src: Pgsl_spmatrix_uint): Pgsl_spmatrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_ccs';

function gsl_spmatrix_uint_crs(src: Pgsl_spmatrix_uint): Pgsl_spmatrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_crs';

function gsl_spmatrix_uint_memcpy(dest: Pgsl_spmatrix_uint; src: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_memcpy';

function gsl_spmatrix_uint_fprintf(stream: PPointer; m: Pgsl_spmatrix_uint; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_fprintf';

function gsl_spmatrix_uint_fscanf(stream: PPointer): Pgsl_spmatrix_uint; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_fscanf';

function gsl_spmatrix_uint_fwrite(stream: PPointer; m: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_fwrite';

function gsl_spmatrix_uint_fread(stream: PPointer; m: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_fread';

function gsl_spmatrix_uint_get(m: Pgsl_spmatrix_uint; i: NativeUInt; j: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_get';

function gsl_spmatrix_uint_set(m: Pgsl_spmatrix_uint; i: NativeUInt; j: NativeUInt; x: Cardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_set';

function gsl_spmatrix_uint_ptr(m: Pgsl_spmatrix_uint; i: NativeUInt; j: NativeUInt): PCardinal; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_ptr';

function gsl_spmatrix_uint_minmax(m: Pgsl_spmatrix_uint; min_out: PCardinal; max_out: PCardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_minmax';

function gsl_spmatrix_uint_min_index(m: Pgsl_spmatrix_uint; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_min_index';

function gsl_spmatrix_uint_scale(m: Pgsl_spmatrix_uint; x: Cardinal): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_scale';

function gsl_spmatrix_uint_scale_columns(m: Pgsl_spmatrix_uint; x: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_scale_columns';

function gsl_spmatrix_uint_scale_rows(m: Pgsl_spmatrix_uint; x: Pgsl_vector_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_scale_rows';

function gsl_spmatrix_uint_add(c: Pgsl_spmatrix_uint; a: Pgsl_spmatrix_uint; b: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_add';

function gsl_spmatrix_uint_add_to_dense(a: Pgsl_matrix_uint; b: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_add_to_dense';

function gsl_spmatrix_uint_d2sp(T: Pgsl_spmatrix_uint; A: Pgsl_matrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_d2sp';

function gsl_spmatrix_uint_sp2d(A: Pgsl_matrix_uint; S: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_sp2d';

function gsl_spmatrix_uint_equal(a: Pgsl_spmatrix_uint; b: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_equal';

function gsl_spmatrix_uint_transpose(m: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_transpose';

function gsl_spmatrix_uint_transpose2(m: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_transpose2';

function gsl_spmatrix_uint_transpose_memcpy(dest: Pgsl_spmatrix_uint; src: Pgsl_spmatrix_uint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uint_transpose_memcpy';

function gsl_spmatrix_int_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_alloc';

function gsl_spmatrix_int_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_alloc_nzmax';

procedure gsl_spmatrix_int_free(m: Pgsl_spmatrix_int); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_free';

function gsl_spmatrix_int_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_realloc';

function gsl_spmatrix_int_nnz(m: Pgsl_spmatrix_int): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_nnz';

function gsl_spmatrix_int_type(m: Pgsl_spmatrix_int): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_type';

function gsl_spmatrix_int_set_zero(m: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_set_zero';

function gsl_spmatrix_int_tree_rebuild(m: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_tree_rebuild';

function gsl_spmatrix_int_csc(dest: Pgsl_spmatrix_int; src: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_csc';

function gsl_spmatrix_int_csr(dest: Pgsl_spmatrix_int; src: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_csr';

function gsl_spmatrix_int_compress(src: Pgsl_spmatrix_int; sptype: Integer): Pgsl_spmatrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_compress';

function gsl_spmatrix_int_compcol(src: Pgsl_spmatrix_int): Pgsl_spmatrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_compcol';

function gsl_spmatrix_int_ccs(src: Pgsl_spmatrix_int): Pgsl_spmatrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_ccs';

function gsl_spmatrix_int_crs(src: Pgsl_spmatrix_int): Pgsl_spmatrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_crs';

function gsl_spmatrix_int_memcpy(dest: Pgsl_spmatrix_int; src: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_memcpy';

function gsl_spmatrix_int_fprintf(stream: PPointer; m: Pgsl_spmatrix_int; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_fprintf';

function gsl_spmatrix_int_fscanf(stream: PPointer): Pgsl_spmatrix_int; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_fscanf';

function gsl_spmatrix_int_fwrite(stream: PPointer; m: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_fwrite';

function gsl_spmatrix_int_fread(stream: PPointer; m: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_fread';

function gsl_spmatrix_int_get(m: Pgsl_spmatrix_int; i: NativeUInt; j: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_get';

function gsl_spmatrix_int_set(m: Pgsl_spmatrix_int; i: NativeUInt; j: NativeUInt; x: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_set';

function gsl_spmatrix_int_ptr(m: Pgsl_spmatrix_int; i: NativeUInt; j: NativeUInt): PInteger; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_ptr';

function gsl_spmatrix_int_minmax(m: Pgsl_spmatrix_int; min_out: PInteger; max_out: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_minmax';

function gsl_spmatrix_int_min_index(m: Pgsl_spmatrix_int; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_min_index';

function gsl_spmatrix_int_scale(m: Pgsl_spmatrix_int; x: Integer): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_scale';

function gsl_spmatrix_int_scale_columns(m: Pgsl_spmatrix_int; x: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_scale_columns';

function gsl_spmatrix_int_scale_rows(m: Pgsl_spmatrix_int; x: Pgsl_vector_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_scale_rows';

function gsl_spmatrix_int_add(c: Pgsl_spmatrix_int; a: Pgsl_spmatrix_int; b: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_add';

function gsl_spmatrix_int_add_to_dense(a: Pgsl_matrix_int; b: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_add_to_dense';

function gsl_spmatrix_int_d2sp(T: Pgsl_spmatrix_int; A: Pgsl_matrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_d2sp';

function gsl_spmatrix_int_sp2d(A: Pgsl_matrix_int; S: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_sp2d';

function gsl_spmatrix_int_equal(a: Pgsl_spmatrix_int; b: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_equal';

function gsl_spmatrix_int_transpose(m: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_transpose';

function gsl_spmatrix_int_transpose2(m: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_transpose2';

function gsl_spmatrix_int_transpose_memcpy(dest: Pgsl_spmatrix_int; src: Pgsl_spmatrix_int): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_int_transpose_memcpy';

function gsl_spmatrix_ushort_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_alloc';

function gsl_spmatrix_ushort_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_alloc_nzmax';

procedure gsl_spmatrix_ushort_free(m: Pgsl_spmatrix_ushort); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_free';

function gsl_spmatrix_ushort_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_realloc';

function gsl_spmatrix_ushort_nnz(m: Pgsl_spmatrix_ushort): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_nnz';

function gsl_spmatrix_ushort_type(m: Pgsl_spmatrix_ushort): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_type';

function gsl_spmatrix_ushort_set_zero(m: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_set_zero';

function gsl_spmatrix_ushort_tree_rebuild(m: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_tree_rebuild';

function gsl_spmatrix_ushort_csc(dest: Pgsl_spmatrix_ushort; src: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_csc';

function gsl_spmatrix_ushort_csr(dest: Pgsl_spmatrix_ushort; src: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_csr';

function gsl_spmatrix_ushort_compress(src: Pgsl_spmatrix_ushort; sptype: Integer): Pgsl_spmatrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_compress';

function gsl_spmatrix_ushort_compcol(src: Pgsl_spmatrix_ushort): Pgsl_spmatrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_compcol';

function gsl_spmatrix_ushort_ccs(src: Pgsl_spmatrix_ushort): Pgsl_spmatrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_ccs';

function gsl_spmatrix_ushort_crs(src: Pgsl_spmatrix_ushort): Pgsl_spmatrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_crs';

function gsl_spmatrix_ushort_memcpy(dest: Pgsl_spmatrix_ushort; src: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_memcpy';

function gsl_spmatrix_ushort_fprintf(stream: PPointer; m: Pgsl_spmatrix_ushort; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_fprintf';

function gsl_spmatrix_ushort_fscanf(stream: PPointer): Pgsl_spmatrix_ushort; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_fscanf';

function gsl_spmatrix_ushort_fwrite(stream: PPointer; m: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_fwrite';

function gsl_spmatrix_ushort_fread(stream: PPointer; m: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_fread';

function gsl_spmatrix_ushort_get(m: Pgsl_spmatrix_ushort; i: NativeUInt; j: NativeUInt): Word; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_get';

function gsl_spmatrix_ushort_set(m: Pgsl_spmatrix_ushort; i: NativeUInt; j: NativeUInt; x: Word): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_set';

function gsl_spmatrix_ushort_ptr(m: Pgsl_spmatrix_ushort; i: NativeUInt; j: NativeUInt): PWord; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_ptr';

function gsl_spmatrix_ushort_minmax(m: Pgsl_spmatrix_ushort; min_out: PWord; max_out: PWord): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_minmax';

function gsl_spmatrix_ushort_min_index(m: Pgsl_spmatrix_ushort; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_min_index';

function gsl_spmatrix_ushort_scale(m: Pgsl_spmatrix_ushort; x: Word): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_scale';

function gsl_spmatrix_ushort_scale_columns(m: Pgsl_spmatrix_ushort; x: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_scale_columns';

function gsl_spmatrix_ushort_scale_rows(m: Pgsl_spmatrix_ushort; x: Pgsl_vector_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_scale_rows';

function gsl_spmatrix_ushort_add(c: Pgsl_spmatrix_ushort; a: Pgsl_spmatrix_ushort; b: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_add';

function gsl_spmatrix_ushort_add_to_dense(a: Pgsl_matrix_ushort; b: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_add_to_dense';

function gsl_spmatrix_ushort_d2sp(T: Pgsl_spmatrix_ushort; A: Pgsl_matrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_d2sp';

function gsl_spmatrix_ushort_sp2d(A: Pgsl_matrix_ushort; S: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_sp2d';

function gsl_spmatrix_ushort_equal(a: Pgsl_spmatrix_ushort; b: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_equal';

function gsl_spmatrix_ushort_transpose(m: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_transpose';

function gsl_spmatrix_ushort_transpose2(m: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_transpose2';

function gsl_spmatrix_ushort_transpose_memcpy(dest: Pgsl_spmatrix_ushort; src: Pgsl_spmatrix_ushort): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_ushort_transpose_memcpy';

function gsl_spmatrix_short_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_alloc';

function gsl_spmatrix_short_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_alloc_nzmax';

procedure gsl_spmatrix_short_free(m: Pgsl_spmatrix_short); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_free';

function gsl_spmatrix_short_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_realloc';

function gsl_spmatrix_short_nnz(m: Pgsl_spmatrix_short): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_nnz';

function gsl_spmatrix_short_type(m: Pgsl_spmatrix_short): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_type';

function gsl_spmatrix_short_set_zero(m: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_set_zero';

function gsl_spmatrix_short_tree_rebuild(m: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_tree_rebuild';

function gsl_spmatrix_short_csc(dest: Pgsl_spmatrix_short; src: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_csc';

function gsl_spmatrix_short_csr(dest: Pgsl_spmatrix_short; src: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_csr';

function gsl_spmatrix_short_compress(src: Pgsl_spmatrix_short; sptype: Integer): Pgsl_spmatrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_compress';

function gsl_spmatrix_short_compcol(src: Pgsl_spmatrix_short): Pgsl_spmatrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_compcol';

function gsl_spmatrix_short_ccs(src: Pgsl_spmatrix_short): Pgsl_spmatrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_ccs';

function gsl_spmatrix_short_crs(src: Pgsl_spmatrix_short): Pgsl_spmatrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_crs';

function gsl_spmatrix_short_memcpy(dest: Pgsl_spmatrix_short; src: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_memcpy';

function gsl_spmatrix_short_fprintf(stream: PPointer; m: Pgsl_spmatrix_short; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_fprintf';

function gsl_spmatrix_short_fscanf(stream: PPointer): Pgsl_spmatrix_short; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_fscanf';

function gsl_spmatrix_short_fwrite(stream: PPointer; m: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_fwrite';

function gsl_spmatrix_short_fread(stream: PPointer; m: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_fread';

function gsl_spmatrix_short_get(m: Pgsl_spmatrix_short; i: NativeUInt; j: NativeUInt): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_get';

function gsl_spmatrix_short_set(m: Pgsl_spmatrix_short; i: NativeUInt; j: NativeUInt; x: Smallint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_set';

function gsl_spmatrix_short_ptr(m: Pgsl_spmatrix_short; i: NativeUInt; j: NativeUInt): PSmallint; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_ptr';

function gsl_spmatrix_short_minmax(m: Pgsl_spmatrix_short; min_out: PSmallint; max_out: PSmallint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_minmax';

function gsl_spmatrix_short_min_index(m: Pgsl_spmatrix_short; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_min_index';

function gsl_spmatrix_short_scale(m: Pgsl_spmatrix_short; x: Smallint): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_scale';

function gsl_spmatrix_short_scale_columns(m: Pgsl_spmatrix_short; x: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_scale_columns';

function gsl_spmatrix_short_scale_rows(m: Pgsl_spmatrix_short; x: Pgsl_vector_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_scale_rows';

function gsl_spmatrix_short_add(c: Pgsl_spmatrix_short; a: Pgsl_spmatrix_short; b: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_add';

function gsl_spmatrix_short_add_to_dense(a: Pgsl_matrix_short; b: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_add_to_dense';

function gsl_spmatrix_short_d2sp(T: Pgsl_spmatrix_short; A: Pgsl_matrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_d2sp';

function gsl_spmatrix_short_sp2d(A: Pgsl_matrix_short; S: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_sp2d';

function gsl_spmatrix_short_equal(a: Pgsl_spmatrix_short; b: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_equal';

function gsl_spmatrix_short_transpose(m: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_transpose';

function gsl_spmatrix_short_transpose2(m: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_transpose2';

function gsl_spmatrix_short_transpose_memcpy(dest: Pgsl_spmatrix_short; src: Pgsl_spmatrix_short): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_short_transpose_memcpy';

function gsl_spmatrix_uchar_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_alloc';

function gsl_spmatrix_uchar_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_alloc_nzmax';

procedure gsl_spmatrix_uchar_free(m: Pgsl_spmatrix_uchar); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_free';

function gsl_spmatrix_uchar_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_realloc';

function gsl_spmatrix_uchar_nnz(m: Pgsl_spmatrix_uchar): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_nnz';

function gsl_spmatrix_uchar_type(m: Pgsl_spmatrix_uchar): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_type';

function gsl_spmatrix_uchar_set_zero(m: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_set_zero';

function gsl_spmatrix_uchar_tree_rebuild(m: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_tree_rebuild';

function gsl_spmatrix_uchar_csc(dest: Pgsl_spmatrix_uchar; src: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_csc';

function gsl_spmatrix_uchar_csr(dest: Pgsl_spmatrix_uchar; src: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_csr';

function gsl_spmatrix_uchar_compress(src: Pgsl_spmatrix_uchar; sptype: Integer): Pgsl_spmatrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_compress';

function gsl_spmatrix_uchar_compcol(src: Pgsl_spmatrix_uchar): Pgsl_spmatrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_compcol';

function gsl_spmatrix_uchar_ccs(src: Pgsl_spmatrix_uchar): Pgsl_spmatrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_ccs';

function gsl_spmatrix_uchar_crs(src: Pgsl_spmatrix_uchar): Pgsl_spmatrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_crs';

function gsl_spmatrix_uchar_memcpy(dest: Pgsl_spmatrix_uchar; src: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_memcpy';

function gsl_spmatrix_uchar_fprintf(stream: PPointer; m: Pgsl_spmatrix_uchar; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_fprintf';

function gsl_spmatrix_uchar_fscanf(stream: PPointer): Pgsl_spmatrix_uchar; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_fscanf';

function gsl_spmatrix_uchar_fwrite(stream: PPointer; m: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_fwrite';

function gsl_spmatrix_uchar_fread(stream: PPointer; m: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_fread';

function gsl_spmatrix_uchar_get(m: Pgsl_spmatrix_uchar; i: NativeUInt; j: NativeUInt): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_get';

function gsl_spmatrix_uchar_set(m: Pgsl_spmatrix_uchar; i: NativeUInt; j: NativeUInt; x: Byte): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_set';

function gsl_spmatrix_uchar_ptr(m: Pgsl_spmatrix_uchar; i: NativeUInt; j: NativeUInt): PByte; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_ptr';

function gsl_spmatrix_uchar_minmax(m: Pgsl_spmatrix_uchar; min_out: PByte; max_out: PByte): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_minmax';

function gsl_spmatrix_uchar_min_index(m: Pgsl_spmatrix_uchar; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_min_index';

function gsl_spmatrix_uchar_scale(m: Pgsl_spmatrix_uchar; x: Byte): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_scale';

function gsl_spmatrix_uchar_scale_columns(m: Pgsl_spmatrix_uchar; x: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_scale_columns';

function gsl_spmatrix_uchar_scale_rows(m: Pgsl_spmatrix_uchar; x: Pgsl_vector_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_scale_rows';

function gsl_spmatrix_uchar_add(c: Pgsl_spmatrix_uchar; a: Pgsl_spmatrix_uchar; b: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_add';

function gsl_spmatrix_uchar_add_to_dense(a: Pgsl_matrix_uchar; b: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_add_to_dense';

function gsl_spmatrix_uchar_d2sp(T: Pgsl_spmatrix_uchar; A: Pgsl_matrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_d2sp';

function gsl_spmatrix_uchar_sp2d(A: Pgsl_matrix_uchar; S: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_sp2d';

function gsl_spmatrix_uchar_equal(a: Pgsl_spmatrix_uchar; b: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_equal';

function gsl_spmatrix_uchar_transpose(m: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_transpose';

function gsl_spmatrix_uchar_transpose2(m: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_transpose2';

function gsl_spmatrix_uchar_transpose_memcpy(dest: Pgsl_spmatrix_uchar; src: Pgsl_spmatrix_uchar): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_uchar_transpose_memcpy';

function gsl_spmatrix_char_alloc(n1: NativeUInt; n2: NativeUInt): Pgsl_spmatrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_alloc';

function gsl_spmatrix_char_alloc_nzmax(n1: NativeUInt; n2: NativeUInt; nzmax: NativeUInt; sptype: Integer): Pgsl_spmatrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_alloc_nzmax';

procedure gsl_spmatrix_char_free(m: Pgsl_spmatrix_char); cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_free';

function gsl_spmatrix_char_realloc(nzmax: NativeUInt; m: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_realloc';

function gsl_spmatrix_char_nnz(m: Pgsl_spmatrix_char): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_nnz';

function gsl_spmatrix_char_type(m: Pgsl_spmatrix_char): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_type';

function gsl_spmatrix_char_set_zero(m: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_set_zero';

function gsl_spmatrix_char_tree_rebuild(m: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_tree_rebuild';

function gsl_spmatrix_char_csc(dest: Pgsl_spmatrix_char; src: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_csc';

function gsl_spmatrix_char_csr(dest: Pgsl_spmatrix_char; src: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_csr';

function gsl_spmatrix_char_compress(src: Pgsl_spmatrix_char; sptype: Integer): Pgsl_spmatrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_compress';

function gsl_spmatrix_char_compcol(src: Pgsl_spmatrix_char): Pgsl_spmatrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_compcol';

function gsl_spmatrix_char_ccs(src: Pgsl_spmatrix_char): Pgsl_spmatrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_ccs';

function gsl_spmatrix_char_crs(src: Pgsl_spmatrix_char): Pgsl_spmatrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_crs';

function gsl_spmatrix_char_memcpy(dest: Pgsl_spmatrix_char; src: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_memcpy';

function gsl_spmatrix_char_fprintf(stream: PPointer; m: Pgsl_spmatrix_char; format: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_fprintf';

function gsl_spmatrix_char_fscanf(stream: PPointer): Pgsl_spmatrix_char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_fscanf';

function gsl_spmatrix_char_fwrite(stream: PPointer; m: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_fwrite';

function gsl_spmatrix_char_fread(stream: PPointer; m: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_fread';

function gsl_spmatrix_char_get(m: Pgsl_spmatrix_char; i: NativeUInt; j: NativeUInt): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_get';

function gsl_spmatrix_char_set(m: Pgsl_spmatrix_char; i: NativeUInt; j: NativeUInt; x: UTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_set';

function gsl_spmatrix_char_ptr(m: Pgsl_spmatrix_char; i: NativeUInt; j: NativeUInt): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_ptr';

function gsl_spmatrix_char_minmax(m: Pgsl_spmatrix_char; min_out: PUTF8Char; max_out: PUTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_minmax';

function gsl_spmatrix_char_min_index(m: Pgsl_spmatrix_char; imin_out: PNativeUInt; jmin_out: PNativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_min_index';

function gsl_spmatrix_char_scale(m: Pgsl_spmatrix_char; x: UTF8Char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_scale';

function gsl_spmatrix_char_scale_columns(m: Pgsl_spmatrix_char; x: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_scale_columns';

function gsl_spmatrix_char_scale_rows(m: Pgsl_spmatrix_char; x: Pgsl_vector_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_scale_rows';

function gsl_spmatrix_char_add(c: Pgsl_spmatrix_char; a: Pgsl_spmatrix_char; b: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_add';

function gsl_spmatrix_char_add_to_dense(a: Pgsl_matrix_char; b: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_add_to_dense';

function gsl_spmatrix_char_d2sp(T: Pgsl_spmatrix_char; A: Pgsl_matrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_d2sp';

function gsl_spmatrix_char_sp2d(A: Pgsl_matrix_char; S: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_sp2d';

function gsl_spmatrix_char_equal(a: Pgsl_spmatrix_char; b: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_equal';

function gsl_spmatrix_char_transpose(m: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_transpose';

function gsl_spmatrix_char_transpose2(m: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_transpose2';

function gsl_spmatrix_char_transpose_memcpy(dest: Pgsl_spmatrix_char; src: Pgsl_spmatrix_char): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spmatrix_char_transpose_memcpy';

function gsl_spblas_dgemv(TransA: CBLAS_TRANSPOSE_t; alpha: Double; A: Pgsl_spmatrix; x: Pgsl_vector; beta: Double; y: Pgsl_vector): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spblas_dgemv';

function gsl_spblas_dgemm(alpha: Double; A: Pgsl_spmatrix; B: Pgsl_spmatrix; C: Pgsl_spmatrix): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spblas_dgemm';

function gsl_spblas_scatter(A: Pgsl_spmatrix; j: NativeUInt; alpha: Double; w: PInteger; x: PDouble; mark: Integer; C: Pgsl_spmatrix; nz: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spblas_scatter';

function gsl_splinalg_itersolve_alloc(T: Pgsl_splinalg_itersolve_type; n: NativeUInt; m: NativeUInt): Pgsl_splinalg_itersolve; cdecl;
  external LIBGSL name _PU + 'gsl_splinalg_itersolve_alloc';

procedure gsl_splinalg_itersolve_free(w: Pgsl_splinalg_itersolve); cdecl;
  external LIBGSL name _PU + 'gsl_splinalg_itersolve_free';

function gsl_splinalg_itersolve_name(w: Pgsl_splinalg_itersolve): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_splinalg_itersolve_name';

function gsl_splinalg_itersolve_iterate(A: Pgsl_spmatrix; b: Pgsl_vector; tol: Double; x: Pgsl_vector; w: Pgsl_splinalg_itersolve): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_splinalg_itersolve_iterate';

function gsl_splinalg_itersolve_normr(w: Pgsl_splinalg_itersolve): Double; cdecl;
  external LIBGSL name _PU + 'gsl_splinalg_itersolve_normr';

function gsl_spline_alloc(T: Pgsl_interp_type; size: NativeUInt): Pgsl_spline; cdecl;
  external LIBGSL name _PU + 'gsl_spline_alloc';

function gsl_spline_init(spline: Pgsl_spline; xa: PDouble; ya: PDouble; size: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline_init';

function gsl_spline_name(spline: Pgsl_spline): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spline_name';

function gsl_spline_min_size(spline: Pgsl_spline): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_spline_min_size';

function gsl_spline_eval_e(spline: Pgsl_spline; x: Double; a: Pgsl_interp_accel; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline_eval_e';

function gsl_spline_eval(spline: Pgsl_spline; x: Double; a: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline_eval';

function gsl_spline_eval_deriv_e(spline: Pgsl_spline; x: Double; a: Pgsl_interp_accel; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline_eval_deriv_e';

function gsl_spline_eval_deriv(spline: Pgsl_spline; x: Double; a: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline_eval_deriv';

function gsl_spline_eval_deriv2_e(spline: Pgsl_spline; x: Double; a: Pgsl_interp_accel; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline_eval_deriv2_e';

function gsl_spline_eval_deriv2(spline: Pgsl_spline; x: Double; a: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline_eval_deriv2';

function gsl_spline_eval_integ_e(spline: Pgsl_spline; a: Double; b: Double; acc: Pgsl_interp_accel; y: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline_eval_integ_e';

function gsl_spline_eval_integ(spline: Pgsl_spline; a: Double; b: Double; acc: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline_eval_integ';

procedure gsl_spline_free(spline: Pgsl_spline); cdecl;
  external LIBGSL name _PU + 'gsl_spline_free';

function gsl_spline2d_alloc(T: Pgsl_interp2d_type; xsize: NativeUInt; ysize: NativeUInt): Pgsl_spline2d; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_alloc';

function gsl_spline2d_init(interp: Pgsl_spline2d; xa: PDouble; ya: PDouble; za: PDouble; xsize: NativeUInt; ysize: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_init';

procedure gsl_spline2d_free(interp: Pgsl_spline2d); cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_free';

function gsl_spline2d_eval(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval';

function gsl_spline2d_eval_e(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_e';

function gsl_spline2d_eval_deriv_x(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_x';

function gsl_spline2d_eval_deriv_x_e(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_x_e';

function gsl_spline2d_eval_deriv_y(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_y';

function gsl_spline2d_eval_deriv_y_e(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_y_e';

function gsl_spline2d_eval_deriv_xx(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_xx';

function gsl_spline2d_eval_deriv_xx_e(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_xx_e';

function gsl_spline2d_eval_deriv_yy(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_yy';

function gsl_spline2d_eval_deriv_yy_e(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_yy_e';

function gsl_spline2d_eval_deriv_xy(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_xy';

function gsl_spline2d_eval_deriv_xy_e(interp: Pgsl_spline2d; x: Double; y: Double; xa: Pgsl_interp_accel; ya: Pgsl_interp_accel; z: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_eval_deriv_xy_e';

function gsl_spline2d_min_size(interp: Pgsl_spline2d): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_min_size';

function gsl_spline2d_name(interp: Pgsl_spline2d): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_name';

function gsl_spline2d_set(interp: Pgsl_spline2d; zarr: PDouble; i: NativeUInt; j: NativeUInt; z: Double): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_set';

function gsl_spline2d_get(interp: Pgsl_spline2d; zarr: PDouble; i: NativeUInt; j: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_spline2d_get';

function gsl_stats_long_double_mean(data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_mean';

function gsl_stats_long_double_variance(data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_variance';

function gsl_stats_long_double_sd(data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_sd';

function gsl_stats_long_double_variance_with_fixed_mean(data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_variance_with_fixed_mean';

function gsl_stats_long_double_sd_with_fixed_mean(data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_sd_with_fixed_mean';

function gsl_stats_long_double_tss(data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_tss';

function gsl_stats_long_double_tss_m(data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_tss_m';

function gsl_stats_long_double_absdev(data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_absdev';

function gsl_stats_long_double_skew(data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_skew';

function gsl_stats_long_double_kurtosis(data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_kurtosis';

function gsl_stats_long_double_lag1_autocorrelation(data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_lag1_autocorrelation';

function gsl_stats_long_double_covariance(data1: PExtended; stride1: NativeUInt; data2: PExtended; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_covariance';

function gsl_stats_long_double_correlation(data1: PExtended; stride1: NativeUInt; data2: PExtended; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_correlation';

function gsl_stats_long_double_spearman(data1: PExtended; stride1: NativeUInt; data2: PExtended; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_spearman';

function gsl_stats_long_double_variance_m(data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_variance_m';

function gsl_stats_long_double_sd_m(data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_sd_m';

function gsl_stats_long_double_absdev_m(data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_absdev_m';

function gsl_stats_long_double_skew_m_sd(data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_skew_m_sd';

function gsl_stats_long_double_kurtosis_m_sd(data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_kurtosis_m_sd';

function gsl_stats_long_double_lag1_autocorrelation_m(data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_lag1_autocorrelation_m';

function gsl_stats_long_double_covariance_m(data1: PExtended; stride1: NativeUInt; data2: PExtended; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_covariance_m';

function gsl_stats_long_double_wmean(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wmean';

function gsl_stats_long_double_wvariance(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wvariance';

function gsl_stats_long_double_wsd(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wsd';

function gsl_stats_long_double_wvariance_with_fixed_mean(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wvariance_with_fixed_mean';

function gsl_stats_long_double_wsd_with_fixed_mean(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wsd_with_fixed_mean';

function gsl_stats_long_double_wtss(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wtss';

function gsl_stats_long_double_wtss_m(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wtss_m';

function gsl_stats_long_double_wabsdev(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wabsdev';

function gsl_stats_long_double_wskew(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wskew';

function gsl_stats_long_double_wkurtosis(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wkurtosis';

function gsl_stats_long_double_wvariance_m(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wvariance_m';

function gsl_stats_long_double_wsd_m(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wsd_m';

function gsl_stats_long_double_wabsdev_m(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wabsdev_m';

function gsl_stats_long_double_wskew_m_sd(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt; wmean: Double; wsd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wskew_m_sd';

function gsl_stats_long_double_wkurtosis_m_sd(w: PExtended; wstride: NativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt; wmean: Double; wsd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_wkurtosis_m_sd';

function gsl_stats_long_double_pvariance(data1: PExtended; stride1: NativeUInt; n1: NativeUInt; data2: PExtended; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_pvariance';

function gsl_stats_long_double_ttest(data1: PExtended; stride1: NativeUInt; n1: NativeUInt; data2: PExtended; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_ttest';

function gsl_stats_long_double_max(data: PExtended; stride: NativeUInt; n: NativeUInt): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_max';

function gsl_stats_long_double_min(data: PExtended; stride: NativeUInt; n: NativeUInt): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_min';

procedure gsl_stats_long_double_minmax(min: PExtended; max: PExtended; data: PExtended; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_minmax';

function gsl_stats_long_double_max_index(data: PExtended; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_max_index';

function gsl_stats_long_double_min_index(data: PExtended; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_min_index';

procedure gsl_stats_long_double_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PExtended; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_minmax_index';

function gsl_stats_long_double_select(data: PExtended; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_select';

function gsl_stats_long_double_median_from_sorted_data(sorted_data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_median_from_sorted_data';

function gsl_stats_long_double_median(sorted_data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_median';

function gsl_stats_long_double_quantile_from_sorted_data(sorted_data: PExtended; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_quantile_from_sorted_data';

function gsl_stats_long_double_trmean_from_sorted_data(trim: Double; sorted_data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_trmean_from_sorted_data';

function gsl_stats_long_double_gastwirth_from_sorted_data(sorted_data: PExtended; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_gastwirth_from_sorted_data';

function gsl_stats_long_double_mad0(data: PExtended; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_mad0';

function gsl_stats_long_double_mad(data: PExtended; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_mad';

function gsl_stats_long_double_Sn0_from_sorted_data(sorted_data: PExtended; stride: NativeUInt; n: NativeUInt; work: PExtended): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_Sn0_from_sorted_data';

function gsl_stats_long_double_Sn_from_sorted_data(sorted_data: PExtended; stride: NativeUInt; n: NativeUInt; work: PExtended): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_Sn_from_sorted_data';

function gsl_stats_long_double_Qn0_from_sorted_data(sorted_data: PExtended; stride: NativeUInt; n: NativeUInt; work: PExtended; work_int: PInteger): Extended; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_Qn0_from_sorted_data';

function gsl_stats_long_double_Qn_from_sorted_data(sorted_data: PExtended; stride: NativeUInt; n: NativeUInt; work: PExtended; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_double_Qn_from_sorted_data';

function gsl_stats_mean(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_mean';

function gsl_stats_variance(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_variance';

function gsl_stats_sd(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_sd';

function gsl_stats_variance_with_fixed_mean(data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_variance_with_fixed_mean';

function gsl_stats_sd_with_fixed_mean(data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_sd_with_fixed_mean';

function gsl_stats_tss(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_tss';

function gsl_stats_tss_m(data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_tss_m';

function gsl_stats_absdev(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_absdev';

function gsl_stats_skew(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_skew';

function gsl_stats_kurtosis(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_kurtosis';

function gsl_stats_lag1_autocorrelation(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_lag1_autocorrelation';

function gsl_stats_covariance(data1: PDouble; stride1: NativeUInt; data2: PDouble; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_covariance';

function gsl_stats_correlation(data1: PDouble; stride1: NativeUInt; data2: PDouble; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_correlation';

function gsl_stats_spearman(data1: PDouble; stride1: NativeUInt; data2: PDouble; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_spearman';

function gsl_stats_variance_m(data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_variance_m';

function gsl_stats_sd_m(data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_sd_m';

function gsl_stats_absdev_m(data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_absdev_m';

function gsl_stats_skew_m_sd(data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_skew_m_sd';

function gsl_stats_kurtosis_m_sd(data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_kurtosis_m_sd';

function gsl_stats_lag1_autocorrelation_m(data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_lag1_autocorrelation_m';

function gsl_stats_covariance_m(data1: PDouble; stride1: NativeUInt; data2: PDouble; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_covariance_m';

function gsl_stats_wmean(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wmean';

function gsl_stats_wvariance(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wvariance';

function gsl_stats_wsd(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wsd';

function gsl_stats_wvariance_with_fixed_mean(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wvariance_with_fixed_mean';

function gsl_stats_wsd_with_fixed_mean(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wsd_with_fixed_mean';

function gsl_stats_wtss(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wtss';

function gsl_stats_wtss_m(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wtss_m';

function gsl_stats_wabsdev(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wabsdev';

function gsl_stats_wskew(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wskew';

function gsl_stats_wkurtosis(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wkurtosis';

function gsl_stats_wvariance_m(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wvariance_m';

function gsl_stats_wsd_m(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wsd_m';

function gsl_stats_wabsdev_m(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wabsdev_m';

function gsl_stats_wskew_m_sd(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt; wmean: Double; wsd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wskew_m_sd';

function gsl_stats_wkurtosis_m_sd(w: PDouble; wstride: NativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt; wmean: Double; wsd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_wkurtosis_m_sd';

function gsl_stats_pvariance(data1: PDouble; stride1: NativeUInt; n1: NativeUInt; data2: PDouble; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_pvariance';

function gsl_stats_ttest(data1: PDouble; stride1: NativeUInt; n1: NativeUInt; data2: PDouble; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ttest';

function gsl_stats_max(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_max';

function gsl_stats_min(data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_min';

procedure gsl_stats_minmax(min: PDouble; max: PDouble; data: PDouble; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_minmax';

function gsl_stats_max_index(data: PDouble; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_max_index';

function gsl_stats_min_index(data: PDouble; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_min_index';

procedure gsl_stats_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PDouble; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_minmax_index';

function gsl_stats_select(data: PDouble; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_select';

function gsl_stats_median_from_sorted_data(sorted_data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_median_from_sorted_data';

function gsl_stats_median(sorted_data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_median';

function gsl_stats_quantile_from_sorted_data(sorted_data: PDouble; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_quantile_from_sorted_data';

function gsl_stats_trmean_from_sorted_data(trim: Double; sorted_data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_trmean_from_sorted_data';

function gsl_stats_gastwirth_from_sorted_data(sorted_data: PDouble; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_gastwirth_from_sorted_data';

function gsl_stats_mad0(data: PDouble; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_mad0';

function gsl_stats_mad(data: PDouble; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_mad';

function gsl_stats_Sn0_from_sorted_data(sorted_data: PDouble; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_Sn0_from_sorted_data';

function gsl_stats_Sn_from_sorted_data(sorted_data: PDouble; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_Sn_from_sorted_data';

function gsl_stats_Qn0_from_sorted_data(sorted_data: PDouble; stride: NativeUInt; n: NativeUInt; work: PDouble; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_Qn0_from_sorted_data';

function gsl_stats_Qn_from_sorted_data(sorted_data: PDouble; stride: NativeUInt; n: NativeUInt; work: PDouble; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_Qn_from_sorted_data';

function gsl_stats_float_mean(data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_mean';

function gsl_stats_float_variance(data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_variance';

function gsl_stats_float_sd(data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_sd';

function gsl_stats_float_variance_with_fixed_mean(data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_variance_with_fixed_mean';

function gsl_stats_float_sd_with_fixed_mean(data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_sd_with_fixed_mean';

function gsl_stats_float_tss(data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_tss';

function gsl_stats_float_tss_m(data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_tss_m';

function gsl_stats_float_absdev(data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_absdev';

function gsl_stats_float_skew(data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_skew';

function gsl_stats_float_kurtosis(data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_kurtosis';

function gsl_stats_float_lag1_autocorrelation(data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_lag1_autocorrelation';

function gsl_stats_float_covariance(data1: PSingle; stride1: NativeUInt; data2: PSingle; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_covariance';

function gsl_stats_float_correlation(data1: PSingle; stride1: NativeUInt; data2: PSingle; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_correlation';

function gsl_stats_float_spearman(data1: PSingle; stride1: NativeUInt; data2: PSingle; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_spearman';

function gsl_stats_float_variance_m(data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_variance_m';

function gsl_stats_float_sd_m(data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_sd_m';

function gsl_stats_float_absdev_m(data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_absdev_m';

function gsl_stats_float_skew_m_sd(data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_skew_m_sd';

function gsl_stats_float_kurtosis_m_sd(data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_kurtosis_m_sd';

function gsl_stats_float_lag1_autocorrelation_m(data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_lag1_autocorrelation_m';

function gsl_stats_float_covariance_m(data1: PSingle; stride1: NativeUInt; data2: PSingle; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_covariance_m';

function gsl_stats_float_wmean(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wmean';

function gsl_stats_float_wvariance(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wvariance';

function gsl_stats_float_wsd(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wsd';

function gsl_stats_float_wvariance_with_fixed_mean(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wvariance_with_fixed_mean';

function gsl_stats_float_wsd_with_fixed_mean(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wsd_with_fixed_mean';

function gsl_stats_float_wtss(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wtss';

function gsl_stats_float_wtss_m(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wtss_m';

function gsl_stats_float_wabsdev(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wabsdev';

function gsl_stats_float_wskew(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wskew';

function gsl_stats_float_wkurtosis(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wkurtosis';

function gsl_stats_float_wvariance_m(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wvariance_m';

function gsl_stats_float_wsd_m(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wsd_m';

function gsl_stats_float_wabsdev_m(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt; wmean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wabsdev_m';

function gsl_stats_float_wskew_m_sd(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt; wmean: Double; wsd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wskew_m_sd';

function gsl_stats_float_wkurtosis_m_sd(w: PSingle; wstride: NativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt; wmean: Double; wsd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_wkurtosis_m_sd';

function gsl_stats_float_pvariance(data1: PSingle; stride1: NativeUInt; n1: NativeUInt; data2: PSingle; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_pvariance';

function gsl_stats_float_ttest(data1: PSingle; stride1: NativeUInt; n1: NativeUInt; data2: PSingle; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_ttest';

function gsl_stats_float_max(data: PSingle; stride: NativeUInt; n: NativeUInt): Single; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_max';

function gsl_stats_float_min(data: PSingle; stride: NativeUInt; n: NativeUInt): Single; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_min';

procedure gsl_stats_float_minmax(min: PSingle; max: PSingle; data: PSingle; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_minmax';

function gsl_stats_float_max_index(data: PSingle; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_max_index';

function gsl_stats_float_min_index(data: PSingle; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_min_index';

procedure gsl_stats_float_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PSingle; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_minmax_index';

function gsl_stats_float_select(data: PSingle; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Single; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_select';

function gsl_stats_float_median_from_sorted_data(sorted_data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_median_from_sorted_data';

function gsl_stats_float_median(sorted_data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_median';

function gsl_stats_float_quantile_from_sorted_data(sorted_data: PSingle; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_quantile_from_sorted_data';

function gsl_stats_float_trmean_from_sorted_data(trim: Double; sorted_data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_trmean_from_sorted_data';

function gsl_stats_float_gastwirth_from_sorted_data(sorted_data: PSingle; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_gastwirth_from_sorted_data';

function gsl_stats_float_mad0(data: PSingle; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_mad0';

function gsl_stats_float_mad(data: PSingle; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_mad';

function gsl_stats_float_Sn0_from_sorted_data(sorted_data: PSingle; stride: NativeUInt; n: NativeUInt; work: PSingle): Single; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_Sn0_from_sorted_data';

function gsl_stats_float_Sn_from_sorted_data(sorted_data: PSingle; stride: NativeUInt; n: NativeUInt; work: PSingle): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_Sn_from_sorted_data';

function gsl_stats_float_Qn0_from_sorted_data(sorted_data: PSingle; stride: NativeUInt; n: NativeUInt; work: PSingle; work_int: PInteger): Single; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_Qn0_from_sorted_data';

function gsl_stats_float_Qn_from_sorted_data(sorted_data: PSingle; stride: NativeUInt; n: NativeUInt; work: PSingle; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_float_Qn_from_sorted_data';

function gsl_stats_ulong_mean(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_mean';

function gsl_stats_ulong_variance(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_variance';

function gsl_stats_ulong_sd(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_sd';

function gsl_stats_ulong_variance_with_fixed_mean(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_variance_with_fixed_mean';

function gsl_stats_ulong_sd_with_fixed_mean(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_sd_with_fixed_mean';

function gsl_stats_ulong_tss(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_tss';

function gsl_stats_ulong_tss_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_tss_m';

function gsl_stats_ulong_absdev(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_absdev';

function gsl_stats_ulong_skew(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_skew';

function gsl_stats_ulong_kurtosis(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_kurtosis';

function gsl_stats_ulong_lag1_autocorrelation(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_lag1_autocorrelation';

function gsl_stats_ulong_covariance(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_covariance';

function gsl_stats_ulong_correlation(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_correlation';

function gsl_stats_ulong_spearman(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_spearman';

function gsl_stats_ulong_variance_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_variance_m';

function gsl_stats_ulong_sd_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_sd_m';

function gsl_stats_ulong_absdev_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_absdev_m';

function gsl_stats_ulong_skew_m_sd(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_skew_m_sd';

function gsl_stats_ulong_kurtosis_m_sd(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_kurtosis_m_sd';

function gsl_stats_ulong_lag1_autocorrelation_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_lag1_autocorrelation_m';

function gsl_stats_ulong_covariance_m(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_covariance_m';

function gsl_stats_ulong_pvariance(data1: PCardinal; stride1: NativeUInt; n1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_pvariance';

function gsl_stats_ulong_ttest(data1: PCardinal; stride1: NativeUInt; n1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_ttest';

function gsl_stats_ulong_max(data: PCardinal; stride: NativeUInt; n: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_max';

function gsl_stats_ulong_min(data: PCardinal; stride: NativeUInt; n: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_min';

procedure gsl_stats_ulong_minmax(min: PCardinal; max: PCardinal; data: PCardinal; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_minmax';

function gsl_stats_ulong_max_index(data: PCardinal; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_max_index';

function gsl_stats_ulong_min_index(data: PCardinal; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_min_index';

procedure gsl_stats_ulong_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PCardinal; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_minmax_index';

function gsl_stats_ulong_select(data: PCardinal; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_select';

function gsl_stats_ulong_median_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_median_from_sorted_data';

function gsl_stats_ulong_median(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_median';

function gsl_stats_ulong_quantile_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_quantile_from_sorted_data';

function gsl_stats_ulong_trmean_from_sorted_data(trim: Double; sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_trmean_from_sorted_data';

function gsl_stats_ulong_gastwirth_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_gastwirth_from_sorted_data';

function gsl_stats_ulong_mad0(data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_mad0';

function gsl_stats_ulong_mad(data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_mad';

function gsl_stats_ulong_Sn0_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PCardinal): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_Sn0_from_sorted_data';

function gsl_stats_ulong_Sn_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PCardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_Sn_from_sorted_data';

function gsl_stats_ulong_Qn0_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PCardinal; work_int: PInteger): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_Qn0_from_sorted_data';

function gsl_stats_ulong_Qn_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PCardinal; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ulong_Qn_from_sorted_data';

function gsl_stats_long_mean(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_mean';

function gsl_stats_long_variance(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_variance';

function gsl_stats_long_sd(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_sd';

function gsl_stats_long_variance_with_fixed_mean(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_variance_with_fixed_mean';

function gsl_stats_long_sd_with_fixed_mean(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_sd_with_fixed_mean';

function gsl_stats_long_tss(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_tss';

function gsl_stats_long_tss_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_tss_m';

function gsl_stats_long_absdev(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_absdev';

function gsl_stats_long_skew(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_skew';

function gsl_stats_long_kurtosis(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_kurtosis';

function gsl_stats_long_lag1_autocorrelation(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_lag1_autocorrelation';

function gsl_stats_long_covariance(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_covariance';

function gsl_stats_long_correlation(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_correlation';

function gsl_stats_long_spearman(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_spearman';

function gsl_stats_long_variance_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_variance_m';

function gsl_stats_long_sd_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_sd_m';

function gsl_stats_long_absdev_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_absdev_m';

function gsl_stats_long_skew_m_sd(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_skew_m_sd';

function gsl_stats_long_kurtosis_m_sd(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_kurtosis_m_sd';

function gsl_stats_long_lag1_autocorrelation_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_lag1_autocorrelation_m';

function gsl_stats_long_covariance_m(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_covariance_m';

function gsl_stats_long_pvariance(data1: PInteger; stride1: NativeUInt; n1: NativeUInt; data2: PInteger; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_pvariance';

function gsl_stats_long_ttest(data1: PInteger; stride1: NativeUInt; n1: NativeUInt; data2: PInteger; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_ttest';

function gsl_stats_long_max(data: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_max';

function gsl_stats_long_min(data: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_min';

procedure gsl_stats_long_minmax(min: PInteger; max: PInteger; data: PInteger; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_minmax';

function gsl_stats_long_max_index(data: PInteger; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_max_index';

function gsl_stats_long_min_index(data: PInteger; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_min_index';

procedure gsl_stats_long_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PInteger; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_minmax_index';

function gsl_stats_long_select(data: PInteger; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_select';

function gsl_stats_long_median_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_median_from_sorted_data';

function gsl_stats_long_median(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_median';

function gsl_stats_long_quantile_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_quantile_from_sorted_data';

function gsl_stats_long_trmean_from_sorted_data(trim: Double; sorted_data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_trmean_from_sorted_data';

function gsl_stats_long_gastwirth_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_gastwirth_from_sorted_data';

function gsl_stats_long_mad0(data: PInteger; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_mad0';

function gsl_stats_long_mad(data: PInteger; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_mad';

function gsl_stats_long_Sn0_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; work: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_Sn0_from_sorted_data';

function gsl_stats_long_Sn_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; work: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_Sn_from_sorted_data';

function gsl_stats_long_Qn0_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; work: PInteger; work_int: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_Qn0_from_sorted_data';

function gsl_stats_long_Qn_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; work: PInteger; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_long_Qn_from_sorted_data';

function gsl_stats_uint_mean(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_mean';

function gsl_stats_uint_variance(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_variance';

function gsl_stats_uint_sd(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_sd';

function gsl_stats_uint_variance_with_fixed_mean(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_variance_with_fixed_mean';

function gsl_stats_uint_sd_with_fixed_mean(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_sd_with_fixed_mean';

function gsl_stats_uint_tss(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_tss';

function gsl_stats_uint_tss_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_tss_m';

function gsl_stats_uint_absdev(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_absdev';

function gsl_stats_uint_skew(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_skew';

function gsl_stats_uint_kurtosis(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_kurtosis';

function gsl_stats_uint_lag1_autocorrelation(data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_lag1_autocorrelation';

function gsl_stats_uint_covariance(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_covariance';

function gsl_stats_uint_correlation(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_correlation';

function gsl_stats_uint_spearman(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_spearman';

function gsl_stats_uint_variance_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_variance_m';

function gsl_stats_uint_sd_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_sd_m';

function gsl_stats_uint_absdev_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_absdev_m';

function gsl_stats_uint_skew_m_sd(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_skew_m_sd';

function gsl_stats_uint_kurtosis_m_sd(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_kurtosis_m_sd';

function gsl_stats_uint_lag1_autocorrelation_m(data: PCardinal; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_lag1_autocorrelation_m';

function gsl_stats_uint_covariance_m(data1: PCardinal; stride1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_covariance_m';

function gsl_stats_uint_pvariance(data1: PCardinal; stride1: NativeUInt; n1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_pvariance';

function gsl_stats_uint_ttest(data1: PCardinal; stride1: NativeUInt; n1: NativeUInt; data2: PCardinal; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_ttest';

function gsl_stats_uint_max(data: PCardinal; stride: NativeUInt; n: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_max';

function gsl_stats_uint_min(data: PCardinal; stride: NativeUInt; n: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_min';

procedure gsl_stats_uint_minmax(min: PCardinal; max: PCardinal; data: PCardinal; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_minmax';

function gsl_stats_uint_max_index(data: PCardinal; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_max_index';

function gsl_stats_uint_min_index(data: PCardinal; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_min_index';

procedure gsl_stats_uint_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PCardinal; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_minmax_index';

function gsl_stats_uint_select(data: PCardinal; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_select';

function gsl_stats_uint_median_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_median_from_sorted_data';

function gsl_stats_uint_median(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_median';

function gsl_stats_uint_quantile_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_quantile_from_sorted_data';

function gsl_stats_uint_trmean_from_sorted_data(trim: Double; sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_trmean_from_sorted_data';

function gsl_stats_uint_gastwirth_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_gastwirth_from_sorted_data';

function gsl_stats_uint_mad0(data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_mad0';

function gsl_stats_uint_mad(data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_mad';

function gsl_stats_uint_Sn0_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PCardinal): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_Sn0_from_sorted_data';

function gsl_stats_uint_Sn_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PCardinal): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_Sn_from_sorted_data';

function gsl_stats_uint_Qn0_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PCardinal; work_int: PInteger): Cardinal; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_Qn0_from_sorted_data';

function gsl_stats_uint_Qn_from_sorted_data(sorted_data: PCardinal; stride: NativeUInt; n: NativeUInt; work: PCardinal; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uint_Qn_from_sorted_data';

function gsl_stats_int_mean(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_mean';

function gsl_stats_int_variance(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_variance';

function gsl_stats_int_sd(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_sd';

function gsl_stats_int_variance_with_fixed_mean(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_variance_with_fixed_mean';

function gsl_stats_int_sd_with_fixed_mean(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_sd_with_fixed_mean';

function gsl_stats_int_tss(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_tss';

function gsl_stats_int_tss_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_tss_m';

function gsl_stats_int_absdev(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_absdev';

function gsl_stats_int_skew(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_skew';

function gsl_stats_int_kurtosis(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_kurtosis';

function gsl_stats_int_lag1_autocorrelation(data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_lag1_autocorrelation';

function gsl_stats_int_covariance(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_covariance';

function gsl_stats_int_correlation(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_correlation';

function gsl_stats_int_spearman(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_spearman';

function gsl_stats_int_variance_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_variance_m';

function gsl_stats_int_sd_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_sd_m';

function gsl_stats_int_absdev_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_absdev_m';

function gsl_stats_int_skew_m_sd(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_skew_m_sd';

function gsl_stats_int_kurtosis_m_sd(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_kurtosis_m_sd';

function gsl_stats_int_lag1_autocorrelation_m(data: PInteger; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_lag1_autocorrelation_m';

function gsl_stats_int_covariance_m(data1: PInteger; stride1: NativeUInt; data2: PInteger; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_covariance_m';

function gsl_stats_int_pvariance(data1: PInteger; stride1: NativeUInt; n1: NativeUInt; data2: PInteger; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_pvariance';

function gsl_stats_int_ttest(data1: PInteger; stride1: NativeUInt; n1: NativeUInt; data2: PInteger; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_ttest';

function gsl_stats_int_max(data: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_max';

function gsl_stats_int_min(data: PInteger; stride: NativeUInt; n: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_min';

procedure gsl_stats_int_minmax(min: PInteger; max: PInteger; data: PInteger; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_minmax';

function gsl_stats_int_max_index(data: PInteger; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_max_index';

function gsl_stats_int_min_index(data: PInteger; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_min_index';

procedure gsl_stats_int_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PInteger; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_minmax_index';

function gsl_stats_int_select(data: PInteger; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_select';

function gsl_stats_int_median_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_median_from_sorted_data';

function gsl_stats_int_median(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_median';

function gsl_stats_int_quantile_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_quantile_from_sorted_data';

function gsl_stats_int_trmean_from_sorted_data(trim: Double; sorted_data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_trmean_from_sorted_data';

function gsl_stats_int_gastwirth_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_gastwirth_from_sorted_data';

function gsl_stats_int_mad0(data: PInteger; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_mad0';

function gsl_stats_int_mad(data: PInteger; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_mad';

function gsl_stats_int_Sn0_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; work: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_Sn0_from_sorted_data';

function gsl_stats_int_Sn_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; work: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_Sn_from_sorted_data';

function gsl_stats_int_Qn0_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; work: PInteger; work_int: PInteger): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_Qn0_from_sorted_data';

function gsl_stats_int_Qn_from_sorted_data(sorted_data: PInteger; stride: NativeUInt; n: NativeUInt; work: PInteger; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_int_Qn_from_sorted_data';

function gsl_stats_ushort_mean(data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_mean';

function gsl_stats_ushort_variance(data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_variance';

function gsl_stats_ushort_sd(data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_sd';

function gsl_stats_ushort_variance_with_fixed_mean(data: PWord; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_variance_with_fixed_mean';

function gsl_stats_ushort_sd_with_fixed_mean(data: PWord; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_sd_with_fixed_mean';

function gsl_stats_ushort_tss(data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_tss';

function gsl_stats_ushort_tss_m(data: PWord; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_tss_m';

function gsl_stats_ushort_absdev(data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_absdev';

function gsl_stats_ushort_skew(data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_skew';

function gsl_stats_ushort_kurtosis(data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_kurtosis';

function gsl_stats_ushort_lag1_autocorrelation(data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_lag1_autocorrelation';

function gsl_stats_ushort_covariance(data1: PWord; stride1: NativeUInt; data2: PWord; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_covariance';

function gsl_stats_ushort_correlation(data1: PWord; stride1: NativeUInt; data2: PWord; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_correlation';

function gsl_stats_ushort_spearman(data1: PWord; stride1: NativeUInt; data2: PWord; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_spearman';

function gsl_stats_ushort_variance_m(data: PWord; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_variance_m';

function gsl_stats_ushort_sd_m(data: PWord; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_sd_m';

function gsl_stats_ushort_absdev_m(data: PWord; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_absdev_m';

function gsl_stats_ushort_skew_m_sd(data: PWord; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_skew_m_sd';

function gsl_stats_ushort_kurtosis_m_sd(data: PWord; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_kurtosis_m_sd';

function gsl_stats_ushort_lag1_autocorrelation_m(data: PWord; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_lag1_autocorrelation_m';

function gsl_stats_ushort_covariance_m(data1: PWord; stride1: NativeUInt; data2: PWord; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_covariance_m';

function gsl_stats_ushort_pvariance(data1: PWord; stride1: NativeUInt; n1: NativeUInt; data2: PWord; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_pvariance';

function gsl_stats_ushort_ttest(data1: PWord; stride1: NativeUInt; n1: NativeUInt; data2: PWord; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_ttest';

function gsl_stats_ushort_max(data: PWord; stride: NativeUInt; n: NativeUInt): Word; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_max';

function gsl_stats_ushort_min(data: PWord; stride: NativeUInt; n: NativeUInt): Word; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_min';

procedure gsl_stats_ushort_minmax(min: PWord; max: PWord; data: PWord; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_minmax';

function gsl_stats_ushort_max_index(data: PWord; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_max_index';

function gsl_stats_ushort_min_index(data: PWord; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_min_index';

procedure gsl_stats_ushort_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PWord; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_minmax_index';

function gsl_stats_ushort_select(data: PWord; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Word; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_select';

function gsl_stats_ushort_median_from_sorted_data(sorted_data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_median_from_sorted_data';

function gsl_stats_ushort_median(sorted_data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_median';

function gsl_stats_ushort_quantile_from_sorted_data(sorted_data: PWord; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_quantile_from_sorted_data';

function gsl_stats_ushort_trmean_from_sorted_data(trim: Double; sorted_data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_trmean_from_sorted_data';

function gsl_stats_ushort_gastwirth_from_sorted_data(sorted_data: PWord; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_gastwirth_from_sorted_data';

function gsl_stats_ushort_mad0(data: PWord; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_mad0';

function gsl_stats_ushort_mad(data: PWord; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_mad';

function gsl_stats_ushort_Sn0_from_sorted_data(sorted_data: PWord; stride: NativeUInt; n: NativeUInt; work: PWord): Word; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_Sn0_from_sorted_data';

function gsl_stats_ushort_Sn_from_sorted_data(sorted_data: PWord; stride: NativeUInt; n: NativeUInt; work: PWord): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_Sn_from_sorted_data';

function gsl_stats_ushort_Qn0_from_sorted_data(sorted_data: PWord; stride: NativeUInt; n: NativeUInt; work: PWord; work_int: PInteger): Word; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_Qn0_from_sorted_data';

function gsl_stats_ushort_Qn_from_sorted_data(sorted_data: PWord; stride: NativeUInt; n: NativeUInt; work: PWord; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_ushort_Qn_from_sorted_data';

function gsl_stats_short_mean(data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_mean';

function gsl_stats_short_variance(data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_variance';

function gsl_stats_short_sd(data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_sd';

function gsl_stats_short_variance_with_fixed_mean(data: PSmallint; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_variance_with_fixed_mean';

function gsl_stats_short_sd_with_fixed_mean(data: PSmallint; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_sd_with_fixed_mean';

function gsl_stats_short_tss(data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_tss';

function gsl_stats_short_tss_m(data: PSmallint; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_tss_m';

function gsl_stats_short_absdev(data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_absdev';

function gsl_stats_short_skew(data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_skew';

function gsl_stats_short_kurtosis(data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_kurtosis';

function gsl_stats_short_lag1_autocorrelation(data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_lag1_autocorrelation';

function gsl_stats_short_covariance(data1: PSmallint; stride1: NativeUInt; data2: PSmallint; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_covariance';

function gsl_stats_short_correlation(data1: PSmallint; stride1: NativeUInt; data2: PSmallint; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_correlation';

function gsl_stats_short_spearman(data1: PSmallint; stride1: NativeUInt; data2: PSmallint; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_spearman';

function gsl_stats_short_variance_m(data: PSmallint; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_variance_m';

function gsl_stats_short_sd_m(data: PSmallint; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_sd_m';

function gsl_stats_short_absdev_m(data: PSmallint; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_absdev_m';

function gsl_stats_short_skew_m_sd(data: PSmallint; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_skew_m_sd';

function gsl_stats_short_kurtosis_m_sd(data: PSmallint; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_kurtosis_m_sd';

function gsl_stats_short_lag1_autocorrelation_m(data: PSmallint; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_lag1_autocorrelation_m';

function gsl_stats_short_covariance_m(data1: PSmallint; stride1: NativeUInt; data2: PSmallint; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_covariance_m';

function gsl_stats_short_pvariance(data1: PSmallint; stride1: NativeUInt; n1: NativeUInt; data2: PSmallint; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_pvariance';

function gsl_stats_short_ttest(data1: PSmallint; stride1: NativeUInt; n1: NativeUInt; data2: PSmallint; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_ttest';

function gsl_stats_short_max(data: PSmallint; stride: NativeUInt; n: NativeUInt): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_max';

function gsl_stats_short_min(data: PSmallint; stride: NativeUInt; n: NativeUInt): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_min';

procedure gsl_stats_short_minmax(min: PSmallint; max: PSmallint; data: PSmallint; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_minmax';

function gsl_stats_short_max_index(data: PSmallint; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_max_index';

function gsl_stats_short_min_index(data: PSmallint; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_min_index';

procedure gsl_stats_short_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PSmallint; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_minmax_index';

function gsl_stats_short_select(data: PSmallint; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_select';

function gsl_stats_short_median_from_sorted_data(sorted_data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_median_from_sorted_data';

function gsl_stats_short_median(sorted_data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_median';

function gsl_stats_short_quantile_from_sorted_data(sorted_data: PSmallint; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_quantile_from_sorted_data';

function gsl_stats_short_trmean_from_sorted_data(trim: Double; sorted_data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_trmean_from_sorted_data';

function gsl_stats_short_gastwirth_from_sorted_data(sorted_data: PSmallint; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_gastwirth_from_sorted_data';

function gsl_stats_short_mad0(data: PSmallint; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_mad0';

function gsl_stats_short_mad(data: PSmallint; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_mad';

function gsl_stats_short_Sn0_from_sorted_data(sorted_data: PSmallint; stride: NativeUInt; n: NativeUInt; work: PSmallint): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_Sn0_from_sorted_data';

function gsl_stats_short_Sn_from_sorted_data(sorted_data: PSmallint; stride: NativeUInt; n: NativeUInt; work: PSmallint): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_Sn_from_sorted_data';

function gsl_stats_short_Qn0_from_sorted_data(sorted_data: PSmallint; stride: NativeUInt; n: NativeUInt; work: PSmallint; work_int: PInteger): Smallint; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_Qn0_from_sorted_data';

function gsl_stats_short_Qn_from_sorted_data(sorted_data: PSmallint; stride: NativeUInt; n: NativeUInt; work: PSmallint; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_short_Qn_from_sorted_data';

function gsl_stats_uchar_mean(data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_mean';

function gsl_stats_uchar_variance(data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_variance';

function gsl_stats_uchar_sd(data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_sd';

function gsl_stats_uchar_variance_with_fixed_mean(data: PByte; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_variance_with_fixed_mean';

function gsl_stats_uchar_sd_with_fixed_mean(data: PByte; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_sd_with_fixed_mean';

function gsl_stats_uchar_tss(data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_tss';

function gsl_stats_uchar_tss_m(data: PByte; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_tss_m';

function gsl_stats_uchar_absdev(data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_absdev';

function gsl_stats_uchar_skew(data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_skew';

function gsl_stats_uchar_kurtosis(data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_kurtosis';

function gsl_stats_uchar_lag1_autocorrelation(data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_lag1_autocorrelation';

function gsl_stats_uchar_covariance(data1: PByte; stride1: NativeUInt; data2: PByte; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_covariance';

function gsl_stats_uchar_correlation(data1: PByte; stride1: NativeUInt; data2: PByte; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_correlation';

function gsl_stats_uchar_spearman(data1: PByte; stride1: NativeUInt; data2: PByte; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_spearman';

function gsl_stats_uchar_variance_m(data: PByte; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_variance_m';

function gsl_stats_uchar_sd_m(data: PByte; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_sd_m';

function gsl_stats_uchar_absdev_m(data: PByte; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_absdev_m';

function gsl_stats_uchar_skew_m_sd(data: PByte; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_skew_m_sd';

function gsl_stats_uchar_kurtosis_m_sd(data: PByte; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_kurtosis_m_sd';

function gsl_stats_uchar_lag1_autocorrelation_m(data: PByte; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_lag1_autocorrelation_m';

function gsl_stats_uchar_covariance_m(data1: PByte; stride1: NativeUInt; data2: PByte; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_covariance_m';

function gsl_stats_uchar_pvariance(data1: PByte; stride1: NativeUInt; n1: NativeUInt; data2: PByte; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_pvariance';

function gsl_stats_uchar_ttest(data1: PByte; stride1: NativeUInt; n1: NativeUInt; data2: PByte; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_ttest';

function gsl_stats_uchar_max(data: PByte; stride: NativeUInt; n: NativeUInt): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_max';

function gsl_stats_uchar_min(data: PByte; stride: NativeUInt; n: NativeUInt): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_min';

procedure gsl_stats_uchar_minmax(min: PByte; max: PByte; data: PByte; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_minmax';

function gsl_stats_uchar_max_index(data: PByte; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_max_index';

function gsl_stats_uchar_min_index(data: PByte; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_min_index';

procedure gsl_stats_uchar_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PByte; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_minmax_index';

function gsl_stats_uchar_select(data: PByte; stride: NativeUInt; n: NativeUInt; k: NativeUInt): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_select';

function gsl_stats_uchar_median_from_sorted_data(sorted_data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_median_from_sorted_data';

function gsl_stats_uchar_median(sorted_data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_median';

function gsl_stats_uchar_quantile_from_sorted_data(sorted_data: PByte; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_quantile_from_sorted_data';

function gsl_stats_uchar_trmean_from_sorted_data(trim: Double; sorted_data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_trmean_from_sorted_data';

function gsl_stats_uchar_gastwirth_from_sorted_data(sorted_data: PByte; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_gastwirth_from_sorted_data';

function gsl_stats_uchar_mad0(data: PByte; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_mad0';

function gsl_stats_uchar_mad(data: PByte; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_mad';

function gsl_stats_uchar_Sn0_from_sorted_data(sorted_data: PByte; stride: NativeUInt; n: NativeUInt; work: PByte): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_Sn0_from_sorted_data';

function gsl_stats_uchar_Sn_from_sorted_data(sorted_data: PByte; stride: NativeUInt; n: NativeUInt; work: PByte): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_Sn_from_sorted_data';

function gsl_stats_uchar_Qn0_from_sorted_data(sorted_data: PByte; stride: NativeUInt; n: NativeUInt; work: PByte; work_int: PInteger): Byte; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_Qn0_from_sorted_data';

function gsl_stats_uchar_Qn_from_sorted_data(sorted_data: PByte; stride: NativeUInt; n: NativeUInt; work: PByte; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_uchar_Qn_from_sorted_data';

function gsl_stats_char_mean(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_mean';

function gsl_stats_char_variance(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_variance';

function gsl_stats_char_sd(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_sd';

function gsl_stats_char_variance_with_fixed_mean(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_variance_with_fixed_mean';

function gsl_stats_char_sd_with_fixed_mean(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_sd_with_fixed_mean';

function gsl_stats_char_tss(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_tss';

function gsl_stats_char_tss_m(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_tss_m';

function gsl_stats_char_absdev(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_absdev';

function gsl_stats_char_skew(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_skew';

function gsl_stats_char_kurtosis(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_kurtosis';

function gsl_stats_char_lag1_autocorrelation(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_lag1_autocorrelation';

function gsl_stats_char_covariance(data1: PUTF8Char; stride1: NativeUInt; data2: PUTF8Char; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_covariance';

function gsl_stats_char_correlation(data1: PUTF8Char; stride1: NativeUInt; data2: PUTF8Char; stride2: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_correlation';

function gsl_stats_char_spearman(data1: PUTF8Char; stride1: NativeUInt; data2: PUTF8Char; stride2: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_spearman';

function gsl_stats_char_variance_m(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_variance_m';

function gsl_stats_char_sd_m(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_sd_m';

function gsl_stats_char_absdev_m(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_absdev_m';

function gsl_stats_char_skew_m_sd(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_skew_m_sd';

function gsl_stats_char_kurtosis_m_sd(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; mean: Double; sd: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_kurtosis_m_sd';

function gsl_stats_char_lag1_autocorrelation_m(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; mean: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_lag1_autocorrelation_m';

function gsl_stats_char_covariance_m(data1: PUTF8Char; stride1: NativeUInt; data2: PUTF8Char; stride2: NativeUInt; n: NativeUInt; mean1: Double; mean2: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_covariance_m';

function gsl_stats_char_pvariance(data1: PUTF8Char; stride1: NativeUInt; n1: NativeUInt; data2: PUTF8Char; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_pvariance';

function gsl_stats_char_ttest(data1: PUTF8Char; stride1: NativeUInt; n1: NativeUInt; data2: PUTF8Char; stride2: NativeUInt; n2: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_ttest';

function gsl_stats_char_max(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_max';

function gsl_stats_char_min(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_min';

procedure gsl_stats_char_minmax(min: PUTF8Char; max: PUTF8Char; data: PUTF8Char; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_minmax';

function gsl_stats_char_max_index(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_max_index';

function gsl_stats_char_min_index(data: PUTF8Char; stride: NativeUInt; n: NativeUInt): NativeUInt; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_min_index';

procedure gsl_stats_char_minmax_index(min_index: PNativeUInt; max_index: PNativeUInt; data: PUTF8Char; stride: NativeUInt; n: NativeUInt); cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_minmax_index';

function gsl_stats_char_select(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; k: NativeUInt): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_select';

function gsl_stats_char_median_from_sorted_data(sorted_data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_median_from_sorted_data';

function gsl_stats_char_median(sorted_data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_median';

function gsl_stats_char_quantile_from_sorted_data(sorted_data: PUTF8Char; stride: NativeUInt; n: NativeUInt; f: Double): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_quantile_from_sorted_data';

function gsl_stats_char_trmean_from_sorted_data(trim: Double; sorted_data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_trmean_from_sorted_data';

function gsl_stats_char_gastwirth_from_sorted_data(sorted_data: PUTF8Char; stride: NativeUInt; n: NativeUInt): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_gastwirth_from_sorted_data';

function gsl_stats_char_mad0(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_mad0';

function gsl_stats_char_mad(data: PUTF8Char; stride: NativeUInt; n: NativeUInt; work: PDouble): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_mad';

function gsl_stats_char_Sn0_from_sorted_data(sorted_data: PUTF8Char; stride: NativeUInt; n: NativeUInt; work: PUTF8Char): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_Sn0_from_sorted_data';

function gsl_stats_char_Sn_from_sorted_data(sorted_data: PUTF8Char; stride: NativeUInt; n: NativeUInt; work: PUTF8Char): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_Sn_from_sorted_data';

function gsl_stats_char_Qn0_from_sorted_data(sorted_data: PUTF8Char; stride: NativeUInt; n: NativeUInt; work: PUTF8Char; work_int: PInteger): UTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_Qn0_from_sorted_data';

function gsl_stats_char_Qn_from_sorted_data(sorted_data: PUTF8Char; stride: NativeUInt; n: NativeUInt; work: PUTF8Char; work_int: PInteger): Double; cdecl;
  external LIBGSL name _PU + 'gsl_stats_char_Qn_from_sorted_data';

function gsl_sum_levin_u_alloc(n: NativeUInt): Pgsl_sum_levin_u_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_u_alloc';

procedure gsl_sum_levin_u_free(w: Pgsl_sum_levin_u_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_u_free';

function gsl_sum_levin_u_accel(&array: PDouble; n: NativeUInt; w: Pgsl_sum_levin_u_workspace; sum_accel: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_u_accel';

function gsl_sum_levin_u_minmax(&array: PDouble; n: NativeUInt; min_terms: NativeUInt; max_terms: NativeUInt; w: Pgsl_sum_levin_u_workspace; sum_accel: PDouble; abserr: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_u_minmax';

function gsl_sum_levin_u_step(term: Double; n: NativeUInt; nmax: NativeUInt; w: Pgsl_sum_levin_u_workspace; sum_accel: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_u_step';

function gsl_sum_levin_utrunc_alloc(n: NativeUInt): Pgsl_sum_levin_utrunc_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_utrunc_alloc';

procedure gsl_sum_levin_utrunc_free(w: Pgsl_sum_levin_utrunc_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_utrunc_free';

function gsl_sum_levin_utrunc_accel(&array: PDouble; n: NativeUInt; w: Pgsl_sum_levin_utrunc_workspace; sum_accel: PDouble; abserr_trunc: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_utrunc_accel';

function gsl_sum_levin_utrunc_minmax(&array: PDouble; n: NativeUInt; min_terms: NativeUInt; max_terms: NativeUInt; w: Pgsl_sum_levin_utrunc_workspace; sum_accel: PDouble; abserr_trunc: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_utrunc_minmax';

function gsl_sum_levin_utrunc_step(term: Double; n: NativeUInt; w: Pgsl_sum_levin_utrunc_workspace; sum_accel: PDouble): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_sum_levin_utrunc_step';

procedure gsl_test(status: Integer; test_description: PUTF8Char) varargs; cdecl;
  external LIBGSL name _PU + 'gsl_test';

procedure gsl_test_rel(result: Double; expected: Double; relative_error: Double; test_description: PUTF8Char) varargs; cdecl;
  external LIBGSL name _PU + 'gsl_test_rel';

procedure gsl_test_abs(result: Double; expected: Double; absolute_error: Double; test_description: PUTF8Char) varargs; cdecl;
  external LIBGSL name _PU + 'gsl_test_abs';

procedure gsl_test_factor(result: Double; expected: Double; factor: Double; test_description: PUTF8Char) varargs; cdecl;
  external LIBGSL name _PU + 'gsl_test_factor';

procedure gsl_test_int(result: Integer; expected: Integer; test_description: PUTF8Char) varargs; cdecl;
  external LIBGSL name _PU + 'gsl_test_int';

procedure gsl_test_str(result: PUTF8Char; expected: PUTF8Char; test_description: PUTF8Char) varargs; cdecl;
  external LIBGSL name _PU + 'gsl_test_str';

procedure gsl_test_verbose(verbose: Integer); cdecl;
  external LIBGSL name _PU + 'gsl_test_verbose';

function gsl_test_summary(): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_test_summary';

function gsl_wavelet_alloc(T: Pgsl_wavelet_type; k: NativeUInt): Pgsl_wavelet; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet_alloc';

procedure gsl_wavelet_free(w: Pgsl_wavelet); cdecl;
  external LIBGSL name _PU + 'gsl_wavelet_free';

function gsl_wavelet_name(w: Pgsl_wavelet): PUTF8Char; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet_name';

function gsl_wavelet_workspace_alloc(n: NativeUInt): Pgsl_wavelet_workspace; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet_workspace_alloc';

procedure gsl_wavelet_workspace_free(work: Pgsl_wavelet_workspace); cdecl;
  external LIBGSL name _PU + 'gsl_wavelet_workspace_free';

function gsl_wavelet_transform(w: Pgsl_wavelet; data: PDouble; stride: NativeUInt; n: NativeUInt; dir: gsl_wavelet_direction; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet_transform';

function gsl_wavelet_transform_forward(w: Pgsl_wavelet; data: PDouble; stride: NativeUInt; n: NativeUInt; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet_transform_forward';

function gsl_wavelet_transform_inverse(w: Pgsl_wavelet; data: PDouble; stride: NativeUInt; n: NativeUInt; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet_transform_inverse';

function gsl_wavelet2d_transform(w: Pgsl_wavelet; data: PDouble; tda: NativeUInt; size1: NativeUInt; size2: NativeUInt; dir: gsl_wavelet_direction; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_transform';

function gsl_wavelet2d_transform_forward(w: Pgsl_wavelet; data: PDouble; tda: NativeUInt; size1: NativeUInt; size2: NativeUInt; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_transform_forward';

function gsl_wavelet2d_transform_inverse(w: Pgsl_wavelet; data: PDouble; tda: NativeUInt; size1: NativeUInt; size2: NativeUInt; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_transform_inverse';

function gsl_wavelet2d_nstransform(w: Pgsl_wavelet; data: PDouble; tda: NativeUInt; size1: NativeUInt; size2: NativeUInt; dir: gsl_wavelet_direction; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_nstransform';

function gsl_wavelet2d_nstransform_forward(w: Pgsl_wavelet; data: PDouble; tda: NativeUInt; size1: NativeUInt; size2: NativeUInt; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_nstransform_forward';

function gsl_wavelet2d_nstransform_inverse(w: Pgsl_wavelet; data: PDouble; tda: NativeUInt; size1: NativeUInt; size2: NativeUInt; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_nstransform_inverse';

function gsl_wavelet2d_transform_matrix(w: Pgsl_wavelet; a: Pgsl_matrix; dir: gsl_wavelet_direction; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_transform_matrix';

function gsl_wavelet2d_transform_matrix_forward(w: Pgsl_wavelet; a: Pgsl_matrix; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_transform_matrix_forward';

function gsl_wavelet2d_transform_matrix_inverse(w: Pgsl_wavelet; a: Pgsl_matrix; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_transform_matrix_inverse';

function gsl_wavelet2d_nstransform_matrix(w: Pgsl_wavelet; a: Pgsl_matrix; dir: gsl_wavelet_direction; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_nstransform_matrix';

function gsl_wavelet2d_nstransform_matrix_forward(w: Pgsl_wavelet; a: Pgsl_matrix; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_nstransform_matrix_forward';

function gsl_wavelet2d_nstransform_matrix_inverse(w: Pgsl_wavelet; a: Pgsl_matrix; work: Pgsl_wavelet_workspace): Integer; cdecl;
  external LIBGSL name _PU + 'gsl_wavelet2d_nstransform_matrix_inverse';

implementation

end.