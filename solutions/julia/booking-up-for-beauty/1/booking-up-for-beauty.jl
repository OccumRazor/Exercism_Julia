using Dates

function schedule_appointment(appointment::String)
    d,t = split(appointment," ")
    month,day,year = split(d,"/")
    d = "$(year)-$(month)-$(day)"
    D = Dates.Date(d)
    T = Dates.Time(t)
    return Dates.DateTime(D,T)
end

function has_passed(appointment::DateTime)
    pst = Dates.now()
    return (pst - appointment) > Second(0)
end

function is_afternoon_appointment(appointment::DateTime)
    h = Dates.hour(appointment)
    if 12 ≤ h < 18
        return true
    else 
        return false
    end
end

function describe(appointment::DateTime)
    w_day = dayname(appointment)
    m_month = monthname(appointment)
    h = string(hour(appointment))
    m = string(minute(appointment))
    if length(h) == 1
        h = "0" * h
    end
    if length(m) == 1
        m = "0" * m
    end
    return "You have an appointment on $(w_day), $(m_month) $(day(appointment)), $(year(appointment)) at $(h):$(m)"
end

function anniversary_date()
    pst = Dates.now()
    this_year = year(pst)
    return Dates.Date(this_year,09,15)
end
