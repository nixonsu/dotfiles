#Requires AutoHotkey v2.0
#SingleInstance Force

; Caps + Space -> Ctrl+B (for tmux)
CapsLock & Space::Send "^b"

; Swap Left Alt -> Left Ctrl
; Intentionally not swapping Left Ctrl -> Left Alt because it breaks Raycast paste
LAlt::LCtrl

SetCapsLockState "AlwaysOff"

global g_CapsUsed := false
global g_CapsDownAt := 0

*CapsLock::
{
    global g_CapsUsed, g_CapsDownAt
    g_CapsUsed := false
    g_CapsDownAt := A_TickCount
}

*CapsLock Up::
{
    global g_CapsUsed, g_CapsDownAt

    if !g_CapsUsed && (A_TickCount - g_CapsDownAt <= 500)
        Send "{Esc}"
}

#HotIf GetKeyState("CapsLock", "P")

h::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send GetKeyState("Shift", "P") ? "+{Left}" : "{Left}"
}

j::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send GetKeyState("Shift", "P") ? "+{Down}" : "{Down}"
}

k::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send GetKeyState("Shift", "P") ? "+{Up}" : "{Up}"
}

l::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send GetKeyState("Shift", "P") ? "+{Right}" : "{Right}"
}

d::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^d"
}

u::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^u"
}

s::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^s"
}

x::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^x"
}

g::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^g"
}

a::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^a"
}

t::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^t"
}

r::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^r"
}

n::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^n"
}

1::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^1"
}

2::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^2"
}

3::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^3"
}

4::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^4"
}

5::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^5"
}

6::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^6"
}

7::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^7"
}

8::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^8"
}

9::
{
    global g_CapsUsed
    g_CapsUsed := true
    Send "^9"
}

#HotIf
