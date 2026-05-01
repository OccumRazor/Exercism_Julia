using Dates

const dow1 = Dict("Monday"=>1,"Tuesday"=>2,"Wednesday"=>3,"Thursday"=>4,"Friday"=>5,"Saturday"=>6,"Sunday"=>7)
const weeks1 =Dict("first"=>1, "second"=>2, "third"=>3, "fourth"=>4, "last"=>5)

function meetup(year::Int, month::Int, week::String, dayofweek::String)
    d_o_w = dow1[dayofweek]
    if week == "teenth"
        f_day = firstdayofweek(Date(year,month,12))
        f_day = tonext(x->Dates.dayofweek(x)==d_o_w,f_day)
        if Dates.day(f_day) < 13
            f_day = tonext(x->Dates.dayofweek(x)==d_o_w,f_day)
        end
        return f_day
    end
    w_o_m = weeks1[week]
    if month == 1
        tgt_day = lastdayofmonth(Date(year-1,12,1))
    else
        tgt_day = lastdayofmonth(Date(year,month-1,1))
    end
    for _ in 1:w_o_m
        tgt_day = tonext(x->Dates.dayofweek(x)==d_o_w,tgt_day)
    end
    if Dates.month(tgt_day) ≠ month
        if month == 1
            tgt_day = lastdayofmonth(Date(year-1,12,1))
        else
            tgt_day = lastdayofmonth(Date(year,month-1,1))
        end
        for _ in 1:w_o_m-1
            tgt_day = tonext(x->Dates.dayofweek(x)==d_o_w,tgt_day)
        end
    end
    return tgt_day
end
