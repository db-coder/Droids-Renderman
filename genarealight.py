num_x = 20
num_y = 2
num_z = 20
start_x = 0
start_y = 15
start_z = 8
step_x = 0.015
step_y = 0.015
step_z = 0.015
intensity = 1
count = 1
text1 = "LightSource \"shaders/shadowlight\" "
text2 = " \"intensity\" "+str(intensity)+" \"lightcolor\" [1 1 1] \"from\" ["

x = start_x
for i in xrange(num_x):
	y = start_y
	for j in xrange(num_y):
		z = start_z
		for k in xrange(num_z):
			print text1+str(count)+text2+str(x)+" "+str(y)+" "+str(z)+"]"
			count += 1
			z += step_z
		y += step_y
	x += step_x

