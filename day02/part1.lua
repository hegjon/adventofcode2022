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

function select_score(selected)
  return points[selected]
end

function match_score(opponent, selected)
  if wins[selected] == opponent then
    return 6
  elseif draws[selected] == opponent then
    return 3
  else
    return 0
  end
end

function total_score(lines)
  local total = 0
  for line in lines do
    local opponent = string.sub(line, 1, 1)
    local selected = string.sub(line, 3, 3)

    total = total +
            select_score(selected) +
            match_score(opponent, selected)
  end
  return total
end

print(total_score(io.lines()))
