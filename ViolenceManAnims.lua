require 'animation'
require 'Util'

gSprites = {
	['idle'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManIdle.png'),
	['walk'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManWalk.png'),
}

gFrames = {
	['idle'] = GenerateQuads(gSprites['idle'], 256, 256),
	['walk'] = GenerateQuads(gSprites['walk'], 256, 256)
}

IdleAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'idle'
            })


WalkAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
                interval = 0.05,
                texture = 'walk'


            })

