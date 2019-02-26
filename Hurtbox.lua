Hurtbox = Class{}


function Hurtbox:init( x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height

end

function Hurtbox:move(x, y)
	self.x = x
	self.y = y
end

function Hurtbox:trans(width, height)
	self.width = self.width + width
	self.height = self.height + height
end
--for testing btw
function Hurtbox:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end

function Hurtbox:collide(hurtbox2)
	if self.x + self.width == hurtbox2.x then
		return true
	elseif self.x == hurtbox2.x + hurtbox2.width then
		return true
	else
		return false
	end
end
