--data folder
folder = '../data/scene03/'

--create root node
terrain = gr.node('terrain')

--create materials
yellow = gr.material({0.45, 0.45, 0.1, 1.0}, {0.5, 0.5, 0.5}, 10.0)

--create textures
textureTerrain = gr.texture(folder .. 'stone01.png', 0, 1)

--create base objects
square = gr.square()

--create common transformations
rotateXNeg90 = gr.rotation({1.0, 0.0, 0.0}, -90.0)

--create terrain
object = gr.node('terrain00')
object:addChild(gr.scaling({20.0, 20.0, 20.0}))
object:addChild(rotateXNeg90)
object:addChild(yellow)
object:addChild(textureTerrain)
object:addChild(square)
terrain:addChild(object)

--return root node
return terrain
