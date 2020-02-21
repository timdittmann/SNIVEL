# SNIVEL
<b>Satellite Navigation-derived Instaneous Velocities</b>


This package computes GNSS velocities using the broadcast ephemeris and high-rate RINEX files. This loosely follows the method of Colisimo et al. (2012). It uses both the L1 and L2 phase observables and inverts for velocity on an epoch by epoch basis with the ionosphere free combination. There is no single frequency mode currently (i.e. <a href="https://pubs.geoscienceworld.org/ssa/srl/article/89/3/1040/530132/Single-Frequency-Instantaneous-GNSS-Velocities">Grapenthin et al. (2018)</a>), however I have tested it using just L1 and it produces almost identical results. 

The logic flow is rather simple:


<b>(1)</b> in the file sites_process.txt, you simple need to add 4-character station ids in lowercase. If the station is not located in UNAVCO, SOPAC, or CWU archives, you will need to put your files into a directory called 'rinex_hr'. This folder is autogenerated, so run SNIVEL.py once and you will get the directory. When you put your RINEX file in this folder, ensure that it follows standard naming convention, "SITEDOY0.YRo". If you use uppercase for <b>SITE</b>, enter it that way in the sites_process.txt file. If your RINEX is Hatanaka compressed, use the crx2rnx command to uncompress it (i.e. go from <b>YR</b>d to <b>YR</b>o). For files downloaded, the uncompression is performed automatically.
  
<b>(2)</b> in the file dates_process.txt, you enter in the dates and times you want to process. There are 4 columns in this file:

<YEAR> <DOY> <START_TIME> <MINUTES>
 
<YEAR> should always be 4 digits.
  
<DOY> is the day of year, three characters between 001 and 365/366 for leap years. Check the <a href="https://www.ngs.noaa.gov/CORS/Gpscal.shtml">NGS GPS Calendar</a> to determine your DOY.
  
<START_TIME> is the time in HR:MN:SC format that you want to start processing. Note that RINEX files use GPS time, so there is currently an 18 second difference between UTC time (GPS-UTC=18) as of Feb 2020.

<MINUTES> is simply the number of minutes you wish to process. Decimals are allowed here.

