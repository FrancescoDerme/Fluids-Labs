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
 Number used before BFC allowance is                         387922
 Number used after BFC allowance is                          387922
 biggest cell volume divided by average is     1.99002148401717       at:
 ix = 1 iy = 100 iz = 61
 xg =0.26 yg =0.074625 zg =1.5125
 smallest cell volume divided by average is   9.999911999893446E-003  at:
 ix = 1 iy = 1 iz = 62
 xg =0.26 yg =3.749999E-04 zg =1.5375
 ratio of smallest to biggest is   5.025027156846083E-003
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
 NY = 100
 YVLAST =0.075
 YFRAC(1)=9.999998E-03 ;YFRAC(21)=0.21
 YFRAC(41)=0.41 ;YFRAC(61)=0.61
 YFRAC(81)=0.809999
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
 PATCH(OB1 ,LOW , 1, 1, 1, 100, 1, 1, 1, 1)
 COVAL(OB1 ,P1 , FIXFLU ,409.5 )
 COVAL(OB1 ,V1 ,0. ,0. )
 COVAL(OB1 ,W1 ,0. ,0.45 )
 
   Parent VR object for this patch is: OUTL2         
 PATCH(OB2 ,HIGH , 1, 1, 1, 100, 100, 100, 1, 1)
 COVAL(OB2 ,P1 ,1000. ,0. )
 COVAL(OB2 ,V1 ,0. ,0. )
 COVAL(OB2 ,W1 ,0. ,0. )
 
   Parent VR object for this patch is: PLAT3         
 PATCH(OB3 ,NWALL , 1, 1, 100, 100, 1, 100, 1, 1)
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
 IXMON = 1 ;IYMON = 100 ;IZMON = 86
 NPRMON = 100000 ;NPRMNT = 1 ;TSTSWP = 10001
 UWATCH = F ;USTEER = F
 HIGHLO = F
 ************************************************************
  Group 23.Field Print-Out & Plot Control
 NPRINT = 10000 ;NUMCLS = 5
 NYPRIN = 20 ;IYPRF = 1 ;IYPRL = 100
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
    3.750E-04   1.537E-02   3.037E-02   4.537E-02   6.037E-02

 Z-coordinates of the cell centres
    1.250E-02   5.125E-01   1.012E+00   1.513E+00   2.013E+00

 
 X-coordinates of the (higher) cell faces
    5.200E-01
 Y-coordinates of the (higher) cell faces
    7.500E-04   1.575E-02   3.075E-02   4.575E-02   6.075E-02

 Z-coordinates of the (higher) cell faces
    2.500E-02   5.250E-01   1.025E+00   1.525E+00   2.025E+00

 
 Total number of F-array elements used is                    388633
 --- INTEGRATION OF EQUATIONS BEGINS ---
 
 ************************************************************
 *** End of sweep 10000
 ************************************************************
 
 ************************************************************
 Whole-field residuals before solution at sweep 10000
 with resref values determined by EARTH
 & resfac=1.0E-05
  variable   resref  (res sum)/resref  (res sum)
     P1     1.279E+00   1.191E-10      1.523E-10
     V1     1.870E+00   1.792E-06      3.351E-06
     W1     1.870E+00   1.640E-05      3.067E-05
 
 max abs corrections for solved-for variables
 for comparison with maximum & minimum values
  variable   max-cor      high           low     (   IX    IY    IZ)
     P1     3.094E-05   6.482E+02      2.769E-02 (    1,   35,   66)
     V1     1.480E-08   2.632E-03     -6.332E-02 (    1,   40,  100)
     W1     3.935E-07   8.979E-01      9.015E-03 (    1,    1,   99)
 
 
 ************************************************************
 Sources and sinks
 !! Zero nett sources are not printed !!!
 
    Nett Sources have units of mass_per_unit_time * variable
    Average values have units of the variable
 
    Typically the units of the sources are:
        U1,V1,W1 - Force  - Newtons
        R1       - Mass   - kg/s
        TEM1,H1  - Energy - Watts
 
 Nett source of V1   at patch named: OB2      (OUTL2       ) =-6.880277E-04
 pos. sum=0. neg. sum=-6.880277E-04
 nett sum=-6.880277E-04
 
 Nett source of W1   at patch named: OB1      (INLE1       ) = 2.695009E-01
 Nett source of W1   at patch named: OB2      (OUTL2       ) =-3.576252E-01
 Nett source of W1   at patch named: OB3      (PLAT3       ) =-8.323456E-01
 pos. sum=0.269501 neg. sum=-1.189971
 nett sum=-0.92047
 
 Nett source of R1   at patch named: OB1      (INLE1       ) = 5.988909E-01
 Nett source of R1   at patch named: OB2      (OUTL2       ) =-5.988909E-01 (Mass Out -5.988909E-01 In 0.000000E+00)
 pos. sum=0.598891 neg. sum=-0.598891
 nett sum=-6.550316E-15
 
 
 ************************************************************
 Summary of sources from all Objects/Patches at sweep 10000
    Variable      Inflow        Outflow       Nett
       P1       5.988909E-01 -5.988909E-01 -6.550316E-15
       V1       0.000000E+00 -6.880277E-04 -6.880277E-04
       W1       2.695009E-01 -1.189971E+00 -9.204699E-01
 ************************************************************
 
 
 ************************************************************
 spot values vs sweep or iteration number
 IXMON= 1 IYMON= 100 IZMON= 86 TIMESTEP= 1
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1  
      1   0.0000E+00   0.0000E+00   1.0000E-10
    501   1.2279E+02   0.0000E+00   1.5435E-02
   1001   9.7991E+01   0.0000E+00   1.2348E-02
   1501   8.7842E+01   0.0000E+00   1.1082E-02
   2001   8.2304E+01   0.0000E+00   1.0391E-02
   2501   7.8879E+01   0.0000E+00   9.9629E-03
   3001   7.6614E+01   0.0000E+00   9.6801E-03
   3501   7.5058E+01   0.0000E+00   9.4859E-03
   4001   7.3964E+01   0.0000E+00   9.3494E-03
   4501   7.3184E+01   0.0000E+00   9.2522E-03
   5001   7.2624E+01   0.0000E+00   9.1824E-03
   5501   7.2219E+01   0.0000E+00   9.1320E-03
   6001   7.1927E+01   0.0000E+00   9.0956E-03
   6501   7.1717E+01   0.0000E+00   9.0694E-03
   7001   7.1573E+01   0.0000E+00   9.0510E-03
   7501   7.1483E+01   0.0000E+00   9.0387E-03
   8001   7.1440E+01   0.0000E+00   9.0315E-03
   8501   7.1430E+01   0.0000E+00   9.0277E-03
   9001   7.1438E+01   0.0000E+00   9.0261E-03
   9501   7.1449E+01   0.0000E+00   9.0256E-03
   Variable    1 = P1     2 = V1     3 = W1  
     Minval=  0.000E+00  0.000E+00  1.000E-10
     Maxval=  1.228E+02  0.000E+00  1.543E-02
     Cellav=  7.430E+01  0.000E+00  9.383E-03
 1.00 +..3.+....+....+....+....+....+....+....+....+....+
      .                                                 .
 0.90 +                                                 +
      .                                                 .
 0.80 +    3                                            +
      .                                                 .
 0.70 +       3                                         +
      .          3 3  3                                 .
 0.60 +               1 3  3  3 3  3  3 3  3 3  3  3 3  3
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
 0.00 3..2.2..2.+2.2.+2.2.+2..2+2..2+.2.2+.2.2+.2..2.2..2
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 9.50E+03
 
 ************************************************************
 
 ************************************************************
 residuals vs sweep or iteration number
 
 Tabulation of abscissa and ordinates...
   ISWP       P1           V1           W1  
      1   1.1000E+00   2.4933E-10   1.9679E-01
    501   2.6754E-07   3.0428E-03   4.2928E-01
   1001   1.3956E-07   1.8419E-03   2.3711E-01
   1501   8.7487E-08   1.2327E-03   1.4701E-01
   2001   5.8823E-08   8.5809E-04   9.5468E-02
   2501   4.0924E-08   6.0834E-04   6.3225E-02
   3001   2.9014E-08   4.3561E-04   4.2189E-02
   3501   2.0787E-08   3.1375E-04   2.8174E-02
   4001   1.4976E-08   2.2677E-04   1.8742E-02
   4501   1.0827E-08   1.6425E-04   1.2390E-02
   5001   7.8439E-09   1.1911E-04   8.1183E-03
   5501   5.6894E-09   8.6450E-05   5.2581E-03
   6001   4.1296E-09   6.2772E-05   3.3551E-03
   6501   2.9984E-09   4.5581E-05   2.0994E-03
   7001   2.1748E-09   3.3035E-05   1.2795E-03
   7501   1.5673E-09   2.3738E-05   7.5167E-04
   8001   1.1050E-09   1.6723E-05   4.1944E-04
   8501   7.4085E-10   1.1199E-05   2.1816E-04
   9001   4.5621E-10   6.8854E-06   1.0358E-04
   9501   2.4995E-10   3.7661E-06   4.3971E-05
   Variable    1 = P1     2 = V1     3 = W1  
     Minval= -2.211E+01 -2.211E+01 -1.003E+01
     Maxval=  9.531E-02 -5.795E+00 -8.457E-01
 1.00 1..3.+....+....+....+....+....+....+....+....+....+
      .    3  2                                         .
 0.90 3       3  2 2  2                                 +
      .          3      2  2                            .
 0.80 +            3          2 2  2                    +
      .               3               2 2               .
 0.70 +                 3                  2 2  2       +
      .                    3                       2 2  .
 0.60 +                       3                         2
      .                         3                       .
 0.50 +                            3                    +
      .                               3                 .
 0.40 +                                 3               +
      .                                    3            .
 0.30 +  1 1                                 3          +
      .       1  1 1                            3       .
 0.20 +               1 1  1                            +
      .                       1 1  1  1            3    .
 0.10 +                                 1  1 1       3  +
      .                                         1  1 1  .
 0.00 2....+....+....+....+....+....+....+....+....+....3
      0   .1   .2   .3   .4   .5   .6   .7   .8   .9  1.0
 the abscissa is      ISWP.  min= 1.00E+00 max= 9.50E+03
 
 ************************************************************
 
 ************************************************************
 SATLIT RUN NUMBER =   1 ; LIBRARY REF.=    0
 Run started at 19:26:52 on Sunday, 24 November 2024                           
 Run completed at 19:31:32 on Sunday, 24 November 2024                         
 CPU time of run 282 s
 This includes 282 seconds of user time and 0 seconds of system time.
 TIME/(VARIABLES*CELLS*TSTEPS*SWEEPS*ITS) = 9.400E-07
 ************************************************************
