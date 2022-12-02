--[[
A = Rock
B = Paper
C = Scissors

Y = Paper
X = Rock
Z = Scissors
]]

local points = {
  Y=2,
  X=1,
  Z=3
}

local wins = {
  Y="A",
  X="C",
  Z="B"
}

local draws = {
  Y="B",
  X="A",
  Z="C"
}

local total = 0

for line in io.lines() do
  local opponent = string.sub(line, 1, 1)
  local selected = string.sub(line, 3, 3)

  total = total + points[selected]
  if wins[selected] == opponent then
    total = total + 6
  elseif draws[selected] == opponent then
    total = total + 3
  end

end

print(total)
