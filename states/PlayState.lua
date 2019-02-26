PlayState = Class{__includes = BaseState}

function PlayState:init() end
	Player1 = GeorgeLopez(100, 290, -1)
    Player2 = ViolenceMan(500, 290, 1)
   -- UI = UI()


function PlayState:enter() end


function PlayState:exit() end


function PlayState:update(dt) 
   -- UI:update(dt)
   --player one controls
   --uses detect input boolean in order to lock/unlock play using characters
    if Player1.detectInput == true then
        --movement
       if love.keyboard.isDown('left') and Player1.canMove == true then
            Player1.dx = -PLAYER_SPEED
            Player1.direction = 1
            
        elseif love.keyboard.isDown('right') and Player1.canMove == true then
            Player1.dx = PLAYER_SPEED
            
            Player1.direction = -1
        else
            Player1.dx = 0
            
        end
        --crouching
        if love.keyboard.isDown('down') then
            Player1.crouching = true
            Player1.canMove = false
        else
            Player1.crouching = false
        end
        --blocking
        if love.keyboard.isDown('rshift') then
            Player1.blocking = true
            Player1.canMove = false
        else
            Player1.blocking = false
        end
        --attacks allowing for the / to change into specials 
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
        --jumping
        if love.keyboard.isDown('up') and Player1.jumping == true then
            Player1.dy = - Player1.jumpHeight
        end
        Player1.y = Player1.y + Player1.dy
    else
        Player1:punch()
    end
    --Player 2 controls, literally the same
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
         if love.keyboard.isDown('w') and Player2.jumping == true then
            Player2.dy = - Player2.jumpHeight
        end
        Player2.y = Player2.y + Player2.dy
    end
    --updating players
    Player1:update(dt)
    Player2:update(dt)




end


function PlayState:render() 
    --drawing players
	--UI:render()
    Player1:render()
    Player2:render()
    


end