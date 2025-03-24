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
   Code expiry date is the end  : nov 2024                     
   ----------------------------------------------------------  
   Running with 64-bit Double Precision executable             
   Working directory: C:\phoenics\d_priv1
 
 ************************************************************
 
 Initial estimated storage requirement is                  10000000
 
 PRPS is not stored
 Material properties used for phase 1 are
 density
 laminar viscosity
 >>>   End of property-related data   <<<
 ************************************************************
 
 Number of F-array locations available is                  10000000
 Number used before BFC allowance is                         330127
 Number used after BFC allowance is                          330127
 biggest cell volume divided by average is     1.41733854224141       at:
 ix = 1 iy = 52 iz = 61
 xg =0.26 yg =0.056442 zg =1.5125
 smallest cell volume divided by average is   2.631452853479486E-002  at:
 ix = 1 iy = 1 iz = 62
 xg =0.26 yg =6.598144E-04 zg =1.5375
 ratio of smallest to biggest is   1.856615603861337E-002
 ************************************************************
 
 -------- Recommended settings -------
 CONWIZ=T activates settings based on
 refrho =1. refvel =10. reflen =1. reftemp =50.
 rlxdu1 =0.5 rlxdv1 =0.5 rlxdw1 =0.5
 Maximum change of V1   per sweep=   100.000000000000     
 Maximum change of W1   per sweep=   100.000000000000     
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
 XULAST =0.52
 ************************************************************
  Group 4. Y-Direction Grid Spacing
 NY = 85
 YVLAST =0.075
 YFRAC(1)=0.017595 ;YFRAC(18)=0.300184
 YFRAC(35)=0.548844 ;YFRAC(52)=0.758096
 YFRAC(69)=0.918332
 ************************************************************
  Group 5. Z-Direction Grid Spacing
 PARAB = F
 NZ = 100
 ZWLAST =2.5
 ZFRAC(1)=1.0E-02 ;ZFRAC(21)=0.21
 ZFRAC(41)=0.41 ;ZFRAC(61)=0.61
 ZFRAC(81)=0.81
 ************************************************************
  Group 6. Body-Fitted Coordinates
 ************************************************************
  Group 7. Variables: STOREd,SOLVEd,NAMEd
 ONEPHS = T
 NAME(1)=P1 ;NAME(5)=V1
 NAME(7)=W1 ;NAME(148)=DEN1
 NAME(150)=DWDY
    * Y in SOLUTN argument list denotes:
    * 1-stored 2-solved 3-whole-field
    * 4-point-by-point 5-explicit 6-harmonic averaging 
 SOLUTN(P1,Y,Y,Y,N,N,Y)
 SOLUTN(V1,Y,Y,Y,N,N,Y)
 SOLUTN(W1,Y,Y,Y,N,N,Y)
 SOLUTN(DEN1,Y,N,N,N,N,Y)
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
 DIFCUT =0.5 ;ZDIFAC =1.
 GALA = F ;ADDDIF = T
 ISOLX = 0 ;ISOLY = -1 ;ISOLZ = -1
 ************************************************************
  Group 9. Properties used if PRPS is not
  stored, and where PRPS = -1.0 if it is!
 RHO1 =910. ;TMP1 =0. ;EL1 =0.
 TSURR =0. ;TEMP0 =273.15 ;PRESS0 =1.01325E+05
 DVO1DT =3.41E-03 ;DRH1DP =0.
 EMISS =0. ;SCATT =0.
 RADIA =0. ;RADIB =0.
 ENUL =3.5E-04 ;ENUT =0.
 PRNDTL(V1)=1. ;PRNDTL(W1)=1.
 PRT(V1)=1. ;PRT(W1)=1.
 CP1 =1005. ;CP2 =1.
 ************************************************************
  Group 10.Inter-Phase Transfer Processes
 ************************************************************
  Group 11.Initial field variables (PHIs)
 FIINIT(P1)=0. ;FIINIT(V1)=1.0E-10
 FIINIT(W1)=1.0E-10 ;FIINIT(DEN1)=910.
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
 PATCH(OB1 ,LOW , 1, 1, 1, 85, 1, 1, 1, 1)
 COVAL(OB1 ,P1 , FIXFLU ,409.5 )
 COVAL(OB1 ,V1 ,0. ,0. )
 COVAL(OB1 ,W1 ,0. ,0.45 )
 
   Parent VR object for this patch is: OUTL2         
 PATCH(OB2 ,HIGH , 1, 1, 1, 85, 100, 100, 1, 1)
 COVAL(OB2 ,P1 ,1000. ,0. )
 COVAL(OB2 ,V1 ,0. ,0. )
 COVAL(OB2 ,W1 ,0. ,0. )
 
   Parent VR object for this patch is: PLAT3         
 PATCH(OB3 ,NWALL , 1, 1, 85, 85, 1, 100, 1, 1)
 COVAL(OB3 ,W1 ,1. ,0. )
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
 LITER(W1)=10
 ENDIT(P1)=1.0E-03 ;ENDIT(V1)=1.0E-03
 ENDIT(W1)=1.0E-03
 ************************************************************
  Group 17. Relaxation
 RELAX(P1,LINRLX,0.5)
 RELAX(V1,LINRLX,0.5)
 RELAX(W1,LINRLX,0.5)
 RELAX(DEN1,LINRLX,0.5)
 RELAX(DWDY,LINRLX,1.)
 OVRRLX =0.
 EXPERT = F ;NNORSL = F
 ************************************************************
  Group 18. Limits
 VARMAX(P1)=1.0E+10 ;VARMIN(P1)=-1.0E+10
 VARMAX(V1)=1.0E+06 ;VARMIN(V1)=-1.0E+06
 VARMAX(W1)=1.0E+06 ;VARMIN(W1)=-1.0E+06
 VARMAX(DEN1)=1.0E+10 ;VARMIN(DEN1)=1.0E-06
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
 SPEDAT(SET,FACETDAT,NUMOBJ,I,3)
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
 OUTPUT(DEN1,N,N,Y,N,N,N)
 OUTPUT(DWDY,N,N,Y,N,N,N)
 ************************************************************
  Group 22. Monitor Print-Out
 IXMON = 1 ;IYMON = 82 ;IZMON = 85
 NPRMON = 100000 ;NPRMNT = 1 ;TSTSWP = 10001
 UWATCH = F ;USTEER = F
 HIGHLO = F
 ************************************************************
  Group 23.Field Print-Out & Plot Control
 NPRINT = 10000 ;NUMCLS = 5
 NYPRIN = 17 ;IYPRF = 1 ;IYPRL = 85
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
    2.600E-01
 Y-coordinates of the cell centres
    6.598E-04   2.192E-02   4.065E-02   5.644E-02   6.858E-02

 Z-coordinates of the cell centres
    1.250E-02   5.125E-01   1.012E+00   1.513E+00   2.013E+00

 
 X-coordinates of the (higher) cell faces
    5.200E-01
 Y-coordinates of the (higher) cell faces
    1.320E-03   2.251E-02   4.116E-02   5.686E-02   6.887E-02

 Z-coordinates of the (higher) cell faces
    2.500E-02   5.250E-01   1.025E+00   1.525E+00   2.025E+00

 
 Total number of F-array elements used is                    330763
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 Run ending on sweep  6094 with all residuals below RESFAC ( 1.000000E-05)
 ************************************************************
 *** End of sweep 6095
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 6095
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.280E+00   1.899E-11      2.430E-11
     V1     1.970E+00   1.972E-07      3.885E-07
     W1     1.970E+00   9.965E-06      1.963E-05
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     9.871E-06   6.499E+02      1.212E-02 (    1,   80,    2)
     V1     7.259E-10   1.915E-03     -6.351E-02 (    1,   27,   75)
     W1     6.111E-08   8.980E-01      1.150E-03 (    1,    1,   99)
 
 
 ************************************************************
 Sources and sinks
 !! Zero nett sources are not printed !!!
 
    Nett Sources have units of mass_per_unit_time * variable
    Average values have units of the variable
 
    Typically the units of the sources are:
        U1,V1,W1 - Force  - Newtons
        R1       - Mass   - kg/s
        TEM1,H1  - Energy - Watts
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-5.997901E-04
 pos. sum=0. neg. sum=-5.997901E-04
 nett sum=-5.997901E-04
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 2.695009E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-3.579785E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-8.324776E-01
 pos. sum=0.269501 neg. sum=-1.190456
 nett sum=-0.920955
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 5.988909E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-5.988909E-01 (Mass Out -5.988909E-01 In 0.000000E+00)
 pos. sum=0.598891 neg. sum=-0.598891
 nett sum=-1.221245E-15
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep  6095
    Variable      Inflow        Outflow       Nett
       P1       5.988909E-01 -5.988909E-01 -1.221245E-15
       V1       0.000000E+00 -5.997901E-04 -5.997901E-04
       W1       2.695009E-01 -1.190456E+00 -9.209553E-01
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 82 IZMON= 85 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1  
      1   0.0000E+00   1.0000E-10   1.0000E-10
    501   7.8617E+01  -1.2003E-12   1.7616E-02
   1001   7.7194E+01  -1.6671E-13   1.6060E-02
   1501   7.6729E+01  -1.2122E-13   1.5543E-02
   2001   7.6543E+01  -7.4707E-11   1.5322E-02
   2501   7.6473E+01  -1.5834E-09   1.5216E-02
   3001   7.6498E+01  -6.3931E-09   1.5165E-02
   3501   7.6575E+01  -1.2310E-08   1.5143E-02
   4001   7.6643E+01  -1.6721E-08   1.5136E-02
   4501   7.6683E+01  -1.9102E-08   1.5136E-02
   5001   7.6700E+01  -2.0083E-08   1.5136E-02
   5501   7.6707E+01  -2.0373E-08   1.5137E-02
   6001   7.6708E+01  -2.0407E-08   1.5138E-02
   Variable    1 = P1     2 = V1     3 = W1  
     Minval=  0.000E+00 -2.041E-08  1.000E-10
     Maxval=  7.862E+01  1.000E-10  1.762E-02
     Cellav=  7.093E+01 -8.996E-09  1.429E-02
 1.00 2...3+..2.+..2.+.2..+....+....+....+..1.+.1..+1...1
      .                1   1   1   1   1                .
 0.90 +       3    3       2                            +
      .                3   3   3   3   3    3   3   3   3
 0.80 +                                                 +
      .                                                 .
 0.70 +                        2                        +
      .                                                 .
 0.60 +                                                 +
      .                                                 .
 0.50 +                                                 +
      .                                                 .
 0.40 +                            2                    +
      .                                                 .
 0.30 +                                                 +
      .                                                 .
 0.20 +                                2                +
      .                                                 .
 0.10 +                                                 +
      .                                     2           .
 0.00 3....+....+....+....+....+....+....+....+.2..+2...2
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 6.00E+03
 
 ************************************************************
 
 ************************************************************
 residuals vs sweep or iteration number
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1  
      1   1.1000E+00   2.2798E-10   1.9679E-01
    501   5.4500E-08   3.4334E-03   1.1515E-01
   1001   2.3931E-08   9.7356E-04   4.0430E-02
   1501   1.2407E-08   3.7623E-04   1.6517E-02
   2001   6.8187E-09   1.6960E-04   7.1948E-03
   2501   3.8075E-09   8.2995E-05   3.1694E-03
   3001   2.0664E-09   4.1707E-05   1.3669E-03
   3501   9.8842E-10   2.0291E-05   5.7187E-04
   4001   3.7772E-10   9.1448E-06   2.3896E-04
   4501   9.9725E-11   3.8003E-06   1.0595E-04
   5001   2.7488E-11   1.4827E-06   5.1843E-05
   5501   2.8135E-11   5.6722E-07   2.5658E-05
   6001   2.0780E-11   2.3033E-07   1.1663E-05
   Variable    1 = P1     2 = V1     3 = W1  
     Minval= -2.460E+01 -2.220E+01 -1.136E+01
     Maxval=  9.531E-02 -5.674E+00 -1.626E+00
 1.00 3...2+....+....+....+....+....+....+....+....+....+
      .   3                                             .
 0.90 +       2                                         +
      .       3    2                                    .
 0.80 +                2                                +
      .            3       2   2                        .
 0.70 +                            2                    +
      .                3               2                .
 0.60 +                    3                2           +
      .                                         2       .
 0.50 +                        3                        +
      .                                             2   .
 0.40 +                            3                    2
      .                                                 .
 0.30 +   1   1                        3                +
      .            1   1                    3           .
 0.20 +                    1   1                        +
      .                            1            3       .
 0.10 +                                1            3   +
      .                                     1           .
 0.00 2....+....+....+....+....+....+....+....+.1..+1...3
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 6.00E+03
 
 ************************************************************
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 17:26:15 on Tuesday, 26 November 2024                          
 Run completed at 17:27:28 on Tuesday, 26 November 2024                        
 CPU time of run 73 s
 This includes 73 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 4.697E-07
 ************************************************************
