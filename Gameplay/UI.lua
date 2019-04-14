UI = Class{}


function UI:init()
	self.P1HP = 100
	self.P2HP = 100
	self.timeDisplay = 90 
	self.round = 1
	self.P1Wins = 0
	self.P2Wins = 0
	self.time = 0

end

function UI:update(dt)
	self.time = self.time + dt


end

function UI:damage(player, damage)
	if player == 1 then
		self.P1HP = self.P1HP - damage
	elseif player == 2 then
		self.P2HP = self.P2HP - damage
	end
end

function UI:render()
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('fill', 10, 20, 510, 50)
	love.graphics.rectangle('fill', WINDOW_WIDTH - 520, 20, 508, 50)
	love.graphics.print(math.floor(90 - self.time), WINDOW_WIDTH / 2 - 50, 20)
	love.graphics.setColor(1, 0, 0)
	love.graphics.rectangle('fill', 16, 24, self.P2HP * 5 - 2, 42)
	love.graphics.rectangle('fill', WINDOW_WIDTH - 516, 24, self.P1HP * 5 - 2, 42)
	love.graphics.setColor(1, 1, 1)


end
