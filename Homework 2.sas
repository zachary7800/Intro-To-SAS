libname STATS725 '/home/u58002446/STAT 725';

data wineA;
set STATS725.winea;
ScoreA = appearance + aroma + taste + aftertaste;
Age = substr(taster,1,2)+0;
Gender = substr(taster,3,1);
if Taste in ('0','1','2','3','4') then output;
keep id taster appearance aroma taste aftertaste scorea age gender;
run;

data wineB;
set STATS725.wineb;
ScoreB = appearance + aroma + taste + aftertaste;
if Taste in ('0','1','2','3','4') and Aroma in ('0','1','2','3','4') then output;
keep id appearance aroma taste aftertaste scoreb;
run;

data bothwine;
merge winea wineb;
by id;
Difference = scorea-scoreb;
keep id scorea scoreb age gender difference;
run;

proc print data=bothwine;

proc sgplot data=bothwine;
scatter X=scoreb Y=difference / group=Gender;
run;






