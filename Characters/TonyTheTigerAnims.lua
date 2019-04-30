require 'Utilities/Animation'
require 'Utilities/Util'

TTgSprites = {
	['idle'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyIdel.png'),
	['walk'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyWalk.png'),
    ['block'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyBlock.png'),
    ['blockTO'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyBlockTO.png'),
    ['blockFROM'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyBlockFROM.png'),
    ['crouch'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyCrouch.png'),
    ['crouchTO'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyCrouchTO.png'),
    ['crouchFROM'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyCrouchFROM.png'),
    ['punch'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyPunch.png'),
    ['spunch'] = love.graphics.newImage('Sprites/TonyTheTiger/TonySPunch.png'),
    ['kick'] = love.graphics.newImage('Sprites/TonyTheTiger/TonyKick.png'),
    ['skick'] = love.graphics.newImage('Sprites/TonyTheTiger/TonySKick.png')
}

TTgFrames = {
	['idle'] = GenerateQuads(TTgSprites['idle'], 256, 256),
	['walk'] = GenerateQuads(TTgSprites['walk'], 256, 256),
    ['block'] = GenerateQuads(TTgSprites['block'], 256, 256),
    ['blockTO'] = GenerateQuads(TTgSprites['blockTO'], 256, 256),
    ['blockFROM'] = GenerateQuads(TTgSprites['blockFROM'], 256, 256),
    ['crouch'] = GenerateQuads(TTgSprites['crouch'], 256, 256),
    ['crouchTO'] = GenerateQuads(TTgSprites['crouchTO'], 256, 256),
    ['crouchFROM'] = GenerateQuads(TTgSprites['crouchFROM'], 256, 256),
    ['punch'] = GenerateQuads(TTgSprites['punch'], 512, 512),
    ['spunch'] = GenerateQuads(TTgSprites['spunch'], 256, 256),
    ['kick'] = GenerateQuads(TTgSprites['kick'], 256, 256),
    ['skick'] = GenerateQuads(TTgSprites['skick'], 512, 512)
}

TTIdleAnim = Animation({
                frames = {1, 2, 3, 4,},
                interval = 0.15,
                texture = 'idle',
                looping = true
            })


TTWalkAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7},
                interval = 0.05,
                texture = 'walk',
                looping = true


            })

TTBlockAnim = Animation({
                frames = {1, 2, 3, 4, 5},
                interval = 0.15,
                texture = 'block',
                looping = true


            })
TTBlockTOAnim = Animation({
                frames = {1, 2, 3, 4, 5},
                interval = 0.15,
                texture = 'blockTO',
                looping = true


            })
TTBlockFROMAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
                interval = 0.15,
                texture = 'blockFROM',
                looping = true

            })
TTCrouchAnim = Animation({
                frames = {1, 2, 3, 4, 5},
                interval = 0.15,
                texture = 'crouch',
                looping = true


            })
TTCrouchTOAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
                interval = 0.15,
                texture = 'crouchTO',
                looping = true


            })
TTCrouchFROMAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6},
                interval = 0.15,
                texture = 'crouchFROM',
                looping = true

            })
TTPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36},
                interval = 0.05,
                texture = 'punch',
                looping = true

            })
TTSPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20},
                interval = 0.05,
                texture = 'spunch',
                looping = true

            })
TTKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6},
                interval = 0.05,
                texture = 'kick',
                looping = true

            })
TTSKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64},
                interval = 0.05,
                texture = 'skick',
                looping = true

            })