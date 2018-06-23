-------------------------------------------------------------------------------
--                         Start her up                                      --
-------------------------------------------------------------------------------
function love.load()
  ---------- load dependencies ------------------------------------------------
  require "sprites"
  require "inhabitant"
  require "partyMarker"
  require "pointOfIntrest"
  --------- Set up groups -----------------------------------------------------
  inhabitants = {}
  partyMarkers = {}
  pointsOfInterests = {}

  selectedMarker = spawPartyMarker()
  -------- Sample/test objects section ----------------------------------------
  table.insert(partyMarkers, selectedMarker)
  table.insert(inhabitants, spawnInhabitant(love.graphics.getWidth()/2, love.graphics.getHeight()/2, selectedMarker))
  table.insert(pointsOfInterests, spawnPointOfInterest(sprites.teal))

  myFont = love.graphics.newFont(40)
end
-------------------------------------------------------------------------------
--                          Gears and cogs                                   --
-------------------------------------------------------------------------------
spwncnt = 5
function love.update(dt)
  ----------------- tinkering w/ controls --------------------------------------
  if selectedMarker ~= nil then
    if spwncnt % 5 == 0 then
      table.insert(inhabitants, spawnInhabitant(love.graphics.getWidth()/2, love.graphics.getHeight()/2, selectedMarker))
  end
  if spwncnt < 0 then
    table.insert(pointsOfInterests, spawnPointOfInterest(sprites.teal))
    spwncnt = 5
  else
    spwncnt = spwncnt - dt
  end
end
  ----------------- partyMarker control ---------------------------------------
  if partyMarkers ~= nil then
   for i,marker in ipairs(partyMarkers) do
     if love.mouse.isDown(1) and distance_to_mouse(marker) < 30 and selectedMarker == nil then
       marker.selected = true
       selectedMarker = marker
     end
     if love.mouse.isDown(1) == false then
       marker.selected = false
       selectedMarker = nil
     end
     updatePartyMarker(selectedMarker, dt)
   end
  end
  ----------------- Movements -------------------------------------------------
  if inhabitants ~= nil then
   for i,inhab in ipairs(inhabitants) do
     updateInhabitant(inhab, dt)
     for i,point in ipairs(pointsOfInterests) do
       if distanceBetween(inhab, point) < 20 and point.owner ~= inhab.owner then
       point.image = inhab.owner.color["pointOfIntrest"];
       point.owner = inhab.owner
      end
     end
   end
  end
end
-------------------------------------------------------------------------------
--                            Display                                        --
-------------------------------------------------------------------------------
function love.draw()
  ---------------- background -------------------------------------------------
  love.graphics.draw(sprites.background, 0, 0)
  ---------------- pointsOfInterests ------------------------------------------
  for i,point in ipairs(pointsOfInterests) do
    drawPointOfInterest(point)
  end
  --------------- inhabitants -------------------------------------------------
  for i,inhab in ipairs(inhabitants) do
    drawInhabitant(inhab)
  end
  -------------- partyMarkers -------------------------------------------------
  for i,marker in ipairs(partyMarkers) do
    drawPartyMarker(marker)
  end

end
---------------------------- Movement helpers ---------------------------------
function object_to_mouse_angle(object)
  return math.atan2(object.y - love.mouse.getY(), object.x - love.mouse.getX()) + math.pi
end

function object_to_object_angle(object1, object2)
  return math.atan2(object1.y - object2.y, object1.x - object2.x)
end

function move(object, speed, destination, dt)
  object.x = object.x + math.cos(object_to_object_angle(destination, object)) * speed * dt
  object.y = object.y + math.sin(object_to_object_angle(destination, object)) * speed * dt
end

function distanceBetween(object1, object2)
  return math.sqrt((object2.y - object1.y)^2 + (object2.x - object1.x)^2)
end
function distance_to_mouse(object)
  return math.sqrt((object.y - love.mouse.getY())^2 + (object.x - love.mouse.getX())^2)
end
-------------------------------------------------------------------------------
--                            Tinker Town                                    --
-------------------------------------------------------------------------------
function love.keypressed(key, scancode, isrepeat)
  if key == "q" then
    table.insert(partyMarkers, spawPartyMarker())
  end
end

function love.mousepressed( x, y, b, istouch)
  if b == 1 then
    --actions for left mousepressed
  end
end
