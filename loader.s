.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot  # helps multiboot compliant bootloaders to boot kernels
	.long MAGIC
	.long FLAGS
	.long CHECKSUM


.section .text
.extern kernelMain
.global loader
.extern callConstructors

loader:
	mov $kernel_stack, %esp	
	call callConstructors        

	push %eax  # points to multiboot struct
        push %ebx  # points to magic number
        call kernelMain

_stop:
 	cli
	hlt 
	jmp _stop


.section .bss
.space 2*1024*1024; #2 MiB space to avoid stack being overwritten 

kernel_stack:
 

