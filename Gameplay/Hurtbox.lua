Hurtbox = Class{}


function Hurtbox:init(x, y, width, height)
	self.x = x
	self.y = y
	self.ogwidth = width
	self.ogheight = height
	self.width = width
	self.height = height
	self.widthMod = 0
	self.heightMod = 0

end

function Hurtbox:move(x, y)
	self.x = x
	self.y = y
end

function Hurtbox:shiftw(width, widthMod)
	self.width = width
	self.widthMod = widthMod
end

function Hurtbox:shifth(height, heightMod)
	self.height = height
	self.heightMod = heightMod
end

function Hurtbox:reset()
	self.height = self.ogheight
	self.width = self.ogwidth
	self.heightMod = 0
	self.widthMod = 0
end

--for testing btw
function Hurtbox:render()
	love.graphics.rectangle('fill', self.x + self.widthMod, self.y + self.heightMod, self.width, self.height)
end

function Hurtbox:collide(x, width, y, height)
  return self.x < x+width and
         x < self.x+self.width and
         self.y < y+height and
         y < self.y+self.height
end

