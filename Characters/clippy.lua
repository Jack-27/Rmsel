clippy = Class{}

require 'Characters/clippyAnims'
function clippy:init(x, y, dir)
	--inits all the vars tried to make them self explainatory
	self.x = x
	self.y = y
	self.dx = 0
	self.dy = 0
	self.width = 256
	self.height = 256
	self.currentAnimation = cIdleAnim
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
	self.jumpHeight = 20
	self.Hurtboxx = self.x + 10
	self.Hurtboxy = self.y + 10
	-- mess with these, need good hitbox
	--ask Eric about how to get hitbox to work
	self.HurtboxWidth = self.width 
	self.HurtboxHeight = self.height 
	self.Hurtbox = Hurtbox(self.Hurtboxx, self.Hurtboxy, self.HurtboxWidth, self.HurtboxHeight)
	self.PunchHB = Hurtbox(self.x, self.y + 120, 32, 20)
	self.KickHB = Hurtbox(self.x, self.y + 215, 32, 25)
	self.SKickHB = Hurtbox(self.x, self.y + 32, 256, 64)
	self.SPunchHB = Hurtbox(self.x, self.y + 120, 32, 40)
	-- remember sub.string and tonumber
	self.Attack = nil
	self.AttackData = {
		['Punch'] = '0405',
		['Kick'] = '0708',
		['SPunch'] = '0010',
		['SKick'] = '0509'
 	}



	
end
-- Make sure to use c instead of GL

function clippy:update(dt)
	--fixes the jumpin around in sprites when turning around
	if self.direction == -1 then
		self.offset = 256
	else
		self.offset = 0
	end
	--allows movement
	if self.dx < 0 and self.canMove == true then
		self.currentAnimation = cWalkAnim
		self.x = math.max(0, self.x + self.dx * dt)
	elseif self.dx > 0 then
		self.currentAnimation = cWalkAnim
		self.x = math.min(WINDOW_WIDTH - self.width, self.x + self.dx * dt)
	else
		if self.attacking == false then
	    	self.currentAnimation = cIdleAnim
	    	cWalkAnim:refresh()
	    end
	end
	--hitbox update
	self.Hurtbox:move(self.x + 32, self.y + 50)
	if self.direction == 1 then 
		self.PunchHB:move(self.x, self.y + 120)
		self.KickHB:move(self.x, self.y + 215)
		self.SKickHB:move(self.x, self.y + 32)
	else
		self.PunchHB:move(self.x + self.HurtboxWidth + 32, self.y + 120)
		self.KickHB:move(self.x + self.HurtboxWidth + 32, self.y + 215)
		self.SKickHB:move(self.x, self.y + 32)
	end
	--blocking code
	if self.blocking == true and self.blockframe < 5 then
		self.currentAnimation = cBlockTOAnim
		local anim = self.currentAnimation
		self.blockframe = anim.currentFrame
	elseif self.blocking == true and self.blockframe == 5 then
		self.currentAnimation = cBlockAnim
	elseif self.blocking == false and self.blockframe > 0 then
		self.currentAnimation = cBlockFROMAnim
		local anim = self.currentAnimation
		self.blockframe = (5 - anim.currentFrame)
	elseif self.dx == 0 then
		if self.attacking == false then
			self.blockframe = 0
			self.canMove = true
			cBlockFROMAnim:refresh()
			cBlockTOAnim:refresh()
			self.animCancel = true
		end
	end
	--crouching code
	if self.crouching == true and self.crouchframe < 4 then
		self.currentAnimation = cCrouchTOAnim
		local anim = self.currentAnimation
		self.crouchframe = anim.currentFrame
	elseif self.crouching == true and self.crouchframe == 4 then
		self.currentAnimation = cCrouchAnim
		self.Hurtbox:shifth(170, 36)
	elseif self.crouching == false and self.crouchframe > 0 then
		self.currentAnimation = cCrouchFROMAnim
		local anim = self.currentAnimation
		self.Hurtbox:reset()
		self.crouchframe = (4 - anim.currentFrame)
	else
		if self.attacking == false and self.dx == 0 then
			self.crouchframe = 0
			self.canMove = true
			cCrouchFROMAnim:refresh()
			cCrouchTOAnim:refresh()
			self.animCancel = true
		end
	end
	self.currentAnimation:update(dt)
	--attack frame update code
	if self.attacking == true and self.dx == 0 then
		local anim = self.currentAnimation
		self.attackFrame = anim.currentFrame
		if self.currentAnimation == cPunchAnim then
			self:punch()
		elseif self.currentAnimation == cSPunchAnim then
			self:spunch()
		elseif self.currentAnimation == cKickAnim then
			self:kick()
		elseif self.currentAnimation == cSKickAnim then
			self:skick()
		end
	else
		self.attackFrame = 0
	end
	--jumping code
	if self.y < 290 then
		self.dy = self.dy + dt * GRAVITY
		self.jumping = false
	else
		self.y = 290
		self.dy = 0
		self.jumping = true
	end
end



--rendering 
function clippy:render()
	--text not being used below is like that because that code was to show hitbox
	--section to enable showing hit boxes
	--love.graphics.setColor(0, .05, .25)
	--cHurtbox:render()
	--love.graphics.setColor(1, 0, 0)
	--cPunchHB:render()
	--love.graphics.setColor(1, 1, 1)--]]
	local anim = self.currentAnimation
	love.graphics.draw(cgSprites[anim.texture], cgFrames[anim.texture][anim:getCurrentFrame()], self.x, self.y, 0, self.direction, 1, self.xoffset + self.offset, self.yoffset)
end

function clippy:punch()
	if self.attackFrame == 0 then
		self.currentAnimation = cPunchAnim
		self.canMove = false
		self.detectInput = false
		self.attacking = true
	elseif self.attackFrame > 9 then
		self.canMove = false
	elseif self.attackFrame == 9 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = cIdleAnim
		self.attacking = false
		cPunchAnim:refresh()
	end
end

function clippy:kick()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = cKickAnim
		self.attacking = true
		--Cannonball =

	elseif self.attackFrame > 9 then
		self.canMove = false
	elseif self.attackFrame == 9 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = cIdleAnim
		self.attacking = false
		cKickAnim:refresh()
	end
end

function clippy:skick()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = cSKickAnim
		self.attacking = true

	elseif self.attackFrame > 10 then
		self.canMove = false
	elseif self.attackFrame == 10 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = cIdleAnim
		self.attacking = false
		cSKickAnim:refresh()
	end
end

function clippy:spunch()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = cSPunchAnim
		self.attacking = true

	elseif self.attackFrame > 11 then
		self.canMove = false
	elseif self.attackFrame == 11 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = cIdleAnim
		self.attacking = false
		cSPunchAnim:refresh()
	end
end
