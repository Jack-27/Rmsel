Select2State = Class{__includes = BaseState}

function Select2State:init(def)
	self.selection = ViolenceMan
end

function Select2State:enter(parems)
	self.selection1 = parems.selection1
end

function Select2State:exit() end

function Select2State:update(dt) 
	--if love.keyboard.isDown('return') then
	--	Player1Turn = true
	--end	
	if love.keyboard.isDown('1') then--and Player1Turn == true then
		self.selection = TonyTheTiger
	end
	if love.keyboard.isDown('2') then
		self.selection = GeorgeLopez
	end	
	if love.keyboard.isDown('3') then
		self.selection = ViolenceMan
	end	
	if love.keyboard.isDown('4') then
		self.selection = Ghost
	end
	if love.keyboard.isDown('5') then
		self.selection = clippy
	end
	if love.keyboard.isDown('tab') then
       Player1turn = currentSelection and false
	end	
	if love.keyboard.isDown('return') then
		gStateMachine:change('play',{
			selection1 = self.selection1,
			selection2 = self.selection
		})
	end
end

function Select2State:render()
 love.graphics.draw(love.graphics.newImage('Sprites/Backgrounds/Background.png'), 0, 0)
	--love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/cursor.png'), 460 + self.currentSelection * 30, 270)
	if TonyTheTiger == self.selection then
     	love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/cursor.png'), 490, 270) 
    end 	
    if GeorgeLopez == self.selection then
     	love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/cursor.png'), 600, 270)
    end 	
    if  ViolenceMan == self.selection then
     	love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/cursor.png'), 700, 270)
	end
	if Ghost == self.selection then
		love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/cursor.png'), 800, 270)
	end
	if clippy == self.selection then
		love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/cursor.png'), 900, 270)
	end
	love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/tony the tigger.png'), 490, 270)
	love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/fighter menu elec clone.png'), 600, 270)
	love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/fighter menu_ vilonce man.png'), 700, 270)
	love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/fighter menu elec clone(1).png'), 800, 270)
	love.graphics.draw(love.graphics.newImage('Sprites/Titlescreenbox/fighter menu clippy.png'), 900, 270)
end	
