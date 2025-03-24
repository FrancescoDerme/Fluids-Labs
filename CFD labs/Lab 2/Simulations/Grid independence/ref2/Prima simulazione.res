 ************************************************************
 
 
   ----------------------------------------------------------  
   PHOENICS 2022 v1.0 - EARTH                                  
   (C) Copyright 2022                                          
   Concentration Heat and Momentum Limited                     
   All rights reserved.                                        
   Address:  Bakery House, 40 High Street                      
   Wimbledon, London, SW19 5AU, England                        
   tel:       +44 (0) 20-8947-7651                             
   fax:       +44 (0) 20-8879-3497                             
   e-mail:    phoenics@cham.co.uk                              
   web:       www.cham.co.uk                                   
   ----------------------------------------------------------  
   Code expiry date is the end  : feb 2025                     
   ----------------------------------------------------------  
   Running with 64-bit Double Precision executable             
   Working directory: C:\phoenics\d_priv1
 
 ************************************************************
 
 Initial estimated storage requirement is                  10000000
 
 PRPS is not stored
 Material properties used for phase 1 are
 density
 laminar viscosity
 turbulent viscosity
 mixing length
 >>>   End of property-related data   <<<
 ************************************************************
 
 Number of F-array locations available is                  10000000
 Number used before BFC allowance is                         426389
 Number used after BFC allowance is                          426389
 ************************************************************
 
  Standard k-e model constants
 
 AK =0.41 EWAL =8.6
 CMU =0.5478 CD =0.1643 CMUCD =0.090004
 C1E =1.44 C2E =1.92
 
 The foregoing constants may be changed
 from the Q1 file by setting:
 SPEDAT(KECONST,name of constant,R,value)
 
 ************************************************************
 biggest cell volume divided by average is     8.87258872499966       at:
 ix = 1 iy = 91 iz = 85
 xg =0.5 yg =0.04875 zg =5.07
 smallest cell volume divided by average is   1.013910467707640E-002  at:
 ix = 1 iy = 1 iz = 58
 xg =0.5 yg =2.63889E-04 zg =3.45
 ratio of smallest to biggest is   1.142744805527633E-003
 ************************************************************
 
 -------- Recommended settings -------
 CONWIZ=T activates settings based on
 refrho =1. refvel =10. reflen =1. reftemp =50.
 rlxdu1 =0.5 rlxdv1 =0.5 rlxdw1 =0.5
 Maximum change of V1   per sweep=   100.000000000000     
 Maximum change of W1   per sweep=   100.000000000000     
 Maximum change of KE   per sweep=   1.00000000000000     
 Maximum change of EP   per sweep=   1000.00000000000     
 relaxation and min/max values left at
 defaults may have been changed
 
 ************************************************************
 SParsol activated
 ************************************************************
  Group 1. Run Title and Number
 ************************************************************
 ************************************************************
 
 TEXT(                                        )
 
 ************************************************************
 ************************************************************
 
 IRUNN = 1 ;LIBREF = 0
 ************************************************************
  Group 2. Time dependence
 STEADY = T
 ************************************************************
  Group 3. X-Direction Grid Spacing
 CARTES = F
 NX = 1
 XULAST =1.
 ************************************************************
  Group 4. Y-Direction Grid Spacing
 NY = 91
 YVLAST =0.05
 YFRAC(1)=0.010556 ;YFRAC(19)=0.200555
 YFRAC(37)=0.390556 ;YFRAC(55)=0.580556
 YFRAC(73)=0.770555 ;YFRAC(91)=1.
 ************************************************************
  Group 5. Z-Direction Grid Spacing
 PARAB = F
 NZ = 100
 ZWLAST =6.
 ZFRAC(1)=1.0E-02 ;ZFRAC(21)=0.21
 ZFRAC(41)=0.41 ;ZFRAC(61)=0.61
 ZFRAC(81)=0.81
 ************************************************************
  Group 6. Body-Fitted Coordinates
 ************************************************************
  Group 7. Variables: STOREd,SOLVEd,NAMEd
 ONEPHS = T
 NAME(1)=P1 ;NAME(5)=V1
 NAME(7)=W1 ;NAME(12)=KE
 NAME(13)=EP ;NAME(146)=YPLS
 NAME(147)=STRS ;NAME(148)=DEN1
 NAME(149)=EPKE ;NAME(150)=DWDY
    * Y in SOLUTN argument list denotes:
    * 1-stored 2-solved 3-whole-field
    * 4-point-by-point 5-explicit 6-harmonic averaging 
 SOLUTN(P1,Y,Y,Y,N,N,Y)
 SOLUTN(V1,Y,Y,Y,N,N,Y)
 SOLUTN(W1,Y,Y,Y,N,N,N)
 SOLUTN(KE,Y,Y,N,N,N,N)
 SOLUTN(EP,Y,Y,N,N,N,N)
 SOLUTN(YPLS,Y,N,N,N,N,Y)
 SOLUTN(STRS,Y,N,N,N,N,Y)
 SOLUTN(DEN1,Y,N,N,N,N,Y)
 SOLUTN(EPKE,Y,N,N,N,N,Y)
 SOLUTN(DWDY,Y,N,N,N,N,Y)
 DEN1 = 148
 ************************************************************
  Group 8. Terms & Devices
    * Y in TERMS argument list denotes:
    * 1-built-in source 2-convection 3-diffusion 4-transient
    * 5-first phase variable 6-interphase transport         
 TERMS(P1,Y,Y,Y,N,Y,N)
 TERMS(V1,Y,Y,Y,N,Y,N)
 TERMS(W1,Y,Y,Y,N,Y,N)
 TERMS(KE,N,Y,Y,N,Y,N)
 TERMS(EP,N,Y,Y,N,Y,N)
 DIFCUT =0.5 ;ZDIFAC =1.
 GALA = F ;ADDDIF = T
 NEWENT = T
 ISOLX = 0 ;ISOLY = -1 ;ISOLZ = -1
 ************************************************************
  Group 9. Properties used if PRPS is not
  stored, and where PRPS = -1.0 if it is!
 RHO1 =998.23 ;TMP1 =0. ;EL1 = GRND4
 TSURR =0. ;TEMP0 =273.15 ;PRESS0 =1.01325E+05
 DVO1DT =1.18E-04 ;DRH1DP =0.
 EMISS =0. ;SCATT =0.
 RADIA =0. ;RADIB =0.
 EL1A =0. ;EL1B =0. ;EL1C =0.
 ENUL =1.006E-06 ;ENUT = GRND3
 ENUTA =0. ;ENUTB =0. ;ENUTC =0.
 IENUTA = 0
 PRNDTL(V1)=1. ;PRNDTL(W1)=1.
 PRNDTL(KE)=1. ;PRNDTL(EP)=1.
 PRT(V1)=1. ;PRT(W1)=1.
 PRT(KE)=1. ;PRT(EP)=1.314
 CP1 =4181.8 ;CP2 =1.
 ************************************************************
  Group 10.Inter-Phase Transfer Processes
 ************************************************************
  Group 11.Initial field variables (PHIs)
 FIINIT(P1)=0. ;FIINIT(V1)=1.0E-10
 FIINIT(W1)=1.0E-10 ;FIINIT(KE)=5.625E-17
 FIINIT(EP)=1.386463E-23 ;FIINIT(YPLS)=1.0E-10
 FIINIT(STRS)=1.0E-10 ;FIINIT(DEN1)=998.23
 FIINIT(EPKE)=1.0E-10 ;FIINIT(DWDY)=1.0E-10
   No PATCHes yet used for this Group
 INIADD = F
 FSWEEP = 1
 NAMFI =CHAM
 ************************************************************
  Group 12. Patchwise adjustment of terms
  Patches for this group are printed with those
  for Group 13.
  Their names begin either with GP12 or &
 ************************************************************
  Group 13. Boundary & Special Sources
 
   Parent VR object for this patch is: INLE1         
 PATCH(OB1 ,LOW , 1, 1, 1, 91, 1, 1, 1, 1)
 COVAL(OB1 ,P1 , FIXFLU ,748.6725 )
 COVAL(OB1 ,V1 ,0. ,0. )
 COVAL(OB1 ,W1 ,0. ,0.75 )
 COVAL(OB1 ,KE ,0. ,5.625E-17 )
 COVAL(OB1 ,EP ,0. ,1.386463E-23 )
 
   Parent VR object for this patch is: OUTL2         
 PATCH(OB2 ,HIGH , 1, 1, 1, 91, 100, 100, 1, 1)
 COVAL(OB2 ,P1 ,1000. ,0. )
 COVAL(OB2 ,V1 ,0. ,0. )
 COVAL(OB2 ,W1 ,0. ,0. )
 COVAL(OB2 ,KE ,0. , SAME )
 COVAL(OB2 ,EP ,0. , SAME )
 
   Parent VR object for this patch is: PLAT3         
 PATCH(OB3 ,NWALL , 1, 1, 91, 91, 1, 100, 1, 1)
 COVAL(OB3 ,W1 , GRND2 ,0. )
 COVAL(OB3 ,KE , GRND2 , GRND2 )
 COVAL(OB3 ,EP , GRND2 , GRND2 )
 
 PATCH(KESOURCE,PHASEM, 1, 1, 1, 91, 1, 100, 1, 1)
 COVAL(KESOURCE,KE , GRND4 , GRND4 )
 COVAL(KESOURCE,EP , GRND4 , GRND4 )
 XCYCLE = F
 EGWF = F
 ************************************************************
  Group 14. Downstream Pressure For PARAB
 ************************************************************
  Group 15. Terminate Sweeps
 LSWEEP = 10000 ;ISWC1 = 1
 LITHYD = 1 ;LITFLX = 1 ;LITC = 1 ;ITHC1 = 1
 SELREF = T
 RESFAC =1.0E-05
 ************************************************************
  Group 16. Terminate Iterations
 LITER(P1)=200 ;LITER(V1)=10
 LITER(W1)=10 ;LITER(KE)=20
 LITER(EP)=20
 ENDIT(P1)=1.0E-03 ;ENDIT(V1)=1.0E-03
 ENDIT(W1)=1.0E-03 ;ENDIT(KE)=1.0E-03
 ENDIT(EP)=1.0E-03
 ************************************************************
  Group 17. Relaxation
 RELAX(P1,LINRLX,0.5)
 RELAX(V1,LINRLX,0.5)
 RELAX(W1,LINRLX,0.5)
 RELAX(KE,LINRLX,0.5)
 RELAX(EP,LINRLX,0.5)
 RELAX(YPLS,LINRLX,1.)
 RELAX(STRS,LINRLX,1.)
 RELAX(DEN1,LINRLX,0.5)
 RELAX(EPKE,LINRLX,1.)
 RELAX(DWDY,LINRLX,1.)
 KELIN = 3
 OVRRLX =0.
 EXPERT = F ;NNORSL = F
 ************************************************************
  Group 18. Limits
 VARMAX(P1)=1.0E+10 ;VARMIN(P1)=-1.0E+10
 VARMAX(V1)=1.0E+06 ;VARMIN(V1)=-1.0E+06
 VARMAX(W1)=1.0E+06 ;VARMIN(W1)=-1.0E+06
 VARMAX(KE)=1.0E+10 ;VARMIN(KE)=1.0E-10
 VARMAX(EP)=1.0E+10 ;VARMIN(EP)=1.0E-10
 VARMAX(YPLS)=1.0E+10 ;VARMIN(YPLS)=-1.0E+10
 VARMAX(STRS)=1.0E+10 ;VARMIN(STRS)=-1.0E+10
 VARMAX(DEN1)=1.0E+10 ;VARMIN(DEN1)=1.0E-06
 VARMAX(EPKE)=1.0E+10 ;VARMIN(EPKE)=1.0E-10
 VARMAX(DWDY)=1.0E+10 ;VARMIN(DWDY)=-1.0E+10
 ************************************************************
  Group 19. Data transmitted to GROUND
 DWDY = T
 GENK = T
 PARSOL = F
 CONWIZ = T
 GEN1 = 681
 ISG62 = 0
 SPEDAT(SET,GXMONI,PLOTALL,L,T)
 SPEDAT(SET,OBJNAM,^OB1,C,INLE1)
 SPEDAT(SET,OBJTYP,^OB1,C,INLET)
 SPEDAT(SET,OBJNAM,^OB2,C,OUTL2)
 SPEDAT(SET,OBJTYP,^OB2,C,OUTLET)
 SPEDAT(SET,ARATIO,^OB2,R,1.)
 SPEDAT(SET,OBJNAM,^OB3,C,PLAT3)
 SPEDAT(SET,OBJTYP,^OB3,C,PLATE)
 SPEDAT(SET,OBJNAM,!OB4,C,NULL4)
 SPEDAT(SET,OBJTYP,!OB4,C,NULL)
 SPEDAT(SET,FACETDAT,NUMOBJ,I,4)
 ************************************************************
  Group 20. Preliminary Printout
 ************************************************************
  Group 21. Print-out of Variables
 INIFLD = F ;SUBWGR = F
    * Y in OUTPUT argument list denotes:
    * 1-field 2-correction-eq. monitor 3-selective dumping      
    * 4-whole-field residual 5-spot-value table 6-residual table
 OUTPUT(P1,N,N,Y,Y,Y,Y)
 OUTPUT(V1,N,N,Y,Y,Y,Y)
 OUTPUT(W1,N,N,Y,Y,Y,Y)
 OUTPUT(KE,N,N,Y,Y,Y,Y)
 OUTPUT(EP,N,N,Y,Y,Y,Y)
 OUTPUT(YPLS,N,N,Y,N,N,N)
 OUTPUT(STRS,N,N,Y,N,N,N)
 OUTPUT(DEN1,N,N,Y,N,N,N)
 OUTPUT(EPKE,N,N,Y,N,N,N)
 OUTPUT(DWDY,N,N,Y,N,N,N)
 WALPRN = T
 ************************************************************
  Group 22. Monitor Print-Out
 IXMON = 1 ;IYMON = 91 ;IZMON = 84
 NPRMON = 100000 ;NPRMNT = 1 ;TSTSWP = 10001
 UWATCH = F ;USTEER = F
 HIGHLO = F
 ************************************************************
  Group 23.Field Print-Out & Plot Control
 NPRINT = 10000 ;NUMCLS = 5
 NYPRIN = 18 ;IYPRF = 1 ;IYPRL = 91
 NZPRIN = 20 ;IZPRF = 1 ;IZPRL = 10000
 XZPR = F ;YZPR = T
 IPLTF = 1 ;IPLTL = 10000 ;NPLT = 500
 ISWPRF = 1 ;ISWPRL = 100000
 ITABL = 3 ;IPROF = 1
 ABSIZ =0.5 ;ORSIZ =0.4
 NTZPRF = 1 ;NCOLPF = 50
 ICHR = 2 ;NCOLCO = 45 ;NROWCO = 20
   No PATCHes yet used for this Group
 ************************************************************
  Group 24. Dumps For Restarts
 SAVE = T ;NOWIPE = F
 NSAVE =CHAM
 
 *** grid-geometry information ***
 X-coordinates of the cell centres
    5.000E-01
 Y-coordinates of the cell centres
    2.639E-04   9.764E-03   1.926E-02   2.876E-02   3.826E-02
    4.875E-02
 Z-coordinates of the cell centres
    3.000E-02   1.230E+00   2.430E+00   3.630E+00   4.830E+00

 
 X-coordinates of the (higher) cell faces
    1.000E+00
 Y-coordinates of the (higher) cell faces
    5.278E-04   1.003E-02   1.953E-02   2.903E-02   3.853E-02
    5.000E-02
 Z-coordinates of the (higher) cell faces
    6.000E-02   1.260E+00   2.460E+00   3.660E+00   4.860E+00

 
 Total number of F-array elements used is                    427656
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 Run ending on sweep  8701 with all residuals below RESFAC ( 1.000000E-05)
 ************************************************************
 *** End of sweep 8702
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 8702
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.911E+00   1.317E-11      2.516E-11
     V1     1.958E+00   4.370E-07      8.558E-07
     W1     1.958E+00   9.969E-06      1.952E-05
     KE     1.244E-01   9.127E-08      1.136E-08
     EP     1.220E+00   2.611E-08      3.185E-08
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     6.577E-06   3.258E+02      5.747E-01 (    1,   91,   89)
     V1     1.350E-09   1.969E-03     -2.600E-03 (    1,   41,   92)
     W1     6.871E-08   9.268E-01      5.134E-01 (    1,    1,   99)
     KE     1.037E-09   7.119E-03      1.000E-10 (    1,   42,   88)
     EP     3.365E-09   1.926E-01      1.000E-10 (    1,   90,   97)
 
 
 ************************************************************
 Sources and sinks
 !! Zero nett sources are not printed !!!
 
    Nett Sources have units of mass_per_unit_time * variable
    Average values have units of the variable
 
    Typically the units of the sources are:
        U1,V1,W1 - Force  - Newtons
        R1       - Mass   - kg/s
        TEM1,H1  - Energy - Watts
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-8.313889E-04
 pos. sum=0. neg. sum=-8.313889E-04
 nett sum=-8.313889E-04
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 7.018679E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-7.132133E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-3.940060E-01
 pos. sum=0.701868 neg. sum=-1.107219
 nett sum=-0.405351
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 9.358238E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-9.358238E-01 (Mass Out -9.358238E-01 In 0.000000E+00)
 pos. sum=0.935824 neg. sum=-0.935824
 nett sum=1.298961E-14
 
 Nett source of KE   at patch named: OB1      (INLE1       ) = 5.264009E-17 (Average  5.625000E-17)
 Nett source of KE   at patch named: OB2      (OUTL2       ) =-2.760293E-03 (Ave Out  2.949586E-03 In  0.000000E+00)
 Nett source of KE   at patch named: OB3      (PLAT3       ) = 9.786832E-16
 Nett source of KE   at patch named: KESOURCE                =-6.027948E-02
 Non-linearised source for KE    at: KESOURCE                = 6.080196E-02
 pos. sum=0.060802 neg. sum=-0.06304
 nett sum=-2.237815E-03
 
 Nett source of EP   at patch named: OB1      (INLE1       ) = 1.297485E-23 (Average  1.386463E-23)
 Nett source of EP   at patch named: OB2      (OUTL2       ) =-1.418621E-02 (Ave Out  1.515906E-02 In  0.000000E+00)
 Nett source of EP   at patch named: OB3      (PLAT3       ) = 3.124937E-14
 Nett source of EP   at patch named: KESOURCE                =-6.791998E-01
 Non-linearised source for EP    at: KESOURCE                = 5.142915E-01
 pos. sum=0.514292 neg. sum=-0.693386
 nett sum=-0.179094
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep  8702
    Variable      Inflow        Outflow       Nett
       P1       9.358238E-01 -9.358238E-01  1.298961E-14
       V1       0.000000E+00 -8.313889E-04 -8.313889E-04
       W1       7.018679E-01 -1.107219E+00 -4.053514E-01
       KE       6.080196E-02 -6.303977E-02 -2.237815E-03
       EP       5.142915E-01 -6.933860E-01 -1.790945E-01
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 91 IZMON= 84 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   0.0000E+00   0.0000E+00   1.0000E-10   1.0000E-10   1.0000E-10
    501   5.5080E+01   0.0000E+00   5.2830E-01   4.3968E-03   9.3466E-02
   1001   5.2452E+01   0.0000E+00   5.2837E-01   4.3981E-03   9.3507E-02
   1501   5.1548E+01   0.0000E+00   5.2872E-01   4.4031E-03   9.3667E-02
   2001   5.1182E+01   0.0000E+00   5.2891E-01   4.4059E-03   9.3757E-02
   2501   5.1017E+01   0.0000E+00   5.2901E-01   4.4074E-03   9.3804E-02
   3001   5.0941E+01   0.0000E+00   5.2907E-01   4.4083E-03   9.3832E-02
   3501   5.0906E+01   0.0000E+00   5.2911E-01   4.4089E-03   9.3851E-02
   4001   5.0892E+01   0.0000E+00   5.2914E-01   4.4094E-03   9.3868E-02
   4501   5.0887E+01   0.0000E+00   5.2918E-01   4.4100E-03   9.3885E-02
   5001   5.0888E+01   0.0000E+00   5.2921E-01   4.4105E-03   9.3902E-02
   5501   5.0892E+01   0.0000E+00   5.2925E-01   4.4110E-03   9.3919E-02
   6001   5.0898E+01   0.0000E+00   5.2928E-01   4.4114E-03   9.3932E-02
   6501   5.0905E+01   0.0000E+00   5.2930E-01   4.4117E-03   9.3940E-02
   7001   5.0912E+01   0.0000E+00   5.2931E-01   4.4118E-03   9.3944E-02
   7501   5.0918E+01   0.0000E+00   5.2931E-01   4.4118E-03   9.3945E-02
   8001   5.0922E+01   0.0000E+00   5.2931E-01   4.4118E-03   9.3945E-02
   8501   5.0925E+01   0.0000E+00   5.2931E-01   4.4118E-03   9.3944E-02
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval=  0.000E+00  0.000E+00  1.000E-10  1.000E-10  1.000E-10
     Maxval=  5.508E+01  0.000E+00  5.293E-01  4.412E-03  9.395E-02
     Cellav=  4.845E+01  0.000E+00  4.997E-01  4.163E-03  8.862E-02
 1.00 +..5.+5..5+.5..5..5.+5..5+5..5+.5..5..5.+5..5+.5..5
      .     1  1  1  1                                  .
 0.90 +                 1  1  1 1  1  1  1  1  1  1  1  1
      .                                                 .
 0.80 +                                                 +
      .                                                 .
 0.70 +                                                 +
      .                                                 .
 0.60 +                                                 +
      .                                                 .
 0.50 +                                                 +
      .                                                 .
 0.40 +                                                 +
      .                                                 .
 0.30 +                                                 +
      .                                                 .
 0.20 +                                                 +
      .                                                 .
 0.10 +                                                 +
      .                                                 .
 0.00 5..2.+2..2+.2..2..2.+2..2+2..2+.2..2..2.+2..2+.2..2
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 8.50E+03
 
 ************************************************************
 
 ************************************************************
 residuals vs sweep or iteration number
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   1.1000E+00   8.7871E-11   3.8952E-01   6.9134E-10   1.2561E-09
    501   2.6372E-08   3.5675E-04   7.2976E-02   2.7818E-03   6.8059E-04
   1001   7.8775E-09   1.4945E-04   2.5737E-02   7.2583E-04   1.4411E-04
   1501   3.2199E-09   9.5131E-05   1.0982E-02   2.6496E-04   4.7860E-05
   2001   1.5189E-09   6.3754E-05   5.2215E-03   1.1424E-04   1.9843E-05
   2501   7.6087E-10   4.4012E-05   2.6317E-03   5.3925E-05   9.3583E-06
   3001   3.8767E-10   3.0916E-05   1.3756E-03   2.6689E-05   4.7903E-06
   3501   1.9840E-10   2.1890E-05   7.4682E-04   1.3578E-05   2.6048E-06
   4001   1.0318E-10   1.5626E-05   4.2947E-04   7.1338E-06   1.4990E-06
   4501   5.5606E-11   1.1122E-05   2.6999E-04   3.9376E-06   9.1991E-07
   5001   2.9867E-11   7.9557E-06   1.8199E-04   2.3376E-06   6.0197E-07
   5501   1.4787E-11   5.6577E-06   1.2791E-04   1.5048E-06   4.1206E-07
   6001   8.2183E-12   3.9703E-06   9.1829E-05   1.0183E-06   2.8512E-07
   6501   9.7020E-12   2.7429E-06   6.5468E-05   6.8713E-07   1.9418E-07
   7001   1.2796E-11   1.8544E-06   4.5636E-05   4.5230E-07   1.2923E-07
   7501   1.5654E-11   1.2203E-06   3.0821E-05   2.8908E-07   8.3562E-08
   8001   1.6213E-11   7.8905E-07   1.9962E-05   1.8008E-07   5.2381E-08
   8501   1.4411E-11   5.1291E-07   1.2297E-05   1.1076E-07   3.1986E-08
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval= -2.552E+01 -2.316E+01 -1.131E+01 -2.109E+01 -2.050E+01
     Maxval=  9.531E-02 -7.938E+00 -9.428E-01 -5.885E+00 -7.293E+00
 1.00 3..5.+....+....+....+....+....+....+....+....+....+
      .     2                                           .
 0.90 +     5  2  2                                     +
      .  3     4     2  2                               .
 0.80 +        5  4        2  2                         +
      .     3     5  4          2  2  2                 .
 0.70 +              5  4                2  2           +
      .        3           4                   2  2     .
 0.60 +           3     5  5  4                      2  +
      .                       5 4  4                    2
 0.50 +              3          5     4  4              +
      .                 3          5  5     4  4        .
 0.40 +                    3             5  5     4     +
      .                       3                5     4  4
 0.30 +  1                      3                 5  5  +
      .     1  1                   3  3                 5
 0.20 +           1  1                   3              +
      .                 1                   3  3        .
 0.10 +                    1  1                   3     +
      .                         1  1              1  3  .
 0.00 5....+....+....+....+....+....+.1..1..1.+1...+....3
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 8.50E+03
 
 ************************************************************
 
 ************************************************************
  Patch-wise Printout from GXYPLS
Variable= Sk.Fr.Co, at patch named: OB3      and  IX=     1
 IY=    91  4.367E-03  4.765E-03  4.749E-03  4.725E-03  4.723E-03
 IZ=          1         21         41         61         81
 
 ************************************************************
 
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 13:40:45 on Saturday, 21 December 2024                         
 Run completed at 13:43:22 on Saturday, 21 December 2024                       
 CPU time of run 159 s
 This includes 159 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 4.016E-07
 ************************************************************
