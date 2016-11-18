function [] = sunPosition()

exec('C:\Users\user\Documents\Github\SunPosition\NumberDays.sce');
exec('C:\Users\user\Documents\Github\SunPosition\ConvertTime.sce');

directionLat = "N";
degreesLat = 29;
minutesLat = 39;
secondsLat = 7.19;
directionLong = "W";
degreesLong = 82;
minutesLong = 19;
secondsLong = 29.97;
standardTimeMeridian = 75;
month = 6; // number e.g. 01 for January, 02 for February
day = 11;
solarHourAngle = 0;

daysPassed = numberDays(month,day);
latitude = degreesLat + minutesLat/60 + secondsLat/3600;
longitude = degreesLong + minutesLong/60 + secondsLong/3600;

solarDec = 23.45*sind(360*(284+daysPassed)/365);
solarAltitudeAngle = asind(cosd(latitude)*cosd(solarDec)*cosd(solarHourAngle)+sind(latitude)*sind(solarDec));
solarAzimuthAngle = cosd(solarDec)*sind(solarHourAngle)/cosd(solarAltitudeAngle);

hourAngleSunriseDif = acosd(-tand(latitude)*tand(solarDec)); //sunset is with +coef.
timeDifNoon = hourAngleSunriseDif*4/60; // unit in hours (float)

solarRiseTime = 12-timeDifNoon;g
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

endfunction




