require 'Utilities/Animation'
require 'Utilities/Util'

GgSprites = {
	['idle'] = love.graphics.newImage('Sprites/Ghost/GhostIdle.png'),
	['walk'] = love.graphics.newImage('Sprites/Ghost/GhostWalk.png'),
    ['block'] = love.graphics.newImage('Sprites/Ghost/GhostBlock.png'),
    ['blockTO'] = love.graphics.newImage('Sprites/Ghost/GhostBlockTO.png'),
    ['blockFROM'] = love.graphics.newImage('Sprites/Ghost/GhostBlockFROM.png'),
    ['crouch'] = love.graphics.newImage('Sprites/Ghost/GhostCrouch.png'),
    ['crouchTO'] = love.graphics.newImage('Sprites/Ghost/GhostCrouchTO.png'),
    ['crouchFROM'] = love.graphics.newImage('Sprites/Ghost/GhostCrouchFROM.png'),
    ['punch'] = love.graphics.newImage('Sprites/Ghost/GhostPunch.png'),
    ['spunch'] = love.graphics.newImage('Sprites/Ghost/GhostSpecialPunch.png'),
    ['kick'] = love.graphics.newImage('Sprites/Ghost/GhostKick.png'),
    ['skick'] = love.graphics.newImage('Sprites/Ghost/GhostSpecialKick.png')
}

GgFrames = {
	['idle'] = GenerateQuads(GgSprites['idle'], 512, 512),
	['walk'] = GenerateQuads(GgSprites['walk'], 512, 512),
    ['block'] = GenerateQuads(GgSprites['block'], 512, 512),
    ['blockTO'] = GenerateQuads(GgSprites['blockTO'], 512, 512),
    ['blockFROM'] = GenerateQuads(GgSprites['blockFROM'], 512, 512),
    ['crouch'] = GenerateQuads(GgSprites['crouch'], 512, 512),
    ['crouchTO'] = GenerateQuads(GgSprites['crouchTO'], 512, 512),
    ['crouchFROM'] = GenerateQuads(GgSprites['crouchFROM'], 512, 512),
    ['punch'] = GenerateQuads(GgSprites['punch'], 768, 768),
    ['spunch'] = GenerateQuads(GgSprites['spunch'], 768, 768),
    ['kick'] = GenerateQuads(GgSprites['kick'], 512, 512),
    ['skick'] = GenerateQuads(GgSprites['skick'], 768, 768)
}

GIdleAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39},
                interval = 0.15,
                texture = 'idle',
                looping = true
            })


GWalkAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6},
                interval = 0.05,
                texture = 'walk',
                looping = true


            })

GBlockAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28},
                interval = 0.05,
                texture = 'block',
                looping = true


            })
GBlockTOAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                interval = 0.05,
                texture = 'blockTO',
                looping = true


            })
GBlockFROMAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                interval = 0.05,
                texture = 'blockFROM',
                looping = true

            })
GCrouchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
                interval = 0.15,
                texture = 'crouch',
                looping = true


            })
GCrouchTOAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                interval = 0.15,
                texture = 'crouchTO',
                looping = true


            })
GCrouchFROMAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                interval = 0.15,
                texture = 'crouchFROM',
                looping = true

            })
GPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14},
                interval = 0.03,
                texture = 'punch',
                looping = true

            })
GSPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55},
                interval = 0.02,
                texture = 'spunch',
                looping = true

            })
GKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28},
                interval = 0.03,
                texture = 'kick',
                looping = true

            })
GSKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31},
                interval = 0.04,
                texture = 'skick',
                looping = true

            })