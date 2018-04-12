
	### G�gn ###

# �fangasta�ir
set flug;
# 	Flugn�mer					Eftirspurn 
	param flugnr{flug}; 		param eftirs{flug};
# 	Fjarl�g� � km				Ver� � flugi
	param fjarlkm{flug};		param flugverd{flug};
# 	Marka�svir�i eldsneytis		Gallon af eldsneyti vegur � kg
	param virdiEld; 			param gallonVegur; 

# Flotin Icelandair
set velar;
#	Tilt�kar v�lar				Fj�ldi s�ti � v�l
	param floti{velar};			param s�ti{velar};
#	Eldsneytis ey�sla (kg/km)	Drifkraftur v�lar (km)
	param fuel{velar};			param range{velar};

	### �kvar�anarbreytur ###
	
var velFlaug {flug,velar} binary;

	### Markfall ###
	
minimize Bens�nEy�slu: sum {i in flug, j in velar} 
	(virdiEld  * velFlaug[i,j]) * ((fjarlkm[i] * fuel[j])/gallonVegur) ;

	###	Skor�ur	###

subject to svarVi�Eftirspurn {i in flug, j in velar}:
	eftirs[i] * velFlaug[i,j] <= s�ti[j];
		
subject to v�lVer�urA�Dr�fa {i in flug, j in velar}:
	velFlaug[i,j] * fjarlkm[i] <= range[j];
	
subject to flotaSkor�a {j in velar}:
	sum {i in flug} velFlaug[i,j] <= floti[j];
	
subject to borgarSkor�a {i in flug}:
	sum {j in velar} velFlaug[i,j] == 1;
	


