require "ragdoll"

--> Setup Display
display.setStatusBar (display.HiddenStatusBar)

--> Start Physics
local physics = require ("physics")

physics.start (true)
 
system.activate ("multitouch")

local color1 = {255, 0, 0, 128}
local color2 = {0, 255, 0, 128}
--local color3 = {255, 255, 0, 128}
local color4 = {0, 0, 255, 128}

local walls = ragdoll.createWalls()
local doll1 = ragdoll.newRagDoll(80, 320, color1) 
local doll2 = ragdoll.newRagDoll(200, 320, color2) 
--local doll3 = ragdoll.newRagDoll(160, 320, color3) 
local doll4 = ragdoll.newRagDoll(280, 320, color4)

local box = display.newRect(0, 0, 64, 256)
box:setFillColor(32, 0, 0, 255)
box.strokeWidth = 3
box:setStrokeColor(128, 128, 128)

box.x = 160
box.y = 32

physics.addBody(box, { density = 0.5, friction = 0.3, bounce = 0.2 })

function onTouch( event )
	gameUI.dragBody( event )
end

box:addEventListener ( "touch", onTouch )

local function onTilt( event )
	physics.setGravity( 10 * event.xGravity, -10 * event.yGravity )
end
 
Runtime:addEventListener( "accelerometer", onTilt )
