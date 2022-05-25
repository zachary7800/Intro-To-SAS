libname STATS725 '/home/u58002446/STAT 725';

data WarehouseA;
infile "/home/u58002446/STAT 725/WarehouseA.txt" firstobs=2;
input ShipID $ Received : yymmdd10. Shipped : yymmdd10. Address & $24.;
City = scan(Address,1,',');
ZipCode = scan(Address,-1,' ')+0;
Warehouse = 'A';
format received shipped yymmdds10.;
keep ShipID Received Shipped City ZipCode Warehouse;
run;

data WarehouseB;
infile "/home/u58002446/STAT 725/WarehouseB.txt" firstobs=2;
input ShipID $ Received : yymmdd10. Shipped : yymmdd10. City $11. ZipCode;
Warehouse = 'B';
format received shipped yymmdds10.;
run;

data WarehouseC;
infile "/home/u58002446/STAT 725/WarehouseC.txt" firstobs=2 dlm='09'x;
input ShipID $ Received : yymmdd10. Shipped : yymmdd10. ZipCode City & $12.;
Warehouse = 'C';
format received shipped yymmdds10.;
run;

data WarehouseD;
proc import
	datafile="/home/u58002446/STAT 725/WarehouseD.xlsx"
	out = WarehouseD
	dbms= 'XLSX'
	replace;
   sheet='Sheet1';
   getnames=YES;
   run;


data WarehouseAll;
set warehousea warehouseb warehousec warehoused;
if Warehouse in (' ') then Warehouse = 'D';
ProcessDays = shipped - received;
run;

data threedaysorless;
set warehouseall;
if ProcessDays in (1,2,3) then output;
label shipped = 'Ship Date' received = 'Receive Date';
proc sort data=threedaysorless;
by received;
run;

proc print label data=threedaysorless;
run;

proc freq data=warehouseall;
	table processdays;
run;
/*Proportion is the cumuluative propotion on the third line of this table, this was the best
I could figure out*/









