const days_feb = collect(1:28)
const days_small = collect(1:30)
const days_large = collect(1:31)
const month_large = [1,3,5,7,8,10,12]
const years = collect(1950:2026)
const months = collect(1:12)
using Dates

function shared_birthday(birthdates::Vector{String})
    for i ∈ eachindex(birthdates)
        for j ∈ i+1:length(birthdates)
            if birthdates[i][6:10] == birthdates[j][6:10]
                return true
            end
        end
    end
    return false
end

isleap(year::Int) = floor((2028-year)/4) == (2028-year)/4

function random_birthdates(groupsize::Int)
    birthdates = Vector{Dates.Date}(undef,groupsize)
    for i ∈ 1:groupsize
        year = rand(years)
        while isleap(year)
            year = rand(years)
        end
        month = rand(months)
        if month == 2
            day = rand(days_feb)
        elseif month ∈ month_large
            day = rand(days_large)
        else
            day = rand(days_small)
        end
        month = month < 10 ? "0" * string(month) : string(month)
        day = day < 10 ? "0" * string(day) : string(day)
        birthdates[i] = Date("$year-$month-$day")
    end
    return birthdates
end

function estimate_probability_of_shared_birthday(groupsize::Int)
    p0 = 1
    for i ∈ 2:groupsize
        p0 *= (365-i)/365
    end
    return 1-p0
end
