# Gögn

# Áfangastaðir
set flug;
param flugnr{flug};
param eftirs{flug} >= 0;
param fjarlkm{flug};
param flugverd{flug};

param virdiEld; 	# Markaðsvirði eldsneytis á gallon

param gallEldVegur; # Gallon af eldsneyti vegur

					# Laus sæti í flugvél og fjöldi lausra flugvéla
set velar;
param floti{velar} >= 0;
param sæti{velar};
param fuel{velar};
param range{velar};

# Kostnaður á flugi
set flugVerd;
param kostn{flugVerd};

# Ákvarðanarbreytur
var velFlaug {flug,velar} binary;

# Markfall
maximize mestiSparnaður: sum {i in flug, j in velar} 
	virdiEld  * velFlaug[i,j] * (fjarlkm[i] * fuel[j])/gallEldVegur ;

subject to eftirspurn {i in flug, j in velar}:
	eftirs[i] * velFlaug[i,j] <= sæti[j];
		
subject to dreifFlug {i in flug, j in velar}:
	velFlaug[i,j] * fjarlkm[i] <= range[j];
	
subject to flaugVel {j in velar}:
	sum {i in flug} velFlaug[i,j] <= floti[j];
	
subject to fljugaAf {i in flug}:
	sum {j in velar} velFlaug[i,j] == 1;
	


