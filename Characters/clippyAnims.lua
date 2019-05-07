require 'Utilities/Animation'
require 'Utilities/Util'

--adds all the pictures
cgSprites = {
	['idle'] = love.graphics.newImage('Sprites/clippy/ClippyIdle.png'),
	['walk'] = love.graphics.newImage('Sprites/clippy/ClippyWalk.png'),
    ['block'] = love.graphics.newImage('Sprites/clippy/ClippyBlockIdle.png'),
    ['blockTO'] = love.graphics.newImage('Sprites/clippy/ClippyShieldTO.png'),
    ['blockFROM'] = love.graphics.newImage('Sprites/clippy/ClippyShieldFROM.png'),
    ['crouch'] = love.graphics.newImage('Sprites/clippy/ClippyCrouchIdle.png'),
    ['crouchTO'] = love.graphics.newImage('Sprites/clippy/ClippyCrouchTO.png'),
    ['crouchFROM'] = love.graphics.newImage('Sprites/clippy/ClippyCrouchFROM.png'),
    ['punch'] = love.graphics.newImage('Sprites/clippy/ClippyPunch.png'),
    ['spunch'] = love.graphics.newImage('Sprites/clippy/ClippySpecialPunch.png'),
    ['kick'] = love.graphics.newImage('Sprites/clippy/ClippyKick.png'),
    ['skick'] = love.graphics.newImage('Sprites/clippy/ClippySpecialKick.png')
}
--must fix punch, kick, spunch, and skick anims to be one sheet
--????
--cuts pictures into frames
cgFrames = {
	['idle'] = GenerateQuads(cgSprites['idle'], 256, 256),
	['walk'] = GenerateQuads(cgSprites['walk'], 256, 256),
    ['block'] = GenerateQuads(cgSprites['block'], 256, 256),
    ['blockTO'] = GenerateQuads(cgSprites['blockTO'], 256, 256),
    ['blockFROM'] = GenerateQuads(cgSprites['blockFROM'], 256, 256),
    ['crouch'] = GenerateQuads(cgSprites['crouch'], 256, 256),
    ['crouchTO'] = GenerateQuads(cgSprites['crouchTO'], 256, 256),
    ['crouchFROM'] = GenerateQuads(cgSprites['crouchFROM'], 256, 256),
    ['punch'] = GenerateQuads(cgSprites['punch'], 256, 256),
    ['spunch'] = GenerateQuads(cgSprites['spunch'], 256, 256),
    ['kick'] = GenerateQuads(cgSprites['kick'], 256, 256),
    ['skick'] = GenerateQuads(cgSprites['skick'], 256, 256)
}
--different animations for different characters
cIdleAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6},
                interval = 0.15,
                texture = 'idle',
                looping = true
            })


cWalkAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.05,
                texture = 'walk',
                looping = true


            })

cBlockAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                interval = 0.15,
                texture = 'block',
                looping = true


            })
cBlockTOAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'blockTO',
                looping = true


            })
cBlockFROMAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.15,
                texture = 'blockFROM',
                looping = true

            })
cCrouchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6},
                interval = 0.15,
                texture = 'crouch',
                looping = true


            })
cCrouchTOAnim = Animation({
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'crouchTO',
                looping = true


            })
cCrouchFROMAnim = Animation({
                frames = {1, 2, 3, 4},
                interval = 0.15,
                texture = 'crouchFROM',
                looping = true

            })
cPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                interval = 0.05,
                texture = 'punch',
                looping = true

            })
cSPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
                interval = 0.15,
                texture = 'spunch',
                looping = true

            })
cKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                interval = 0.05,
                texture = 'kick',
                looping = true

            })
cSKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
                interval = 0.2,
                texture = 'skick',
                looping = true

            })