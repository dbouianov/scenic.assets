--create root node
effects = gr.node('effects')

--environment parameters
fireVelocity  = {0.0, 0.75, 0.0}
spaceGravity  = {0.0, 0.0, 0.0}

--create base objects
cube   = gr.cube(1, 1)
sphere = gr.sphereLod(10, 8)

--maze parameters
size     = 35
halfSize = size * 0.5

--create common transformations
translateXHalfSize = gr.translation({halfSize, 0.0, 0.0})

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

--create 4 fires and smokes
fires = gr.node('fires')
fires:addChild(gr.translation({-2.0, 0.0, 0.0}))
fires:addChild(fire)
fires:addChild(smoke)
fires:addChild(gr.translation({2.0, 0.0, -2.0}))
fires:addChild(fire)
fires:addChild(smoke)
fires:addChild(gr.translation({2.0, 0.0, 2.0}))
fires:addChild(fire)
fires:addChild(smoke)
fires:addChild(gr.translation({-2.0, 0.0, 2.0}))
fires:addChild(fire)
fires:addChild(smoke)

--add fires in around the center and around each rocket
effects:addChild(fires)
effects:addChild(
  gr.translation({-0.5 * halfSize, 0.0, 0.5 * halfSize}))
effects:addChild(fires)
effects:addChild(gr.translation({0.0, 0.0, -halfSize}))
effects:addChild(fires)
effects:addChild(gr.translation({halfSize, 0.0, 0.0}))
effects:addChild(fires)
effects:addChild(gr.translation({0.0, 0.0, halfSize}))
effects:addChild(fires)

--delete unused objects
gr.delete(cube)
gr.delete(sphere)
gr.delete(fireParticle)

--return root node
return effects
