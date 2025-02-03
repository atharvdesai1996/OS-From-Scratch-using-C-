# OS-From-Scratch-using-C++
Welcome to the ultimate adventure in low-level programming! In this repository, we're going to create an operating system from scratch using the mighty C++. It's like building a robot that builds robots - but instead of robots, we're making an OS!

## Running the Kernel in QEMU
To test the compiled OS kernel using QEMU, use the following command:

```bash
qemu-system-i386 -cdrom mykernel.iso -m 512M -boot d -monitor stdio
```

### Checking Kernel Files in GRUB
Once inside **GRUB**, verify that the necessary files exist by running:

```grub
ls (cd)/boot/
```

You should see:

```
mykernel.bin  grub/
```

### Booting the Kernel from GRUB
If the kernel file is detected, run:

```grub
multiboot /boot/mykernel.bin
boot
```

This will boot your OS inside the QEMU virtual machine.
