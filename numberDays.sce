function [days] = numberDays(month,day)

days = 0;

for i = 1:month-1
    if pmodulo(i,2) == 1 then
        isEven = %F;
    else
        isEven = %T;
    end,

    if i <= 7 then
        if isEven == %T;
            if i == 2 then
                days = days + 28;
            else
                days = days + 30;
            end,
        else
            days = days + 31;
        end,
    end,
    if i >7 then
        if isEven == %T;
            days = days + 31;
        else 
            days = days+30;
        end,
    end,
end

days = days + day;

endfunction

//1	31	
//2	28	59
//3	31	90
//4	30	120
//5	31	151
//6	30	181
//7	31	212
//8	31	243
//9	30	273
//10	31	304
//11	30	334
//12	31	365




