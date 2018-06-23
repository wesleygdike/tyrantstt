
-------------------------------------------------------------------------------
-- This class will be used to represent stationary objects with which other
-- objects will interact
-------------------------------------------------------------------------------
pointOfIntrest = {}

function spawnPointOfInterest(color)
  local pointOfIntrest = {}
  pointOfIntrest.x = math.random(0, love.graphics.getWidth())
  pointOfIntrest.y = math.random(0, love.graphics.getHeight())
  pointOfIntrest.selected = false
  pointOfIntrest.image = color["pointOfIntrest"]
  pointOfIntrest.owner = nil
  return pointOfIntrest
end

function drawPointOfInterest (point)
  love.graphics.draw(point.image, point.x, point.y, nil, nil, nil, point.image:getWidth()/2, point.image:getHeight()/2)
end
