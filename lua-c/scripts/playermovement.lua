local x, y = 1, 1
local WINDOW_WIDTH = 800
local WINDOW_HIGHT = 600
local dx, dy = 50, 30

function update(delta_time)
    x = x + dx * delta_time
    y = y + dy * delta_time

    if x > WINDOW_WIDTH or x <= 0 then
        dx = -dx
    end

    if y > WINDOW_HIGHT or y <= 0 then
        dy = -dy
    end

    -- print("Delta time from lua: " .. delta_time)
    -- print("Player position: " .. x .. ", " .. y)
    set_player_pos(x, y)
end

-- function set_playwer_pos(x, y)
--     -- set player position
--     player.x = x
--     player.y = y
-- end

function render()
end
