local calories = {}
local current = 0

for line in io.lines() do
  if line == "" then
    table.insert(calories, current)
    current = 0
  else
    current = current + tonumber(line)
  end
end

function reverse(n1, n2)
  return n1 > n2
end

table.sort(calories, reverse)
print(calories[1] + calories[2] + calories[3])
