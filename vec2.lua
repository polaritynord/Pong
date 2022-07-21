local vec2 = {}

function vec2.new(x, y)
   local x = x or 0
   local y = y or 0
   local v = {
            [1] = x; --First index x
            [2] = y; --Second index y
            X = x; --Uppercase X property
            Y = y; --Uppercase Y property
            x = x; --Lowercase x property
            y = y; --Lowercase y property
         }
         
   v.mt = {} --Our metatable
   setmetatable(v, v.mt)
   
   v.Add = function (a, b)
      if getmetatable(a) ~= "Vector2" or getmetatable(b) ~= "Vector2" then
         return vec2.new()
      end
      local x = a.X + b.X
      local y = a.Y + b.Y
      return vec2.new(x, y)
   end
   v.Subtract = function (a, b)
      if getmetatable(a) ~= "Vector2" or getmetatable(b) ~= "Vector2" then
         return vec2.new()
      end
      local x = a.X - b.X
      local y = a.Y - b.Y
      return vec2.new(x, y)
   end
   v.Multiply = function (a, b)
      if type(a) == "table" and type(b) == "table" then
         if getmetatable(a) ~= "Vector2" or getmetatable(b) ~= "Vector2" then
            return vec2.new()
         end
         local x = a.X * b.X
         local y = a.Y * b.Y
         return vec2.new(x, y)
      elseif (type(a) == "number" or type(b) == "number") and not (type(a) == "number" and type("b") == number) then
         --A is a number OR b is a number. Not both.
         if type(a) == "number" then
            --If a is the number.
            return vec2.new(b.X * a, b.Y * a)
         elseif type(b) == "number" then
            --If b is the number.
            return vec2.new(a.X * b, a.Y * b)
         end
      end
      return vec2.new()
   end
   v.Divide = function (a, b)
      if type(a) == "table" and type(b) == "table" then
         if getmetatable(a) ~= "Vector2" or getmetatable(b) ~= "Vector2" then
            return vec2.new()
         end
         local x = a.X / b.X
         local y = a.Y / b.Y
         return vec2.new(x, y)
      elseif (type(a) == "number" or type(b) == "number") and not (type(a) == "number" and type("b") == number) then
         --A is a number OR b is a number. Not both.
         if type(a) == "number" then
            --If a is the number.
            return vec2.new(b.X / a, b.Y / a)
         elseif type(b) == "number" then
            --If b is the number.
            return vec2.new(a.X / b, a.Y / b)
         end
      end
      return vec2.new()
   end
   v.Print = function (a)
      if getmetatable(a) ~= "Vector2" then
         return "[NOT A VECTOR]"
      end
      return "["..tostring(a.X)..", "..tostring(a.Y).."]"
   end
   --
   v.Magnitude = function ()
      local x = v.X
      local y = v.Y
      return math.sqrt((x^2)+(y^2))
   end
   v.Unit = function ()
      local x = v.X
      local y = v.Y
      local d = math.sqrt((x^2)+(y^2))
      local dir = v / vec2.new(d, d)
      return dir
   end
   function v:lerp(a, frac)
      if getmetatable(a) ~= "Vector2" then
         return vec2.new()
      end
      local frac = frac or 0
      if frac < 0 then
         frac = 0
      elseif frac > 1 then
         frac = 1
      end
      local a = (a - v) * vec2.new(frac, frac)
      return a + v
   end
   function v:toAngle(a)
      if getmetatable(a) ~= "Vector2" then
         return vec2.new()
      end
      return math.atan2(a[2] - v[2], a[1] - v[1]) - math.pi
   end
   v.mt.__add = v.Add
   v.mt.__sub = v.Subtract
   v.mt.__div = v.Divide
   v.mt.__mul = v.Multiply
   v.mt.__tostring = v.Print
   v.mt.__metatable = "Vector2"
   return v
end

return vec2