local M = {}

function count(tabla)
  local count = 0
  for _ in pairs(tabla) do count = count + 1 end
  return count
end

function has_key(tabla, key)
  local existe = false
  for k, v in pairs(tabla) do
    if k == key then
      existe = true
      break
    end
  end
  return existe
end

function exist(tabla, item)
  rpta = false
  for k, v in pairs(tabla) do
    if v == item then
      return true
    end
  end
  return rpta
end

function url_enconde(str)
  if ( str ) then
    str = string.gsub( str, "\n", "\r\n" )
    str = string.gsub( str, "([^%w ])",
    function (c) return string.format( "%%%02X", string.byte(c) ) end )
    str = string.gsub( str, " ", "+" )
  end
  return str
end

function split_delimeter(s, delimiter)
  result = {};
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(result, match);
  end
  return result;
end

function split_dot(s)
  result = {};
  for match in (s):gmatch("[^%.]+") do
    table.insert(result, match);
  end
  return result;
end

M.count = count
M.has_key = has_key
M.exist = exist
M.url_enconde = url_enconde
M.split_dot = split_dot
M.split_delimeter = split_delimeter

return M
