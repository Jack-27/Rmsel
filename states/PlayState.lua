PlayState = Class{__includes = BaseState}

function PlayState:init() end
	Player1 = GeorgeLopez('Violence', 100, 290, -1)
    Player2 = ViolenceMan('ah', 500, 290, 1)


function PlayState:enter() end


function PlayState:exit() end


function PlayState:update(dt) 
    --need to move the anim changes somewhere esle currently temp
    if Player1.detectInput == true then
       if love.keyboard.isDown('left') and Player1.canMove == true then
            Player1.dx = -PLAYER_SPEED
            Player1.direction = 1
            --Player1.currentAnimation = GLWalkAnim
        elseif love.keyboard.isDown('right') and Player1.canMove == true then
            Player1.dx = PLAYER_SPEED
            --Player1.currentAnimation = GLWalkAnim
            Player1.direction = -1
        else
            Player1.dx = 0
            --Player1.currentAnimation = GLIdleAnim
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
    else
        Player1:punch()
    end
    if Player2.detectInput == true then
       if love.keyboard.isDown('a') and Player2.canMove == true then
            Player2.dx = -PLAYER_SPEED
            Player2.direction = 1
        elseif love.keyboard.isDown('d') and Player2.canMove == true then
            Player2.dx = PLAYER_SPEED
            Player2.direction = -1
        else
            Player2.dx = 0
        end
        if love.keyboard.isDown('s') then
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
    Player2:update(dt)




end


function PlayState:render() 
	Player1:render()
    Player2:render()


end