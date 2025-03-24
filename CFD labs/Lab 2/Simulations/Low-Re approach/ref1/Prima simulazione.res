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
 Number used before BFC allowance is                         448909
 Number used after BFC allowance is                          448909
 ************************************************************
 
  Two-layer low-Re k-e model constants
 
 AK =0.41 EWAL =8.6
 CMU =0.5478 CD =0.1643 CMUCD =0.090004
 C1E =1.44 C2E =1.92
 
 The foregoing constants may be changed
 from the Q1 file by setting:
 SPEDAT(KECONST,name of constant,R,value)
 
 ************************************************************
 biggest cell volume divided by average is     2.85721278984217       at:
 ix = 1 iy = 60 iz = 85
 xg =0.5 yg =0.048592 zg =5.07
 smallest cell volume divided by average is   2.400975010009946E-002  at:
 ix = 1 iy = 1 iz = 58
 xg =0.5 yg =4.083333E-04 zg =3.45
 ratio of smallest to biggest is   8.403206854406436E-003
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
 PATCH(OB1 ,LOW , 1, 1, 1, 90, 1, 1, 1, 1)
 COVAL(OB1 ,P1 , FIXFLU ,748.6725 )
 COVAL(OB1 ,V1 ,0. ,0. )
 COVAL(OB1 ,W1 ,0. ,0.75 )
 COVAL(OB1 ,KE ,0. ,5.625E-17 )
 COVAL(OB1 ,EP ,0. ,1.386463E-23 )
 
   Parent VR object for this patch is: OUTL2         
 PATCH(OB2 ,HIGH , 1, 1, 1, 90, 100, 100, 1, 1)
 COVAL(OB2 ,P1 ,1.0E+04 ,0. )
 COVAL(OB2 ,V1 ,0. ,0. )
 COVAL(OB2 ,W1 ,0. ,0. )
 COVAL(OB2 ,KE ,0. , SAME )
 COVAL(OB2 ,EP ,0. , SAME )
 
   Parent VR object for this patch is: PLAT3         
 PATCH(OB3 ,NWALL , 1, 1, 90, 90, 1, 100, 1, 1)
 COVAL(OB3 ,W1 , GRND2 ,0. )
 COVAL(OB3 ,KE ,1. ,0. )
 
 PATCH(KESOURCE,PHASEM, 1, 1, 1, 90, 1, 100, 1, 1)
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
 IXMON = 1 ;IYMON = 59 ;IZMON = 50
 NPRMON = 100000 ;NPRMNT = 1 ;TSTSWP = 10001
 UWATCH = F ;USTEER = F
 HIGHLO = F
 ************************************************************
  Group 23.Field Print-Out & Plot Control
 NPRINT = 15000 ;NUMCLS = 5
 NYPRIN = 18 ;IYPRF = 1 ;IYPRL = 90
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
    4.083E-04   1.511E-02   2.981E-02   4.451E-02   4.942E-02

 Z-coordinates of the cell centres
    3.000E-02   1.230E+00   2.430E+00   3.630E+00   4.830E+00

 
 X-coordinates of the (higher) cell faces
    1.000E+00
 Y-coordinates of the (higher) cell faces
    8.167E-04   1.552E-02   3.022E-02   4.492E-02   4.943E-02

 Z-coordinates of the (higher) cell faces
    6.000E-02   1.260E+00   2.460E+00   3.660E+00   4.860E+00

 
 Total number of F-array elements used is                    450431
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 *** End of sweep 15000
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 15000
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.900E+00   1.418E-09      2.695E-09
     V1     2.111E+00   5.902E-07      1.246E-06
     W1     2.111E+00   3.306E-05      6.980E-05
     KE     6.167E-03   7.679E-01      4.736E-03
     EP     9.942E+02   1.236E+00      1.229E+03
     LTLS   1.100E+00   6.818E-03      7.500E-03
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     1.132E-04   3.580E+02      3.622E-02 (    1,   45,   10)
     V1     1.289E-07   9.844E-04     -4.467E-03 (    1,   33,   13)
     W1     1.215E-05   9.095E-01      2.311E-02 (    1,   39,   11)
     KE     4.238E-06   5.652E-03      1.000E-10 (    1,   33,   13)
     EP     4.312E-05   6.961E-01      1.000E-10 (    1,   38,   11)
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
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-2.605738E-04
 pos. sum=0. neg. sum=-2.605738E-04
 nett sum=-2.605738E-04
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 7.018679E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-7.166829E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-4.329568E-01
 pos. sum=0.701868 neg. sum=-1.14964
 nett sum=-0.447772
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 9.358238E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-9.358238E-01 (Mass Out -9.358238E-01 In 0.000000E+00)
 pos. sum=0.935824 neg. sum=-0.935824
 nett sum=-2.220446E-16
 
 Nett source of KE   at patch named: OB1      (INLE1       ) = 5.264009E-17 (Average  5.625000E-17)
 Nett source of KE   at patch named: OB2      (OUTL2       ) =-2.945853E-03 (Ave Out  3.147871E-03 In  0.000000E+00)
 Nett source of KE   at patch named: OB3      (PLAT3       ) =-1.807505E-09
 Nett source of KE   at patch named: KESOURCE                =-1.785575E-03
 pos. sum=5.264009E-17 neg. sum=-4.731429E-03
 nett sum=-4.731429E-03
 
 Nett source of EP   at patch named: OB1      (INLE1       ) = 1.297485E-23 (Average  1.386463E-23)
 Nett source of EP   at patch named: OB2      (OUTL2       ) =-1.585635E-02 (Ave Out  1.694374E-02 In  0.000000E+00)
 Nett source of EP   at patch named: KESOURCE                =-9.939853E+02
 pos. sum=1.297485E-23 neg. sum=-994.001175
 nett sum=-994.001175
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep 15000
    Variable      Inflow        Outflow       Nett
       P1       9.358238E-01 -9.358238E-01 -2.220446E-16
       V1       0.000000E+00 -2.605738E-04 -2.605738E-04
       W1       7.018679E-01 -1.149640E+00 -4.477719E-01
       KE       5.264009E-17 -4.731429E-03 -4.731429E-03
       EP       1.297485E-23 -9.940012E+02 -9.940012E+02
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 59 IZMON= 50 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1           KE           EP  
      1   0.0000E+00   9.9999E-11   1.0000E-10   1.0000E-10   1.0000E-10
    751   7.4088E+02  -1.6770E-08   3.6950E-01   2.3014E-02   6.5295E-01
   1501   3.9893E+02   4.5028E-07   4.5366E-01   1.4566E-02   3.3015E-01
   2251   2.7171E+02   1.2039E-06   5.1258E-01   9.4876E-03   1.7434E-01
   3001   2.2243E+02   1.8938E-06   5.4952E-01   6.9673E-03   1.1013E-01
   3751   1.9908E+02   3.7554E-06   5.7076E-01   5.7734E-03   8.3292E-02
   4501   1.8558E+02   6.6590E-06   5.8173E-01   5.1431E-03   7.0153E-02
   5251   1.7767E+02   8.3717E-06   5.8739E-01   4.8367E-03   6.4038E-02
   6001   1.7477E+02   9.1026E-06   5.9090E-01   4.6932E-03   6.1239E-02
   6751   1.7227E+02   9.4164E-06   5.9249E-01   4.6031E-03   5.9504E-02
   7501   1.7088E+02   9.4079E-06   5.9331E-01   4.5571E-03   5.8622E-02
   8251   1.7014E+02   9.2925E-06   5.9373E-01   4.5331E-03   5.8166E-02
   9001   1.6973E+02   9.1602E-06   5.9395E-01   4.5209E-03   5.7932E-02
   9751   1.6952E+02   9.0414E-06   5.9406E-01   4.5144E-03   5.7810E-02
  10501   1.6940E+02   8.9526E-06   5.9412E-01   4.5110E-03   5.7745E-02
  11251   1.6933E+02   8.8916E-06   5.9415E-01   4.5092E-03   5.7711E-02
  12001   1.6930E+02   8.8508E-06   5.9417E-01   4.5082E-03   5.7693E-02
  12751   1.6928E+02   8.8246E-06   5.9418E-01   4.5077E-03   5.7683E-02
  13501   1.6927E+02   8.8082E-06   5.9418E-01   4.5075E-03   5.7678E-02
  14251   1.6927E+02   8.7982E-06   5.9419E-01   4.5073E-03   5.7675E-02
   Variable    1 = P1     2 = V1     3 = W1     4 = KE     5 = EP  
     Minval=  0.000E+00 -1.677E-08  1.000E-10  1.000E-10  1.000E-10
     Maxval=  7.409E+02  9.416E-06  5.942E-01  2.301E-02  6.529E-01
     Cellav=  2.120E+02  6.543E-06  5.374E-01  6.213E-03  1.092E-01
 1.00 +..5.+....+....+3.3.+3..3+3..3+.3.3+.3.3+.3..3.3..3
      .            3       2          2 2  2 2  2  2 2  2
 0.90 +          3      2                               +
      .       3                                         .
 0.80 +                                                 +
      .    3                                            .
 0.70 +               2                                 +
      .    4                                            .
 0.60 +  3                                              +
      .    1                                            .
 0.50 +    5                                            +
      .                                                 .
 0.40 +       4    2                                    +
      .       1                                         .
 0.30 +          4                                      +
      .       5    4  1 1  1  1 1  1  1 1  1 1  1  1 1  1
 0.20 +          2    4 4  4  4 4  4  4 4  4 4  4  4 4  4
      .       2  5 5                                    .
 0.10 +               5 5  5  5 5  5  5 5  5 5  5  5 5  5
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
    751   2.7480E-07   8.8945E-04   6.1090E-01   1.6354E-01   1.0018E+00
   1501   1.7986E-07   5.9750E-04   4.9917E-01   2.8020E-01   1.0119E+00
   2251   1.1078E-07   4.3674E-04   3.1928E-01   4.5357E-01   1.0864E+00
   3001   7.4150E-08   2.9470E-04   1.7965E-01   6.7210E-01   1.2477E+00
   3751   3.0255E-08   1.8110E-04   9.9178E-02   7.1851E-01   1.3431E+00
   4501   2.2745E-08   1.2533E-04   5.4032E-02   7.4914E-01   1.5864E+00
   5251   3.0135E-08   7.6499E-05   3.1361E-02   7.7699E-01   1.5684E+00
   6001   1.0347E-08   4.9297E-05   1.6971E-02   7.6978E-01   1.6695E+00
   6751   4.7188E-09   3.1065E-05   9.1524E-03   7.6938E-01   1.6321E+00
   7501   4.1119E-09   2.0385E-05   5.0143E-03   7.6937E-01   1.7137E+00
   8251   5.6985E-09   1.2923E-05   2.7251E-03   7.6969E-01   1.9512E+00
   9001   4.2913E-09   8.8695E-06   1.5371E-03   7.6903E-01   1.9387E+00
   9751   2.3420E-09   5.2615E-06   8.0205E-04   7.6795E-01   1.7455E+00
  10501   2.5647E-09   3.6918E-06   4.5094E-04   7.6788E-01   1.5536E+00
  11251   1.4912E-09   2.3568E-06   2.4187E-04   7.6768E-01   1.5526E+00
  12001   1.4153E-09   1.5946E-06   1.3904E-04   7.6776E-01   1.6440E+00
  12751   1.2143E-09   1.2555E-06   8.3396E-05   7.6766E-01   1.4770E+00
  13501   1.2736E-09   9.8669E-07   5.8431E-05   7.6775E-01   1.7751E+00
  14251   1.1220E-09   7.7540E-07   3.8706E-05   7.6765E-01   1.4148E+00
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
     Minval= -2.061E+01 -2.316E+01 -1.016E+01 -1.635E+01  1.773E-03
     Maxval=  9.531E-02 -7.025E+00 -4.928E-01 -2.523E-01  6.684E-01
   Variable    6 = LTLS
     Minval= -4.605E+01
     Maxval= -4.605E+01
 1.00 1..3.3....+4.4.+4.4.+4..4+4..5+.5.4+.4.4+.4..4.4..4
      3    4  4  2                                      .
 0.90 +  4         2  2                                 +
      .          3      2               5            5  .
 0.80 +            3       2  2 5                       +
      .               3    5  5 2  2            5       .
 0.70 +               5 3             2 2               +
      .                 5  3               5 5          .
 0.60 +                                         2  5 2  +
      .                       3                         2
 0.50 +                         3                       5
      .            5               3                    .
 0.40 +                               3                 +
      .          5                                      .
 0.30 +                                 3               +
      .  1 1                               3            .
 0.20 +       1  1                           3          +
      .            1  1 1                       3       .
 0.10 +       5            1       1               3    +
      5                       1 1     1 1  1         3  .
 0.00 6..6.6..6.+6.6.+6.6.+6..6+6..6+.6.6+.6.6+.6..6.6..6
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 1.43E+04
 
 ************************************************************
 
 ************************************************************
  Patch-wise Printout from GXYPLS
Variable= Sk.Fr.Co, at patch named: OB3      and  IX=     1
 IY=    90  1.222E+00  2.562E+00  2.604E+00  2.560E+00  2.551E+00
 IZ=          1         21         41         61         81
 
 ************************************************************
 
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 10:18:34 on Thursday, 26 December 2024                         
 Run completed at 10:33:00 on Thursday, 26 December 2024                       
 CPU time of run 867 s
 This includes 867 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 1.070E-06
 ************************************************************
