--Alright
Push = require 'Push'
Class = require 'Class'


require 'Settings'
require 'Fighter'
require 'StateMachine'

require 'states/BaseState'
require 'states/TitleState'



function love.load() 
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)

	gStateMachine = StateMachine {
        ['title'] = function() return TitleState() end
    }
    gStateMachine:change('title')
        




end

function love.update(dt)

	gStateMachine:update(dt)
	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
end
function love.draw()
	gStateMachine:render()
end