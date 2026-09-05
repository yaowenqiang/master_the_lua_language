-- Name: Ryu        ->  Hadouken
-- Name: Chun Li    ->  Lightning kick
-- Name: Guile      ->  Sonic boom
-- Name: Honda      ->  Hundred Hands Slap
-- Name: Ken        ->  Hadouken
-- Name: Blanka     ->  Electric shock

fighter_name = string.lower("Ken")

if fighter_name == "ryu" or fighter_name == "ken" then
	attack_move = "hadouken"
elseif fighter_name == "Blanka" then
	attack_move = "electric shock"
elseif fighter_name == "Chun Li" then
	attack_move = "lightning kick"
elseif fighter_name == "Guile" then
	attack_move = "sonic boom"
elseif fighter_name == "Honda" then
	attack_move = "hundred hands slap"
end
print("Attack move : " .. attack_move)
