	*=$ff8a-9
	jmp pcint
	jmp ioinit
	jmp ramtas
	*=$ff8a         ;new vectors for basic
	jmp restor      ;restore vectors to initial system
	jmp vector      ;change vectors for user
	* =$ff90
	jmp setmsg      ;control o.s. messages
	jmp secnd       ;send sa after listen
	jmp tksa        ;send sa after talk
	jmp memtop      ;set/read top of memory
	jmp membot      ;set/read bottom of memory
	jmp scnkey      ;scan keyboard
	jmp settmo      ;set timeout in ieee
	jmp acptr       ;handshake ieee byte in
	jmp ciout       ;handshake ieee byte out
	jmp untlk       ;send untalk out ieee
	jmp unlsn       ;send unlisten out ieee
	jmp listn       ;send listen out ieee
	jmp talk        ;send talk out ieee
	jmp readss      ;return i/o status byte
	jmp setlfs      ;set la, fa, sa
	jmp setnam      ;set length and fn adr
open	jmp (iopen)     ;open logical file
close	jmp (iclose)    ;close logical file
chkin	jmp (ichkin)    ;open channel in
ckout	jmp (ickout)    ;open channel out
clrch	jmp (iclrch)    ;close i/o channel
basin	jmp (ibasin)    ;input from channel
bsout	jmp (ibsout)    ;output to channel
	jmp loadsp      ;load from file
	jmp savesp      ;save to file
	jmp settim      ;set internal clock
	jmp rdtim       ;read internal clock
stop	jmp (istop)     ;scan stop key
getin	jmp (igetin)    ;get char from q
clall	jmp (iclall)    ;close all files
	jmp udtim       ;increment clock
jscrog	jmp scrorg      ;screen org
jplot	jmp plot        ;read/set x,y coord
jiobas	jmp iobase      ;return i/o base

	*=$fffa
	.wor nmi        ;program defineable
	.wor start      ;initialization code
	.wor puls       ;interrupt handler

