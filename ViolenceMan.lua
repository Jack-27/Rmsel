ViolenceMan = Class{}

require 'ViolenceManAnims'
function ViolenceMan:init(type, x, y, dir)
	self.x = x
	self.y = y
	self.dx = 0
	self.width = 64
	self.height = 64
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

	
end

function ViolenceMan:update(dt)
	local anim = self.currentAnimation

	if self.direction == -1 then
		self.offset = 256
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
			self.animCancel = true
			self.currentAnimation = VMIdleAnim
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
			self.currentAnimation = VMIdleAnim
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
	self.currentAnimation:update(dt)
end




function ViolenceMan:render()
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
	elseif self.attackFrame > 21 then
		self.canMove = false
	elseif self.attackFrame == 21 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = VMIdleAnim
		self.attacking = false
		self.xoffset = 0
		self.yoffset = 0
		VMPunchAnim:refresh()
	end
end

function ViolenceMan:kick()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = VMKickAnim
		self.attacking = true
		--Cannonball =

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

	elseif self.attackFrame > 22 then
		self.canMove = false
	elseif self.attackFrame == 22 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = VMIdleAnim
		self.attacking = false
		VMSKickAnim:refresh()
	end
end

function ViolenceMan:spunch()
	if self.attackFrame == 0 then
		self.canMove = false
		self.detectInput = false
		self.currentAnimation = VMSPunchAnim
		self.attacking = true

	elseif self.attackFrame > 7 then
		self.canMove = false
	elseif self.attackFrame == 7 then
		self.canMove = true
		self.detectInput = true
		self.currentAnimation = VMIdleAnim
		self.attacking = false
		VMSPunchAnim:refresh()
	end
end
