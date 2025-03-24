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
 
 Initial estimated storage requirement is                  40500001
 
 PRPS is not stored
 Material properties used for phase 1 are
 density
 laminar viscosity
 turbulent viscosity
 mixing length
 >>>   End of property-related data   <<<
 ************************************************************
 
 Number of F-array locations available is                  40500001
 Number used before BFC allowance is                         597529
 Number used after BFC allowance is                          597529
 ************************************************************
 
  Two-layer low-Re k-e model constants
 
 AK =0.41 EWAL =8.6
 CMU =0.5478 CD =0.1643 CMUCD =0.090004
 C1E =1.44 C2E =1.92
 
 The foregoing constants may be changed
 from the Q1 file by setting:
 SPEDAT(KECONST,name of constant,R,value)
 
 ************************************************************
 biggest cell volume divided by average is     2.54688983012369       at:
 ix = 1 iy = 90 iz = 85
 xg =0.5 yg =0.048728 zg =5.07
 smallest cell volume divided by average is   1.422800877034169E-002  at:
 ix = 1 iy = 1 iz = 58
 xg =0.5 yg =2.722223E-04 zg =3.45
 ratio of smallest to biggest is   5.586424902270200E-003
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
 NY = 120
 YVLAST =0.05
 YFRAC(1)=0.010889 ;YFRAC(25)=0.272222
 YFRAC(49)=0.533555 ;YFRAC(73)=0.794889
 YFRAC(97)=0.984667
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
 NAME(13)=EP ;NAME(144)=LTLS
 NAME(145)=ENUT ;NAME(146)=YPLS
 NAME(147)=STRS ;NAME(148)=DEN1
 NAME(149)=WDIS ;NAME(150)=DWDY
    * Y in SOLUTN argument list denotes:
    * 1-stored 2-solved 3-whole-field
    * 4-point-by-point 5-explicit 6-harmonic averaging 
 SOLUTN(P1,Y,Y,Y,N,N,Y)
 SOLUTN(V1,Y,Y,Y,N,N,Y)
 SOLUTN(W1,Y,Y,Y,N,N,N)
 SOLUTN(KE,Y,Y,N,N,N,N)
 SOLUTN(EP,Y,Y,N,N,N,N)
 SOLUTN(LTLS,Y,Y,Y,N,N,Y)
 SOLUTN(ENUT,Y,N,N,N,N,Y)
 SOLUTN(YPLS,Y,N,N,N,N,Y)
 SOLUTN(STRS,Y,N,N,N,N,Y)
 SOLUTN(DEN1,Y,N,N,N,N,Y)
 SOLUTN(WDIS,Y,N,N,N,N,Y)
 SOLUTN(DWDY,Y,N,N,N,N,Y)
 DEN1 = 148
 VIST = 145
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
 TERMS(LTLS,N,N,Y,N,Y,N)
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
 IENUTA = 8
 PRNDTL(V1)=1. ;PRNDTL(W1)=1.
 PRNDTL(KE)=1. ;PRNDTL(EP)=1.
 PRNDTL(LTLS)=1.
 PRT(V1)=1. ;PRT(W1)=1.
 PRT(KE)=1. ;PRT(EP)=1.314
 PRT(LTLS)=1.0E+10
 CP1 =4181.8 ;CP2 =1.
 ************************************************************
  Group 10.Inter-Phase Transfer Processes
 ************************************************************
  Group 11.Initial field variables (PHIs)
 FIINIT(P1)=0. ;FIINIT(V1)=1.0E-10
 FIINIT(W1)=1.0E-10 ;FIINIT(KE)=5.625E-17
 FIINIT(EP)=1.386463E-23 ;FIINIT(LTLS)=0.
 FIINIT(ENUT)=1.0E-10 ;FIINIT(YPLS)=1.0E-10
 FIINIT(STRS)=1.0E-10 ;FIINIT(DEN1)=998.23
 FIINIT(WDIS)=5.0E-03 ;FIINIT(DWDY)=1.0E-10
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
 PATCH(OB1 ,LOW , 1, 1, 1, 120, 1, 1, 1, 1)
 COVAL(OB1 ,P1 , FIXFLU ,748.6725 )
 COVAL(OB1 ,V1 ,0. ,0. )
 COVAL(OB1 ,W1 ,0. ,0.75 )
 COVAL(OB1 ,KE ,0. ,5.625E-17 )
 COVAL(OB1 ,EP ,0. ,1.386463E-23 )
 
   Parent VR object for this patch is: OUTL2         
 PATCH(OB2 ,HIGH , 1, 1, 1, 120, 100, 100, 1, 1)
 COVAL(OB2 ,P1 ,1.0E+04 ,0. )
 COVAL(OB2 ,V1 ,0. ,0. )
 COVAL(OB2 ,W1 ,0. ,0. )
 COVAL(OB2 ,KE ,0. , SAME )
 COVAL(OB2 ,EP ,0. , SAME )
 
   Parent VR object for this patch is: PLAT3         
 PATCH(OB3 ,NWALL , 1, 1, 120, 120, 1, 100, 1, 1)
 COVAL(OB3 ,W1 , GRND2 ,0. )
 COVAL(OB3 ,KE ,1. ,0. )
 
 PATCH(KESOURCE,PHASEM, 1, 1, 1, 120, 1, 100, 1, 1)
 COVAL(KESOURCE,KE , GRND4 , GRND4 )
 COVAL(KESOURCE,EP , GRND4 , GRND4 )
 XCYCLE = F
 EGWF = F
 ************************************************************
  Group 14. Downstream Pressure For PARAB
 ************************************************************
  Group 15. Terminate Sweeps
 LSWEEP = 15000 ;ISWC1 = 1
 LITHYD = 1 ;LITFLX = 1 ;LITC = 1 ;ITHC1 = 1
 SELREF = T
 RESFAC =1.0E-05
 ************************************************************
  Group 16. Terminate Iterations
 LITER(P1)=200 ;LITER(V1)=10
 LITER(W1)=10 ;LITER(KE)=20
 LITER(EP)=20 ;LITER(LTLS)=1000
 ENDIT(P1)=1.0E-03 ;ENDIT(V1)=1.0E-03
 ENDIT(W1)=1.0E-03 ;ENDIT(KE)=1.0E-03
 ENDIT(EP)=1.0E-03 ;ENDIT(LTLS)=1.0E-03
 ************************************************************
  Group 17. Relaxation
 RELAX(P1,LINRLX,0.5)
 RELAX(V1,LINRLX,0.5)
 RELAX(W1,LINRLX,0.5)
 RELAX(KE,LINRLX,0.5)
 RELAX(EP,LINRLX,0.5)
 RELAX(LTLS,LINRLX,1.)
 RELAX(ENUT,LINRLX,0.5)
 RELAX(YPLS,LINRLX,1.)
 RELAX(STRS,LINRLX,1.)
 RELAX(DEN1,LINRLX,0.5)
 RELAX(WDIS,LINRLX,1.)
 RELAX(DWDY,LINRLX,1.)
 KELIN = 0
 OVRRLX =0.
 EXPERT = F ;NNORSL = F
 ************************************************************
  Group 18. Limits
 VARMAX(P1)=1.0E+10 ;VARMIN(P1)=-1.0E+10
 VARMAX(V1)=1.0E+06 ;VARMIN(V1)=-1.0E+06
 VARMAX(W1)=1.0E+06 ;VARMIN(W1)=-1.0E+06
 VARMAX(KE)=1.0E+10 ;VARMIN(KE)=1.0E-10
 VARMAX(EP)=1.0E+10 ;VARMIN(EP)=1.0E-10
 VARMAX(LTLS)=1.0E+10 ;VARMIN(LTLS)=0.
 VARMAX(ENUT)=1.0E+10 ;VARMIN(ENUT)=1.0E-10
 VARMAX(YPLS)=1.0E+10 ;VARMIN(YPLS)=-1.0E+10
 VARMAX(STRS)=1.0E+10 ;VARMIN(STRS)=-1.0E+10
 VARMAX(DEN1)=1.0E+10 ;VARMIN(DEN1)=1.0E-06
 VARMAX(WDIS)=1.0E+10 ;VARMIN(WDIS)=0.
 VARMAX(DWDY)=1.0E+10 ;VARMIN(DWDY)=-1.0E+10
 ************************************************************
  Group 19. Data transmitted to GROUND
 DWDY = T
 GENK = T
 PARSOL = F
 CONWIZ = T
 IENUTA = 8
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
 SPEDAT(SET,OBJNAM,^OB4,C,NULL4)
 SPEDAT(SET,OBJTYP,^OB4,C,NULL)
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
 OUTPUT(LTLS,N,N,Y,Y,N,Y)
 OUTPUT(ENUT,N,N,Y,N,N,N)
 OUTPUT(YPLS,N,N,Y,N,N,N)
 OUTPUT(STRS,N,N,Y,N,N,N)
 OUTPUT(DEN1,N,N,Y,N,N,N)
 OUTPUT(WDIS,N,N,Y,N,N,N)
 OUTPUT(DWDY,N,N,Y,N,N,N)
 WALPRN = T
 ************************************************************
  Group 22. Monitor Print-Out
 IXMON = 1 ;IYMON = 88 ;IZMON = 50
 NPRMON = 100000 ;NPRMNT = 1 ;TSTSWP = 10001
 UWATCH = F ;USTEER = F
 HIGHLO = F
 ************************************************************
  Group 23.Field Print-Out & Plot Control
 NPRINT = 15000 ;NUMCLS = 5
 NYPRIN = 24 ;IYPRF = 1 ;IYPRL = 120
 NZPRIN = 20 ;IZPRF = 1 ;IZPRL = 10000
 XZPR = F ;YZPR = T
 IPLTF = 1 ;IPLTL = 15000 ;NPLT = 750
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
    2.722E-04   1.334E-02   2.641E-02   3.947E-02   4.922E-02

 Z-coordinates of the cell centres
    3.000E-02   1.230E+00   2.430E+00   3.630E+00   4.830E+00

 
 X-coordinates of the (higher) cell faces
    1.000E+00
 Y-coordinates of the (higher) cell faces
    5.444E-04   1.361E-02   2.668E-02   3.974E-02   4.923E-02

 Z-coordinates of the (higher) cell faces
    6.000E-02   1.260E+00   2.460E+00   3.660E+00   4.860E+00

 
 Total number of F-array elements used is                    599321
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 *** End of sweep 15000
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 15000
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.901E+00   6.255E-10      1.189E-09
     V1     2.087E+00   7.855E-07      1.639E-06
     W1     2.087E+00   7.693E-05      1.605E-04
     KE     6.041E-03   7.848E-01      4.741E-03
     EP     2.001E+03   1.227E+00      2.456E+03
     LTLS   1.100E+00   6.818E-03      7.500E-03
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     6.613E-05   3.575E+02      3.647E-02 (    1,   62,   12)
     V1     8.538E-08   1.005E-03     -4.480E-03 (    1,    8,   28)
     W1     1.022E-05   9.089E-01      2.307E-02 (    1,   82,   20)
     KE     3.731E-06   5.650E-03      1.000E-10 (    1,   77,   20)
     EP     3.974E-04   6.967E-01      1.000E-10 (    1,   81,   20)
     LTLS   6.256E-04   6.256E-04      4.167E-07 (    1,    1,  100)
 
 
 ************************************************************
 Sources and sinks
 !! Zero nett sources are not printed !!!
 
    Nett Sources have units of mass_per_unit_time * variable
    Average values have units of the variable
 
    Typically the units of the sources are:
        U1,V1,W1 - Force  - Newtons
        R1       - Mass   - kg/s
        TEM1,H1  - Energy - Watts
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-2.658594E-04
 pos. sum=0. neg. sum=-2.658594E-04
 nett sum=-2.658594E-04
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 7.018679E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-7.166857E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-4.322128E-01
 pos. sum=0.701868 neg. sum=-1.148898
 nett sum=-0.447031
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 9.358238E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-9.358238E-01 (Mass Out -9.358238E-01 In 0.000000E+00)
 pos. sum=0.935824 neg. sum=-0.935824
 nett sum=-1.110223E-15
 
 Nett source of KE   at patch named: OB1      (INLE1       ) = 5.264009E-17 (Average  5.625000E-17)
 Nett source of KE   at patch named: OB2      (OUTL2       ) =-2.933593E-03 (Ave Out  3.134770E-03 In  0.000000E+00)
 Nett source of KE   at patch named: OB3      (PLAT3       ) =-1.807505E-09
 Nett source of KE   at patch named: KESOURCE                =-1.801628E-03
 pos. sum=5.264009E-17 neg. sum=-4.735223E-03
 nett sum=-4.735223E-03
 
 Nett source of EP   at patch named: OB1      (INLE1       ) = 1.297485E-23 (Average  1.386463E-23)
 Nett source of EP   at patch named: OB2      (OUTL2       ) =-1.578518E-02 (Ave Out  1.686768E-02 In  0.000000E+00)
 Nett source of EP   at patch named: KESOURCE                = 2.001159E+03
 pos. sum=2001.159489 neg. sum=-0.015785
 nett sum=2001.143704
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep 15000
    Variable      Inflow        Outflow       Nett
       P1       9.358238E-01 -9.358238E-01 -1.110223E-15
       V1       0.000000E+00 -2.658594E-04 -2.658594E-04
       W1       7.018679E-01 -1.148898E+00 -4.470306E-01
       KE       5.264009E-17 -4.735223E-03 -4.735223E-03
       EP       2.001159E+03 -1.578518E-02  2.001144E+03
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 88 IZMON= 50 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   0.0000E+00   9.9999E-11   1.0000E-10   1.0000E-10   1.0000E-10
    751   7.6220E+02   5.4641E-08   3.7722E-01   2.2959E-02   6.1366E-01
   1501   3.0336E+02   3.5119E-07   4.5422E-01   1.4894E-02   3.2175E-01
   2251   1.2567E+02   7.2676E-07   5.1033E-01   9.9873E-03   1.7739E-01
   3001   1.0934E+02   2.1286E-06   5.4723E-01   7.2427E-03   1.0995E-01
   3751   1.3733E+02   3.5559E-06   5.6963E-01   5.8713E-03   8.0473E-02
   4501   1.5683E+02   4.6073E-06   5.8284E-01   5.2149E-03   6.7474E-02
   5251   1.6522E+02   6.4968E-06   5.9040E-01   4.8662E-03   6.0883E-02
   6001   1.6789E+02   9.2740E-06   5.9449E-01   4.6716E-03   5.7302E-02
   6751   1.6843E+02   1.0342E-05   5.9688E-01   4.5804E-03   5.5650E-02
   7501   1.6904E+02   1.0917E-05   5.9819E-01   4.5184E-03   5.4534E-02
   8251   1.6904E+02   1.0952E-05   5.9890E-01   4.4841E-03   5.3922E-02
   9001   1.6899E+02   1.0798E-05   5.9929E-01   4.4654E-03   5.3587E-02
   9751   1.6896E+02   1.0608E-05   5.9952E-01   4.4550E-03   5.3403E-02
  10501   1.6893E+02   1.0447E-05   5.9965E-01   4.4491E-03   5.3298E-02
  11251   1.6892E+02   1.0327E-05   5.9972E-01   4.4459E-03   5.3240E-02
  12001   1.6891E+02   1.0245E-05   5.9977E-01   4.4439E-03   5.3206E-02
  12751   1.6890E+02   1.0189E-05   5.9979E-01   4.4429E-03   5.3187E-02
  13501   1.6890E+02   1.0153E-05   5.9981E-01   4.4422E-03   5.3175E-02
  14251   1.6890E+02   1.0130E-05   5.9982E-01   4.4418E-03   5.3168E-02
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval=  0.000E+00  1.000E-10  1.000E-10  1.000E-10  1.000E-10
     Maxval=  7.622E+02  1.095E-05  5.998E-01  2.296E-02  6.137E-01
     Cellav=  1.893E+02  7.115E-06  5.409E-01  6.244E-03  1.040E-01
 1.00 +..5.+....+....+..3.+3..3+3..3+.3.3+.3.3+.3..3.3..3
      .            3  3       2         2  2 2  2  2 2  .
 0.90 +          3                                      2
      .       3            2                            .
 0.80 +                                                 +
      .    3                                            .
 0.70 +                                                 +
      .  3 4                                            .
 0.60 +                 2                               +
      .                                                 .
 0.50 +    5                                            +
      .       4                                         .
 0.40 +    1          2                                 +
      .                                                 .
 0.30 +       5  4 2                                    +
      .            4  4                                 .
 0.20 +          5 1  1 4  4  4 4  4  4 4  4 4  4  4 4  4
      .       1  1 5                                    .
 0.10 +               5 5  5  5 5  5  5 5  5 5  5  5 5  5
      .    2  2                                         .
 0.00 5..2.+....+....+....+....+....+....+....+....+....+
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
 residuals vs sweep or iteration number
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   1.1000E+00   8.7868E-11   3.8952E-01   7.9518E-08   1.0298E+00
    751   2.6708E-07   1.3858E-03   7.0894E-01   1.8394E-01   1.0015E+00
   1501   1.6825E-07   1.4715E-03   6.5044E-01   2.4500E-01   1.0472E+00
   2251   9.7585E-08   1.2399E-03   5.1056E-01   3.3496E-01   1.0658E+00
   3001   6.9298E-08   8.3400E-04   3.1758E-01   4.9819E-01   1.2191E+00
   3751   4.2882E-08   4.8802E-04   1.7459E-01   7.7062E-01   1.3633E+00
   4501   2.5965E-08   2.7570E-04   9.4849E-02   8.2772E-01   1.4809E+00
   5251   1.5556E-08   1.6789E-04   5.2172E-02   8.0989E-01   1.6229E+00
   6001   1.1383E-08   1.0341E-04   2.9151E-02   8.0061E-01   1.6961E+00
   6751   5.8502E-09   6.4695E-05   1.7363E-02   7.9451E-01   1.8227E+00
   7501   4.1621E-09   4.3863E-05   9.8800E-03   7.9026E-01   1.7976E+00
   8251   3.0357E-09   2.9188E-05   5.6646E-03   7.8832E-01   1.5380E+00
   9001   1.8716E-09   1.8954E-05   3.2302E-03   7.8662E-01   1.3925E+00
   9751   1.2431E-09   1.2098E-05   1.8318E-03   7.8559E-01   1.7232E+00
  10501   8.2303E-10   7.7623E-06   1.0352E-03   7.8489E-01   1.8247E+00
  11251   1.0210E-09   5.2703E-06   6.3097E-04   7.8490E-01   2.5167E+00
  12001   7.0964E-10   3.4672E-06   3.7628E-04   7.8497E-01   2.7706E+02
  12751   8.9562E-10   2.3543E-06   2.5003E-04   7.8459E-01   1.2102E+00
  13501   8.2550E-10   1.5701E-06   1.6176E-04   7.8455E-01   1.4930E+00
  14251   6.4333E-10   1.0435E-06   1.0048E-04   7.8459E-01   1.7751E+00
   ISWP       LTLS
      1   0.0000E+00
    751   0.0000E+00
   1501   0.0000E+00
   2251   0.0000E+00
   3001   0.0000E+00
   3751   0.0000E+00
   4501   0.0000E+00
   5251   0.0000E+00
   6001   0.0000E+00
   6751   0.0000E+00
   7501   0.0000E+00
   8251   0.0000E+00
   9001   0.0000E+00
   9751   0.0000E+00
  10501   0.0000E+00
  11251   0.0000E+00
  12001   0.0000E+00
  12751   0.0000E+00
  13501   0.0000E+00
  14251   0.0000E+00
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval= -2.116E+01 -2.316E+01 -9.206E+00 -1.635E+01  1.518E-03
     Maxval=  9.531E-02 -6.521E+00 -3.440E-01 -1.891E-01  5.624E+00
   Variable    6 = LTLS
     Minval= -4.605E+01
     Maxval= -4.605E+01
 1.00 1..3.3..2.+..4.+4.4.+4..4+4..4+.4.4+.4.4+.5..4.4..4
      3       4  4 2                                    .
 0.90 +  4 4     3    2                                 +
      .            3    2  2                            .
 0.80 +                       2 2                       +
      .               3            2  2                 .
 0.70 +                 3               2  2            +
      .                    3                 2  2       .
 0.60 +                       3                    2 2  +
      .                                                 2
 0.50 +                         3                       +
      .                            3                    .
 0.40 +                               3                 +
      .                                 3               .
 0.30 +  1                                              +
      .    1  1                            3            .
 0.20 +          1 1                         3          +
      .               1 1  1                 5  3       .
 0.10 +                 5  5  5 5  5    5  5       3    5
      .          5 5  5            1  5 1          5 5  .
 0.00 6..6.6..6.+6.6.+6.6.+6..6+6..6+.6.6+.6.6+.6..6.6..6
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
  Patch-wise Printout from GXYPLS
Variable= Sk.Fr.Co, at patch named: OB3      and  IX=     1
 IY=   120  1.220E+00  2.563E+00  2.609E+00  2.565E+00  2.557E+00
 IZ=          1         21         41         61         81
 
 ************************************************************
 
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 10:34:19 on Thursday, 26 December 2024                         
 Run completed at 10:51:22 on Thursday, 26 December 2024                       
 CPU time of run 1025 s
 This includes 1025 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 9.491E-07
 ************************************************************
