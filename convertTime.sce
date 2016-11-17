function [timeMatrix] = convertTime(decimalHours)
    hours = floor(decimalHours);
    minutes = round((decimalHours-hours)*60);
    timeMatrix = [hours minutes]
endfunction

    
    
