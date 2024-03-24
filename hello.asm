format mz
start:
		
          mov edi,120001h
          mov ecx,80*26*2
          mov al,017h
          mov edx,2
          call fill32
          mov edi,120000h
          mov ecx,80*26*2
          mov al,'*'
          mov edx,2
          call fill32  
          mov esi,120000h
          mov edi,0b8000h
          mov ecx,80*25*2
          mov edx,1
          call copymem32                        
                          
          exitdo:                
                                    
                                    
                    exit:                
                              int 20h                
                              xor ah,ah
                              int 21h                
                                             
                
halt:
jmp halt
fill32:                
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          push ds                
          mov bp,0                
          mov ds,bp
          cmp edx,0
          JNZ FILL3211
          inc edx                
          FILL3211:
          FILL321:  
                    ds    
                    mov [edi],al
                    clc                
                    add edi,edx
                    dec ecx                
                    JNZ FILL321
                    pop ds                
                    pop ebp                
                    pop edi                
                    pop esi                
                    pop edx                
                    pop ecx                 
                    pop ebx                
                    pop eax                
                    RET 
                    
copymem32:
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          push ds                
          mov bp,0                
          mov ds,bp
          cmp edx,0
          JNZ COPYMEM3211
          inc edx                
          COPYMEM3211:
          cmp ecx,0
          JZ COPYMEM326
          COPYMEM321:
                    ds
                    mov al,[esi]
                    ds
                    mov [edi],al
                    clc                
                    add edi,edx
                    inc esi                
                    dec ecx                
                    JNZ COPYMEM321
                    COPYMEM326:
                    pop ds                
                    pop ebp                
                    pop edi                
                    pop esi                
                    pop edx                
                    pop ecx                 
                    pop ebx                
                    pop eax                
                    RET                       

x     db 0     
y     db 0
color dw 07h
string1 db "hello world.....",13,10,"$"
string2 db "$",0

