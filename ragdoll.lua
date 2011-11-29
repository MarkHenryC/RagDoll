module(..., package.seeall)

local gameUI = require("gameUI")

--physics.setDrawMode ("hybrid")

function createWalls()
	--> Create Walls
	
	local walls = display.newGroup()
	
	local leftWall  = display.newRect (0, 0, 1, display.contentHeight)
	local rightWall = display.newRect (display.contentWidth, 0, 1, display.contentHeight)
	local ceiling   = display.newRect (0, 0, display.contentWidth, 1)
	local floor     = display.newRect (0, display.contentHeight, display.contentWidth, 1)
	 
	physics.addBody (leftWall, "static", {bounce = 0.0, friction = 10})
	physics.addBody (rightWall, "static", {bounce = 0.0, friction = 10})
	physics.addBody (ceiling, "static", {bounce = 0.0, friction = 10})
	physics.addBody (floor, "static", {bounce = 0.0, friction = 10})
	
	walls:insert(leftWall)
	walls:insert(rightWall)
	walls:insert(ceiling)
	walls:insert(floor)
	
	return walls
end

local function setFill(ob, param)
	ob:setFillColor(param[1], param[2], param[3], param[4] or 255)
end

function newRagDoll(originX, originY, colorTable) 
       
	--> Create Ragdoll Group
	 
	local spacing = 1
	 
	local ragdoll = display.newGroup ()
	 
	local head = display.newCircle( 0, 0, 15 )
	--local head = display.newImage( "head.png" )
	head.x = originX
	head.y = originY
	setFill(head, colorTable)	
--	head:setFillColor (255, 255, 255, 128)
	ragdoll:insert (head)
	 
	local torsoA = display.newRect( 0, 0, 45, 24 )
	torsoA.x = originX
	torsoA.y = originY + head.height
--	torsoA:setFillColor (255, 255, 255, 128)
	setFill(torsoA, colorTable)
	ragdoll:insert (torsoA)
	 
	local torsoB = display.newRect( 0, 0, 37.5, 24 )
	torsoB.x = originX
	torsoB.y = torsoA.y + (torsoA.height * 0.5) + spacing
--	torsoB:setFillColor (255, 255, 255, 128)
	setFill(torsoB, colorTable)
	ragdoll:insert (torsoB)
	 
	local torsoC = display.newRect( 0, 0, 30, 24 )
	torsoC.x = originX
	torsoC.y = torsoB.y + (torsoB.height * 0.5) + spacing
--	torsoC:setFillColor (255, 255, 255, 128)
	setFill(torsoC, colorTable)
	ragdoll:insert (torsoC)
	 
	local pelvis = display.newRect( 0, 0, 30, 24 )
	pelvis.x = originX
	pelvis.y = torsoC.y + (torsoC.height * 0.5) + spacing
	setFill(pelvis, colorTable)
--	pelvis:setFillColor (255, 255, 255, 128)
	ragdoll:insert (pelvis)
	 
	local leftLegA = display.newRect( 0, 0, 12, 52.5 )
	leftLegA.x = pelvis.x - ((pelvis.width - leftLegA.width) * 0.5)
	leftLegA.y = pelvis.y + (leftLegA.height * 0.5) + spacing
	setFill(leftLegA, colorTable)
--	leftLegA:setFillColor (255, 255, 255, 128)
	ragdoll:insert (leftLegA)
	 
	local rightLegA = display.newRect( 0, 0, 12, 52.5 )
	rightLegA.x = pelvis.x + ((pelvis.width - rightLegA.width) * 0.5)
	rightLegA.y = pelvis.y + (rightLegA.height * 0.5) + spacing
	setFill(rightLegA, colorTable)
--	rightLegA:setFillColor (255, 255, 255, 128)
	ragdoll:insert (rightLegA)
	 
	local leftLegB = display.newRect( 0, 0, 12, 45 )
	leftLegB.x = leftLegA.x
	leftLegB.y = leftLegA.y + rightLegA.height - 12
	setFill(leftLegB, colorTable)
--	leftLegB:setFillColor (255, 255, 255, 128)
	ragdoll:insert (leftLegB)
	 
	local rightLegB = display.newRect( 0, 0, 12, 45 )
	rightLegB.x = rightLegA.x
	rightLegB.y = rightLegA.y + rightLegA.height - 12
	setFill(rightLegB, colorTable)
--	rightLegB:setFillColor (255, 255, 255, 128)
	ragdoll:insert (rightLegB)
	 
	local leftArmA = display.newRect( 125, 70, 10.5, 39 )
	leftArmA.x = torsoA.x - (torsoA.width * 0.5) - 3
	leftArmA.y = torsoA.y + (leftArmA.height * 0.5) - 6
	setFill(leftArmA, colorTable)
--	leftArmA:setFillColor (255, 255, 255, 128)
	ragdoll:insert (leftArmA)
	 
	local rightArmA = display.newRect( 185, 70, 10.5, 39 )
	rightArmA.x = torsoA.x + (torsoA.width * 0.5) + 3
	rightArmA.y = torsoA.y + (rightArmA.height * 0.5) - 6
	setFill(rightArmA, colorTable)
--	rightArmA:setFillColor (255, 255, 255, 128)
	ragdoll:insert (rightArmA)
	 
	local leftArmB = display.newRect( 125, 105, 10.5, 37.5 )
	leftArmB.x = leftArmA.x
	leftArmB.y = leftArmA.y + (leftArmA.height) - 6
	setFill(leftArmB, colorTable)
--	leftArmB:setFillColor (255, 255, 255, 128)
	ragdoll:insert (leftArmB)
	 
	local rightArmB = display.newRect( 185, 105, 10.5, 37.5 )
	rightArmB.x = rightArmA.x
	rightArmB.y = rightArmA.y + (rightArmA.height) - 6
	setFill(rightArmB, colorTable)
--	rightArmB:setFillColor (255, 255, 255, 128)
	ragdoll:insert (rightArmB)
	 
	physics.addBody (head, {bounce = 2.0, friction = 1.0})
	physics.addBody (torsoA, {bounce = 0, friction = 1.0})
	physics.addBody (torsoB, {bounce = 0, friction = 1.0})
	physics.addBody (torsoC, {bounce = 0, friction = 1.0})
	physics.addBody (pelvis, {bounce = 0, friction = 1.0})
	physics.addBody (leftLegA, {bounce = 2, friction = 1.0})
	physics.addBody (rightLegA, {bounce = 2, friction = 1.0})
	physics.addBody (leftLegB, {bounce = 0, friction = 1.0})
	physics.addBody (rightLegB, {bounce = 0, friction = 1.0})
	physics.addBody (leftArmA, {bounce = 2, friction = 1.0})
	physics.addBody (rightArmA, {bounce = 2, friction = 1.0})
	physics.addBody (leftArmB, {bounce = 0, friction = 1.0})
	physics.addBody (rightArmB, {bounce = 0, friction = 1.0})
	 
	function ragdoll:addFrictionJoint(a, b, posX, posY, rFrom, rTo, mT) 
		local j = physics.newJoint ( "pivot", a, b, posX, posY, rFrom, rTo)
		j.isLimitEnabled = true
		j:setRotationLimits (rFrom, rTo)
		j.isMotorEnabled	= true
		j.motorSpeed = 0
		j.maxMotorTorque = mT or 0.1
		return j
	end

	-- neck	
	ragdoll:addFrictionJoint(head, torsoA, torsoA.x, torsoA.y, -22.5, 22.5)
	
	-- backboneA
	 ragdoll:addFrictionJoint(torsoA, torsoB, torsoB.x, torsoB.y, -22.5, 22.5)
	 
	-- backboneB
	ragdoll:addFrictionJoint(torsoB, torsoC, torsoC.x, torsoC.y, -22.5, 22.5)
	
	-- backboneC	 
	ragdoll:addFrictionJoint(torsoC, pelvis, pelvis.x, pelvis.y, -22.5, 22.5)
	
	-- leftHip
	ragdoll:addFrictionJoint(pelvis, leftLegA, leftLegA.x, pelvis.y, -45, 90)
	 
	-- rightHip
	ragdoll:addFrictionJoint(pelvis, rightLegA, rightLegA.x, pelvis.y, -90, 45)
	 
	-- leftKnee
	ragdoll:addFrictionJoint(leftLegA, leftLegB, leftLegB.x, 
		leftLegA.y + leftLegA.height * 0.5 - 6, -45, 90)

	-- rightKnee
	ragdoll:addFrictionJoint(rightLegA, rightLegB, rightLegB.x, 
		rightLegA.y + rightLegA.height * 0.5 - 6, -90, 45)
	
	-- leftShoulder
	ragdoll:addFrictionJoint(torsoA, leftArmA, leftArmA.x, torsoA.y, 0, 180)
	
	-- rightShoulder
	ragdoll:addFrictionJoint(torsoA, rightArmA, rightArmA.x, torsoA.y, -180, 0)
	
	-- leftElbow
	ragdoll:addFrictionJoint(leftArmA, leftArmB, leftArmB.x, leftArmA.y + 
		leftArmA.height * 0.5 - 6, -45, 90)
	
	-- rightElbow
	ragdoll:addFrictionJoint(rightArmA, rightArmB, rightArmB.x, rightArmA.y + 
		rightArmA.height * 0.5 - 6, -90, 45)
	 
	function ragdoll:touch( event )
		gameUI.dragBody( event )
	end
	 
	head:addEventListener ( "touch", ragdoll )
	leftLegA:addEventListener ( "touch", ragdoll )
	leftLegB:addEventListener ( "touch", ragdoll )
	rightLegA:addEventListener ( "touch", ragdoll )
	rightLegB:addEventListener ( "touch", ragdoll )
	leftArmA:addEventListener ( "touch", ragdoll )
	leftArmB:addEventListener ( "touch", ragdoll )
	rightArmA:addEventListener ( "touch", ragdoll )
	rightArmB:addEventListener ( "touch", ragdoll )
	
	return ragdoll
end