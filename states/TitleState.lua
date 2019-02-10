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
	love.graphics.print('*Main Menu Noises*', 500, 260, 0, 3, 3)


end