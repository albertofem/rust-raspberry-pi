build-obj:
	rustc --target arm-unknown-linux-gnueabihf -O --emit=obj kernel.rs -L ~/.multirust/toolchains/arm-unknown-linux-gnueabihf/lib -o obj/kernel.o

build-elf:
	arm-none-eabi-gcc -O0 -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -nostartfiles obj/kernel.o -o bin/kernel.elf --specs=nosys.specs

build-img:
	arm-none-eabi-objcopy bin/kernel.elf -O binary raspberry/kernel.img

build: build-obj build-elf build-img
