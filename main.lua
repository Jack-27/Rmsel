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

end