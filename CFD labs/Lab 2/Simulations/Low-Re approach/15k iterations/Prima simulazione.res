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
 Number used before BFC allowance is                         300289
 Number used after BFC allowance is                          300289
 ************************************************************
 
  Two-layer low-Re k-e model constants
 
 AK =0.41 EWAL =8.6
 CMU =0.5478 CD =0.1643 CMUCD =0.090004
 C1E =1.44 C2E =1.92
 
 The foregoing constants may be changed
 from the Q1 file by setting:
 SPEDAT(KECONST,name of constant,R,value)
 
 ************************************************************
 biggest cell volume divided by average is     3.77761489843784       at:
 ix = 1 iy = 30 iz = 85
 xg =0.5 yg =0.048183 zg =5.07
 smallest cell volume divided by average is   6.402603946653625E-002  at:
 ix = 1 iy = 1 iz = 58
 xg =0.5 yg =8.166668E-04 zg =3.45
 ratio of smallest to biggest is   1.694880002009019E-002
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
 NY = 60
 YVLAST =0.05
 YFRAC(1)=0.032667 ;YFRAC(13)=0.424667
 YFRAC(25)=0.816667 ;YFRAC(37)=0.984667
 YFRAC(49)=0.992667
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
 PATCH(OB1 ,LOW , 1, 1, 1, 60, 1, 1, 1, 1)
 COVAL(OB1 ,P1 , FIXFLU ,748.6725 )
 COVAL(OB1 ,V1 ,0. ,0. )
 COVAL(OB1 ,W1 ,0. ,0.75 )
 COVAL(OB1 ,KE ,0. ,5.625E-17 )
 COVAL(OB1 ,EP ,0. ,1.386463E-23 )
 
   Parent VR object for this patch is: OUTL2         
 PATCH(OB2 ,HIGH , 1, 1, 1, 60, 100, 100, 1, 1)
 COVAL(OB2 ,P1 ,1.0E+04 ,0. )
 COVAL(OB2 ,V1 ,0. ,0. )
 COVAL(OB2 ,W1 ,0. ,0. )
 COVAL(OB2 ,KE ,0. , SAME )
 COVAL(OB2 ,EP ,0. , SAME )
 
   Parent VR object for this patch is: PLAT3         
 PATCH(OB3 ,NWALL , 1, 1, 60, 60, 1, 100, 1, 1)
 COVAL(OB3 ,W1 , GRND2 ,0. )
 COVAL(OB3 ,KE ,1. ,0. )
 
 PATCH(KESOURCE,PHASEM, 1, 1, 1, 60, 1, 100, 1, 1)
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
 IXMON = 1 ;IYMON = 30 ;IZMON = 84
 NPRMON = 100000 ;NPRMNT = 1 ;TSTSWP = 10001
 UWATCH = F ;USTEER = F
 HIGHLO = F
 ************************************************************
  Group 23.Field Print-Out & Plot Control
 NPRINT = 15000 ;NUMCLS = 5
 NYPRIN = 12 ;IYPRF = 1 ;IYPRL = 60
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
    8.167E-04   2.042E-02   4.002E-02   4.922E-02   4.962E-02

 Z-coordinates of the cell centres
    3.000E-02   1.230E+00   2.430E+00   3.630E+00   4.830E+00

 
 X-coordinates of the (higher) cell faces
    1.000E+00
 Y-coordinates of the (higher) cell faces
    1.633E-03   2.123E-02   4.083E-02   4.923E-02   4.963E-02

 Z-coordinates of the (higher) cell faces
    6.000E-02   1.260E+00   2.460E+00   3.660E+00   4.860E+00

 
 Total number of F-array elements used is                    301541
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 *** End of sweep 15000
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 15000
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.896E+00   5.268E-09      9.991E-09
     V1     2.163E+00   1.222E-06      2.644E-06
     W1     2.163E+00   6.302E-05      1.363E-04
     KE     6.400E-03   7.379E-01      4.723E-03
     EP     5.600E+03   1.086E+00      6.083E+03
     LTLS   1.100E+00   6.818E-03      7.500E-03
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     5.509E-04   3.603E+02      3.551E-02 (    1,   30,    9)
     V1     1.177E-06   9.262E-04     -4.416E-03 (    1,   13,   18)
     W1     3.310E-05   9.116E-01      2.326E-02 (    1,   28,   10)
     KE     1.129E-05   5.643E-03      1.000E-10 (    1,   25,   10)
     EP     7.295E-04   6.906E-01      1.000E-10 (    1,   27,   10)
     LTLS   6.255E-04   6.255E-04      4.167E-07 (    1,    1,  100)
 
 
 ************************************************************
 Sources and sinks
 !! Zero nett sources are not printed !!!
 
    Nett Sources have units of mass_per_unit_time * variable
    Average values have units of the variable
 
    Typically the units of the sources are:
        U1,V1,W1 - Force  - Newtons
        R1       - Mass   - kg/s
        TEM1,H1  - Energy - Watts
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-2.448284E-04
 pos. sum=0. neg. sum=-2.448284E-04
 nett sum=-2.448284E-04
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 7.018679E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-7.166447E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-4.358421E-01
 pos. sum=0.701868 neg. sum=-1.152487
 nett sum=-0.450619
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 9.358238E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-9.358238E-01 (Mass Out -9.358238E-01 In 0.000000E+00)
 pos. sum=0.935824 neg. sum=-0.935824
 nett sum=-3.663736E-15
 
 Nett source of KE   at patch named: OB1      (INLE1       ) = 5.264009E-17 (Average  5.625000E-17)
 Nett source of KE   at patch named: OB2      (OUTL2       ) =-2.997544E-03 (Ave Out  3.203107E-03 In  0.000000E+00)
 Nett source of KE   at patch named: OB3      (PLAT3       ) =-1.807505E-09
 Nett source of KE   at patch named: KESOURCE                =-1.710166E-03
 pos. sum=5.264009E-17 neg. sum=-4.707711E-03
 nett sum=-4.707711E-03
 
 Nett source of EP   at patch named: OB1      (INLE1       ) = 1.297485E-23 (Average  1.386463E-23)
 Nett source of EP   at patch named: OB2      (OUTL2       ) =-1.616151E-02 (Ave Out  1.726982E-02 In  0.000000E+00)
 Nett source of EP   at patch named: KESOURCE                = 5.600193E+03
 pos. sum=5600.193161 neg. sum=-0.016162
 nett sum=5600.177
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep 15000
    Variable      Inflow        Outflow       Nett
       P1       9.358238E-01 -9.358238E-01 -3.663736E-15
       V1       0.000000E+00 -2.448284E-04 -2.448284E-04
       W1       7.018679E-01 -1.152487E+00 -4.506189E-01
       KE       5.264009E-17 -4.707711E-03 -4.707711E-03
       EP       5.600193E+03 -1.616151E-02  5.600177E+03
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 30 IZMON= 84 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   0.0000E+00   1.0000E-10   1.0000E-10   1.0000E-10   1.0000E-10
    751   2.4218E+02  -1.3036E-08   3.3095E-01   2.2328E-02   7.6202E-01
   1501   1.4865E+02  -6.1152E-09   4.2371E-01   1.3737E-02   3.6968E-01
   2251   1.0377E+02  -1.5466E-09   4.9109E-01   9.3337E-03   2.0810E-01
   3001   7.8629E+01  -1.7784E-08   5.3020E-01   6.9148E-03   1.3330E-01
   3751   6.6436E+01  -9.5059E-08   5.5163E-01   5.7578E-03   1.0160E-01
   4501   6.2057E+01  -1.6736E-07   5.6525E-01   5.3270E-03   9.0542E-02
   5251   5.8469E+01  -2.4763E-07   5.7203E-01   5.0027E-03   8.2499E-02
   6001   5.6618E+01  -3.0210E-07   5.7559E-01   4.8380E-03   7.8508E-02
   6751   5.5652E+01  -3.2918E-07   5.7746E-01   4.7528E-03   7.6471E-02
   7501   5.5145E+01  -3.3763E-07   5.7845E-01   4.7086E-03   7.5419E-02
   8251   5.4879E+01  -3.3670E-07   5.7897E-01   4.6854E-03   7.4870E-02
   9001   5.4737E+01  -3.3156E-07   5.7924E-01   4.6732E-03   7.4582E-02
   9751   5.4663E+01  -3.2543E-07   5.7939E-01   4.6668E-03   7.4431E-02
  10501   5.4623E+01  -3.1986E-07   5.7946E-01   4.6635E-03   7.4352E-02
  11251   5.4602E+01  -3.1541E-07   5.7950E-01   4.6617E-03   7.4310E-02
  12001   5.4591E+01  -3.1210E-07   5.7952E-01   4.6608E-03   7.4288E-02
  12751   5.4585E+01  -3.0977E-07   5.7953E-01   4.6603E-03   7.4277E-02
  13501   5.4582E+01  -3.0819E-07   5.7954E-01   4.6600E-03   7.4271E-02
  14251   5.4580E+01  -3.0714E-07   5.7954E-01   4.6599E-03   7.4268E-02
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval=  0.000E+00 -3.376E-07  1.000E-10  1.000E-10  1.000E-10
     Maxval=  2.422E+02  1.000E-10  5.795E-01  2.233E-02  7.620E-01
     Cellav=  7.097E+01 -2.192E-07  5.206E-01  6.235E-03  1.324E-01
 1.00 2..5.2..2.+....+3.3.+3..3+3..3+.3.3+.3.3+.3..3.3..3
      .  2       2 3                                    .
 0.90 +          3                                      +
      .       3                                         .
 0.80 +                                                 +
      .    3                                            .
 0.70 +            2                                    +
      .                                                 .
 0.60 +    4                                            +
      .  3                                              .
 0.50 +    5          2                                 +
      .       1                                         .
 0.40 +       4                                         +
      .                                                 .
 0.30 +          4                                      +
      .       5    4  4 2  1  1 1  1  1 1  1 1  1  1 1  1
 0.20 +                 4  4  4 4  4  4 4  4 4  4  4 4  4
      .          5 5                                    .
 0.10 +               5 5  5  5 5  5  5 5  5 5  5  5 5  5
      .                       2         2  2 2          .
 0.00 5....+....+....+....+....+2..2+.2..+....+....+....+
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
 residuals vs sweep or iteration number
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   1.1000E+00   8.7266E-11   3.8952E-01   7.9456E-08   1.0297E+00
    751   2.8758E-07   3.0619E-04   5.1282E-01   1.7961E-01   1.0022E+00
   1501   2.6462E-07   1.9831E-04   3.6463E-01   3.1375E-01   1.0119E+00
   2251   1.1574E-07   1.7190E-04   2.3708E-01   4.6827E-01   1.0799E+00
   3001   8.3792E-08   1.2912E-04   1.3498E-01   6.0140E-01   1.1951E+00
   3751   8.7082E-08   9.7294E-05   7.5562E-02   6.9191E-01   1.3658E+00
   4501   3.4432E-08   6.2605E-05   4.4344E-02   7.0110E-01   1.4151E+00
   5251   1.2422E-08   4.0658E-05   2.3379E-02   7.2426E-01   1.5036E+00
   6001   1.7127E-08   2.7174E-05   1.2404E-02   7.3525E-01   1.5375E+00
   6751   5.4281E-09   1.7391E-05   6.4440E-03   7.3620E-01   1.5816E+00
   7501   4.8513E-09   1.1536E-05   3.3532E-03   7.3638E-01   1.6043E+00
   8251   1.1379E-08   9.0440E-06   1.9010E-03   7.3727E-01   1.2982E+00
   9001   1.0649E-08   5.6807E-06   9.7714E-04   7.3734E-01   1.4426E+00
   9751   1.3991E-08   3.9536E-06   5.2245E-04   7.3935E-01   1.1784E+00
  10501   8.4597E-09   3.1344E-06   3.1255E-04   7.3707E-01   2.2490E+00
  11251   1.3209E-08   2.2933E-06   1.7181E-04   7.3926E-01   1.1661E+00
  12001   6.6239E-09   2.0903E-06   1.3084E-04   7.3699E-01   3.1055E+00
  12751   1.4561E-08   1.4657E-06   7.6291E-05   7.3928E-01   1.1619E+00
  13501   6.4345E-09   1.6957E-06   8.4312E-05   7.3698E-01   3.7394E+00
  14251   1.2678E-08   1.2492E-06   5.1950E-05   7.3921E-01   1.1615E+00
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
     Minval= -1.914E+01 -2.316E+01 -9.865E+00 -1.635E+01  2.197E-03
     Maxval=  9.531E-02 -8.091E+00 -6.678E-01 -3.020E-01  1.319E+00
   Variable    6 = LTLS
     Minval= -4.605E+01
     Maxval= -4.605E+01
 1.00 1..3.+....+4.4.+4.4.+4..4+4..4+.4.4+.4.4+.4..4.5..4
      3    4  4  2                                      .
 0.90 +  4    3    2  2                                 +
      .          3      2  2                    5       .
 0.80 +            3          2 2                       +
      .               3            2  2                 .
 0.70 +                                 2  2 2          +
      .                 3                       2  2 2  2
 0.60 +                    3               5            +
      .                                                 .
 0.50 +                       3                         +
      .                         3                       .
 0.40 +                            3                    +
      .                    5  5 5                       .
 0.30 +                 5             5                 +
      .            5  5                 3               .
 0.20 +  1 1                       5       3            +
      .       1  5 1                         3          .
 0.10 +               1                 5    5  3  5    5
      .       5         1  1       1  1 1  1 1     3 3  1
 0.00 6..6.6..6.+6.6.+6.6.+6..6+6..6+.6.6+.6.6+.6..6.6..6
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
  Patch-wise Printout from GXYPLS
Variable= Sk.Fr.Co, at patch named: OB3      and  IX=     1
 IY=    60  1.230E+00  2.551E+00  2.585E+00  2.538E+00  2.530E+00
 IZ=          1         21         41         61         81
 
 ************************************************************
 
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 18:09:50 on Tuesday, 24 December 2024                          
 Run completed at 18:15:49 on Tuesday, 24 December 2024                        
 CPU time of run 361 s
 This includes 361 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 6.685E-07
 ************************************************************
