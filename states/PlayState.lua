PlayState = Class{__includes = BaseState}

function PlayState:init() 

   


function PlayState:enter(parems)
    
    Player1 = parems.selection1(100, 290, 1)    
    Player2 = parems.selection2(1200, 290, 1)

    paused = false
    UI = UI()
end

 end


function PlayState:exit() end


function PlayState:update(dt) 
   UI:update(dt)
   --player one controls
   --uses detect input boolean in order to lock/unlock play using characters
    if Player1.x < Player2.x then
        Player1.direction = -1
        Player2.direction = 1
    else
        Player1.direction = 1
        Player2.direction = -1
    end

    --movement
   if love.keyboard.isDown('left') and Player1.canMove == true then
        Player1.dx = -PLAYER_SPEED
        
    elseif love.keyboard.isDown('right') and Player1.canMove == true then
        Player1.dx = PLAYER_SPEED
        
    else
        Player1.dx = 0
        
    end
    --crouching
    if love.keyboard.isDown('down') and Player1.jumping == true then
        Player1.crouching = true
        Player1.canMove = false
    else
        Player1.crouching = false
    end
    --blocking
    if love.keyboard.isDown('rshift') and Player1.jumping == true then
        Player1.blocking = true
        Player1.canMove = false
    else
        Player1.blocking = false
    end
    --attacks allowing for the / to change into specials 
    if love.keyboard.isDown(',') and love.keyboard.isDown('/') and Player1.jumping == true and Player1.canAttack then
        Player1:spunch()
    elseif love.keyboard.isDown(',') and not love.keyboard.isDown('/') and Player1.jumping == true and Player1.canAttack then
        Player1:punch()
    end
    if love.keyboard.isDown('.') and love.keyboard.isDown('/') and Player1.jumping == true  and Player1.canAttack then
        Player1:skick()
    elseif love.keyboard.isDown('.') and not love.keyboard.isDown('/') and Player1.jumping == true and Player1.canAttack then
        Player1:kick()
    end
    --jumping
    if love.keyboard.isDown('up') and Player1.jumping == true then
        Player1.dy = - Player1.jumpHeight
    end
    Player1.y = Player1.y + Player1.dy
        

    --Player 2 controls, literally the same

   if love.keyboard.isDown('a') and Player2.canMove == true then
        Player2.dx = -PLAYER_SPEED
        Player2.direction = 1
    elseif love.keyboard.isDown('d') and Player2.canMove == true then
        Player2.dx = PLAYER_SPEED
        Player2.direction = -1
    else
        Player2.dx = 0
    end
    if love.keyboard.isDown('s') and Player2.jumping == true then
        Player2.crouching = true
        Player2.canMove = false
    else
        Player2.crouching = false
    end
    if love.keyboard.isDown('lshift') and Player2.jumping == true then
        Player2.blocking = true
        Player2.canMove = false
    else
        Player2.blocking = false
    end
    if love.keyboard.isDown('q') and love.keyboard.isDown('tab') and Player2.jumping == true and Player2.canMove then
        Player2:spunch()
    elseif love.keyboard.isDown('q') and not love.keyboard.isDown('tab') and Player2.jumping == true and Player2.canMove then
        Player2:punch()
        
    end
    if love.keyboard.isDown('e') and love.keyboard.isDown('tab') and Player2.jumping == true and Player2.canMove then
        Player2:skick()
    elseif love.keyboard.isDown('e') and not love.keyboard.isDown('tab') and Player2.jumping == true and Player2.canMove then
        Player2:kick()
    end
     if love.keyboard.isDown('w') and Player2.jumping == true then
        Player2.dy = - Player2.jumpHeight
    end
    Player2.y = Player2.y + Player2.dy

    if Player1.Attack == 'punch' and Player1.attackFrame > tonumber(string.sub(Player1.AttackData['Punch'], 1, 2)) then
           if Player1.PunchHB:collide(Player2.Hurtbox.x, Player2.Hurtbox.width, Player2.Hurtbox.y, Player2.Hurtbox.height) and Player2.blocking == false then
              UI:damage(2, tonumber(string.sub(Player1.AttackData['Punch'], 3, 4)))
                Player1.Attack = nil
           end
    elseif Player1.Attack == 'kick' and Player1.attackFrame > tonumber(string.sub(Player1.AttackData['Kick'], 1, 2)) then
        if Player1.KickHB:collide(Player2.Hurtbox.x, Player2.Hurtbox.width, Player2.Hurtbox.y, Player2.Hurtbox.height) and Player2.blocking == false  then
                UI:damage(2, tonumber(string.sub(Player1.AttackData['Kick'], 3, 4)))
                Player1.Attack = nil
            end
        elseif Player1.Attack == 'skick' and Player1.attackFrame > tonumber(string.sub(Player1.AttackData['SKick'], 1, 2)) then
            if Player1.SKickHB:collide(Player2.Hurtbox.x, Player2.Hurtbox.width, Player2.Hurtbox.y, Player2.Hurtbox.height) and Player2.blocking == false then
                UI:damage(2, tonumber(string.sub(Player1.AttackData['SKick'], 3, 4)))
                Player1.Attack = nil
            end
        elseif Player1.Attack == 'spunch' and Player1.attackFrame > tonumber(string.sub(Player1.AttackData['SPunch'], 1, 2)) then

            if Player1.SPunchHB:collide(Player2.Hurtbox.x, Player2.Hurtbox.width, Player2.Hurtbox.y, Player2.Hurtbox.height) then

                UI:damage(2, tonumber(string.sub(Player1.AttackData['SPunch'], 3, 4)))
                Player1.Attack = nil
            end
        end
    if Player2.Attack == 'punch' and Player2.attackFrame > tonumber(string.sub(Player2.AttackData['Punch'], 1, 2)) then
            if Player2.PunchHB:collide(Player1.Hurtbox.x, Player1.Hurtbox.width, Player1.Hurtbox.y, Player1.Hurtbox.height) and Player1.blocking == false then
                UI:damage(1, tonumber(string.sub(Player2.AttackData['Punch'], 3, 4)))
                Player2.Attack = nil
            end
        elseif Player2.Attack == 'kick' and Player2.attackFrame > tonumber(string.sub(Player2.AttackData['Kick'], 1, 2)) then
            if Player2.KickHB:collide(Player1.Hurtbox.x, Player1.Hurtbox.width, Player1.Hurtbox.y, Player1.Hurtbox.height) and Player1.blocking == false then
                UI:damage(1, tonumber(string.sub(Player2.AttackData['Kick'], 3, 4)))
                Player2.Attack = nil
            end
        elseif Player2.Attack == 'skick' and Player2.attackFrame > tonumber(string.sub(Player2.AttackData['SKick'], 1, 2)) then
            if Player2.SKickHB:collide(Player1.Hurtbox.x, Player1.Hurtbox.width, Player1.Hurtbox.y, Player1.Hurtbox.height) and Player1.blocking == false then
                UI:damage(1, tonumber(string.sub(Player2.AttackData['SKick'], 3, 4)))
                Player2.Attack = nil
            end
        elseif Player2.Attack == 'spunch' and Player2.attackFrame > tonumber(string.sub(Player2.AttackData['SPunch'], 1, 2)) then
            if Player2.SPunchHB:collide(Player1.Hurtbox.x, Player1.Hurtbox.width, Player1.Hurtbox.y, Player1.Hurtbox.height) and Player1.blocking == false then
                UI:damage(1, tonumber(string.sub(Player2.AttackData['SPunch'], 3, 4)))
                Player2.Attack = nil
            end
        end
    --Pause Function
    if paused == true then
        Player1.dx = 0
        Player2.dx = 0
    end
    --updating players
    Player1:update(dt)
    Player2:update(dt)

end


function PlayState:render() 
    --drawing players
    love.graphics.draw(love.graphics.newImage('Sprites/Backgrounds/Background.png'), 0, 0)
	UI:render()
    Player1:render()
    love.graphics.setColor(1, 1, 1)
    Player2:render()
    
    
end