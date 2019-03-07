SelectState = Class{__includes = BaseState}

function SelectState:init() end

function SelectState:enter() end

function SelectState:exit() end

function SelectState:update(dt) 
	if love.keyboard.isDown('space') then
		gStateMachine:change('play')
	end
end

function SelectState:render()
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.print('Press Space to Continue', 260, 550, 0, .5, .5)
end