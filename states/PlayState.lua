PlayState = Class{__includes = BaseState}

function PlayState:init() end
	Player1 = Fighter('Violence', 100, 100)

function PlayState:enter() end


function PlayState:exit() end


function PlayState:update(dt) 
	if love.keyboard.isDown('left') then
        Player1.dx = -PLAYER_SPEED
    elseif love.keyboard.isDown('right') then
        Player1.dx = PLAYER_SPEED
    else
        Player1.dx = 0
    end

    Player1:update(dt)




end


function PlayState:render() 
	Player1:render()

end