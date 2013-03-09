--data folder
folder = '../data/scene02/'

--create root node
mirrors = gr.node('mirrors')

--create materials
grey = gr.material({0.5, 0.5, 0.5, 0.75}, {0.5, 0.5, 0.5}, 10)

--create textures
texture00 = gr.texture(folder .. 'water00.png', 0, 1)

--create base objects
disk = gr.disk()

--create common transformations
scaleXZ5     = gr.scaling({5.0, 5.0, 5.0})
rotateXNeg90 = gr.rotation({1.0, 0.0, 0.0}, -90.0)

--create center mirror
object = gr.node('mirror00')
object:addChild(rotateXNeg90)
object:addChild(scaleXZ5)
object:addChild(grey)
object:addChild(texture00)
object:addChild(disk)
mirrors:addChild(object)

--return root node
return mirrors
