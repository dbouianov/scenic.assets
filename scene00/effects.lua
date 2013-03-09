--create root node
effects = gr.node('effects')

--environment parameters
fireVelocity  = {0.0, 0.75, 0.0}
waterVelocity = {0.0, 1.25, 0.0}
spaceGravity  = {0.0, 0.0, 0.0}
earthGravity  = {0.0, -9.81, 0.0}

--create base objects
cube   = gr.cubeLod(1, 1)
sphere = gr.sphereLod(10, 8)

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
  waterVelocity, earthGravity, 512, 0, 1, 0.0125, 20.0, 1.0, 1.0)

--create fire and smoke on top of the sphere
object = gr.node('fire00')
object:addChild(gr.translation({-2.0, 1.0, 0.0}))
object:addChild(fire)
object:addChild(smoke)
effects:addChild(object)

--create fire and smoke on top of the cylinder
object = gr.node('fire01')
object:addChild(gr.translation({2.0, 1.0, 0.0}))
object:addChild(fire)
object:addChild(smoke)
effects:addChild(object)

--create fire and smoke on top of the cone
object = gr.node('fire02')
object:addChild(gr.translation({0.0, 1.0, -2.0}))
object:addChild(fire)
object:addChild(smoke)
effects:addChild(object)

--create fire and smoke on top of the cube
object = gr.node('fire03')
object:addChild(gr.translation({0.0, 1.0, 2.0}))
object:addChild(fire)
object:addChild(smoke)
effects:addChild(object)

--create water in the middle of the scene
object = gr.node('water00')
object:addChild(gr.translation({0.0, 0.5, 0.0}))
object:addChild(water)
effects:addChild(object)

--delete unused objects
gr.delete(cube)
gr.delete(sphere)
gr.delete(fireParticle)

--return root node
return effects
