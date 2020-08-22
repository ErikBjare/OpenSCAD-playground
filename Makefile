inputs := $(wildcard models/*.scad)
outputs := $(patsubst %.scad, %.stl, $(inputs))

all: $(outputs)

models/%.stl: models/%.scad
	openscad -o $@ $<
