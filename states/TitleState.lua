TitleState = Class{__includes = BaseState}

function TitleState:init() end


function TitleState:enter() end


function TitleState:exit() end


function TitleState:update(dt)
	if love.keyboard.isDown('return') then
		gStateMachine:change()
	end
end


function TitleState:render()
	love.graphics.clear(0, 0, .75, 1)


end