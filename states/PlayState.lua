
PlayState = Class{__includes = BaseState}

function PlayState:init() end
	Player1 = Fighter('Violence', 100, 290, -1)

function PlayState:enter() end


function PlayState:exit() end


function PlayState:update(dt) 
	if love.keyboard.isDown('left') then
        Player1.dx = -PLAYER_SPEED
        Player1.direction = 1
        Player1.currentAnimation = WalkAnim
    elseif love.keyboard.isDown('right') then
        Player1.dx = PLAYER_SPEED
        Player1.currentAnimation = WalkAnim
        Player1.direction = -1
    else
        Player1.dx = 0
        Player1.currentAnimation = IdleAnim
    end

    if love.keyboard.isDown('up') and Jumping > .5 then
        Player1.dy = -20
        Jumping = 0
    else
        Player1.dy = 0
        Player1.y = 290
    end

    Player1.y = Player1.y + Player1.dy

    Player1:update(dt)

function PlayState:render() 
	Player1:render()

end