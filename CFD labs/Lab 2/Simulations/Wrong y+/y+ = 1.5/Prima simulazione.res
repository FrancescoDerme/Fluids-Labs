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
 Number used before BFC allowance is                         342702
 Number used after BFC allowance is                          342702
 ************************************************************
 
  Standard k-e model constants
 
 AK =0.41 EWAL =8.6
 CMU =0.5478 CD =0.1643 CMUCD =0.090004
 C1E =1.44 C2E =1.92
 
 The foregoing constants may be changed
 from the Q1 file by setting:
 SPEDAT(KECONST,name of constant,R,value)
 
 ************************************************************
 biggest cell volume divided by average is     4.14151792254279       at:
 ix = 1 iy = 30 iz = 85
 xg =0.5 yg =0.046708 zg =5.07
 smallest cell volume divided by average is   7.019375727763022E-002  at:
 ix = 1 iy = 1 iz = 58
 xg =0.5 yg =7.916668E-04 zg =3.45
 ratio of smallest to biggest is   1.694879959242891E-002
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
 NY = 70
 YVLAST =0.05
 YFRAC(1)=0.031667 ;YFRAC(15)=0.475
 YFRAC(29)=0.918333 ;YFRAC(43)=0.96625
 YFRAC(57)=0.98375
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
 NAME(13)=EP ;NAME(145)=ENUT
 NAME(146)=YPLS ;NAME(147)=STRS
 NAME(148)=DEN1 ;NAME(149)=EPKE
 NAME(150)=DWDY
    * Y in SOLUTN argument list denotes:
    * 1-stored 2-solved 3-whole-field
    * 4-point-by-point 5-explicit 6-harmonic averaging 
 SOLUTN(P1,Y,Y,Y,N,N,Y)
 SOLUTN(V1,Y,Y,Y,N,N,Y)
 SOLUTN(W1,Y,Y,Y,N,N,N)
 SOLUTN(KE,Y,Y,N,N,N,N)
 SOLUTN(EP,Y,Y,N,N,N,N)
 SOLUTN(ENUT,Y,N,N,N,N,Y)
 SOLUTN(YPLS,Y,N,N,N,N,Y)
 SOLUTN(STRS,Y,N,N,N,N,Y)
 SOLUTN(DEN1,Y,N,N,N,N,Y)
 SOLUTN(EPKE,Y,N,N,N,N,Y)
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
 FIINIT(EP)=1.386463E-23 ;FIINIT(ENUT)=1.0E-10
 FIINIT(YPLS)=1.0E-10 ;FIINIT(STRS)=1.0E-10
 FIINIT(DEN1)=998.23 ;FIINIT(EPKE)=1.0E-10
 FIINIT(DWDY)=1.0E-10
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
 PATCH(OB1 ,LOW , 1, 1, 1, 70, 1, 1, 1, 1)
 COVAL(OB1 ,P1 , FIXFLU ,748.6725 )
 COVAL(OB1 ,V1 ,0. ,0. )
 COVAL(OB1 ,W1 ,0. ,0.75 )
 COVAL(OB1 ,KE ,0. ,5.625E-17 )
 COVAL(OB1 ,EP ,0. ,1.386463E-23 )
 
   Parent VR object for this patch is: OUTL2         
 PATCH(OB2 ,HIGH , 1, 1, 1, 70, 100, 100, 1, 1)
 COVAL(OB2 ,P1 ,1000. ,0. )
 COVAL(OB2 ,V1 ,0. ,0. )
 COVAL(OB2 ,W1 ,0. ,0. )
 COVAL(OB2 ,KE ,0. , SAME )
 COVAL(OB2 ,EP ,0. , SAME )
 
   Parent VR object for this patch is: PLAT3         
 PATCH(OB3 ,NWALL , 1, 1, 70, 70, 1, 100, 1, 1)
 COVAL(OB3 ,W1 , GRND2 ,0. )
 COVAL(OB3 ,KE , GRND2 , GRND2 )
 COVAL(OB3 ,EP , GRND2 , GRND2 )
 
 PATCH(KESOURCE,PHASEM, 1, 1, 1, 70, 1, 100, 1, 1)
 COVAL(KESOURCE,KE , GRND4 , GRND4 )
 COVAL(KESOURCE,EP , GRND4 , GRND4 )
 XCYCLE = F
 EGWF = F
 ************************************************************
  Group 14. Downstream Pressure For PARAB
 ************************************************************
  Group 15. Terminate Sweeps
 LSWEEP = 100000 ;ISWC1 = 1
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
 RELAX(ENUT,LINRLX,0.5)
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
 VARMAX(ENUT)=1.0E+10 ;VARMIN(ENUT)=1.0E-10
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
 OUTPUT(ENUT,N,N,Y,N,N,N)
 OUTPUT(YPLS,N,N,Y,N,N,N)
 OUTPUT(STRS,N,N,Y,N,N,N)
 OUTPUT(DEN1,N,N,Y,N,N,N)
 OUTPUT(EPKE,N,N,Y,N,N,N)
 OUTPUT(DWDY,N,N,Y,N,N,N)
 WALPRN = T
 ************************************************************
  Group 22. Monitor Print-Out
 IXMON = 1 ;IYMON = 50 ;IZMON = 84
 NPRMON = 100000 ;NPRMNT = 1 ;TSTSWP = 10001
 UWATCH = F ;USTEER = F
 HIGHLO = F
 ************************************************************
  Group 23.Field Print-Out & Plot Control
 NPRINT = 100000 ;NUMCLS = 5
 NYPRIN = 14 ;IYPRF = 1 ;IYPRL = 70
 NZPRIN = 20 ;IZPRF = 1 ;IZPRL = 10000
 XZPR = F ;YZPR = T
 IPLTF = 1 ;IPLTL = 100000 ;NPLT = 5000
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
    7.917E-04   2.296E-02   4.513E-02   4.828E-02   4.916E-02

 Z-coordinates of the cell centres
    3.000E-02   1.230E+00   2.430E+00   3.630E+00   4.830E+00

 
 X-coordinates of the (higher) cell faces
    1.000E+00
 Y-coordinates of the (higher) cell faces
    1.583E-03   2.375E-02   4.592E-02   4.831E-02   4.919E-02

 Z-coordinates of the (higher) cell faces
    6.000E-02   1.260E+00   2.460E+00   3.660E+00   4.860E+00

 
 Total number of F-array elements used is                    343864
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 Run ending on sweep 23533 with all residuals below RESFAC ( 1.000000E-05)
 ************************************************************
 *** End of sweep 23534
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 23534
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.912E+00   9.285E-13      1.776E-12
     V1     2.596E+00   4.364E-08      1.133E-07
     W1     2.596E+00   9.986E-06      2.593E-05
     KE     7.392E-01   3.396E-08      2.510E-08
     EP     1.351E+02   6.896E-09      9.315E-07
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     4.412E-06   5.580E+02      4.910E-01 (    1,   29,   47)
     V1     1.706E-10   2.898E-03     -5.613E-03 (    1,   19,   52)
     W1     8.052E-09   9.775E-01      6.672E-02 (    1,    1,   40)
     KE     4.982E-10   1.163E-02      1.000E-10 (    1,   28,   40)
     EP     3.423E-08   1.607E+01      1.000E-10 (    1,   69,   52)
 
 
 ************************************************************
 Sources and sinks
 !! Zero nett sources are not printed !!!
 
    Nett Sources have units of mass_per_unit_time * variable
    Average values have units of the variable
 
    Typically the units of the sources are:
        U1,V1,W1 - Force  - Newtons
        R1       - Mass   - kg/s
        TEM1,H1  - Energy - Watts
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-1.252943E-03
 pos. sum=0. neg. sum=-1.252943E-03
 nett sum=-1.252943E-03
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 7.018679E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-7.212999E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-6.765991E-01
 pos. sum=0.701868 neg. sum=-1.397899
 nett sum=-0.696031
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 9.358238E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-9.358238E-01 (Mass Out -9.358238E-01 In 0.000000E+00)
 pos. sum=0.935824 neg. sum=-0.935824
 nett sum=-6.661338E-16
 
 Nett source of KE   at patch named: OB1      (INLE1       ) = 5.264009E-17 (Average  5.625000E-17)
 Nett source of KE   at patch named: OB2      (OUTL2       ) =-4.728577E-03 (Ave Out  5.052849E-03 In  0.000000E+00)
 Nett source of KE   at patch named: OB3      (PLAT3       ) =-5.718676E-15
 Nett source of KE   at patch named: KESOURCE                =-3.757605E-01
 Non-linearised source for KE    at: KESOURCE                = 3.567671E-01
 pos. sum=0.356767 neg. sum=-0.380489
 nett sum=-0.023722
 
 Nett source of EP   at patch named: OB1      (INLE1       ) = 1.297485E-23 (Average  1.386463E-23)
 Nett source of EP   at patch named: OB2      (OUTL2       ) =-5.208691E-02 (Ave Out  5.565889E-02 In  0.000000E+00)
 Nett source of EP   at patch named: OB3      (PLAT3       ) =-8.818064E-12
 Nett source of EP   at patch named: KESOURCE                =-8.890188E+01
 Non-linearised source for EP    at: KESOURCE                = 4.474117E+01
 pos. sum=44.741172 neg. sum=-88.953969
 nett sum=-44.212797
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep 23534
    Variable      Inflow        Outflow       Nett
       P1       9.358238E-01 -9.358238E-01 -6.661338E-16
       V1       0.000000E+00 -1.252943E-03 -1.252943E-03
       W1       7.018679E-01 -1.397899E+00 -6.960311E-01
       KE       3.567671E-01 -3.804891E-01 -2.372199E-02
       EP       4.474117E+01 -8.895397E+01 -4.421280E+01
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 50 IZMON= 84 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   0.0000E+00   1.0000E-10   1.0000E-10   1.0000E-10   1.0000E-10
   5001   4.5204E+02  -4.8799E-10   3.3989E-01   2.1623E-02   4.5567E-01
  10001   1.1059E+02  -7.0356E-08   4.7049E-01   7.6684E-03   1.9197E-01
  15001   8.7100E+01  -3.0365E-07   4.7856E-01   7.0219E-03   1.9028E-01
  20001   8.6926E+01  -3.3165E-07   4.7857E-01   7.0169E-03   1.9026E-01
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval=  0.000E+00 -3.316E-07  1.000E-10  1.000E-10  1.000E-10
     Maxval=  4.520E+02  1.000E-10  4.786E-01  2.162E-02  4.557E-01
     Cellav=  1.473E+02 -1.412E-07  3.535E-01  8.666E-03  2.056E-01
 1.00 2....+....+..5.+....+....3....+....+..3.+....+....3
      .                                                 .
 0.90 +                                                 +
      .                                                 .
 0.80 +                        2                        +
      .                                                 .
 0.70 +            3                                    +
      .                                                 .
 0.60 +                                                 +
      .                                                 .
 0.50 +                                                 +
      .                                                 .
 0.40 +                        5            5           5
      .                        4                        .
 0.30 +                                     4           4
      .                        1                        .
 0.20 +                                     1           1
      .                                                 .
 0.10 +                                     2           +
      .                                                 .
 0.00 5....+....+....+....+....+....+....+....+....+....2
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 2.00E+04
 
 ************************************************************
 
 ************************************************************
 residuals vs sweep or iteration number
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   1.1000E+00   8.7282E-11   3.8952E-01   7.6411E-10   1.3883E-09
   5001   3.7346E-08   1.1636E-04   4.2168E-01   8.4172E-04   3.6145E-04
  10001   8.5646E-09   4.5712E-05   5.8638E-02   3.4986E-04   6.5803E-05
  15001   1.5502E-10   3.9882E-06   9.4894E-04   4.6253E-06   8.4567E-07
  20001   4.6582E-12   2.7738E-07   6.1618E-05   2.1522E-07   4.4701E-08
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval= -2.609E+01 -2.316E+01 -9.695E+00 -2.099E+01 -2.040E+01
     Maxval=  9.531E-02 -9.059E+00 -8.635E-01 -7.080E+00 -7.925E+00
 1.00 3....+....+..5.+....+....+....+....+....+....+....+
      .                        4                        .
 0.90 +                                                 +
      .                        5                        .
 0.80 +                        3                        +
      .                                     2           .
 0.70 +                                                 +
      .                                     4           .
 0.60 +                                                 +
      .                                                 2
 0.50 +                                     5           +
      .                                                 .
 0.40 +                                                 4
      .            1                                    .
 0.30 +                        1            3           5
      .                                                 .
 0.20 +                                                 +
      .                                     1           .
 0.10 +                                                 +
      .                                                 .
 0.00 5....+....+....+....+....+....+....+....+....+....3
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 2.00E+04
 
 ************************************************************
 
 ************************************************************
  Patch-wise Printout from GXYPLS
Variable= Sk.Fr.Co, at patch named: OB3      and  IX=     1
 IY=    70  2.971E-01  4.787E-01  4.539E-01  4.473E-01  4.499E-01
 IZ=          1         21         41         61         81
 
 ************************************************************
 
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 17:24:42 on Monday, 23 December 2024                           
 Run completed at 17:30:59 on Monday, 23 December 2024                         
 CPU time of run 379 s
 This includes 379 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 4.601E-07
 ************************************************************
