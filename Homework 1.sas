libname STATS725 '/home/u58002446/STAT 725';

/*Question 1*/
data STATS725.Crops;
infile "/home/u58002446/STAT 725/Dataset1.txt" firstobs=2;
input Group $ Value;
run;

data first5crops;
set STATS725.Crops (obs=5);
run;

proc print data=first5crops;
run;

/*Question 2*/
data Crops2;
infile "/home/u58002446/STAT 725/Dataset2.txt" firstobs=2 obs=6 dlm='09'x;
input Group $ Value;
run;

proc print data=Crops2;
run;

/*Question 3*/
data Crops3;
infile '/home/u58002446/STAT 725/Dataset3.txt' firstobs=2;
input GroupA GroupB GroupC GroupD GroupE;
run;

data Crops4 (keep=Group Yield);
set Crops3;
Group = 'A';
Yield = GroupA;
output;
Group = 'B';
Yield = GroupB;
output;
Group = 'C';
Yield = GroupC;
output;
Group = 'D';
Yield = GroupD;
output;
Group = 'E';
Yield = GroupE;
output;
run;

proc print data=Crops4;
run; 

/*Question 4*/
data Donors;
infile "/home/u58002446/STAT 725/Donors.txt" firstobs=2;
input Donor & $15. Class & $10. Donation comma7. Date & DATE9.;
format Donation dollar7. Date MMDDYY10.;
run;

proc print data=Donors;
run;

/*Question 5*/
data Hours;
infile "/home/u58002446/STAT 725/Hours.txt" dlm='09'x;
input Name $ Hours @@;
run;

proc print data=Hours;
run;

/*Question 6*/
data Pines;
input Plot $ cyc $ ngpine;
datalines;
7 4 1.30
8 4 4.67
160 4 6.87
257 5 1.48
160 5 1.68
run;

proc print data=Pines;
title 'Zach Smith';
run;









