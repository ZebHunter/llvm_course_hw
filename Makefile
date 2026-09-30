all: my_app

start.ll: start.c
	clang -emit-llvm -S $^
sim.ll: sim.c
	clang -emit-llvm -S $^

full.bc: start.ll sim.ll app.ll
	llvm-link $^ -o full.bc

my_app.ll: my_app.c
	clang -emit-llvm -S $^ -o $@ -O2

my_app: my_app.ll start.c sim.c
	clang $^ -lSDL2 -o $@
my_app-opt: my_app.ll start.c sim.c
	clang $^ -lSDL2 -o $@ -O2

LLVM_FLAGS = $(shell llvm-config --cppflags --ldflags --libs)

ir_gen: sim.c IRGen/app_ir_gen.cpp
	clang++ $(LLVM_FLAGS) $^ -lSDL2 -o $@

asm2ir: sim.c IRGen/app_asm_IRgen_1.cpp
	clang++ $(LLVM_FLAGS) $^ -lSDL2 -o $@

asm2fullir: sim.c IRGen/app_asm_IRgen_2.cpp
	clang++ $(LLVM_FLAGS) $^ -lSDL2 -o $@

clean:
	rm my_app my_app-opt *.ll full.bc ir_gen asm2ir asm2fullir

.PHONY: all clean
