--Alright
Push = require 'Push'
Class = require 'Class'



require 'Util'
require 'Animation'
require 'Settings'
require 'ViolenceMan'
require 'StateMachine'

require 'states/BaseState'
require 'states/TitleState'
require 'states/PlayState'



function love.load() 
    BigFont = love.graphics.newFont('PrStart.ttf', 64)
    love.graphics.setFont(BigFont)
    love.graphics.setDefaultFilter('nearest', 'nearest')
	local background = love.graphics.newImage('Sprites/Backgrounds/TempBackground.png')
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)

	gStateMachine = StateMachine {
        ['title'] = function() return TitleState() end,
        ['play'] = function() return PlayState() end
    }
    gStateMachine:change('title')

    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true,
        canvas = false
    })

        




end

function love.update(dt)

	gStateMachine:update(dt)
	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
end
function love.draw()
	love.graphics.draw(love.graphics.newImage('Sprites/Backgrounds/Background.png'), 0, 0)
	gStateMachine:render()
    collectgarbage( 'collect' )
end