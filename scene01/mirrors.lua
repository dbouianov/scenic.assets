--data folder
folder = '../data/scene01/'

--create root node
mirrors = gr.node('mirrors')

--create materials
grey = gr.material({0.5, 0.5, 0.5, 0.75}, {0.5, 0.5, 0.5}, 10)

--create textures
texture00 = gr.texture(folder .. 'dragon00.png', 0, 1)

--create base objects
disk = gr.diskLod(80, 16)

--create common transformations
rotateXNeg90 = gr.rotation({1.0, 0.0, 0.0}, -90.0)

--create center mirror
object = gr.node('mirror00')
object:addChild(gr.scaling({10.0, 6.0, 6.0}))
object:addChild(rotateXNeg90)
object:addChild(grey)
object:addChild(texture00)
object:addChild(disk)
mirrors:addChild(object)

--return root node
return mirrors
