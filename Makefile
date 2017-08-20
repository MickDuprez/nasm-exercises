ASM_FILE=somefile

build:
	nasm -f elf $(ASM_FILE).asm
	ld -m elf_i386 -s -o $(ASM_FILE) $(ASM_FILE).o
