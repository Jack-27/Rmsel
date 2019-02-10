Fighter = Class{}

function Fighter:init(type, x, y)
	self.x = x
	self.y = y
	self.sprite = love.graphics.newImage('sprites/ViolenceMan/violenceManNil.png', format)
	self.dx = 0
	self.width = 64
	self.height = 64

	
end

function Fighter:update(dt)
	if self.dx < 0 then
		self.x = math.max(0, self.x + self.dx * dt)
	else
		self.x = math.min(_WIDTH - self.width, self.x + self.dx * dt)
	end

end




function Fighter:render()
	love.graphics.draw(self.sprite, self.x, self.y, 0, 1, 1)
end