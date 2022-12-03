#!/usr/bin/lua

--[[
Lowercase item types a through z have priorities 1 through 26.
Uppercase item types A through Z have priorities 27 through 52.
]]

function char_to_priority(chr)
  if string.byte(chr) <= 90 then --uppercase
    return string.byte(chr) - string.byte("A") + 27
  else --lowercase
    return string.byte(chr) - string.byte("a") + 1
  end
end

function priority(line)
  local mid = #line/2
  local c1 = string.sub(line, 1, mid)
  local c2 = string.sub(line, mid+1, -1)

  for chr in c1:gmatch"." do
    if string.find(c2, chr) then
      return char_to_priority(chr)
    end
  end
end

function total_priority(lines)
  local total = 0
  for line in lines do
    total = total + priority(line)
  end
  return total
end

print(total_priority(io.lines()))
