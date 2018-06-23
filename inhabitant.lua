-------------------------------------------------------------------------------
-- This class will be used to represent the basic unit... but I don't like to
-- use the word unit since it seems too broad for my taste. Hence the inhabitant
-- name, which I feel more fully expresses the behavior of this class.
-------------------------------------------------------------------------------
inhabitant = {}

function spawnInhabitant (x, y,owner)
  local inhabitant = {}
  inhabitant.x = x
  inhabitant.y = y
  inhabitant.speed = 100
  inhabitant.selected = false
  inhabitant.owner = owner
  inhabitant.image = inhabitant.owner.color["fighter"]
  return inhabitant
end
function updateInhabitant(inhabitant, dt)
  if distanceBetween(inhabitant, inhabitant.owner) > 40 then
    move(inhabitant, inhabitant.speed, inhabitant.owner, dt)
  end
end

function drawInhabitant(inhabitant)
  love.graphics.draw(inhabitant.image, inhabitant.x, inhabitant.y, nil, nil, nil, inhabitant.image:getWidth()/2, inhabitant.image:getHeight()/2)
end
