08048404 <main>:
 8048404:	55                   	push   ebp
 8048405:	89 e5                	mov    ebp,esp
 8048407:	83 e4 f0             	and    esp,0xfffffff0
 804840a:	83 ec 10             	sub    esp,0x10
 804840d:	c7 04 24 f0 84 04 08 	mov    DWORD PTR [esp],0x80484f0
 8048414:	e8 27 ff ff ff       	call   8048340 <puts@plt>
 8048419:	b8 00 00 00 00       	mov    eax,0x0
 804841e:	c9                   	leave  
 804841f:	c3                   	ret    

Contents of section .rodata:
 80484e8 03000000 01000200 48656c6c 6f2c2057  ........Hello, W
 80484f8 6f726c64 2100                        orld!.          
