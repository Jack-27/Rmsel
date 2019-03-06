


--Alright
Push = require 'Push'
Class = require 'Class'


--Miscalleneous
require 'Util'
require 'Animation'
require 'Settings'
require 'StateMachine'
require 'Hurtbox'
require 'UI'
--characters
require 'ViolenceMan'
require 'GeorgeLopez'
--states
require 'states/BaseState'
require 'states/TitleState'
require 'states/PlayState'



function love.load() 
    --adds fonts and background
    BigFont = love.graphics.newFont('PrStart.ttf', 64)
    love.graphics.setFont(BigFont)
    love.graphics.setDefaultFilter('nearest', 'nearest')
	local background = love.graphics.newImage('Sprites/Backgrounds/TempBackground.png')
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
    --adds all the states to the state 
	gStateMachine = StateMachine {
        ['title'] = function() return TitleState() end,
        ['play'] = function() return PlayState() end
    }
    gStateMachine:change('title')
    --honestly this is useless a relic of olden days
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true,
        canvas = false
    })
end

function love.update(dt)
    --sets up state updates
	gStateMachine:update(dt)
    --allows it to close
	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
end
function love.draw()
    --adds background, lets statemachine draw, and fixes the mem leak
	love.graphics.draw(love.graphics.newImage('Sprites/Backgrounds/Background.png'), 0, 0)
	gStateMachine:render()
    collectgarbage( 'collect' )
end