function [solarHourAngle] = convertLst(localTime, longitude, standardMeridian,daysPassed)
    LST = localTime
    n=daysPassed;
    b=360/364*(n-81);
    ET =9.87*sind(2*b)-7.53*cosd(b)-1.5*sind(b);
    solarTime = LST*60 + ET + 4*(standardMeridian- longitude) // Lst time 60 to convert hours to minutes
    solarHourAngle = (solarTime-12*60)/4
endfunction
