require 'Animation'
require 'Util'

--adds all the pictures
GLgSprites = {
	['idle'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezIdle.png'),
	['walk'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezWalk.png'),
    ['block'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezBlock.png'),
    ['blockTO'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezBlockTO.png'),
    ['blockFROM'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezBlockFROM.png'),
    ['crouch'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezCrouch.png'),
    ['crouchTO'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezCrouchTO.png'),
    ['crouchFROM'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezCrouchFROM.png'),
    ['punch'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezPunch.png'),
    ['spunch'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezSpecialPunch.png'),
    ['kick'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezKick.png'),
    ['skick'] = love.graphics.newImage('Sprites/GeorgeLopez/georgeLopezSpecialKick.png')
}
--cuts pictures into frames
GLgFrames = {
	['idle'] = GenerateQuads(GLgSprites['idle'], 256, 256),
	['walk'] = GenerateQuads(GLgSprites['walk'], 256, 256),
    ['block'] = GenerateQuads(GLgSprites['block'], 256, 256),
    ['blockTO'] = GenerateQuads(GLgSprites['blockTO'], 256, 256),
    ['blockFROM'] = GenerateQuads(GLgSprites['blockFROM'], 256, 256),
    ['crouch'] = GenerateQuads(GLgSprites['crouch'], 256, 256),
    ['crouchTO'] = GenerateQuads(GLgSprites['crouchTO'], 256, 256),
    ['crouchFROM'] = GenerateQuads(GLgSprites['crouchFROM'], 256, 256),
    ['punch'] = GenerateQuads(GLgSprites['punch'], 256, 256),
    ['spunch'] = GenerateQuads(GLgSprites['spunch'], 256, 256),
    ['kick'] = GenerateQuads(GLgSprites['kick'], 256, 256),
    ['skick'] = GenerateQuads(GLgSprites['skick'], 256, 256)
}
--different animations for different characters
GLIdleAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38},
                interval = 0.15,
                texture = 'idle',
                looping = true
            })


GLWalkAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18},
                interval = 0.05,
                texture = 'walk',
                looping = true


            })

GLBlockAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
                interval = 0.15,
                texture = 'block',
                looping = true


            })
GLBlockTOAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                interval = 0.15,
                texture = 'blockTO',
                looping = true


            })
GLBlockFROMAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9},
                interval = 0.15,
                texture = 'blockFROM',
                looping = true

            })
GLCrouchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14},
                interval = 0.15,
                texture = 'crouch',
                looping = true


            })
GLCrouchTOAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8},
                interval = 0.15,
                texture = 'crouchTO',
                looping = true


            })
GLCrouchFROMAnim = Animation({
                frames = {7, 8, 9, 10, 11, 12},
                interval = 0.15,
                texture = 'crouchFROM',
                looping = true

            })
GLPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14},
                interval = 0.05,
                texture = 'punch',
                looping = true

            })
GLSPunchAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12},
                interval = 0.15,
                texture = 'spunch',
                looping = true

            })
GLKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
                interval = 0.15,
                texture = 'kick',
                looping = true

            })
GLSKickAnim = Animation({
                frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
                interval = 0.05,
                texture = 'skick',
                looping = true

            })