clc
clear

latitudeDirection = "N";
degreesLat = 29;
minutesLat = 39;
secondsLat = 7.19;
longitudeDirection = "W";
degreesLong = 82;
minutesLong = 19;
secondsLong = 29.97;
month = 2;
day = 1;
solarHourAngle = -10.7;
panelTiltAngle = 30;
panelAzimuthAngle = 10;
groundReflectance = 0.2;

exec('convertGlobal.sce');
exec('getSunCoordinates.sce');
exec('NumberDays.sce');
exec('getInsolation.sce');

daysPassed = numberDays(month,day);

[latitude, longitude] = convertGlobal(degreesLat, minutesLat, secondsLat, latitudeDirection, degreesLong, minutesLong, secondsLong, longitudeDirection);
[solarAltitudeAngle,solarAzimuthAngle] = getSunCoordinates(latitude, daysPassed,solarHourAngle);
[insolationTotal] = getInsolation(solarAltitudeAngle,solarAzimuthAngle, panelTiltAngle, panelAzimuthAngle, groundReflectance, month, daysPassed);





