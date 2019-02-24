require 'Animation'
require 'Util'

gSprites = {
	['idle'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManIdle.png'),
	['walk'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManWalk.png'),
    ['block'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManBlock.png'),
    ['blockTO'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManBlockTO.png'),
    ['blockFROM'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManBlockFROM.png'),
    ['crouch'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManCrouch.png'),
    ['crouchTO'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManCrouchTO.png'),
    ['crouchFROM'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManCrouchFROM.png'),
    ['punch'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManPunch.png'),
    ['spunch'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManSpecialPunch.png'),
    ['kick'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManKick.png'),
    ['skick'] = love.graphics.newImage('Sprites/ViolenceMan/violenceManSpecialKick.png')
}

gFrames = {
	['idle'] = GenerateQuads(gSprites['idle'], 256, 256),
	['walk'] = GenerateQuads(gSprites['walk'], 256, 256),
    ['block'] = GenerateQuads(gSprites['block'], 256, 256),
    ['blockTO'] = GenerateQuads(gSprites['blockTO'], 256, 256),
    ['blockFROM'] = GenerateQuads(gSprites['blockFROM'], 256, 256),
    ['crouch'] = GenerateQuads(gSprites['crouch'], 256, 256),
    ['crouchTO'] = GenerateQuads(gSprites['crouchTO'], 256, 256),
    ['crouchFROM'] = GenerateQuads(gSprites['crouchFROM'], 256, 256),
    ['punch'] = GenerateQuads(gSprites['punch'], 512, 512),
    ['spunch'] = GenerateQuads(gSprites['spunch'], 256, 256),
    ['kick'] = GenerateQuads(gSprites['kick'], 256, 256),
    ['skick'] = GenerateQuads(gSprites['skick'], 256, 256)
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
CrouchAnim = Animation({
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'crouch',
                looping = true


            })
CrouchTOAnim = Animation({
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'crouchTO',
                looping = true


            })
CrouchFROMAnim = Animation({
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'crouchFROM',
                looping = true

            })
PunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21},
                interval = 0.05,
                texture = 'punch',
                looping = true

            })
SPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'spunch',
                looping = true

            })
KickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
                interval = 0.15,
                texture = 'kick',
                looping = true

            })
SKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22},
                interval = 0.05,
                texture = 'skick',
                looping = true

            })