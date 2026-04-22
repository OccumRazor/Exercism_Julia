function sortquantity!(qty)
    res_order = sortperm(qty,rev=true)
    sort!(qty,rev=true)
    return res_order
end

function sortcustomer(cust, srtperm)
    return cust[srtperm]
end

function production_schedule!(cust, qty)
    strperm = sortperm(qty,rev=true)
    cust_2 = cust[strperm]
    invperm = [findfirst(item->item==cust[i],cust_2) for i in eachindex(cust)]
    #invperm = [length(cust) + 1 - strperm[i] for i in eachindex(cust)]
    sort!(qty,rev=true)
    return cust[strperm],invperm
end
