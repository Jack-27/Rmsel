require 'Animation'
require 'Util'

VMgSprites = {
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

VMgFrames = {
	['idle'] = GenerateQuads(VMgSprites['idle'], 256, 256),
	['walk'] = GenerateQuads(VMgSprites['walk'], 256, 256),
    ['block'] = GenerateQuads(VMgSprites['block'], 256, 256),
    ['blockTO'] = GenerateQuads(VMgSprites['blockTO'], 256, 256),
    ['blockFROM'] = GenerateQuads(VMgSprites['blockFROM'], 256, 256),
    ['crouch'] = GenerateQuads(VMgSprites['crouch'], 256, 256),
    ['crouchTO'] = GenerateQuads(VMgSprites['crouchTO'], 256, 256),
    ['crouchFROM'] = GenerateQuads(VMgSprites['crouchFROM'], 256, 256),
    ['punch'] = GenerateQuads(VMgSprites['punch'], 512, 512),
    ['spunch'] = GenerateQuads(VMgSprites['spunch'], 256, 256),
    ['kick'] = GenerateQuads(VMgSprites['kick'], 256, 256),
    ['skick'] = GenerateQuads(VMgSprites['skick'], 256, 256)
}

VMIdleAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'idle',
                looping = true
            })


VMWalkAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
                interval = 0.05,
                texture = 'walk',
                looping = true


            })

VMBlockAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'block',
                looping = true


            })
VMBlockTOAnim = Animation({
                frames = {1, 2, 3, 4, 5},
                interval = 0.15,
                texture = 'blockTO',
                looping = true


            })
VMBlockFROMAnim = Animation({
                frames = {1, 2, 3, 4, 5},
                interval = 0.15,
                texture = 'blockFROM',
                looping = true

            })
VMCrouchAnim = Animation({
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'crouch',
                looping = true


            })
VMCrouchTOAnim = Animation({
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'crouchTO',
                looping = true


            })
VMCrouchFROMAnim = Animation({
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'crouchFROM',
                looping = true

            })
VMPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21},
                interval = 0.05,
                texture = 'punch',
                looping = true

            })
VMSPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'spunch',
                looping = true

            })
VMKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
                interval = 0.15,
                texture = 'kick',
                looping = true

            })
VMSKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22},
                interval = 0.05,
                texture = 'skick',
                looping = true

            })