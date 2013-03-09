--data folder
folder = '../data/scene00/'

--create root node
terrain = gr.node('terrain')

--create materials
green = gr.material({0.1, 0.8, 0.1, 1.0}, {0.5, 0.5, 0.5}, 10.0)

--create textures
textureTerrain = gr.texture(folder .. 'stone02.png')

--create base objects
square = gr.square()

--create common transformations
rotateXNeg90 = gr.rotation({1.0, 0.0, 0.0}, -90.0)

--create terrain
object = gr.node('terrain00')
object:addChild(square)
object:addChild(textureTerrain)
object:addChild(green)
object:addChild(rotateXNeg90)
object:addChild(gr.scaling({8.0, 8.0, 8.0}))
terrain:addChild(object)

--return root node
return terrain
