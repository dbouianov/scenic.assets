--data folder
folder = '../data/scene01/'

--create root node
terrain = gr.node('terrain')

--create materials
brown = gr.material({0.5, 0.2, 0.2, 1.0}, {0.25, 0.25, 0.25}, 10.0)

--create textures
textureTerrain = gr.texture(folder .. 'stone02.png', 0, 1)

--create base objects
square = gr.square()

--create common transformations
rotateXNeg90 = gr.rotation({1.0, 0.0, 0.0}, -90.0)

--create terrain
object = gr.node('terrain00')
object:addChild(gr.scaling({12.0, 10.0, 10.0}))
object:addChild(rotateXNeg90)
object:addChild(brown)
object:addChild(textureTerrain)
object:addChild(square)
terrain:addChild(object)

--return root node
return terrain
