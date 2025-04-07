#Requires AutoHotkey v2.0
#SingleInstance Force

; --------------------------------------------------------------
; Key
; --------------------------------------------------------------

; ! = Alt
; ^ = Control
; + = Shift
; # = Windows

; --------------------------------------------------------------
; Base System Remappings
; --------------------------------------------------------------

LAlt::LCtrl
LWin::LAlt
LCtrl::LWin

; --------------------------------------------------------------
; Home, End, PgUp and PgDn
; --------------------------------------------------------------

!Left:: Send("^{Left}")
!Right:: Send("^{Right}")
!Up:: Send("^{Up}")
!Down:: Send("^{Down}")

!+Left:: Send("^+{Left}")
!+Right:: Send("^+{Right}")
!+Up:: Send("^+{Up}")
!+Down:: Send("^+{Down}")

^Del:: Send("{Shift Down}{End}{Shift Up}{Backspace}")
^Backspace:: Send("{Shift Down}{Home}{Shift Up}{Backspace}")

!Del:: Send("{Shift Down}^{Right}{Shift Up}{Backspace}")
!Backspace:: Send("{Shift Down}^{Left}{Shift Up}{Backspace}")

global alt_tab_active := false

; ==========================================================
; Manipulação do Alt (LAlt)
; ==========================================================
LAlt:: {
    global alt_tab_active
    KeyWait("LAlt")
    if (alt_tab_active) {
        SendInput "{LAlt Up}"
        alt_tab_active := false
    }
}

; ==========================================================
; Funcionalidade do Alt-Tab apenas quando Alt estiver pressionado
; ==========================================================
#HotIf GetKeyState("LAlt", "P")
*Tab:: SendAltTab("{Tab}") 
*+Tab:: SendAltTab("+{Tab}") 
#HotIf

; ==========================================================
; Função para enviar Alt-Tab corretamente
; ==========================================================
SendAltTab(key) {
    global alt_tab_active
    if (!alt_tab_active) {
        SendInput "{alt down}{tab}"
        alt_tab_active := true
    } else {
        SendInput key
    }
}

; ==========================================================
; Remapeamento Alt + Qualquer Tecla → Ctrl + Tecla (exceto Alt-Tab)
; ==========================================================
#HotIf GetKeyState("LAlt", "P")
a:: Send("^a")
b:: Send("^b")
c:: Send("^c")
d:: Send("^d")
e:: Send("^e")
f:: Send("^f")
g:: Send("^g")
h:: Send("^h")
i:: Send("^i")
j:: Send("^j")
k:: Send("^k")
l:: Send("^l")
m:: Send("^m")
n:: Send("^n")
o:: Send("^o")
p:: Send("^p")
q:: Send("^q")
r:: Send("^r")
s:: Send("^s")
t:: Send("^t")
u:: Send("^u")
v:: Send("^v")
w:: Send("^w")
x:: Send("^x")
y:: Send("^y")
z:: Send("^z")

+a:: Send("^+a")
+b:: Send("^+b")
+c:: Send("^+c")
+d:: Send("^+d")
+e:: Send("^+e")
+f:: Send("^+f")
+g:: Send("^+g")
+h:: Send("^+h")
+i:: Send("^+i")
+j:: Send("^+j")
+k:: Send("^+k")
+l:: Send("^+l")
+m:: Send("^+m")
+n:: Send("^+n")
+o:: Send("^+o")
+p:: Send("^+p")
+q:: Send("^+q")
+r:: Send("^+r")
+s:: Send("^+s")
+t:: Send("^+t")
+u:: Send("^+u")
+v:: Send("^+v")
+w:: Send("^+w")
+x:: Send("^+x")
+y:: Send("^+y")
+z:: Send("^+z")

1:: Send("^1")
2:: Send("^2")
3:: Send("^3")
4:: Send("^4")
5:: Send("^5")
6:: Send("^6")
7:: Send("^7")
8:: Send("^8")
9:: Send("^9")
0:: Send("^0")

-:: Send("^-")
=:: Send("^=")
.:: Send("^.")
/:: Send("^/")

Left:: Send("{Home}")
Right:: Send("{End}")
Up:: Send("^{Up}")
Down:: Send("^{Down}")

+Left:: Send("+{Home}")
+Right:: Send("+{End}")
+Up:: Send("^+{Up}")
+Down:: Send("^+{Down}")

+Esc:: Send("^+{Esc}")

Del:: {
    Send("+{End}")
    Send("{Backspace}")
}

Backspace:: {
    Send("+{Home}")
    Send("{Backspace}")
}

Space:: Send("^{Space}")

#HotIf