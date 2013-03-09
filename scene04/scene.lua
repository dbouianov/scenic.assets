--data folder
folder = '../data/scene04/'

--create root node
scene = gr.node('Demo Scene')

--create materials
grey = gr.material({0.5, 1.0, 0.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
red    = gr.material({1.0, 0.0, 0.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
green  = gr.material({0.0, 1.0, 0.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
blue   = gr.material({0.0, 0.0, 1.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
yellow = gr.material({1.0, 1.0, 0.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
brown  = gr.material({0.5, 0.2, 0.2, 1.0}, {0.25, 0.25, 0.25}, 10.0)

--create textures
texture01 = gr.texture(folder .. 'wall35.png')

--create base objects 
cube     = gr.cube()
 
--create common transformations
scale_cube_ew = gr.scaling({2.0, 2.0, 0.5})
scale_cube_ns   = gr.scaling({0.5, 2.0, 2.0})
rotateY5   = gr.rotation({0.0, 1.0, 0.0}, 5.0)
rotateX90  = gr.rotation({1.0, 0.0, 0.0}, -90.0)
rotateZ90  = gr.rotation({0.0, 0.0, 1.0}, 90.0)
rotateX180 = gr.rotation({1.0, 0.0, 0.0}, 180.0)
rotateY180 = gr.rotation({0.0, 1.0, 0.0}, 180.0)

--create cube 
object = gr.node('cube00')
object:addChild(cube)
object:addChild(texture01)
object:addChild(grey)
object:addChild(scale_cube_ew)
object:addChild(gr.translation({2.0, 2.0, 0.0}))
scene:addChild(object)

--create cube 
object = gr.node('cube01')
object:addChild(cube)
object:addChild(texture01)
object:addChild(grey)
object:addChild(scale_cube_ns)
object:addChild(gr.translation({-0.5, 2.0, 2.5}))
scene:addChild(object) 

--create cube 
object = gr.node('cube02')
object:addChild(cube)
object:addChild(texture01)
object:addChild(grey)
object:addChild(scale_cube_ew)
object:addChild(gr.translation({6.0, 2.0, 0.0}))
scene:addChild(object) 

--create cube 
object = gr.node('cube03')
object:addChild(cube)
object:addChild(texture01)
object:addChild(grey)
object:addChild(scale_cube_ns)
object:addChild(gr.translation({-0.5, 2.0, 6.5}))
scene:addChild(object)

return scene
