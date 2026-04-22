function get_vector_of_wagons(args...)
    return collect(args)
end

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    first,second,third,last... = each_wagons_id
    return [[third];missing_wagons;last;[first];[second]]

end

function add_missing_stops(route, stops...)
    d = collect(stops)
    n_route = route
    n_route = Dict("stops" => [d[i][2] for i in eachindex(d)],"to"=>route["to"],"from"=>route["from"])
    return n_route
end

function extend_route_information(route; more_route_information...)
    d = Dict(more_route_information)
    return merge(route,d)
end
