enemy_x, enemy_y = 0, 0
player_x, player_y = 400, 300

while true do
    print("+------------------------------------")
    print("| Welcome, " .. os.date() .. " |")
    print("+------------------------------------")
    print("| 1. Generate random enemy position")
    print("| 2. Distance from enemy to player")
    print("| 3. Get angle from enemy to player")
    print("| 4. Exit")
    print("+------------------------------------")
    print("Please, select your option:")

    local user_option = io.read("n")

    if user_option == 1 then
        print("Generating random enemy position...")
        enemy_x = math.random(0, 800)
        enemy_y = math.random(0, 600)
        print("Enemy position: (" .. enemy_x .. ", " .. enemy_y .. ")")
    elseif user_option == 2 then
        distance = math.sqrt((enemy_x - player_x) ^ 2 + (enemy_y - player_y) ^ 2)
        print("Distance from enemy to player: " .. distance)
    elseif user_option == 3 then
        print("enemy: " .. enemy_x .. ", " .. enemy_y)
        print("player: " .. player_x .. ", " .. player_y)
        angle = math.atan(enemy_y - player_y, enemy_x - player_x) * 180 / math.pi
        local a_degrees = math.deg(angle)
        print("Angle in degrees: " .. a_degrees)
        print("Angle from enemy to player: " .. angle)
    elseif user_option == 4 then
        print("Exiting...")
        break
    else
        print("Invalid option. Please try again.")
    end
end

print("Thank you , goodbye!")
