
	### Gögn ###

# Áfangastaðir
set flug;
# 	Flugnúmer					Eftirspurn 
	param flugnr{flug}; 		param eftirs{flug};
# 	Fjarlægð í km				Verð á flugi
	param fjarlkm{flug};		param flugverd{flug};
# 	Markaðsvirði eldsneytis		Gallon af eldsneyti vegur í kg
	param virdiEld; 			param gallonVegur; 

# Flotin Icelandair
set velar;
#	Tiltækar vélar				Fjöldi sæti í vél
	param floti{velar};			param sæti{velar};
#	Eldsneytis eyðsla (kg/km)	Drifkraftur vélar (km)
	param fuel{velar};			param range{velar};

	### Ákvarðanarbreytur ###
	
var velFlaug {flug,velar} binary;

	### Markfall ###
	
minimize BensínEyðslu: sum {i in flug, j in velar} 
	(virdiEld  * velFlaug[i,j]) * ((fjarlkm[i] * fuel[j])/gallonVegur) ;

	###	Skorður	###

subject to svarViðEftirspurn {i in flug, j in velar}:
	eftirs[i] * velFlaug[i,j] <= sæti[j];
		
subject to vélVerðurAðDrífa {i in flug, j in velar}:
	velFlaug[i,j] * fjarlkm[i] <= range[j];
	
subject to flotaSkorða {j in velar}:
	sum {i in flug} velFlaug[i,j] <= floti[j];
	
subject to borgarSkorða {i in flug}:
	sum {j in velar} velFlaug[i,j] == 1;
	


