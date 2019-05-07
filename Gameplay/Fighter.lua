Fighter = Class{}

require 'ViolenceManAnims'

function Fighter:init(type, x, y, dir)
	self.x = x
	self.y = y
	self.sprite = love.graphics.newImage('Sprites/ViolenceMan/violenceManNil.png', format)
	self.dx = 0
	self.dy = 0
	self.width = 64
	self.height = 64
	self.currentAnimation = IdleAnim
	self.direction = dir
	self.offset = 0
	self.blocking = false

	
end

function Fighter:update(dt)
	if self.direction == -1 then
		self.offset = 256
	else 
		self.offset = 0
	end
	if self.dx < 0 then
		self.x = math.max(0, self.x + self.dx * dt)
	else
		self.x = math.min(WINDOW_WIDTH - self.width, self.x + self.dx * dt)
	end

	if  self.currentAnimation ~= BlockTOAnim and self.blocking == true and self.currentAnimation ~= BlockAnim then
		self.currentAnimation = BlockTOAnim
	elseif BlockTOAnim:getCurrentFrame() == 5 and self.currentAnimation == BlockTOAnim then
		self.currentAnimation = BlockAnim
	elseif self.blocking == false and self.currentAnimation == BlockTOAnim and self.currentAnimation == BlockAnim then
		self.currentAnimation = BlockFROMAnim
	elseif BlockFROMAnim.done == 'done' and self.currentAnimation == BlockAnimFROM then
		self.currentAnimation = IdleAnim
	end


	self.currentAnimation:update(dt)
end




	if self.y < 290 then
		self.dy = self.dy + GRAVITY * dt
	else
		self.dy=0
		self.y = 290
		Jumping = 1
	end

	self.currentAnimation:update(dt)
end

function Fighter:render()
	local anim = self.currentAnimation
	love.graphics.draw(gSprites[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()], self.x, self.y, 0, self.direction, 1, self.offset)
end