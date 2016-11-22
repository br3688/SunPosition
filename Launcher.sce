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

exec('getSunCoordinates.sce');
exec('getInsolation.sce');

function [latitude, longitude] = convertGlobal(degreesLat, minutesLat,secondsLat, latitudeDirection, degreesLong, minutesLong,secondsLong, longitudeDirection)
    if latitudeDirection == "N" then
        latitudeSign = 1;
    elseif latitudeDirection == "S"
        latitudeSign = -1;
    end
    
    if longitudeDirection == "W" then
        longitudeSign = 1;
    elseif longitudeDirection == "E" then
        longitudeSign = -1;
    end
    
    
    latitude = latitudeSign*(degreesLat + minutesLat/60 + secondsLat/3600);
    longitude = longitudeSign*(degreesLong + minutesLong/60 + secondsLong/3600);

endfunction

[latitude, longitude] = convertGlobal(degreesLat, minutesLat, secondsLat, latitudeDirection, degreesLong, minutesLong, secondsLong, longitudeDirection);
[solarAltitudeAngle,solarAzimuthAngle,daysPassed] = getSunCoordinates(latitude,month,day,solarHourAngle);
[insolationTotal] = getInsolation(solarAltitudeAngle,solarAzimuthAngle, panelTiltAngle, panelAzimuthAngle, groundReflectance, month, daysPassed);





