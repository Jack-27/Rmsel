Ghost = Class{}

require 'Characters/GhostAnims'
function Ghost:init(x, y, dir)
	self.x = x
	self.y = y
	self.dx = 0
	self.dy = 0
	self.width = 256
	self.height = 256
	self.currentAnimation = GIdleAnim
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
	self.jumping = true
	self.jumpHeight = 18
	self.Hurtboxx = self.x - 10000
	self.Hurtboxy = self.y - 10000
	self.HurtboxWidth = 85
	self.HurtboxHeight = 100
	self.Hurtbox = Hurtbox(self.Hurtboxx, self.Hurtboxy, self.HurtboxWidth, self.HurtboxHeight)
	self.PunchHB = Hurtbox(self.x - 150, self.y + 120, 145, 20)
	self.SKickHB = Hurtbox(self.x - 50, self.y + -500000, 260, 50)
	self.SPunchHB = Hurtbox(self.x - 70, self.y + 82, 360, 20)
	self.KickHB = Hurtbox(self.x -100000, self.y + 100, 145, 25)
	self.Attack = nil
	self.AttackData = {
		['Punch'] = '1111',
		['Kick'] = '2222',
		['SPunch'] = '4444',
		['SKick'] = '00.5'
 	}


	
end

function Ghost:update(dt)
	local anim = self.currentAnimation

	if self.direction == -1 then
		self.Hurtbox:move(self.x -30, self.y + 60)
		self.offset = 0
	else
		self.offset = 0
	end
	if self.dx < 0 and self.canMove == true then
		self.currentAnimation = GWalkAnim
		self.yoffset = 145
		self.xoffset = 270
		self.x = math.max(0, self.x + 2 * self.dx * dt)
	elseif self.dx > 0 then
		self.yoffset = 145
		self.xoffset = 270
		self.currentAnimation = GWalkAnim
		self.x = math.min(WINDOW_WIDTH - self.width, self.x + 2 * self.dx * dt)
	elseif self.dx == 0 then
		if self.attacking == false and self.dx == 0 then
	    	self.currentAnimation = GIdleAnim
	    	self.yoffset = 0
	    	GWalkAnim:refresh()
	    end
	end

	if self.direction == 1 then 
		self.Hurtbox:move(self.x - 55, self.y + 60)
		self.PunchHB:move(self.x - 285, self.y + 80)
		self.SKickHB:move(self.x - 350, self.y + 190)
		self.SPunchHB:move(self.x - 470, self.y + 95)
		self.KickHB:move(self.x - 215, self.y + 145)
	else
		self.Hurtbox:move(self.x - 30, self.y + 60)
		self.PunchHB:move(self.x + self.HurtboxWidth + 50, self.y + 80)
		self.SKickHB:move(self.x + 90, self.y + 190)
		self.SPunchHB:move(self.x + 100, self.y + 95)
		self.KickHB:move(self.x + 70, self.y + 145)
	end
	if self.currentAnimation == GIdleAnim then
		self.xoffset = 400
	end
	
	if self.blocking == true and self.blockframe < 5 then
		self.currentAnimation = GBlockTOAnim
		local anim = self.currentAnimation
		self.blockframe = anim.currentFrame
		self.yoffset = 300
		self.xoffset = 270
	elseif self.blocking == true and self.blockframe == 5 then
		self.currentAnimation = GBlockAnim
		self.yoffset = 300
		self.xoffset = 270
	elseif self.blocking == false and self.blockframe > 0 then
		self.currentAnimation = GBlockFROMAnim
		local anim = self.currentAnimation
		self.blockframe = (5 - anim.currentFrame)
		self.yoffset = 300
		self.xoffset = 270
	elseif self.dx == 0 then
		if self.attacking == false then
			self.blockframe = 0
			self.canMove = true
			GBlockFROMAnim:refresh()
			GBlockTOAnim:refresh()
			self.animCancel = true
		end
	end
	
	if self.crouching == true and self.crouchframe < 4 then
		self.currentAnimation = GCrouchTOAnim
		self.canMove = true
		self.yoffset = 150
		self.xoffset = 270
		self.crouchframe = self.currentAnimation.currentFrame
	elseif self.crouching == true and self.crouchframe == 4 then
		self.currentAnimation = GCrouchAnim
		self.canMove = true
		self.xoffset = 270
		self.yoffset = 150
	elseif self.crouching == false and self.crouchframe > 0 then
		self.currentAnimation = GCrouchFROMAnim
		self.xoffset = 270
		self.yoffset = 150
		local anim = self.currentAnimation
		self.crouchframe = (4 - anim.currentFrame)
	else
		if self.attacking == false and self.dx == 0 then
			self.crouchframe = 0
			self.canMove = true
			self.yoffset = 130
			GCrouchFROMAnim:refresh()
			GCrouchTOAnim:refresh()
			self.animCancel = true
		end
	end

	if self.attacking == true then
		local anim = self.currentAnimation
		self.attackFrame = anim.currentFrame
		if self.currentAnimation == GPunchAnim then
			self:punch()
		elseif self.currentAnimation == GSPunchAnim then
			self:spunch()
		elseif self.currentAnimation == GKickAnim then
			self:kick()
		elseif self.currentAnimation == GSKickAnim then
			self:skick()
		end
	else
		self.attackFrame = 0
	end
	if self.y < 290 then
		self.dy = self.dy + dt * GRAVITY
		self.jumping = false
	else
		self.y = 290
		self.dy = 0
		self.jumping = true
	end
	self.currentAnimation:update(dt)
end




function Ghost:render()
	--[[section to enable showing hit boxes
	love.graphics.setColor(1, 0, 0)
	self.PunchHB:render()
	self.SPunchHB:render()	
	self.SKickHB:render()
	self.KickHB:render()
	--GSKickHB:render()
	love.graphics.setColor(0, .05, .25)
	self.Hurtbox:render()
	love.graphics.setColor(1, 1, 1)--]]
	local anim = self.currentAnimation
	love.graphics.draw(GgSprites[anim.texture], GgFrames[anim.texture][anim:getCurrentFrame()], self.x, self.y, 0, self.direction, 1, self.xoffset + self.offset, self.yoffset)
end

function Ghost:punch()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = GPunchAnim
		self.attacking = true
		self.xoffset = 413
		self.yoffset = 270
		self.Attack = 'punch'
	elseif self.attackFrame > 14 and delf.attackFrame < 14 then
		self.canMove = false
		
	elseif self.attackFrame == 14 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = GIdleAnim
		self.attacking = false
		self.xoffset = 400
		self.yoffset = 130
		self.attack = nil
		GPunchAnim:refresh()
	end
end

function Ghost:kick()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = GKickAnim
		self.attacking = true
		self.Attack = 'kick'
		self.xoffset = 270
		self.yoffset = 140
		--Cannonball =

	elseif self.attackFrame > 28 then
		self.canMove = false
		self.xoffset = 270
		self.yoffset = 140
	elseif self.attackFrame == 28 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = GIdleAnim
		self.attacking = false
		self.xoffset = 400
		self.yoffset = 130
		self.Attack = nil
		GKickAnim:refresh()
	end
end
function Ghost:skick()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = GSKickAnim
		self.attacking = true
		self.Attack = 'skick'
		self.yoffset = 270
		self.xoffset = 396
	elseif self.attackFrame > 1 and self.attackFrame < 30 then
	   self.attacking = true
	   self.Attack = 'skick'

	   	elseif self.attackFrame == 31 then
	   	self.yoffset = 130
		self.xoffset = 396
		self.Attack = nil
		self.attacking = false
		self.detectInput = true
		self.currentAnimation = GIdleAnim
		GSKickAnim:refresh()

	elseif self.attackFrame == 31 then
		self.yoffset = 130
		self.xoffset = 396
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = GIdleAnim
		self.attacking = false
		self.Attack = nil
		GSKickAnim:refresh()
	end
end

function Ghost:spunch()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = GSPunchAnim
		self.attacking = true
		self.yoffset = 270
		self.xoffset = 525

	elseif self.attackFrame == 51 then
		self.attacking = true
		self.Attack = 'spunch'
		self.yoffset = 270
		self.xoffset = 525
	elseif self.attackFrame == 52 then
		self.Attack = nil

	elseif self.attackFrame == 55 then
		self.yoffset = 130
		self.xoffset = 400
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = GIdleAnim
		self.attacking = false
		self.Attack = nil
		GSPunchAnim:refresh()
	end
end