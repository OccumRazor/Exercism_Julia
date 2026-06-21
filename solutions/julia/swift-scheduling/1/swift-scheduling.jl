using Dates
function workday(YMD::DateTime,month::Int)
    if Dates.month(YMD) < month
        D0 = firstdayofmonth(YMD + Month(month - Dates.month(YMD)))
    else
        D0 = firstdayofmonth(YMD + Year(1) + Month(month - Dates.month(YMD)))
    end
    weekday = dayofweek(D0)
    if weekday > 5
        D0 += Dates.Day(8 - weekday)
    end
    return D0
end

function workday(YMD::Date)
    D0 = lastdayofmonth(YMD)
    weekday = dayofweek(D0)
    if weekday > 5
        D0 -= Dates.Day(weekday - 5)
    end
    return D0
end


function delivery_date(start::String, description::String)
    YMD,TimeOfDay = split(start,'T')
    TimeOfDay = split(TimeOfDay,':')
    H = parse(Int,TimeOfDay[1])
    Mi = parse(Int,TimeOfDay[2])
    S = parse(Int,TimeOfDay[3])
    YMD = Date(YMD)
    YMD = DateTime(year(YMD),month(YMD),day(YMD),H,Mi,S)
    if 'M' ∈ description
        M = parse(Int,description[1:length(description)-1])
        D = workday(YMD,M)
        return  split(string(D),'T')[1]*"T08:00:00"
    elseif 'Q' ∈ description
        Q = parse(Int,description[2])
        QM = Dates.month(YMD)
        if QM > 3Q
            YMD = Date(year(YMD)+1,3Q,1)
        else
            YMD = Date(year(YMD),3Q,1)
        end
        D = workday(YMD)
        return string(D)*"T08:00:00"
    elseif description == "NOW"
        return string(DateTime(year(YMD),month(YMD),day(YMD),H+2,Mi,S))
    elseif description == "ASAP"
        if H < 13
            return string(DateTime(year(YMD),month(YMD),day(YMD),17,0,0))
        else
            return string(DateTime(year(YMD),month(YMD),day(YMD)+1,13,0,0))
        end
    else
        weekday = dayofweek(YMD)
        if weekday < 4
            return string(DateTime(year(YMD),month(YMD),day(YMD),17,0,0) + Dates.Day(5 - weekday))
        else
            return string(DateTime(year(YMD),month(YMD),day(YMD),20,0,0) + Dates.Day(7 - weekday))
        end
    end
end
