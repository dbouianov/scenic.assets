--data folder
folder = '../data/scene00/'

--create root node
scene = gr.node('Demo Scene')

--create materials
red    = gr.material({1.0, 0.0, 0.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
green  = gr.material({0.0, 1.0, 0.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
blue   = gr.material({0.0, 0.0, 1.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
yellow = gr.material({1.0, 1.0, 0.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
brown  = gr.material({0.5, 0.2, 0.2, 1.0}, {0.25, 0.25, 0.25}, 10.0)

--create textures
texture00 = gr.texture(folder .. 'dragon00.png', 0, 1)
texture01 = gr.texture(folder .. 'stone00.png', 0, 1)
texture02 = gr.texture(folder .. 'stone01.png', 0, 1)

--create base objects
sphere   = gr.sphere()
cylinder = gr.cylinder()
cone     = gr.cone()
cube     = gr.cube()
disk     = gr.disk()
square   = gr.square()

--create common transformations
scaleXYZ2     = gr.scaling({0.5, 0.5, 0.5})
spaceZ        = gr.translation({0.0, 0.0, 0.01})
rotateYPos30  = gr.rotation({0.0, 1.0, 0.0}, 30.0)
rotateYNeg30  = gr.rotation({0.0, 1.0, 0.0}, -30.0)
rotateZPos90  = gr.rotation({0.0, 0.0, 1.0}, 90.0)
rotateXNeg90  = gr.rotation({1.0, 0.0, 0.0}, -90.0)
rotateXPos180 = gr.rotation({1.0, 0.0, 0.0}, 180.0)
rotateYPos180 = gr.rotation({0.0, 1.0, 0.0}, 180.0)

--create disk
object = gr.node('disk00', 1)
object:addChild(gr.translation({1.0, 1.5, 0.0}))
object:addChild(rotateYNeg30)
object:addChild(scaleXYZ2)
object:addChild(rotateXPos180)
object:addChild(yellow)
object:addChild(texture00)
object:addChild(disk)
object:addChild(rotateYPos180)
object:addChild(disk)
scene:addChild(object)

--create square
object = gr.node('square00', 1)
object:addChild(gr.translation({-1.0, 1.5, 0.0}))
object:addChild(rotateYPos30)
object:addChild(scaleXYZ2)
object:addChild(yellow)
object:addChild(texture00)
object:addChild(rotateYPos180)
object:addChild(square)
object:addChild(spaceZ)
object:addChild(rotateYPos180)
object:addChild(square)
scene:addChild(object)

--create sphere
object = gr.node('sphere00', 1)
object:addChild(gr.translation({-2.0, 0.5, 0.0}))
object:addChild(scaleXYZ2)
--object:addChild(rotateZPos90)
object:addChild(rotateYPos30)
object:addChild(red)
object:addChild(texture00)
object:addChild(sphere)
scene:addChild(object)

--create cylinder
object = gr.node('cylinder00', 1)
object:addChild(gr.translation({2.0, 0.5, 0.0}))
object:addChild(scaleXYZ2)
object:addChild(rotateXNeg90)
object:addChild(green)
object:addChild(texture01)
object:addChild(cylinder)
object:addChild(gr.translation({0.0, 0.0, 1.0}))
object:addChild(disk)
scene:addChild(object)

--create cone
object = gr.node('cone00', 1)
object:addChild(gr.translation({0.0, 0.5, 2.0}))
object:addChild(scaleXYZ2)
object:addChild(rotateXNeg90)
object:addChild(blue)
object:addChild(texture02)
object:addChild(cone)
scene:addChild(object)

--create cube
object = gr.node('cube00', 1)
object:addChild(gr.translation({0.0, 0.5, -2.0}))
object:addChild(rotateYPos30)
object:addChild(scaleXYZ2)
object:addChild(brown)
object:addChild(texture01)
object:addChild(cube)
scene:addChild(object)

--return root node
return scene
