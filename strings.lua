email = "jacky.yao@gmail.com"
print(string.lower(email))
new_email = string.lower(email)
print(string.upper(new_email))

color = "#cc10e3"
print(color)
pure_color = string.upper(string.gsub(color, "#", ""))
print(pure_color)

sub_color = string.sub(color,1,4)
sub_color2 = string.sub(color,0,4)
sub_color3 = string.len(color)
length = #color --lengh 
print(sub_color)
print(sub_color2)
print(length)

result = string.find(email, '@')
print(result)

