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
text3 = " \"maplist\" [\"light1.shad,light2.shad,light3.shad,light4.shad\"] \"Pl1\" [1.15622 -8.83187 4.78469] \"Pl2\" [0.191448 -6.11682 8.94722] \"Pl3\" [5.9265 -7.13679 4.78469] \"Pl4\" [4.96173 -4.42175 8.94722] \"gapBias\" [0.03] \"shadowBias\" [0.3] \"numsamples\" [36]"

x = start_x
for i in xrange(num_x):
	y = start_y
	for j in xrange(num_y):
		z = start_z
		for k in xrange(num_z):
			print text1+str(count) +text2+str(x)+" "+str(y)+" "+str(z)+"]"
			count += 1
			z += step_z
		y += step_y
	x += step_x


