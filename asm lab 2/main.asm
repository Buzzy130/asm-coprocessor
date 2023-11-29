.386
.MODEL FLAT
.DATA
X DD ?
Y DD ?
adr DD ?

.CODE
_solution PROC
PUSH EBP
MOV EBP, ESP

MOV EAX, [EBP]+8
MOV X, EAX

MOV EAX, [EBP]+12
MOV adr, EAX

FSTSW AX; ��������� �������� �������� ���������
FINIT; �������� ����������� � ��������� ���������

; �������� �������� x � ������� ������� ����� FPU (st(0))
FLD1; ST(0) = 1
FLD ST; st(0) = 1; st(1) = 1
FADDP; ST(0) = 2
FLD X; ST(0) = X; ST(1) = 2
; ���������� �������� � ������ �������� x
FSINCOS; ST(0) = COSX; ST(1) = SINX; ST(2) = 2
FDIV; ST(0) = SINX/COSX = TGX; ST(1) = 2
; ������� ���������� �� 2
FDIVRP

FSTP Y; st(0) = 0 ;� Y ���������

MOV ECX, adr
MOV EDX, Y
MOV [ECX], EDX
POP EBP
RET

_solution ENDP
END
