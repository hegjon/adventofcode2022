local max = -1
local current = 0

for line in io.lines() do
  if line == "" then
    max = math.max(max, current)
    current = 0
  else
    current = current + tonumber(line)
  end
end

print(max)
