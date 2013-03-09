--data folder
folder = '../data/scene02/'

--create root node
scene = gr.node('Ship')

--create materials
grey   = gr.material({0.5, 0.5, 0.5, 1.0}, {0.5, 0.5, 0.5}, 10.0)
yellow = gr.material({0.4, 0.4, 0.2, 1.0}, {0.5, 0.5, 0.5}, 10.0)
brown  = gr.material({0.6, 0.2, 0.2, 1.0}, {0.5, 0.5, 0.5}, 10.0)

--create textures
texture00 = gr.texture(folder .. 'metal00.png', 0, 1)
texture01 = gr.texture(folder .. 'metal01.png', 0, 1)

--create base objects
cylinder = gr.cylinder() 
disk     = gr.disk()
cube     = gr.cube()
 
--create common transformations
rotateX90  = gr.rotation({1.0, 0.0, 0.0}, -90.0)

--create ship's hull
hull = gr.node('hull')
hull:addChild(gr.translation({0.0, 0.5, 0.0}))
hull:addChild(gr.scaling({2.0, 0.5, 0.5}))
hull:addChild(rotateX90)
hull:addChild(brown)
hull:addChild(texture00)
hull:addChild(cylinder)

--create ship's deck
deck = gr.node('deck')
deck:addChild(gr.translation({0.0, 1.0, 0.0}))
deck:addChild(gr.scaling({2.0, 0.5, 0.5}))
deck:addChild(rotateX90)
deck:addChild(yellow)
deck:addChild(texture00)
deck:addChild(disk)

--create ship's bridge
bridge = gr.node('bridge')
bridge:addChild(gr.translation({0.0, 1.25, 0.0}))
bridge:addChild(gr.scaling({1.0, 0.25, 0.25}))
bridge:addChild(grey)
bridge:addChild(texture01)
bridge:addChild(cube)

--create ship's exhaust pipe
pipe = gr.node('pipe')
pipe:addChild(gr.translation({0.0, 2.0, 0.0}))
pipe:addChild(gr.scaling({0.25, 0.5, 0.25}))
pipe:addChild(rotateX90)
pipe:addChild(yellow)
pipe:addChild(texture00)
pipe:addChild(cylinder)

--create ship
ship = gr.node('ship')
ship:addChild(hull)
ship:addChild(deck)
ship:addChild(bridge)
ship:addChild(pipe)

--add ship to the scene
scene:addChild(ship)

--return root node
return scene
