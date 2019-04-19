WinState = Class{__includes = BaseState}

function WinState:init() 
	
end


function WinState:enter(parems)
	self.P1HP = parems.P1HP
	self.P2HP = parems.P2HP
 end


function WinState:exit() end

function WinState:update(dt)
 	if love.keyboard.isDown('return') then
 		gStateMachine:change('win')
 	end
 	if self.P1HP > self.P2HP then
		self.winner = 'P1'
	else
		self.winner = 'P2'
	end
end

function WinState:render()
	love.graphics.draw(love.graphics.newImage('Sprites/Backgrounds/Win.png'), 0, 0)
	love.graphics.setColor(0, 0, 0)
	if self.winner == 'P1' then
		love.graphics.print('Player 2 Wins!', 150, 260)
	else
		love.graphics.print('Player 1 Wins!', 150, 260)
	end
	love.graphics.setColor(1, 1, 1)


end