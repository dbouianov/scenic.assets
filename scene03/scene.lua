--data folder
folder = '../data/scene03/'

--create root node
scene = gr.node('Maze')

--create materials
green = gr.material({0.5, 1.0, 0.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
grey  = gr.material({0.5, 0.5, 0.5, 1.0}, {0.5, 0.5, 0.5}, 10.0)

--create textures
texture00 = gr.texture(folder .. 'wall00.png', 0, 1)
texture01 = gr.texture(folder .. 'metal00.png', 0, 1)

--create base objects 
cylinder = gr.cylinder() 
cube     = gr.cube()
cone     = gr.cone()
 
--maze parameters
wallWidth    = 2.0
wallHeight   = 2.0
wallDepth    = 0.5
mazeSize     = 30
mazeHalfSize = mazeSize * 0.5
size         = 35
halfSize     = size * 0.5

--create common transformations
rotateYPos5            = gr.rotation({0.0, 1.0, 0.0}, 5.0)
rotateYPos45           = gr.rotation({0.0, 1.0, 0.0}, 45.0)
rotateYPos90           = gr.rotation({0.0, 1.0, 0.0}, 90.0)
rotateXNeg90           = gr.rotation({1.0, 0.0, 0.0}, -90.0)
translateXMazeSize     = gr.translation({mazeSize, 0.0, 0.0})
translateXMazeHalfSize = gr.translation({mazeHalfSize, 0.0, 0.0})
translateXHalfSize     = gr.translation({halfSize, 0.0, 0.0})

--create wall
wall = gr.node('wall')
wall:addChild(gr.translation({wallWidth + wallDepth, wallHeight, 0.0}))
wall:addChild(gr.scaling({wallWidth, wallHeight, 0.5}))
wall:addChild(green)
wall:addChild(texture00)
wall:addChild(cube)

--create cross
cross = gr.node('cross')
cross:addChild(rotateYPos5)
for a = 0, 4, 1 do
  cross:addChild(rotateYPos90)
  cross:addChild(wall)
end

--create double wall
doubleWall = gr.node('doubleWall')
doubleWall:addChild(wall)
doubleWall:addChild(gr.translation({2 * wallWidth, 0.0, 0.0}))
doubleWall:addChild(wall)

--create corner
corner = gr.node('corner')
corner:addChild(rotateYPos5)
corner:addChild(doubleWall)
corner:addChild(rotateYPos90)
corner:addChild(doubleWall)

--create rocket nose
rocketBody = gr.node('rocketBody')
rocketBody:addChild(gr.scaling({0.5, 2.0, 0.5}))
rocketBody:addChild(rotateXNeg90)
rocketBody:addChild(grey)
rocketBody:addChild(texture01)
rocketBody:addChild(cylinder)

--create rocket body
rocketNose = gr.node('rocketNose')
rocketNose:addChild(gr.scaling({0.5, 1.0, 0.5}))
rocketNose:addChild(rotateXNeg90)
rocketNose:addChild(grey)
rocketNose:addChild(texture01)
rocketNose:addChild(cone)

--create rocket engine
rocketEngine = gr.node('rocketEngine')
rocketEngine:addChild(gr.scaling({0.5, 1.5, 0.5}))
rocketEngine:addChild(rotateXNeg90)
rocketEngine:addChild(grey)
rocketEngine:addChild(texture01)
rocketEngine:addChild(cone)

--assemble rocket
rocket = gr.node('rocket')
rocket:addChild(gr.translation({0.0, 2.0, 0.0}))
rocket:addChild(rocketBody)
rocket:addChild(gr.translation({0.0, 3.0, 0.0}))
rocket:addChild(rocketNose)
rocket:addChild(gr.translation({-0.25, -3.5, -0.25}))
rocket:addChild(rocketEngine)
rocket:addChild(gr.translation({0.0, 0.0, 0.5}))
rocket:addChild(rocketEngine)
rocket:addChild(gr.translation({0.5, 0.0, 0.0}))
rocket:addChild(rocketEngine)
rocket:addChild(gr.translation({0.0, 0.0, -0.5}))
rocket:addChild(rocketEngine)

--add maze elements
elems = gr.node('elements')
elems:addChild(rotateYPos45)
elems:addChild(
  gr.translation({-0.5 * mazeHalfSize, 0.0, 0.5 * mazeHalfSize}))
elems:addChild(cross)
elems:addChild(translateXMazeHalfSize)
elems:addChild(rotateYPos90)
elems:addChild(cross)
elems:addChild(translateXMazeHalfSize)
elems:addChild(rotateYPos90)
elems:addChild(cross)
elems:addChild(translateXMazeHalfSize)
elems:addChild(rotateYPos90)
elems:addChild(cross)

--add rockets
rockets = gr.node('rockets')
rockets:addChild(gr.translation({-0.5 * halfSize, 0.0, 0.5 * halfSize}))
rockets:addChild(rocket)
rockets:addChild(gr.translation({0.0, 0.0, -halfSize}))
rockets:addChild(rocket)
rockets:addChild(gr.translation({halfSize, 0.0, 0.0}))
rockets:addChild(rocket)
rockets:addChild(gr.translation({0.0, 0.0, halfSize}))
rockets:addChild(rocket)

--add maze corners
corners = gr.node('corners')
corners:addChild(gr.translation({-mazeHalfSize, 0.0, mazeHalfSize}))
corners:addChild(corner)
corners:addChild(translateXMazeSize)
corners:addChild(rotateYPos90)
corners:addChild(corner)
corners:addChild(translateXMazeSize)
corners:addChild(rotateYPos90)
corners:addChild(corner)
corners:addChild(translateXMazeSize)
corners:addChild(rotateYPos90)
corners:addChild(corner)

--add maze center
center = gr.node('center')
center:addChild(rotateYPos45)
center:addChild(cross)
  
--create maze
maze = gr.node('maze')
maze:addChild(center)
maze:addChild(elems)
maze:addChild(rockets)
maze:addChild(corners)

--add maze to the scene
scene:addChild(maze)

--return root node
return scene
