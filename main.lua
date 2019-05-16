
--Alright
Push = require 'Utilities/Push'
Class = require 'Utilities/Class'


--Miscalleneous
require 'Gameplay/Projectile'
require 'Gameplay/Projectiles'
require 'Utilities/Util'
require 'Utilities/Animation'
require 'Settings'
require 'Utilities/StateMachine'
require 'Gameplay/Hurtbox'
require 'Gameplay/UI'

--characters

require 'Characters/ViolenceMan'
require 'Characters/TonyTheTiger'
require 'Characters/Ghost'
require 'Characters/GeorgeLopez'
--states
require 'states/BaseState'
require 'states/TitleState'
require 'states/PlayState'
require 'states/WinState'
require 'states/Select1State'
require 'states/Select2State'



function love.load() 
    --adds fonts and background
    BigFont = love.graphics.newFont('Sprites/PrStart.ttf', 64)
    love.graphics.setFont(BigFont)
    love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
    --adds all the states to the state 
	gStateMachine = StateMachine {
        ['title'] = function() return TitleState() end,
        ['play'] = function() return PlayState() end,
        ['win'] = function() return WinState() end,
        ['select1'] = function() return Select1State() end,
        ['select2'] = function() return Select2State() end
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
	gStateMachine:render()
    collectgarbage( 'collect' )
end