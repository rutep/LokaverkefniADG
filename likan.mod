# G�gn

# �fangasta�ir
set flug;
param flugnr{flug};
param eftirs{flug} >= 0;
param fjarlkm{flug};

param virdiEld; 	# Marka�svir�i eldsneytis � gallon

param gallEldVegur; # Gallon af eldsneyti vegur

					# Laus s�ti � flugv�l og fj�ldi lausra flugv�la
set velar;
param floti{velar} >= 0;
param s�ti{velar};

# Kostna�ur � flugi
set flugVerd;
param kostn{flugVerd};

# �kvar�anarbreytur
var velFlaug {flug,velar} binary;

# Markfall
minimize mestiSparna�ur: sum {i in flug, j in velar} 
	virdiEld * gallEldVegur * velFlaug[i,j] * fjarlkm[i];

subject to eftirspurn {i in flug, j in velar}:
	eftirs[i] <= s�ti[j] * velFlaug[i,j];
	
subject to flugvelar {j in velar}:
	sum {i in flug} velFlaug[i,j] <= floti[j];
	


