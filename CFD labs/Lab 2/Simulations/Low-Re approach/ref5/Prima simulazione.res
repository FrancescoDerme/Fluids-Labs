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
 Number used before BFC allowance is                         670309
 Number used after BFC allowance is                          670309
 ************************************************************
 
  Two-layer low-Re k-e model constants
 
 AK =0.41 EWAL =8.6
 CMU =0.5478 CD =0.1643 CMUCD =0.090004
 C1E =1.44 C2E =1.92
 
 The foregoing constants may be changed
 from the Q1 file by setting:
 SPEDAT(KECONST,name of constant,R,value)
 
 ************************************************************
 biggest cell volume divided by average is     2.85724136168435       at:
 ix = 1 iy = 60 iz = 80
 xg =0.5 yg =0.048592 zg =3.18
 smallest cell volume divided by average is   2.400975010009974E-002  at:
 ix = 1 iy = 1 iz = 45
 xg =0.5 yg =4.083333E-04 zg =1.78
 ratio of smallest to biggest is   8.403122824018592E-003
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
 NY = 90
 YVLAST =0.05
 YFRAC(1)=0.016333 ;YFRAC(19)=0.310333
 YFRAC(37)=0.604333 ;YFRAC(55)=0.898333
 YFRAC(73)=0.988667
 ************************************************************
  Group 5. Z-Direction Grid Spacing
 PARAB = F
 NZ = 150
 ZWLAST =6.
 ZFRAC(1)=6.666667E-03 ;ZFRAC(31)=0.206667
 ZFRAC(61)=0.406667 ;ZFRAC(91)=0.606667
 ZFRAC(121)=0.806667
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
 PATCH(OB1 ,LOW , 1, 1, 1, 90, 1, 1, 1, 1)
 COVAL(OB1 ,P1 , FIXFLU ,748.6725 )
 COVAL(OB1 ,V1 ,0. ,0. )
 COVAL(OB1 ,W1 ,0. ,0.75 )
 COVAL(OB1 ,KE ,0. ,5.625E-17 )
 COVAL(OB1 ,EP ,0. ,1.386463E-23 )
 
   Parent VR object for this patch is: OUTL2         
 PATCH(OB2 ,HIGH , 1, 1, 1, 90, 150, 150, 1, 1)
 COVAL(OB2 ,P1 ,1.0E+04 ,0. )
 COVAL(OB2 ,V1 ,0. ,0. )
 COVAL(OB2 ,W1 ,0. ,0. )
 COVAL(OB2 ,KE ,0. , SAME )
 COVAL(OB2 ,EP ,0. , SAME )
 
   Parent VR object for this patch is: PLAT3         
 PATCH(OB3 ,NWALL , 1, 1, 90, 90, 1, 150, 1, 1)
 COVAL(OB3 ,W1 , GRND2 ,0. )
 COVAL(OB3 ,KE ,1. ,0. )
 
 PATCH(KESOURCE,PHASEM, 1, 1, 1, 90, 1, 150, 1, 1)
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
 IXMON = 1 ;IYMON = 59 ;IZMON = 75
 NPRMON = 100000 ;NPRMNT = 1 ;TSTSWP = 10001
 UWATCH = F ;USTEER = F
 HIGHLO = F
 ************************************************************
  Group 23.Field Print-Out & Plot Control
 NPRINT = 15000 ;NUMCLS = 5
 NYPRIN = 18 ;IYPRF = 1 ;IYPRL = 90
 NZPRIN = 30 ;IZPRF = 1 ;IZPRL = 10000
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
    4.083E-04   1.511E-02   2.981E-02   4.451E-02   4.942E-02

 Z-coordinates of the cell centres
    2.000E-02   1.220E+00   2.420E+00   3.620E+00   4.820E+00

 
 X-coordinates of the (higher) cell faces
    1.000E+00
 Y-coordinates of the (higher) cell faces
    8.167E-04   1.552E-02   3.022E-02   4.492E-02   4.943E-02

 Z-coordinates of the (higher) cell faces
    4.000E-02   1.240E+00   2.440E+00   3.640E+00   4.840E+00

 
 Total number of F-array elements used is                    672181
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 *** End of sweep 15000
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 15000
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.899E+00   5.419E-10      1.029E-09
     V1     2.115E+00   2.746E-07      5.808E-07
     W1     2.115E+00   1.244E-05      2.630E-05
     KE     6.166E-03   7.676E-01      4.733E-03
     EP     6.365E+02   1.053E+00      6.700E+02
     LTLS   1.100E+00   6.818E-03      7.500E-03
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     2.916E-05   3.601E+02      3.100E-02 (    1,   42,   16)
     V1     2.924E-07   1.084E-03     -5.365E-03 (    1,    6,   42)
     W1     4.177E-06   9.104E-01      2.310E-02 (    1,   38,   17)
     KE     2.179E-06   5.738E-03      1.000E-10 (    1,   38,   17)
     EP     3.520E-05   7.632E-01      1.000E-10 (    1,   37,   17)
     LTLS   6.259E-04   6.259E-04      4.167E-07 (    1,    1,    2)
 
 
 ************************************************************
 Sources and sinks
 !! Zero nett sources are not printed !!!
 
    Nett Sources have units of mass_per_unit_time * variable
    Average values have units of the variable
 
    Typically the units of the sources are:
        U1,V1,W1 - Force  - Newtons
        R1       - Mass   - kg/s
        TEM1,H1  - Energy - Watts
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-2.614764E-04
 pos. sum=0. neg. sum=-2.614764E-04
 nett sum=-2.614764E-04
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 7.018679E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-7.171122E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-4.343930E-01
 pos. sum=0.701868 neg. sum=-1.151505
 nett sum=-0.449637
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 9.358238E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-9.358238E-01 (Mass Out -9.358238E-01 In 0.000000E+00)
 pos. sum=0.935824 neg. sum=-0.935824
 nett sum=2.220446E-16
 
 Nett source of KE   at patch named: OB1      (INLE1       ) = 5.264009E-17 (Average  5.625000E-17)
 Nett source of KE   at patch named: OB2      (OUTL2       ) =-2.953261E-03 (Ave Out  3.155787E-03 In  0.000000E+00)
 Nett source of KE   at patch named: OB3      (PLAT3       ) =-1.807505E-09
 Nett source of KE   at patch named: KESOURCE                =-1.778527E-03
 pos. sum=5.264009E-17 neg. sum=-4.73179E-03
 nett sum=-4.73179E-03
 
 Nett source of EP   at patch named: OB1      (INLE1       ) = 1.297485E-23 (Average  1.386463E-23)
 Nett source of EP   at patch named: OB2      (OUTL2       ) =-1.565264E-02 (Ave Out  1.672605E-02 In  0.000000E+00)
 Nett source of EP   at patch named: KESOURCE                =-6.363371E+02
 pos. sum=1.297485E-23 neg. sum=-636.352754
 nett sum=-636.352754
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep 15000
    Variable      Inflow        Outflow       Nett
       P1       9.358238E-01 -9.358238E-01  2.220446E-16
       V1       0.000000E+00 -2.614764E-04 -2.614764E-04
       W1       7.018679E-01 -1.151505E+00 -4.496373E-01
       KE       5.264009E-17 -4.731790E-03 -4.731790E-03
       EP       1.297485E-23 -6.363528E+02 -6.363528E+02
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 59 IZMON= 75 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   0.0000E+00   9.9999E-11   1.0000E-10   1.0000E-10   1.0000E-10
    751   5.0661E+02  -2.8289E-08   4.3342E-01   1.6081E-02   3.8257E-01
   1501   2.9915E+02   5.1705E-07   4.9949E-01   1.0472E-02   2.0195E-01
   2251   2.3252E+02   1.3196E-06   5.4186E-01   7.4584E-03   1.2187E-01
   3001   2.0415E+02   2.1716E-06   5.6664E-01   6.0239E-03   8.8718E-02
   3751   1.8867E+02   5.1315E-06   5.7982E-01   5.2733E-03   7.2807E-02
   4501   1.7976E+02   7.7503E-06   5.8650E-01   4.8938E-03   6.5163E-02
   5251   1.7589E+02   8.8191E-06   5.9049E-01   4.7291E-03   6.1936E-02
   6001   1.7300E+02   9.4655E-06   5.9234E-01   4.6213E-03   5.9853E-02
   6751   1.7138E+02   9.6188E-06   5.9327E-01   4.5668E-03   5.8807E-02
   7501   1.7050E+02   9.5633E-06   5.9374E-01   4.5390E-03   5.8278E-02
   8251   1.7002E+02   9.4450E-06   5.9398E-01   4.5248E-03   5.8007E-02
   9001   1.6977E+02   9.3290E-06   5.9411E-01   4.5174E-03   5.7867E-02
   9751   1.6963E+02   9.2321E-06   5.9417E-01   4.5137E-03   5.7796E-02
  10501   1.6956E+02   9.1600E-06   5.9420E-01   4.5117E-03   5.7758E-02
  11251   1.6952E+02   9.1114E-06   5.9422E-01   4.5106E-03   5.7737E-02
  12001   1.6949E+02   9.0794E-06   5.9423E-01   4.5101E-03   5.7727E-02
  12751   1.6948E+02   9.0591E-06   5.9424E-01   4.5098E-03   5.7721E-02
  13501   1.6948E+02   9.0464E-06   5.9424E-01   4.5096E-03   5.7718E-02
  14251   1.6947E+02   9.0386E-06   5.9424E-01   4.5095E-03   5.7717E-02
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval=  0.000E+00 -2.829E-08  1.000E-10  1.000E-10  1.000E-10
     Maxval=  5.066E+02  9.619E-06  5.942E-01  1.608E-02  3.826E-01
     Cellav=  1.914E+02  6.841E-06  5.463E-01  5.464E-03  8.460E-02
 1.00 +..5.+....+..3.+3.3.+3..3+3..3+.3.3+.3.3+.3..3.3..3
      .          3                    2 2  2 2  2  2 2  2
 0.90 +       3         2                               +
      .    3                                            .
 0.80 +               2                                 +
      .  3                                              .
 0.70 +                                                 +
      .    4                                            .
 0.60 +    1                                            +
      .    5       2                                    .
 0.50 +                                                 +
      .       4                                         .
 0.40 +          1                                      +
      .          4 4  1 1  1  1 1  1  1 1  1 1  1  1 1  1
 0.30 +       5       4 4  4  4 4  4  4 4  4 4  4  4 4  4
      .          5                                      .
 0.20 +            5                                    +
      .       2       5 5  5  5 5  5  5 5  5 5  5  5 5  5
 0.10 +                                                 +
      .    2                                            .
 0.00 5..2.+....+....+....+....+....+....+....+....+....+
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
 residuals vs sweep or iteration number
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   1.1000E+00   8.7646E-11   3.8952E-01   7.9505E-08   1.0298E+00
    751   3.0001E-07   8.2469E-04   5.0268E-01   2.5425E-01   1.0169E+00
   1501   1.1789E-07   5.0149E-04   3.6339E-01   4.2690E-01   1.0502E+00
   2251   6.5590E-08   3.1656E-04   2.1324E-01   6.5622E-01   1.1764E+00
   3001   3.7559E-08   1.8872E-04   1.1864E-01   7.2059E-01   1.3083E+00
   3751   2.2244E-08   1.2921E-04   6.4021E-02   7.4895E-01   1.4986E+00
   4501   1.7095E-08   8.4790E-05   3.5471E-02   7.6374E-01   1.6015E+00
   5251   1.0938E-08   4.9367E-05   2.0217E-02   7.7195E-01   1.5789E+00
   6001   3.7098E-09   3.1007E-05   1.0784E-02   7.7084E-01   1.6118E+00
   6751   4.4921E-09   2.0254E-05   5.9240E-03   7.7037E-01   1.5911E+00
   7501   2.8999E-09   1.2568E-05   3.2128E-03   7.6911E-01   1.6662E+00
   8251   3.8921E-09   8.1982E-06   1.7406E-03   7.6918E-01   1.3717E+00
   9001   2.0258E-09   5.0603E-06   9.4631E-04   7.6823E-01   1.2289E+00
   9751   9.6499E-10   3.1253E-06   5.0852E-04   7.6771E-01   1.6454E+00
  10501   6.8615E-10   1.9979E-06   2.7240E-04   7.6760E-01   1.5572E+00
  11251   6.5325E-10   1.2867E-06   1.4725E-04   7.6755E-01   1.4935E+00
  12001   5.6118E-10   8.9131E-07   8.1278E-05   7.6753E-01   1.4099E+00
  12751   5.4943E-10   5.7655E-07   4.5093E-05   7.6753E-01   1.2678E+00
  13501   5.1336E-10   3.7572E-07   2.6314E-05   7.6749E-01   1.2318E+00
  14251   4.8268E-10   3.2239E-07   1.6798E-05   7.6748E-01   1.1896E+00
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
     Minval= -2.145E+01 -2.316E+01 -1.099E+01 -1.635E+01  1.674E-02
     Maxval=  9.531E-02 -7.100E+00 -6.878E-01 -2.588E-01  5.105E-01
   Variable    6 = LTLS
     Minval= -4.605E+01
     Maxval= -4.605E+01
 1.00 3..3.+..4.+4.4.+4.4.+4..4+5..4+.4.4+.4.4+.4..4.4..4
      .  4 4  2            5            5               .
 0.90 +       3  2 2  5 5     5                         +
      .          3    2                    5            .
 0.80 +            5    2  2                 5          +
      .               3       2 2                       .
 0.70 +                 3          2  2                 +
      .                    3            2       5       .
 0.60 +                            5       2 2          +
      .                       3                 2  2    .
 0.50 +          5              3                    2  2
      .                            3               5    .
 0.40 +                               5              5  +
      .                                 3               .
 0.30 +  1    5                                         5
      .    1  1                            3            .
 0.20 +          1 1                         3          +
      .               1 1                       3       .
 0.10 +                    1  1 1  1               3    +
      5    5                          1 1            3  .
 0.00 6..6.6..6.+6.6.+6.6.+6..6+6..6+.6.6+.6.6+.6..6.6..6
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
  Patch-wise Printout from GXYPLS
Variable= Sk.Fr.Co, at patch named: OB3      and  IX=     1
 IY=    90  1.067E+00  2.563E+00  2.605E+00  2.559E+00  2.551E+00
 IZ=          1         31         61         91        121
 
 ************************************************************
 
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 11:33:08 on Thursday, 26 December 2024                         
 Run completed at 11:54:24 on Thursday, 26 December 2024                       
 CPU time of run 1278 s
 This includes 1278 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 1.052E-06
 ************************************************************
