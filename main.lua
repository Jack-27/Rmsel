--Alright
require 'Settings'
require 'Push'



function love.load() 
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
end

function love.update(dt)
	if love.keyboard.isDown('escape') then
		love.event.quit()
	end
end

function love.draw()
	love.graphics.clear(0, 0, 1)
	love.graphics.setColor(0, 0, 0)
	love.graphics.print('Your Mom Lol', WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2, 0, 1, 1)
end