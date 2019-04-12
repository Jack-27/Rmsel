TitleState = Class{__includes = BaseState}

function TitleState:init() end


function TitleState:enter() end


function TitleState:exit() end


function TitleState:update(dt)
	if love.keyboard.isDown('return') then
		gStateMachine:change('play')
	end
end


function TitleState:render()
	love.graphics.draw(love.graphics.newImage('Sprites/Backgrounds/TitleScreen.png'), 0, 0)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print('Press Enter', 375, 260)
	love.graphics.setColor(1, 1, 1)


end