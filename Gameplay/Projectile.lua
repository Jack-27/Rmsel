Projectile = Class{}
require 'Gameplay/Hurtbox'

function Projectile:init(despawn, speed, picture, height) 
	self.dir = 0
	self.height = height
	self.x = 0
	self.y = 0
	self.speed = speed
	self.despawn =  despawn
	self.time = 0
	self.picture = love.graphics.newImage('Sprites/Projectiles/' .. picture .. '.png')
	self.dead = true
	self.hurtbox = Hurtbox(self.x, self.y, 32, 32)
end

function Projectile:update(dt)
	if self.dead == false then
 		self.time = self.time + dt
		self.x = self.x + self.speed * self.dir * -1
		if self.time >= self.despawn then
			self.dead = true
		end
	end
	self.hurtbox:move(self.x, self.y)
end

function Projectile:render()
	if self.dead == false then
		love.graphics.setColor(0, 0, 1)
		self.hurtbox:render()
		love.graphics.setColor(1, 1, 1)--]]
		love.graphics.draw(self.picture, self.x, self.y)

	end
end

function Projectile:fire(x, y, dir)
	self.dead = false
	self.x = x
	self.y = y
	self.dir = dir
	self.time = 0
end
