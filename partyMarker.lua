-------------------------------------------------------------------------------
-- This class will be used to represent a party unit control system where
-- each inhabitant in the game will follow a given partyMarker 
-------------------------------------------------------------------------------
partyMarker = {}

function spawPartyMarker()
  local partyMarker = {}
  partyMarker.x = love.graphics.getWidth()/2 + 10
  partyMarker.y = love.graphics.getHeight()/2 + 10
  partyMarker.selected = false
  partyMarker.color = sprites.red
  partyMarker.image = partyMarker.color["gem"]
  return partyMarker
end

function updatePartyMarker(partyMarker)
  if partyMarker ~= nil and partyMarker.selected then
    partyMarker.x = love.mouse.getX()
    partyMarker.y = love.mouse.getY()
  end
end

function drawPartyMarker(partyMarker)
  love.graphics.draw(partyMarker.image, partyMarker.x, partyMarker.y, nil, nil, nil, partyMarker.image:getWidth()/2, partyMarker.image:getHeight()/2)
end
