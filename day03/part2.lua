#!/usr/bin/lua

--[[
Lowercase item types a through z have priorities 1 through 26.
Uppercase item types A through Z have priorities 27 through 52.
]]

tablex = require 'pl.tablex'
stringx = require "pl.stringx"
Set = require 'pl.Set'

function char_to_priority(chr)
  if stringx.isupper(chr) then
    return string.byte(chr) - string.byte("A") + 27
  else
    return string.byte(chr) - string.byte("a") + 1
  end
end

function string_to_set(s)
  local t = {}
  for chr in s:gmatch"." do
    table.insert(t, chr)
  end

  return Set(t)
end

function priority(lines)
  local sets = tablex.map(string_to_set, lines)
  local intersection = sets[1]
  for i = 2, 3 do
    intersection = Set.intersection(intersection, sets[i])
  end

  return char_to_priority(Set.values(intersection)[1])
end

function total_priority(lines)
  local total = 0
  while true do
    local line1 = io.read("*line")
    if line1 == nil then return total end
    local line2 = io.read("*line")
    local line3 = io.read("*line")

    total = total + priority({line1, line2, line3})
  end
end

print(total_priority(io.lines()))
