clc
clear

latitudeDirection = "N";
degreesLat = 34;
minutesLat = 1;
secondsLat = 4;
longitudeDirection = "W";
degreesLong = 117;
minutesLong = 41;
secondsLong = 24;
standardMeridian = 120;

panelTiltAngle = 0;
panelAzimuthAngle = 0;
groundReflectance = 0.2;

month = 8;
//day = 1;


//localTime = 12; // enter in integers (hourly)

exec('convertGlobal.sce');
exec('convertLst.sce');
exec('calcSunCoordinates.sce');
exec('NumberDays.sce');
exec('calcInsolation.sce');

[latitude, longitude] = convertGlobal(degreesLat, minutesLat, secondsLat, latitudeDirection, degreesLong, minutesLong, secondsLong, longitudeDirection);

for day = 1:31
    daysPassed = numberDays(month,day);
    dailyInsolationMatrix =[];
    for localTime=1:24
        solarHourAngle = convertLst(localTime, longitude, standardMeridian,daysPassed)
        [solarAltitudeAngle,solarAzimuthAngle] = calcSunCoordinates(latitude, daysPassed,solarHourAngle);
        if solarAltitudeAngle>0 then
            [insolationTotal,beamRadiation] = calcInsolation(solarAltitudeAngle,solarAzimuthAngle, panelTiltAngle, panelAzimuthAngle, groundReflectance, month, daysPassed);
            dailyInsolationMatrix(localTime,1:3)=[localTime round(insolationTotal) round(beamRadiation)]
        else
            dailyInsolationMatrix(localTime,1:3)=[localTime 0 0]
        end,
    end,
    dailyExtractedData = sum(dailyInsolationMatrix,'r');
    monthlyInsolationMatrix(day,1:3) = [day dailyExtractedData(1,2:3)]
end

    

    






