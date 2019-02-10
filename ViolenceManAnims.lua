require 'animation'
require 'Util'

gSprites = {
	['idle'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManIdle'),
	['walk'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManWalk'),
}

gFrames = {
	['idle'] = GenerateQuads(gSprites['idle'], 64, 64)
}

WalkAnim = Animation({
                frames = 1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = gFrames['idle']
            })