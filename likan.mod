# Eldsneiti

# Áfangastaðir
set afangS;
param Flightno{afangS};
param Demandpas{afangS};
param DistanceKm{afangS};

# Markaðsvirði eldsneytis á gallon
param mEld;

# Gallon af eldsneyti vegur
param gEld;

# Tegund á flugvél og fjöldi lausra véla
set aCraftType;
param nrAirCraft{aCraftType};

# Fjöldi sæta í tilteknari flugvélategund
set velar;
param seats{velar};

# Kostnaður á flugi
set flugVerd;
param kostn{flugVerd};