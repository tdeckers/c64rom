	stx facmoh
	ldx facmo+1
	stx facmo
	ldx facov
	stx faclo
	sty facov
	adc #@10
addpr2	=addprc+addprc
addpr4	=addpr2+addpr2
addpr8	=addpr4+addpr4
	cmp #@30+addpr8
	bne norm3
zerofc	lda #0
zerof1	sta facexp
zeroml	sta facsgn
	rts
fadd2	adc oldov
	sta facov
	lda faclo
	adc arglo
	sta faclo
	lda facmo
	adc argmo
	sta facmo
	lda facmoh
	adc argmoh
	sta facmoh
	lda facho
	adc argho
	sta facho
	jmp squeez
norm2	adc #1
	asl facov
	rol faclo
	rol facmo
	rol facmoh
	rol facho
norm1	bpl norm2
	sec
	sbc facexp
	bcs zerofc
	eor #@377
	adc #1
	sta facexp
squeez	bcc rndrts
rndshf	inc facexp
	beq overr
	ror facho
	ror facmoh
	ror facmo
	ror faclo
	ror facov
rndrts	rts
negfac	lda facsgn
	eor #@377
	sta facsgn
negfch	lda facho
	eor #@377
	sta facho
	lda facmoh
	eor #@377
	sta facmoh
	lda facmo
	eor #@377
	sta facmo
	lda faclo
	eor #@377
	sta faclo
	lda facov
	eor #@377
	sta facov
	inc facov
	bne incfrt
incfac	inc faclo
	bne incfrt
	inc facmo
	bne incfrt
	inc facmoh
	bne incfrt
	inc facho
incfrt	rts
overr	ldx #errov
	jmp error
mulshf	ldx #resho-1
shftr2	ldy 3+addprc,x
	sty facov
	ldy 3,x
	sty 4,x
	ldy 2,x
	sty 3,x
	ldy 1,x
	sty 2,x
	ldy bits
	sty 1,x
shiftr	adc #@10
	bmi shftr2
	beq shftr2
	sbc #@10
	tay
	lda facov
	bcs shftrt
shftr3	asl 1,x
	bcc shftr4
	inc 1,x
shftr4	ror 1,x
	ror 1,x
rolshf	ror 2,x
	ror 3,x
	ror 4,x
	ror a
	iny
	bne shftr3
shftrt	clc
	rts
fone	.byt @201,0,0,0,0
logcn2	.byt 3,@177,@136,@126
	.byt @313,@171,@200,@23
	.byt @233,@13,@144,@200
	.byt @166,@70,@223,@26
	.byt @202,@70,@252,@73,@40
sqr05	.byt @200,@65,4,@363,@64
sqr20	.byt @201,@65,@4,@363,@64
neghlf	.byt @200,@200,0,0,0
log2	.byt @200,@61,@162,@27,@370

