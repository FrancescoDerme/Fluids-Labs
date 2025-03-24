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
 Number used before BFC allowance is                         596089
 Number used after BFC allowance is                          596089
 ************************************************************
 
  Two-layer low-Re k-e model constants
 
 AK =0.41 EWAL =8.6
 CMU =0.5478 CD =0.1643 CMUCD =0.090004
 C1E =1.44 C2E =1.92
 
 The foregoing constants may be changed
 from the Q1 file by setting:
 SPEDAT(KECONST,name of constant,R,value)
 
 ************************************************************
 biggest cell volume divided by average is     3.77765267420891       at:
 ix = 1 iy = 30 iz = 114
 xg =0.5 yg =0.048183 zg =3.405
 smallest cell volume divided by average is   6.402539919973557E-002  at:
 ix = 1 iy = 1 iz = 113
 xg =0.5 yg =8.166668E-04 zg =3.375
 ratio of smallest to biggest is   1.694846104747925E-002
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
 NZ = 200
 ZWLAST =6.
 ZFRAC(1)=5.0E-03 ;ZFRAC(41)=0.205
 ZFRAC(81)=0.405 ;ZFRAC(121)=0.605
 ZFRAC(161)=0.805
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
 PATCH(OB2 ,HIGH , 1, 1, 1, 60, 200, 200, 1, 1)
 COVAL(OB2 ,P1 ,1.0E+04 ,0. )
 COVAL(OB2 ,V1 ,0. ,0. )
 COVAL(OB2 ,W1 ,0. ,0. )
 COVAL(OB2 ,KE ,0. , SAME )
 COVAL(OB2 ,EP ,0. , SAME )
 
   Parent VR object for this patch is: PLAT3         
 PATCH(OB3 ,NWALL , 1, 1, 60, 60, 1, 200, 1, 1)
 COVAL(OB3 ,W1 , GRND2 ,0. )
 COVAL(OB3 ,KE ,1. ,0. )
 
 PATCH(KESOURCE,PHASEM, 1, 1, 1, 60, 1, 200, 1, 1)
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
 IXMON = 1 ;IYMON = 30 ;IZMON = 100
 NPRMON = 100000 ;NPRMNT = 1 ;TSTSWP = 10001
 UWATCH = F ;USTEER = F
 HIGHLO = F
 ************************************************************
  Group 23.Field Print-Out & Plot Control
 NPRINT = 15000 ;NUMCLS = 5
 NYPRIN = 12 ;IYPRF = 1 ;IYPRL = 60
 NZPRIN = 40 ;IZPRF = 1 ;IZPRL = 10000
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
    1.500E-02   1.215E+00   2.415E+00   3.615E+00   4.815E+00

 
 X-coordinates of the (higher) cell faces
    1.000E+00
 Y-coordinates of the (higher) cell faces
    1.633E-03   2.123E-02   4.083E-02   4.923E-02   4.963E-02

 Z-coordinates of the (higher) cell faces
    3.000E-02   1.230E+00   2.430E+00   3.630E+00   4.830E+00

 
 Total number of F-array elements used is                    598041
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 *** End of sweep 15000
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 15000
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.896E+00   6.277E-09      1.190E-08
     V1     2.169E+00   7.331E-07      1.590E-06
     W1     2.169E+00   3.954E-05      8.579E-05
     KE     6.399E-03   7.374E-01      4.719E-03
     EP     1.054E+04   1.123E+00      1.183E+04
     LTLS   1.100E+00   6.818E-03      7.500E-03
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     3.893E-04   3.637E+02      2.711E-02 (    1,   29,   13)
     V1     9.006E-07   1.115E-03     -6.053E-03 (    1,   27,   18)
     W1     4.005E-05   9.130E-01      2.325E-02 (    1,   28,   18)
     KE     7.094E-06   5.802E-03      1.000E-10 (    1,   18,   22)
     EP     5.854E-04   7.670E-01      1.000E-10 (    1,   27,   18)
     LTLS   6.278E-04   6.278E-04      4.166E-07 (    1,    1,    2)
 
 
 ************************************************************
 Sources and sinks
 !! Zero nett sources are not printed !!!
 
    Nett Sources have units of mass_per_unit_time * variable
    Average values have units of the variable
 
    Typically the units of the sources are:
        U1,V1,W1 - Force  - Newtons
        R1       - Mass   - kg/s
        TEM1,H1  - Energy - Watts
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-2.509415E-04
 pos. sum=0. neg. sum=-2.509415E-04
 nett sum=-2.509415E-04
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 7.018679E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-7.172616E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-4.379981E-01
 pos. sum=0.701868 neg. sum=-1.15526
 nett sum=-0.453392
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 9.358238E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-9.358238E-01 (Mass Out -9.358238E-01 In 0.000000E+00)
 pos. sum=0.935824 neg. sum=-0.935824
 nett sum=-2.553513E-15
 
 Nett source of KE   at patch named: OB1      (INLE1       ) = 5.264009E-17 (Average  5.625000E-17)
 Nett source of KE   at patch named: OB2      (OUTL2       ) =-3.009013E-03 (Ave Out  3.215362E-03 In  0.000000E+00)
 Nett source of KE   at patch named: OB3      (PLAT3       ) =-1.807505E-09
 Nett source of KE   at patch named: KESOURCE                =-1.701519E-03
 pos. sum=5.264009E-17 neg. sum=-4.710534E-03
 nett sum=-4.710534E-03
 
 Nett source of EP   at patch named: OB1      (INLE1       ) = 1.297485E-23 (Average  1.386463E-23)
 Nett source of EP   at patch named: OB2      (OUTL2       ) =-1.590102E-02 (Ave Out  1.699147E-02 In  0.000000E+00)
 Nett source of EP   at patch named: KESOURCE                =-1.053513E+04
 pos. sum=1.297485E-23 neg. sum=-1.053515E+04
 nett sum=-1.053515E+04
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep 15000
    Variable      Inflow        Outflow       Nett
       P1       9.358238E-01 -9.358238E-01 -2.553513E-15
       V1       0.000000E+00 -2.509415E-04 -2.509415E-04
       W1       7.018679E-01 -1.155260E+00 -4.533918E-01
       KE       5.264009E-17 -4.710534E-03 -4.710534E-03
       EP       1.297485E-23 -1.053515E+04 -1.053515E+04
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 30 IZMON= 100 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   0.0000E+00   1.0000E-10   1.0000E-10   1.0000E-10   1.0000E-10
    751   4.2149E+02  -5.0192E-08   4.5154E-01   1.1638E-02   2.8885E-01
   1501   3.0106E+02  -1.1288E-07   5.0947E-01   8.2125E-03   1.7207E-01
   2251   2.3450E+02   7.8154E-07   5.4067E-01   6.3574E-03   1.1768E-01
   3001   2.0334E+02   2.2774E-06   5.5711E-01   5.4951E-03   9.4836E-02
   3751   1.9046E+02   3.4171E-06   5.6715E-01   5.1123E-03   8.5191E-02
   4501   1.8100E+02   4.2369E-06   5.7156E-01   4.8648E-03   7.9155E-02
   5251   1.7615E+02   4.6461E-06   5.7370E-01   4.7445E-03   7.6274E-02
   6001   1.7365E+02   4.8102E-06   5.7473E-01   4.6859E-03   7.4882E-02
   6751   1.7236E+02   4.8503E-06   5.7522E-01   4.6570E-03   7.4201E-02
   7501   1.7169E+02   4.8394E-06   5.7546E-01   4.6431E-03   7.3872E-02
   8251   1.7135E+02   4.8136E-06   5.7557E-01   4.6363E-03   7.3711E-02
   9001   1.7117E+02   4.7879E-06   5.7562E-01   4.6330E-03   7.3633E-02
   9751   1.7108E+02   4.7673E-06   5.7564E-01   4.6313E-03   7.3595E-02
  10501   1.7103E+02   4.7526E-06   5.7566E-01   4.6305E-03   7.3577E-02
  11251   1.7101E+02   4.7426E-06   5.7566E-01   4.6302E-03   7.3568E-02
  12001   1.7100E+02   4.7361E-06   5.7566E-01   4.6300E-03   7.3564E-02
  12751   1.7099E+02   4.7319E-06   5.7567E-01   4.6299E-03   7.3561E-02
  13501   1.7099E+02   4.7293E-06   5.7567E-01   4.6299E-03   7.3560E-02
  14251   1.7099E+02   4.7278E-06   5.7567E-01   4.6298E-03   7.3560E-02
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval=  0.000E+00 -1.129E-07  1.000E-10  1.000E-10  1.000E-10
     Maxval=  4.215E+02  4.850E-06  5.757E-01  1.164E-02  2.889E-01
     Cellav=  1.883E+02  3.624E-06  5.339E-01  5.105E-03  8.997E-02
 1.00 +..5.+....+..3.+3.3.+3..3+3..3+.3.3+.3.3+.3..3.3..3
      .       3  3      2                               .
 0.90 +    3          2                                 +
      .                                                 .
 0.80 +  3                                              +
      .                                                 .
 0.70 +    4       2                                    +
      .                                                 .
 0.60 +    5                                            +
      .       4                                         .
 0.50 +          2                                      +
      .          4 4  1                                 .
 0.40 +       5       4 4  4  4 4  4  4 4  4 4  4  4 4  4
      .          5                                      .
 0.30 +            5                                    +
      .               5 5  5  5 5  5  5 5  5 5  5  5 5  5
 0.20 +       2                                         +
      .                                                 .
 0.10 +                                                 +
      .                                                 .
 0.00 5..2.2....+....+....+....+....+....+....+....+....+
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
 residuals vs sweep or iteration number
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   1.1000E+00   8.7266E-11   3.8952E-01   7.9456E-08   1.0297E+00
    751   4.0856E-07   2.3873E-04   3.1924E-01   4.2389E-01   1.1149E+00
   1501   5.7321E-08   1.4088E-04   1.9724E-01   5.6519E-01   1.1221E+00
   2251   3.9102E-08   1.0312E-04   1.0981E-01   6.4919E-01   1.3017E+00
   3001   3.0891E-07   8.6854E-05   6.6138E-02   7.5725E-01   1.4714E+00
   3751   1.6987E-08   4.2831E-05   3.5423E-02   7.1810E-01   1.4363E+00
   4501   8.3990E-09   2.6853E-05   1.8606E-02   7.3390E-01   1.5375E+00
   5251   8.3784E-09   1.6989E-05   9.7575E-03   7.3841E-01   1.5591E+00
   6001   4.0124E-09   1.0757E-05   5.1283E-03   7.3787E-01   1.5965E+00
   6751   3.2731E-09   6.5725E-06   2.6768E-03   7.3743E-01   1.6096E+00
   7501   1.1203E-08   4.8808E-06   1.4661E-03   7.3800E-01   1.2684E+00
   8251   9.8673E-09   3.0578E-06   7.7739E-04   7.3772E-01   1.1800E+00
   9001   9.9799E-09   2.2610E-06   4.2780E-04   7.3747E-01   1.3716E+00
   9751   7.9974E-09   1.6683E-06   2.4257E-04   7.3711E-01   1.4942E+00
  10501   7.9324E-09   1.3368E-06   1.4731E-04   7.3707E-01   1.4574E+00
  11251   7.8919E-09   1.1373E-06   9.8156E-05   7.3705E-01   1.4266E+00
  12001   7.8663E-09   1.0169E-06   7.2820E-05   7.3703E-01   1.4048E+00
  12751   7.8503E-09   9.4396E-07   5.9767E-05   7.3703E-01   1.3924E+00
  13501   7.8402E-09   8.9972E-07   5.3045E-05   7.3703E-01   1.3858E+00
  14251   7.8336E-09   8.7254E-07   4.9590E-05   7.3702E-01   1.3825E+00
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
     Minval= -1.954E+01 -2.316E+01 -9.912E+00 -1.635E+01  2.931E-02
     Maxval=  9.531E-02 -8.340E+00 -9.428E-01 -2.781E-01  4.760E-01
   Variable    6 = LTLS
     Minval= -4.605E+01
     Maxval= -4.605E+01
 1.00 3..3.4..4.+4.4.+4.4.+5..5+4..4+.4.4+.4.4+.4..4.4..4
      .  4 2  2  2      5                               .
 0.90 +    3       2  5                                 +
      .       3       2                 5               .
 0.80 +          5      2  2               5            +
      .            5          2 2            5          .
 0.70 +                            2  2         5  5    +
      .               3               5 2  2 2  2  2 5  5
 0.60 +                 3                            2  2
      .                                                 .
 0.50 +       5            3                            +
      .                       3 5                       .
 0.40 +                         3                       +
      .                                                 .
 0.30 +                            5                    +
      .  1       1                    3                 .
 0.20 +  5 5                            3               +
      .    1  1                                         .
 0.10 +            1                       3 3          +
      .               1 1       1  1  1 1  1 1  3  1 1  1
 0.00 6..6.6..6.+6.6.+6.6.+6..6+6..6+.6.6+.6.6+.6..6.6..6
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
  Patch-wise Printout from GXYPLS
Variable= Sk.Fr.Co, at patch named: OB3      and  IX=     1
 IY=    60  9.645E-01  2.552E+00  2.586E+00  2.537E+00  2.530E+00
 IZ=          1         41         81        121        161
 
 ************************************************************
 
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 11:10:43 on Thursday, 26 December 2024                         
 Run completed at 11:31:54 on Thursday, 26 December 2024                       
 CPU time of run 1273 s
 This includes 1273 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 1.179E-06
 ************************************************************
