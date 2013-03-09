--create root node
effects = gr.node('effects')

--environment parameters
fireVelocity  = {0.0, 0.75, 0.0}
waterVelocity = {0.0, 2.0, 0.0}
spaceGravity  = {0.0, 0.0, 0.0}
earthGravity  = {0.0, -9.81, 0.0}

--create base objects
cube   = gr.cubeLod(1, 1)
sphere = gr.sphereLod(10, 8)

--create common transformations
rotateYPos5    = gr.rotation({0.0, 1.0, 0.0}, 5.0)
translateZPos2 = gr.translation({0.0, -0.2, 0.55})
translateZNeg2 = gr.translation({0.0, -0.2, -0.55})

--create fire particle
fireParticle = gr.node('fireParticle')
fireParticle:addChild(gr.scaling({0.5, 1.0, 0.5}))
fireParticle:addChild(gr.rotation({1.0, 1.0, 0.75}, 60.0))
fireParticle:addChild(cube)

--create particle system for fire effect
fire = gr.psystem(fireParticle, {1.0, 0.125, 0.0, 1.0},
  fireVelocity, spaceGravity, 128, 1, 1, 0.05, 2.5, 1.0, 1.25)

--create particle system for smoke effect
smoke = gr.psystem(sphere, {0.025, 0.025, 0.025, 1.0},
  fireVelocity, spaceGravity, 128, 1, 1, 0.075, 5.0, 0.5, 0.5)

--create particle system for water effect
water = gr.psystem(sphere, {0.0, 0.125, 1.0, 1.0},
  waterVelocity, earthGravity, 512, 0, 1, 0.0125, 30.0, 1.0, 1.0)

--building dimensions
width = 8
depth = 6
halfWidth = width / 2
halfDepth = depth / 2

--apply building rotation
effects:addChild(rotateYPos5)

--add fire to each torch on each column
for z = -halfDepth, halfDepth, 6 do
  for x = -halfWidth, halfWidth, 2 do
    --create fire group node
    object = gr.node('fire')
    --apply column translation
    object:addChild(gr.translation({x, 2.0, z}))
    --translate fire away from column
    if z < 0 then
      object:addChild(translateZPos2)
    else
      object:addChild(translateZNeg2)
    end
    --add fire and smoke
    object:addChild(fire)
    object:addChild(smoke)
    --add fire group node to root node
    effects:addChild(object)
  end
end

--create water in the fountain
object = gr.node('water')
object:addChild(gr.translation({0.0, 0.725, 0.0}))
object:addChild(water)
effects:addChild(object)

--delete unused objects
gr.delete(cube)
gr.delete(sphere)
gr.delete(fireParticle)

--return root node
return effects
