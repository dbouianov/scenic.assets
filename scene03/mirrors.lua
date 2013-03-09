--data folder
folder = '../data/scene03/'

--create root node
mirrors = gr.node('mirrors')

--create materials
white = gr.material({1.0, 1.0, 1.0, 0.75}, {0.5, 0.5, 0.5}, 10)

--create textures
texture00 = gr.texture(folder .. 'dragon00.png', 0, 1)

--create base objects
disk = gr.disk()

--maze parameters
size     = 35
halfSize = size * 0.5

--create common transformations
scaleXZ5           = gr.scaling({5.0, 5.0, 5.0})
rotateXNeg90       = gr.rotation({1.0, 0.0, 0.0}, -90.0)
rotateYPos90       = gr.rotation({0.0, 1.0, 0.0}, 90.0)
translateXHalfSize = gr.translation({halfSize, 0.0, 0.0})

--create mirror
mirror = gr.node('mirror')
mirror:addChild(rotateXNeg90)
mirror:addChild(scaleXZ5)
mirror:addChild(white)
mirror:addChild(texture00)
mirror:addChild(disk)

--add mirrors
mirrors:addChild(
  gr.translation({-0.5 * halfSize, 0.0, 0.5 * halfSize}))
mirrors:addChild(mirror)
mirrors:addChild(translateXHalfSize)
mirrors:addChild(rotateYPos90)
mirrors:addChild(mirror)
mirrors:addChild(translateXHalfSize)
mirrors:addChild(rotateYPos90)
mirrors:addChild(mirror)
mirrors:addChild(translateXHalfSize)
mirrors:addChild(rotateYPos90)
mirrors:addChild(mirror)

--return root node
return mirrors
