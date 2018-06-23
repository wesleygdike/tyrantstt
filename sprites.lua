-------------------------------------------------------------------------------
-- This class will be used to store and sort sprites
-------------------------------------------------------------------------------
sprites = {}
sprites.background = love.graphics.newImage('sprites/background.png')
sprites.fighter = love.graphics.newImage('sprites/inhabitant_fighter_grey.png')
sprites.gem_orange = love.graphics.newImage('sprites/gem_orange.png')

sprites.red = {}
sprites.red["fighter"] = love.graphics.newImage('sprites/inhabitant_fighter_red.png')
sprites.red["gem"] = love.graphics.newImage('sprites/gem_red.png')
sprites.red["pointOfIntrest"] = love.graphics.newImage('sprites/poi_castle_red.png')

sprites.teal = {}
sprites.teal["fighter"] = love.graphics.newImage('sprites/inhabitant_fighter_teal.png')
sprites.teal["gem"] = love.graphics.newImage('sprites/gem_teal.png')
sprites.teal["pointOfIntrest"] = love.graphics.newImage('sprites/poi_castle_teal.png')
