# Define the `expected_bake_time` constant`

const expected_bake_time = 60

# Define the `preparation_time(layers)` function.

function preparation_time(layers)
    time = 2 * layers
end

# Define the `remaining_time(time_in_oven)` function.

function remaining_time(time_in_oven)
    time_left = expected_bake_time - time_in_oven
end

# Define the `total_working_time(layers, time_in_oven)` function.

function total_working_time(layers, time_in_oven)
    total_time = preparation_time(layers) + time_in_oven
end

