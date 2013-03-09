--create root node
effects = gr.node('effects')

--environment parameters
smokeVelocity = {-1.0, 0.125, 0.0}
spaceGravity  = {0.0, 0.0, 0.0}

--create base objects
sphere = gr.sphereLod(10, 8)

--create particle system for smoke effect
smoke = gr.psystem(sphere, {0.05, 0.05, 0.05, 1.0},
  smokeVelocity, spaceGravity, 128, 1, 1, 0.15, 5.0, 0.5, 0.5)

--create smoke coming out of ship's pipe
object = gr.node('smoke00')
object:addChild(gr.translation({0.0, 2.5, 0.0}))
object:addChild(smoke)
effects:addChild(object)

--delete unused objects
gr.delete(sphere)

--return root node
return effects
