# G�gn

# �fangasta�ir
set flug;
param flugnr{flug};
param eftirs{flug} >= 0;
param fjarlkm{flug};
param flugverd{flug};

param virdiEld; 	# Marka�svir�i eldsneytis � gallon

param gallEldVegur; # Gallon af eldsneyti vegur

					# Laus s�ti � flugv�l og fj�ldi lausra flugv�la
set velar;
param floti{velar} >= 0;
param s�ti{velar};
param fuel{velar};
param range{velar};

# Kostna�ur � flugi
set flugVerd;
param kostn{flugVerd};

# �kvar�anarbreytur
var velFlaug {flug,velar} binary;

# Markfall
maximize mestiSparna�ur: sum {i in flug, j in velar} 
	virdiEld  * velFlaug[i,j] * (fjarlkm[i] * fuel[j])/gallEldVegur ;

subject to eftirspurn {i in flug, j in velar}:
	eftirs[i] * velFlaug[i,j] <= s�ti[j];
		
subject to dreifFlug {i in flug, j in velar}:
	velFlaug[i,j] * fjarlkm[i] <= range[j];
	
subject to flaugVel {j in velar}:
	sum {i in flug} velFlaug[i,j] <= floti[j];
	
subject to fljugaAf {i in flug}:
	sum {j in velar} velFlaug[i,j] == 1;
	


