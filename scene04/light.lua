--create root node
lights = gr.node('lights')

--create light
light  = gr.light({1.0, 1.0, 1.0, 0.0}, {-1.0, -1.0, -1.0},
                  {1.0, 1.0, 1.0}, {1.0, 1.0, 1.0}, 0.0, 180.0)
lights:addChild(light)

--return root node
return lights
