

# disabling -cxa-atexit -- few things like Prevents the compiler from using the __cxa_atexit function for registering destructors of global objects.
# disabling -fno-builtin Prevents the compiler from replacing function calls with built-in versions of standard library functions (e.g., memcpy, strlen).
# -fno-rtti Disables Run-Time Type Information (RTTI), which is used for dynamic type identification via features like typeid and dynamic_cast.
# -fno-exceptions Prevents the compiler from prepending an underscore (_) to symbol names in the generated assembly code.

GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore  
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o

%.o : %.cpp

	g++ $(GPPPARAMS) -o $@ -c $<

%.o: %.s
	as $(ASPARAMS) -o $@ $<


mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

install: mykernel.bin
	sudo cp $< /boot/mykernel.bin

clean:
	rm -f $(objects)
