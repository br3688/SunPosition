
function [solarAltitudeAngle,solarAzimuthAngle] = calcSunCoordinates(latitude, dayspassed, solarHourAngle)

solarDec = 23.45*sind(360*(284+daysPassed)/365);
solarAltitudeAngle = asind(sind(latitude)*sind(solarDec)+cosd(latitude)*cosd(solarDec)*cosd(solarHourAngle));
solarAzimuthAngle = asind(cosd(solarDec)*sind(solarHourAngle)/cosd(solarAltitudeAngle));

endfunction




