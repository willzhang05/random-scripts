#!/usr/bin/python2
### I was bored in 9th or 10th grade, so I made this. ###

import xml.etree.cElementTree as e
from random import randint


def rgbToString(r, g, b):
    return '#' + ("%02x" % r) + ("%02x" % g) + ("%02x" % b)


svg = e.Element("svg")
svg.set("width", "1920")
svg.set("height", "1200")
svg.set("style", "background-color:" +
        rgbToString(randint(0, 255), randint(0, 255), randint(0, 255)))
svg.set("xmlns", "http://www.w3.org/2000/svg")
svg.set("xmlns:svg", "http://www.w3.org/2000/svg")
g = e.SubElement(svg, "g")
for shapes in range(randint(0, 200)):
	choice = randint(1, 3)
	r1 = randint(0, 10)
	r2 = randint(0, 10)
	size1 = randint(0, 200)
	size2 = randint(0, 200)
	xpos = randint(0, 1920)
	r = randint(0, 255)
	gr = randint(0, 255)
	b = randint(0, 255)
	ypos = randint(0, 1200)
	tup = []
	if choice == 1:
		circ = e.SubElement(g, "circle")
		circ.set("cx", str(xpos))
		circ.set("cy", str(ypos))
		circ.set("r", str(size1))
		circ.set("style", "fill:" + rgbToString(r, gr, b))
	elif choice == 2:
		for sides in range(randint(3, 10)):
			tup.append((randint(0, xpos), randint(0, ypos)))
		points = str()
		for item in tup:
			points += str(item[0]) + ',' + str(item[1]) + " "
		poly = e.SubElement(g, "polygon")
		poly.set("points", points)
		poly.set("style", "fill:" + rgbToString(r, gr, b))
	else:
		rect = e.SubElement(g, "rect")
		rect.set("x", str(xpos))
		rect.set("y", str(ypos))
		rect.set("width", str(size1))
		rect.set("height", str(size2))
		rect.set("style", "fill:" + rgbToString(r, gr, b))
with open('random.svg', 'wb') as f:
    declar = '<?xml version="1.0"?>\n'
    doctype1 = '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"\n'
    doctype2 = '  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">'
    f.write((declar + doctype1 + doctype2).encode())
    e.ElementTree(svg).write(f)
