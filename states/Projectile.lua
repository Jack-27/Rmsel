Projectile = Class{}

function Projectile:init(despawn, speed, picture) 
	self.dir = 0
	self.x = 0
	self.y = 0
	self.speed = speed
	self.despawn =  despawn
	self.time = 0
	self.picture = love.graphics.newImage('Sprites/Projectiles/' .. picture .. '.png')
	self.dead = true
end


function Projectile:update(dt)
	if self.dead = false then
 		self.time = self.time + dt
		self.x = self.x + self.speed * self.dir
		if self.time >= self.despawn then
			self.dead = true
		end
	end
end

function Projectile:render()
	if self.dead = false then
		love.graphics.draw(self.picture, self.x, self.y, 0, self.dir)
	end
end

function Projectile:fire(x, y, dir)
	self.dead = false
	self.x = x
	self.y = y
	self.dir = dir
	self.time = 0
end

