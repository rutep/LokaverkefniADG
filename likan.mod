# Gögn

# Áfangastaðir
set flug;
param flugnr{flug};
param eftirs{flug} >= 0;
param fjarlkm{flug};

param virdiEld; 	# Markaðsvirði eldsneytis á gallon

param gallEldVegur; # Gallon af eldsneyti vegur

					# Laus sæti í flugvél og fjöldi lausra flugvéla
set velar;
param floti{velar} >= 0;
param sæti{velar};

# Kostnaður á flugi
set flugVerd;
param kostn{flugVerd};

# Ákvarðanarbreytur
var velFlaug {flug,velar} binary;

# Markfall
minimize mestiSparnaður: sum {i in flug, j in velar} 
	virdiEld * gallEldVegur * velFlaug[i,j] * fjarlkm[i];

subject to eftirspurn {i in flug, j in velar}:
	eftirs[i] <= sæti[j] * velFlaug[i,j];
	
subject to flugvelar {j in velar}:
	sum {i in flug} velFlaug[i,j] <= floti[j];
	


