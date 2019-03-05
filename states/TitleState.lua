TitleState = Class{__includes = BaseState}

function TitleState:init() end


function TitleState:enter() end


function TitleState:exit() end


function TitleState:update(dt)
	if love.keyboard.isDown('return') then
		gStateMachine:change('select')
	end
end


function TitleState:render()
	love.graphics.setColor(0, 0, 0)
	love.graphics.print('*Main Menu Noises*', 125, 260)
	love.graphics.setColor(1, 1, 1)


end