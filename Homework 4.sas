proc format;
	value BMIs		LOW-<18.5 = 'Underweight'
			        18.5-<25 = 'Normal'
			        25-<30 = 'Overweight'
		            30-HIGH = 'Obese';
			        run;


data Weight;
infile '/home/u58002446/STAT 725/HW4data.txt' dlm=',' firstobs=2;
input Diet $ Height Before After;
Lost = Before - After;
HeightM = Height / 100;
BMI = Before / (HeightM*HeightM);
BMI_group = BMI;
format BMI_group BMIs.;
keep Diet Height Before After Lost BMI BMI_group;
run;

proc sort data=Weight;
by Diet;
run;
proc means data=weight maxdec=1 n mean stddev;
by Diet;
run;
proc sort data=weight;
by bmi_group;
run;
proc boxplot data=weight;
where diet = 'A';
plot lost*bmi_group;
by bmi_group;
run;
proc ttest data=Weight;
	class diet;
	var lost;
run;
/* H(null) = means are same
   H(alt) = means are different
   At 0.05 significance we do not reject the null hypothesis and conclude the difference in means
   is NOT statistically significant.
   Pvalue = 0.1355
*/




