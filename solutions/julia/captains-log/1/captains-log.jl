using Random

function random_planet()
    return rand(['D','H','J','K','L','M','N','R','T','Y'])
end

function random_ship_registry_number()
    return "NCC-" * string(rand(1000:9999))
end

function random_stardate()
    return 4.1e4 + 1e3 * rand()
end

function random_stardate_v2()
    return 4e4 + rand(1000.0:0.1:1999.9)
end

function pick_starships(starships, number_needed)
    numbers = Random.shuffle(1:length(starships))
    return [starships[n] for n in numbers[1:number_needed]]
end
