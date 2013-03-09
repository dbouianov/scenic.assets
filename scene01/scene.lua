--data folder
folder = '../data/scene01/'

--create root node
scene = gr.node('Fountain')

--create materials
green = gr.material({0.1, 0.8, 0.1, 1.0}, {0.5, 0.5, 0.5}, 10.0)
white = gr.material({1.0, 1.0, 1.0, 1.0}, {0.5, 0.5, 0.5}, 10.0)
clear = gr.material({0.5, 0.5, 1.0, 0.5}, {0.75, 0.75, 0.75}, 10.0)

--create textures
textureColumn = gr.texture(folder .. 'column00.png', 0, 1)
textureTorch  = gr.texture(folder .. 'torch00.png', 0, 1)
textureWater  = gr.texture(folder .. 'water00.png', 0, 1)

--create base objects
cylinder = gr.cylinder()
coneLod  = gr.coneLod(10, 8)
cube     = gr.cube()
disk     = gr.disk()

--building dimensions
width  = 8
depth  = 6
height = 4
halfWidth  = width  * 0.5
halfDepth  = depth  * 0.5
halfHeight = height * 0.5

--create common transformations
scaleUpPos2    = gr.scaling({0.5, halfHeight, 0.5})
scaleUpNeg1    = gr.scaling({1.0, -1.0, 1.0})
rotateXPos90   = gr.rotation({1.0, 0.0, 0.0}, 90.0)
rotateXNeg90   = gr.rotation({1.0, 0.0, 0.0}, -90.0)
rotateXPos5    = gr.rotation({1.0, 0.0, 0.0}, 5.0)
rotateXNeg5    = gr.rotation({1.0, 0.0, 0.0}, -5.0)
rotateYPos5    = gr.rotation({0.0, 1.0, 0.0}, 5.0)
translateZPos2 = gr.translation({0.0, -0.5, 0.5})
translateZNeg2 = gr.translation({0.0, -0.5, -0.5})

--create building
building = gr.node('building')

--rotate building a bit
building:addChild(rotateYPos5)

--create roof
roof = gr.node('roof')
roof:addChild(gr.translation({0.0, height + 0.5, 0.0}))
roof:addChild(gr.scaling({halfWidth + 0.75, 0.5, halfDepth + 0.75}))
roof:addChild(green)
roof:addChild(textureColumn)
roof:addChild(cube)

--create column
column = gr.node('column')
column:addChild(scaleUpPos2)
column:addChild(rotateXNeg90)
column:addChild(green)
column:addChild(textureColumn)
column:addChild(cylinder)

--create torch
torch = gr.node('torch')
torch:addChild(gr.translation({0.0, 0.25, 0.0}))
torch:addChild(gr.scaling({0.0625, 0.03125, 0.0625}))
torch:addChild(white)
torch:addChild(textureTorch)
torch:addChild(cube)
torch:addChild(gr.translation({0.0, -8.0, 0.0}))
torch:addChild(gr.scaling({1.0, 8.0, 1.0}))
torch:addChild(rotateXPos90)
torch:addChild(coneLod)

--create block
block = gr.node('block')
block:addChild(gr.scaling({0.25, 0.25, 0.25}))
block:addChild(green)
block:addChild(textureColumn)
block:addChild(cube)

--create fountain
fountain = gr.node('fountain')
fountain:addChild(gr.translation({0.0, 0.5, 0.0}))
fountain:addChild(block)
fountain:addChild(gr.translation({0.0, -0.25, 0.0}))
fountain:addChild(gr.scaling({1.0, 0.25, 1.0}))
fountain:addChild(rotateXNeg90)
fountain:addChild(green)
fountain:addChild(textureColumn)
fountain:addChild(cylinder)
fountain:addChild(scaleUpNeg1)
fountain:addChild(cylinder)
fountain:addChild(gr.translation({0.0, 0.0, 1.0}))
fountain:addChild(scaleUpNeg1)
fountain:addChild(clear)
fountain:addChild(textureWater)
fountain:addChild(disk)

--add fountain to the building
building:addChild(fountain)

--add columns to the building
for z = -halfDepth, halfDepth, 6 do
  for x = -halfWidth, halfWidth, 2 do
    --create column group node
    object = gr.node('column')
    --position column
    object:addChild(gr.translation({x, 2.0, z}))
    object:addChild(column)
    --add torch on inside of each column
    if z < 0 then
      --offset torch from the column
      object:addChild(translateZPos2)
      object:addChild(rotateXPos5)
    else
      --offset torch from the column
      object:addChild(translateZNeg2)
      object:addChild(rotateXNeg5)
    end
    object:addChild(torch)
    --add column to the building
    building:addChild(object)
  end
end

--add roof to the building
building:addChild(roof)

--add building to the scene
scene:addChild(building)

--return root node
return scene
