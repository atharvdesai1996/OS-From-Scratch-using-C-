



void printf (char *str)
{
	volatile unsigned short * VideoMem = (volatile unsigned short *) 0xb8000;

	for (int i =0; str[i] !='\0'; ++i) 
	{
		VideoMem[i] = (VideoMem[i] & 0xFF00) | str[i];
	}
}

/* This code manually calls global/static object constructors by iterating over pointers in the .init_array section defined by start_ctors and end_ctors, typically in embedded or bare-metal systems. It ensures proper initialization when no runtime handles this automatically. */
typedef void (*constructor)();
extern "C" constructor start_ctors;
extern "C" constructor end_ctors;
extern "C" void callConstructors()
{
	for (constructor* i = &start_ctors; i!= &end_ctors; i++)
	{
		(*i)();		
	}
}

/* extern "C" usage - In C++, function names are "mangled" to support function overloading (multiple functions with the same name but different parameters). The compiler modifies the function name to include information about the function's signature, such as the types of parameters and return type.
For example, a function named foo(int) might be mangled into something like _Z3fooi by the C++ compiler.
By using extern "C", you are telling the C++ compiler to use C-style linkage (i.e., no name mangling), ensuring that the function can be correctly linked and called by C or other tools that expect C conventions.
 */
extern "C" void kernelMain(void *multiboot_structure, unsigned int magicnumber) // can also use multiboot.h from gnu project
{

	printf ("Lets create our own OS");

	// infinite loop for now
	while(1);

}
