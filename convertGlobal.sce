
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
