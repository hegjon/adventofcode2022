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
  Z="B",

  A="Z",
  B="X",
  C="Y"
}

local loss = {
  A="Y",
  C="X",
  B="Z",

  Z="A",
  X="B",
  Y="C"
}

local draws = {
  Y="B",
  X="A",
  Z="C",

  A="X",
  B="Y",
  C="Z"
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

function select(opponent, what_to_do)
  local LOOSE="X"
  local DRAW="Y"
  local WIN="Z"

  if what_to_do == LOOSE then
    return wins[opponent]
  elseif what_to_do == DRAW then
    return draws[opponent]
  elseif what_to_do == WIN then
    return loss[opponent]
  end
end

function total_score(lines)
  local total = 0
  for line in lines do
    local opponent = string.sub(line, 1, 1)
    local what_to_do = string.sub(line, 3, 3)
    local selected = select(opponent, what_to_do)

    total = total +
            select_score(selected) +
            match_score(opponent, selected)
  end
  return total
end

print(total_score(io.lines()))
