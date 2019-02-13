require 'Animation'
require 'Util'

gSprites = {
	['idle'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManIdle.png'),
	['walk'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManWalk.png'),
    ['block'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManBlock.png'),
    ['blockTO'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManBlockTO.png'),
    ['blockFROM'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManBlockFROM.png')
}

gFrames = {
	['idle'] = GenerateQuads(gSprites['idle'], 256, 256),
	['walk'] = GenerateQuads(gSprites['walk'], 256, 256),
    ['block'] = GenerateQuads(gSprites['block'], 256, 256),
    ['blockTO'] = GenerateQuads(gSprites['blockTO'], 256, 256),
    ['blockFROM'] = GenerateQuads(gSprites['blockFROM'], 256, 256),
}

IdleAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'idle',
                looping = true
            })


WalkAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
                interval = 0.05,
                texture = 'walk',
                looping = true


            })

BlockAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'block',
                looping = true


            })
BlockTOAnim = Animation({
                frames = {1, 2, 3, 4, 5},
                interval = 0.15,
                texture = 'blockTO',
                looping = true


            })
BlockFROMAnim = Animation({
                frames = {1, 2, 3, 4, 5},
                interval = 0.15,
                texture = 'blockFROM',
                looping = true

            })