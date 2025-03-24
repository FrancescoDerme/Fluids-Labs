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
 Number used before BFC allowance is                         300291
 Number used after BFC allowance is                          300291
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
 xg =0.5 yg =0.048183 zg =2.535
 smallest cell volume divided by average is   6.402603946653625E-002  at:
 ix = 1 iy = 1 iz = 58
 xg =0.5 yg =8.166668E-04 zg =1.725
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
 ZWLAST =3.
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
 SOLUTN(WDIS,Y,N,N,N,N,N)
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
 IXMON = 1 ;IYMON = 30 ;IZMON = 100
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
    1.500E-02   6.150E-01   1.215E+00   1.815E+00   2.415E+00

 
 X-coordinates of the (higher) cell faces
    1.000E+00
 Y-coordinates of the (higher) cell faces
    1.633E-03   2.123E-02   4.083E-02   4.923E-02   4.963E-02

 Z-coordinates of the (higher) cell faces
    3.000E-02   6.300E-01   1.230E+00   1.830E+00   2.430E+00

 
 Total number of F-array elements used is                    301543
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 *** End of sweep 15000
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 15000
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.895E+00   4.403E-09      8.344E-09
     V1     1.813E+00   8.035E-07      1.457E-06
     W1     1.813E+00   4.803E-05      8.708E-05
     KE     3.972E-03   5.886E-01      2.338E-03
     EP     5.534E+02   1.385E+00      7.666E+02
     LTLS   1.100E+00   3.409E-03      3.750E-03
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     2.482E-04   1.923E+02      2.699E-02 (    1,   29,   13)
     V1     9.010E-07   1.118E-03     -6.053E-03 (    1,   27,   18)
     W1     4.006E-05   9.130E-01      2.325E-02 (    1,   28,   18)
     KE     6.856E-06   5.802E-03      1.000E-10 (    1,   27,   18)
     EP     5.855E-04   7.670E-01      1.000E-10 (    1,   27,   18)
     LTLS   6.258E-04   6.258E-04      4.166E-07 (    1,    1,    3)
 
 
 ************************************************************
 Sources and sinks
 !! Zero nett sources are not printed !!!
 
    Nett Sources have units of mass_per_unit_time * variable
    Average values have units of the variable
 
    Typically the units of the sources are:
        U1,V1,W1 - Force  - Newtons
        R1       - Mass   - kg/s
        TEM1,H1  - Energy - Watts
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-3.484661E-04
 pos. sum=0. neg. sum=-3.484661E-04
 nett sum=-3.484661E-04
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 7.018679E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-7.181723E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-2.228133E-01
 pos. sum=0.701868 neg. sum=-0.940986
 nett sum=-0.239118
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 9.358238E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-9.358238E-01 (Mass Out -9.358238E-01 In 0.000000E+00)
 pos. sum=0.935824 neg. sum=-0.935824
 nett sum=-7.771561E-16
 
 Nett source of KE   at patch named: OB1      (INLE1       ) = 5.264009E-17 (Average  5.625000E-17)
 Nett source of KE   at patch named: OB2      (OUTL2       ) =-3.129571E-03 (Ave Out  3.344188E-03 In  0.000000E+00)
 Nett source of KE   at patch named: OB3      (PLAT3       ) =-9.037524E-10
 Nett source of KE   at patch named: KESOURCE                = 7.982610E-04
 pos. sum=7.98261E-04 neg. sum=-3.129572E-03
 nett sum=-2.331311E-03
 
 Nett source of EP   at patch named: OB1      (INLE1       ) = 1.297485E-23 (Average  1.386463E-23)
 Nett source of EP   at patch named: OB2      (OUTL2       ) =-1.610772E-02 (Ave Out  1.721235E-02 In  0.000000E+00)
 Nett source of EP   at patch named: KESOURCE                = 5.532109E+02
 pos. sum=553.210881 neg. sum=-0.016108
 nett sum=553.194774
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep 15000
    Variable      Inflow        Outflow       Nett
       P1       9.358238E-01 -9.358238E-01 -7.771561E-16
       V1       0.000000E+00 -3.484661E-04 -3.484661E-04
       W1       7.018679E-01 -9.409855E-01 -2.391177E-01
       KE       7.982610E-04 -3.129572E-03 -2.331311E-03
       EP       5.532109E+02 -1.610772E-02  5.531948E+02
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 30 IZMON= 100 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   0.0000E+00   1.0000E-10   0.0000E+00   1.0000E-10   1.0000E-10
    751   4.7346E-02   1.5045E-03  -8.6270E-17   9.6780E-03   2.1954E-01
   1501   5.1541E-02   1.1428E-03  -8.6270E-17   7.2296E-03   1.4241E-01
   2251   5.4098E-02   9.0067E-04  -8.6270E-17   5.8760E-03   1.0472E-01
   3001   5.5554E-02   7.8764E-04  -8.6270E-17   5.2301E-03   8.8104E-02
   3751   5.6431E-02   7.2956E-04  -8.6270E-17   4.8914E-03   7.9800E-02
   4501   5.6838E-02   7.0561E-04  -8.6270E-17   4.6740E-03   7.4605E-02
   5251   5.7038E-02   6.9532E-04  -8.6270E-17   4.5656E-03   7.2058E-02
   6001   5.7135E-02   6.9082E-04  -8.6270E-17   4.5117E-03   7.0803E-02
   6751   5.7182E-02   6.8877E-04  -8.6270E-17   4.4849E-03   7.0180E-02
   7501   5.7205E-02   6.8780E-04  -8.6270E-17   4.4717E-03   6.9877E-02
   8251   5.7216E-02   6.8731E-04  -8.6270E-17   4.4653E-03   6.9727E-02
   9001   5.7221E-02   6.8706E-04  -8.6270E-17   4.4621E-03   6.9654E-02
   9751   5.7223E-02   6.8692E-04  -8.6270E-17   4.4606E-03   6.9618E-02
  10501   5.7224E-02   6.8684E-04  -8.6270E-17   4.4598E-03   6.9601E-02
  11251   5.7225E-02   6.8680E-04  -8.6270E-17   4.4594E-03   6.9592E-02
  12001   5.7225E-02   6.8678E-04  -8.6270E-17   4.4593E-03   6.9588E-02
  12751   5.7225E-02   6.8676E-04  -8.6270E-17   4.4592E-03   6.9586E-02
  13501   5.7225E-02   6.8675E-04  -8.6270E-17   4.4591E-03   6.9585E-02
  14251   5.7225E-02   6.8675E-04  -8.6270E-17   4.4591E-03   6.9585E-02
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval=  0.000E+00  1.000E-10 -8.627E-17  1.000E-10  1.000E-10
     Maxval=  5.723E-02  1.505E-03  0.000E+00  9.678E-03  2.195E-01
     Cellav=  5.327E-02  7.358E-04 -8.196E-17  4.788E-03  8.093E-02
 1.00 3..5.+....+..1.+1.1.+1..1+1..1+.1.1+.1.1+.1..1.1..1
      .       1  1                                      .
 0.90 +    1                                            +
      .  1                                              .
 0.80 +                                                 +
      .    4                                            .
 0.70 +                                                 +
      .    5                                            .
 0.60 +       4                                         +
      .          4                                      .
 0.50 +       5  2 4  4                                 +
      .               2 4  4  4 4  4  4 4  4 4  4  4 4  4
 0.40 +          5                                      +
      .            5  5 5                               .
 0.30 +                    5  5 5  5  5 5  5 5  5  5 5  5
      .                                                 .
 0.20 +                                                 +
      .                                                 .
 0.10 +                                                 +
      .                                                 .
 0.00 5..3.3..3.+3.3.+3.3.+3..3+3..3+.3.3+.3.3+.3..3.3..3
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
 residuals vs sweep or iteration number
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   1.1000E+00   8.6170E-11   3.8952E-01   3.9770E-08   9.3874E-01
    751   4.0689E-07   3.1355E-04   2.0676E-01   2.5483E-01   1.1570E+00
   1501   5.7020E-08   1.7118E-04   1.2182E-01   3.2001E-01   1.1306E+00
   2251   3.7625E-08   1.1581E-04   6.6438E-02   4.1041E-01   1.3330E+00
   3001   7.7560E-08   8.3373E-05   4.0645E-02   4.7200E-01   1.5983E+00
   3751   1.5592E-08   4.5756E-05   2.1383E-02   5.1626E-01   1.4423E+00
   4501   7.4140E-09   2.8481E-05   1.1321E-02   5.5126E-01   1.5847E+00
   5251   6.9444E-09   1.7923E-05   6.0129E-03   5.7005E-01   1.5835E+00
   6001   3.5650E-09   1.1152E-05   3.2207E-03   5.7808E-01   1.6458E+00
   6751   3.6709E-09   6.7019E-06   1.6988E-03   5.8307E-01   1.5957E+00
   7501   1.1044E-08   5.1795E-06   9.9120E-04   5.8713E-01   1.1951E+00
   8251   9.7649E-09   3.2321E-06   5.4133E-04   5.8817E-01   1.1226E+00
   9001   8.3498E-09   2.4072E-06   3.1235E-04   5.8833E-01   1.0978E+00
   9751   8.2041E-09   1.8272E-06   1.9282E-04   5.8874E-01   1.0547E+00
  10501   8.1541E-09   1.4965E-06   1.2829E-04   5.8893E-01   1.0362E+00
  11251   8.1229E-09   1.2983E-06   9.4515E-05   5.8902E-01   1.0267E+00
  12001   8.1030E-09   1.1796E-06   7.6834E-05   5.8908E-01   1.0217E+00
  12751   8.0904E-09   1.1082E-06   6.7577E-05   5.8911E-01   1.0193E+00
  13501   8.0822E-09   1.0651E-06   6.2725E-05   5.8912E-01   1.0180E+00
  14251   8.0766E-09   1.0388E-06   6.0184E-05   5.8913E-01   1.0173E+00
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
     Minval= -1.945E+01 -2.317E+01 -9.718E+00 -1.704E+01 -6.321E-02
     Maxval=  9.531E-02 -8.068E+00 -9.428E-01 -5.291E-01  4.982E-01
   Variable    6 = LTLS
     Minval= -4.605E+01
     Maxval= -4.605E+01
 1.00 3..2.+..4.+4.4.+4.4.+5..4+4..4+.4.4+.4.4+.4..4.4..4
      .  4 4  2  5    5 5     5                         .
 0.90 +          2                                      +
      .    3       2  2                                 .
 0.80 +       3         2  2                            +
      .          3 5          2 2                       .
 0.70 +                            2  2                 +
      .            3                    2  2 2  2  2    .
 0.60 +       5       3                              2  2
      .                                                 .
 0.50 +                 3                               +
      .                    3    5                       .
 0.40 +                       3                         +
      .  5 5                                            .
 0.30 +                         3  5  5                 +
      .  1                         3                    .
 0.20 +                               3 5  5            +
      .    1     1                      3    5  5  5 5  5
 0.10 +       1    1                       3            +
      .               1 1       1  1  1 1  1 3  3  1 1  1
 0.00 6..6.6..6.+6.6.+6.6.+6..6+6..6+.6.6+.6.6+.6..6.6..6
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
  Patch-wise Printout from GXYPLS
Variable= Sk.Fr.Co, at patch named: OB3      and  IX=     1
 IY=    60  9.645E-01  2.370E+00  2.552E+00  2.595E+00  2.586E+00
 IZ=          1         21         41         61         81
 
 ************************************************************
 
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 10:05:48 on Thursday, 26 December 2024                         
 Run completed at 10:16:37 on Thursday, 26 December 2024                       
 CPU time of run 651 s
 This includes 651 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 1.206E-06
 ************************************************************
