GeorgeLopez = Class{}

require 'GeorgeLopezAnims'
function GeorgeLopez:init(type, x, y, dir)
	--inits all the vars tried to make them self explainatory
	self.x = x
	self.y = y
	self.dx = 0
	self.width = 256
	self.height = 256
	self.currentAnimation = GLIdleAnim
	self.direction = dir
	self.offset = 0
	self.xoffset = 0
	self.yoffset = 0
	self.blocking = false
	self.blockframe = 0
	self.animCancel = true
	self.canMove = true
	self.crouchframe = 0
	self.attacking = false
	self.attackFrame = 0
	self.detectInput = true
	self.Hurtboxx = self.x 
	self.Hurtboxy = self.y 
	self.HurtboxWidth = self.width - 64
	self.HurtboxHeight = self.height - 50
	GLHurtbox = Hurtbox(self.Hurtboxx, self.Hurtboxy, self.HurtboxWidth, self.HurtboxHeight)



	
end

function GeorgeLopez:update(dt)
	--fixes the jumpin around in sprites when turning around
	if self.direction == -1 then
		self.offset = 256
	else
		self.offset = 0
	end
	--allows movement
	if self.dx < 0 and self.canMove == true then
		self.currentAnimation = GLWalkAnim
		self.x = math.max(0, self.x + self.dx * dt)
	elseif self.dx > 0 then
		self.currentAnimation = GLWalkAnim
		self.x = math.min(WINDOW_WIDTH - self.width, self.x + self.dx * dt)
	else
		if self.attacking == false then
	    	self.currentAnimation = GLIdleAnim
	    	GLWalkAnim:refresh()
	    end
	end
	--hitbox update
	GLHurtbox:move(self.x + 32, self.y + 50)
	--blocking code
	if self.blocking == true and self.blockframe < 5 then
		self.currentAnimation = GLBlockTOAnim
		local anim = self.currentAnimation
		self.blockframe = anim.currentFrame
	elseif self.blocking == true and self.blockframe == 5 then
		self.currentAnimation = GLBlockAnim
		GLHurtbox:shift(self.width +32)
	elseif self.blocking == false and self.blockframe > 0 then
		self.currentAnimation = GLBlockFROMAnim
		local anim = self.currentAnimation
		self.blockframe = (5 - anim.currentFrame)
	elseif self.dx == 0 then
		if self.attacking == false then
			self.blockframe = 0
			self.canMove = true
			GLBlockFROMAnim:refresh()
			GLBlockTOAnim:refresh()
			self.animCancel = true
			self.currentAnimation = GLIdleAnim
		end
	end
	--crouching code
	if self.crouching == true and self.crouchframe < 4 then
		self.currentAnimation = GLCrouchTOAnim
		local anim = self.currentAnimation
		self.crouchframe = anim.currentFrame
	elseif self.crouching == true and self.crouchframe == 4 then
		self.currentAnimation = GLCrouchAnim
	elseif self.crouching == false and self.crouchframe > 0 then
		self.currentAnimation = GLCrouchFROMAnim
		local anim = self.currentAnimation
		self.crouchframe = (4 - anim.currentFrame)
	else
		if self.attacking == false and self.dx == 0 then
			self.crouchframe = 0
			self.canMove = true
			GLCrouchFROMAnim:refresh()
			GLCrouchTOAnim:refresh()
			self.animCancel = true
			self.currentAnimation = GLIdleAnim
		end
	end
	self.currentAnimation:update(dt)
	--attack frame update code
	if self.attacking == true and self.dx == 0 then
		local anim = self.currentAnimation
		self.attackFrame = anim.currentFrame
		if self.currentAnimation == GLPunchAnim then
			self:punch()
		elseif self.currentAnimation == GLSPunchAnim then
			self:spunch()
		elseif self.currentAnimation == GLKickAnim then
			self:kick()
		elseif self.currentAnimation == GLSKickAnim then
			self:skick()
		end
	else
		self.attackFrame = 0
	end
	
end



--rendering 
function GeorgeLopez:render()
	--[[section to enable showing hit boxes
	love.graphics.setColor(0, .05, .25)
	GLHurtbox:render()
	love.graphics.setColor(1, 1, 1)--]]
	local anim = self.currentAnimation
	love.graphics.draw(GLgSprites[anim.texture], GLgFrames[anim.texture][anim:getCurrentFrame()], self.x, self.y, 0, self.direction, 1, self.xoffset + self.offset, self.yoffset)
end

function GeorgeLopez:punch()
	if self.attackFrame == 0 then
		self.currentAnimation = GLPunchAnim
		self.canMove = false
		self.detectInput = false
		self.attacking = true
	elseif self.attackFrame > 14 then
		self.canMove = false
	elseif self.attackFrame == 14 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = GLIdleAnim
		self.attacking = false
		GLPunchAnim:refresh()
	end
end

function GeorgeLopez:kick()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = GLKickAnim
		self.attacking = true
		--Cannonball =

	elseif self.attackFrame > 15 then
		self.canMove = false
	elseif self.attackFrame == 15 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = GLIdleAnim
		self.attacking = false
		GLKickAnim:refresh()
	end
end

function GeorgeLopez:skick()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = GLSKickAnim
		self.attacking = true

	elseif self.attackFrame > 13 then
		self.canMove = false
	elseif self.attackFrame == 13 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = GLIdleAnim
		self.attacking = false
		GLSKickAnim:refresh()
	end
end

function GeorgeLopez:spunch()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = GLSPunchAnim
		self.attacking = true

	elseif self.attackFrame > 12 then
		self.canMove = false
	elseif self.attackFrame == 12 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = GLIdleAnim
		self.attacking = false
		GLSPunchAnim:refresh()
	end
end
