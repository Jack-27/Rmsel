PlayState = Class{__includes = BaseState}

function PlayState:init() end
	Player1 = ViolenceMan('Violence', 100, 290, -1)
    --Player2 = nil


function PlayState:enter() end


function PlayState:exit() end


function PlayState:update(dt) 
    if Player1.detectInput == true then
       if love.keyboard.isDown('left') and Player1.canMove == true then
            Player1.dx = -PLAYER_SPEED
            Player1.direction = 1
            Player1.currentAnimation = WalkAnim
        elseif love.keyboard.isDown('right') and Player1.canMove == true then
            Player1.dx = PLAYER_SPEED
            Player1.currentAnimation = WalkAnim
            Player1.direction = -1
        else
            Player1.dx = 0
            Player1.currentAnimation = IdleAnim
        end
        if love.keyboard.isDown('down') then
            Player1.crouching = true
            Player1.canMove = false
        else
            Player1.crouching = false
        end
        if love.keyboard.isDown('rshift') then
            Player1.blocking = true
            Player1.canMove = false
        else
            Player1.blocking = false
        end
        if love.keyboard.isDown(',') and love.keyboard.isDown('/') then
            Player1:spunch()
        elseif love.keyboard.isDown(',') and not love.keyboard.isDown('/') then
            Player1:punch()
        end
        if love.keyboard.isDown('.') and love.keyboard.isDown('/') then
            Player1:skick()
        elseif love.keyboard.isDown('.') and not love.keyboard.isDown('/') then
            Player1:kick()
        end
    end
    --[[if Player2.detectInput == true then
       if love.keyboard.isDown('a') and Player2.canMove == true then
            Player2.dx = -PLAYER_SPEED
            Player2.direction = 1
            Player2.currentAnimation = WalkAnim
        elseif love.keyboard.isDown('d') and Player2.canMove == true then
            Player2.dx = PLAYER_SPEED
            Player2.currentAnimation = WalkAnim
            Player2.direction = -1
        else
            Player2.dx = 0
            Player2.currentAnimation = IdleAnim
        end
        if love.keyboard.isDown('w') then
            Player2.crouching = true
            Player2.canMove = false
        else
            Player2.crouching = false
        end
        if love.keyboard.isDown('lshift') then
            Player2.blocking = true
            Player2.canMove = false
        else
            Player2.blocking = false
        end
        if love.keyboard.isDown('q') and love.keyboard.isDown('tab') then
            Player2:spunch()
        elseif love.keyboard.isDown('q') and not love.keyboard.isDown('tab') then
            Player2:punch()
        end
        if love.keyboard.isDown('e') and love.keyboard.isDown('tab') then
            Player2:skick()
        elseif love.keyboard.isDown('e') and not love.keyboard.isDown('tab') then
            Player2:kick()
        end
    end--]]

    Player1:update(dt)
    --Player2:update(dt)




end


function PlayState:render() 
	Player1:render()


end