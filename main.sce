//function [] = sunPosition()
clc
clear

exec('NumberDays.sce');
exec('ConvertTime.sce');
exec('getDepthDiffuse.sce');

//latitudeSign is +1 if N of equator, -1 if S of equator
latitudeSign = 1;
degreesLat = 29;
minutesLat = 39;
secondsLat = 7.19;
longitudeSign = 1;
degreesLong = 82;
minutesLong = 19;
secondsLong = 29.97;
standardTimeMeridian = 75;
month = 2; // number e.g. 01 for January, 02 for February
day = 1;
//solarHourAngle = -10.7; // in degrees
solarHourAngle = 79;
panelTiltAngle = 30;
panelAzimuthAngle = 10;
groundReflectance = 0.2;

daysPassed = numberDays(month,day);
latitude = latitudeSign*(degreesLat + minutesLat/60 + secondsLat/3600);
longitude = longitudeSign*(degreesLong + minutesLong/60 + secondsLong/3600);

solarDec = 23.45*sind(360*(284+daysPassed)/365);
solarAltitudeAngle = asind(sind(latitude)*sind(solarDec)+cosd(latitude)*cosd(solarDec)*cosd(solarHourAngle));
solarAzimuthAngle = asind(cosd(solarDec)*sind(solarHourAngle)/cosd(solarAltitudeAngle));

i = acosd(cosd(solarAltitudeAngle)*cosd(solarAzimuthAngle-panelAzimuthAngle)*sind(panelTiltAngle)+sind(solarAltitudeAngle)*cosd(panelTiltAngle))

[opticalDepth, diffuseFactor] = getDepthDiffuse(month);

insolationExtra =1353*(1+.034*cosd(360*daysPassed/365.25)) 
instantRadiation = insolationExtra*exp(-opticalDepth/sind(solarAltitudeAngle))// Cn omitted (assume Cn = 1)
beamRadiation = instantRadiation*cosd(i);
diffuseRadiation = diffuseFactor*instantRadiation*cosd(panelTiltAngle/2)^2;
groundRadiation = groundReflectance*instantRadiation*(sind(solarAltitudeAngle)+diffuseFactor)*sind(panelTiltAngle/2)^2;
insolationTotal = beamRadiation + diffuseRadiation +groundRadiation;


hourAngleSunriseDif = acosd(-tand(latitude)*tand(solarDec)); //sunset is with +coef.
timeDifNoon = hourAngleSunriseDif*4/60; // unit in hours (float)

solarRiseTime = 12-timeDifNoon;
solarSetTime = 12+timeDifNoon;

solarRiseTimeFormatted = convertTime(solarRiseTime);
solarSetTimeFormatted = convertTime(solarSetTime);

n=daysPassed;
b=360/364*(n-81);
et =9.87*sind(2*b)-7.53*cosd(b)-1.5*sind(b);

localSunriseTime = solarRiseTime+(-et-4*(standardTimeMeridian-longitude))/60; //divid                                                     ed by 60 to match units in hours
localSunsetTime = solarSetTime+(-et-4*(standardTimeMeridian-longitude))/60;

localRiseTimeFormatted = convertTime(localSunriseTime);
localSetTimeFormatted = convertTime(localSunsetTime);

//endfunction




