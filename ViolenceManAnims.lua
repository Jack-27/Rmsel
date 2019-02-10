require 'animation'
require 'Util'

gSprites = {
	['idle'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManIdle.png'),
	['walk'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManWalk.png'),
}

gFrames = {
	['idle'] = GenerateQuads(gSprites['idle'], 64, 64),
	['walk'] = GenerateQuads(gSprites['walk'], 64, 64)
}

IdleAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'idle'
            })


WalkAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'walk'


            })

