ViolenceMan = Class{}

require 'Characters/ViolenceManAnims'
function ViolenceMan:init(x, y, dir)
	self.x = x
	self.y = y
	self.dx = 0
	self.dy = 0
	self.width = 256
	self.height = 256
	self.currentAnimation = VMIdleAnim
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
	self.Hurtboxx = self.x + 70
	self.Hurtboxy = self.y + 20
	self.HurtboxWidth = 75
	self.HurtboxHeight = 232
	self.Hurtbox = Hurtbox(self.Hurtboxx, self.Hurtboxy, self.HurtboxWidth, self.HurtboxHeight)
	self.PunchHB = Hurtbox(self.x - 150, self.y + 120, 152, 20)
	self.SKickHB = Hurtbox(self.x, self.y + 145, 32, 50)
	self.SPunchHB = Hurtbox(self.x - 70, self.y + 82, 110, 20)
	self.KickHB = VMProjectile.hurtbox
	self.Attack = nil
	self.AttackData = {
		['Punch'] = '1111',
		['Kick'] = '0005',
		['SPunch'] = '0508',
		['SKick'] = '1815'
 	}


	
end

function ViolenceMan:update(dt)
	local anim = self.currentAnimation
	self.KickHB = VMProjectile.hurtbox

	if self.direction == -1 then
		self.offset = 210
	else
		self.offset = 0
	end
	if self.dx < 0 and self.canMove == true then
		self.currentAnimation = VMWalkAnim
		self.x = math.max(0, self.x + self.dx * dt)
	elseif self.dx > 0 then
		self.currentAnimation = VMWalkAnim
		self.x = math.min(WINDOW_WIDTH - self.width, self.x + self.dx * dt)
	elseif self.dx == 0 then
		if self.attacking == false and self.dx == 0 then
	    	self.currentAnimation = VMIdleAnim
	    	VMWalkAnim:refresh()
	    end
	end

	self.Hurtbox:move(self.x + 70, self.y + 20)
	if self.direction == 1 then 
		self.PunchHB:move(self.x - 100, self.y + 80)
		self.SKickHB:move(self.x, self.y + 155)
		self.SPunchHB:move(self.x - 70, self.y + 95)
	else
		self.PunchHB:move(self.x + self.HurtboxWidth + 62, self.y + 80)
		self.SKickHB:move(self.x + 170, self.y + 155)
		self.SPunchHB:move(self.x + self.HurtboxWidth + 90, self.y + 95)
	end
	
	if self.blocking == true and self.blockframe < 5 then
		self.currentAnimation = VMBlockTOAnim
		local anim = self.currentAnimation
		self.blockframe = anim.currentFrame
	elseif self.blocking == true and self.blockframe == 5 then
		self.currentAnimation = VMBlockAnim
	elseif self.blocking == false and self.blockframe > 0 then
		self.currentAnimation = VMBlockFROMAnim
		local anim = self.currentAnimation
		self.blockframe = (5 - anim.currentFrame)
	else
		if self.attacking == false and self.dx == 0 then
			self.blockframe = 0
			self.canMove = true
			VMBlockFROMAnim:refresh()
			VMBlockTOAnim:refresh()
			self.animCancel = truem
		end
	end
	if self.crouching == true and self.crouchframe < 4 then
		self.currentAnimation = VMCrouchTOAnim
		self.crouchframe = self.currentAnimation.currentFrame
	elseif self.crouching == true and self.crouchframe == 4 then
		self.currentAnimation = VMCrouchAnim
	elseif self.crouching == false and self.crouchframe > 0 then
		self.currentAnimation = VMCrouchFROMAnim
		local anim = self.currentAnimation
		self.crouchframe = (4 - anim.currentFrame)
	else
		if self.attacking == false and self.dx == 0 then
			self.crouchframe = 0
			self.canMove = true
			VMCrouchFROMAnim:refresh()
			VMCrouchTOAnim:refresh()
			self.animCancel = true
		end
	end

	if self.attacking == true then
		local anim = self.currentAnimation
		self.attackFrame = anim.currentFrame
		if self.currentAnimation == VMPunchAnim then
			self:punch()
		elseif self.currentAnimation == VMSPunchAnim then
			self:spunch()
		elseif self.currentAnimation == VMKickAnim then
			self:kick()
		elseif self.currentAnimation == VMSKickAnim then
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
	if self.direction == 1 then
		self.dirx = self.x + 60
	else
		self.dirx = self.x + 140
	end

	self.currentAnimation:update(dt)
	VMProjectile:update(dt)
	VMProjectile:cat()
end 




function ViolenceMan:render()
	--[[section to enable showing hit boxes
	love.graphics.setColor(1, 0, 0)
	self.PunchHB:render()
	self.SPunchHB:render()	
	self.SKickHB:render()
	--VMSKickHB:render()
	love.graphics.setColor(0, .05, .25)
	self.Hurtbox:render()
	love.graphics.setColor(1, 1, 1)--]]
	VMProjectile:render()
	local anim = self.currentAnimation
	love.graphics.draw(VMgSprites[anim.texture], VMgFrames[anim.texture][anim:getCurrentFrame()], self.x, self.y, 0, self.direction, 1, self.xoffset + self.offset, self.yoffset)
end

function ViolenceMan:punch()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = VMPunchAnim
		self.attacking = true
		self.xoffset = 256
		self.yoffset = 256
		self.Attack = 'punch'
	elseif self.attackFrame > 21 and delf.attackFrame < 15 then
		self.canMove = false
		
	elseif self.attackFrame == 21 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = VMIdleAnim
		self.attacking = false
		self.xoffset = 0
		self.yoffset = 0
		self.Attack = nil
		VMPunchAnim:refresh()
	end
end

function ViolenceMan:kick()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = VMKickAnim
		self.attacking = true
		self.Attack = 'kick'
		--Cannonball =
	elseif self.attackFrame == 8 then
		VMProjectile:fire(self.dirx, self.y + 200, self.direction)
	elseif self.attackFrame > 13 then
		self.canMove = false
	elseif self.attackFrame == 13 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = VMIdleAnim
		self.attacking = false
		VMKickAnim:refresh()
	end
end

function ViolenceMan:skick()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = VMSKickAnim
		self.attacking = true
		self.Attack = 'spunch'

	elseif self.attackFrame > 22 then
		self.canMove = false
	elseif self.attackFrame == 22 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = VMIdleAnim
		self.attacking = false
		self.Attack = nil
		VMSKickAnim:refresh()
	end
end

function ViolenceMan:spunch()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = VMSPunchAnim
		self.attacking = true
		self.Attack = 'spunch'

	elseif self.attackFrame > 7 then
		self.canMove = false
	elseif self.attackFrame == 7 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = VMIdleAnim
		self.attacking = false
		self.Attack = nil
		VMSPunchAnim:refresh()
	end
end
