; Inspired from https://gist.github.com/sedm0784/4443120

#Requires AutoHotkey v2.0
#SingleInstance Force

global g_LastCtrlKeyDownTime := 0
global g_AbortSendEsc := false
global g_ControlRepeatDetected := false

*CapsLock:: {
    global g_ControlRepeatDetected
    global g_LastCtrlKeyDownTime
    global g_AbortSendEsc

    if (g_ControlRepeatDetected)
    {
        return
    }

    Send "{Ctrl down}"
    g_LastCtrlKeyDownTime := A_TickCount
    g_AbortSendEsc := false
    g_ControlRepeatDetected := true

    ; MsgBox " down " . g_LastCtrlKeyDownTime . " repeat" . g_ControlRepeatDetected

    return
}

*CapsLock Up:: {
    global g_ControlRepeatDetected
    global g_AbortSendEsc
    global g_LastCtrlKeyDownTime

    Send "{Ctrl up}"
    g_ControlRepeatDetected := false
    
    current_time := A_TickCount
    time_elapsed := current_time - g_LastCtrlKeyDownTime
    ; MsgBox "release " . g_AbortSendEsc . " time " . time_elapsed
    
    if (g_AbortSendEsc)
    {
        return
    }
    if (time_elapsed <= 500)
    {
        SendInput "{Esc}"
    }
    return
}

~*^a::
~*^b::
~*^c::
~*^d::
~*^e::
~*^f::
~*^g::
~*^h::
~*^i::
~*^j::
~*^k::
~*^l::
~*^m::
~*^n::
~*^o::
~*^p::
~*^q::
~*^r::
~*^s::
~*^t::
~*^u::
~*^v::
~*^w::
~*^x::
~*^y::
~*^z::
~*^1::
~*^2::
~*^3::
~*^4::
~*^5::
~*^6::
~*^7::
~*^8::
~*^9::
~*^0::
~*^Space::
~*^Backspace::
~*^Delete::
~*^Insert::
~*^Home::
~*^End::
~*^PgUp::
~*^PgDn::
~*^Tab::
~*^Enter::
~*^,::
~*^.::
~*^/::
~*^;::
~*^'::
~*^[::
~*^]::
~*^\::
~*^-::
~*^=::
~*^`::
~*^F1::
~*^F2::
~*^F3::
~*^F4::
~*^F5::
~*^F6::
~*^F7::
~*^F8::
~*^F9::
~*^F10::
~*^F11::
~*^F12:: {
    global g_AbortSendEsc
    g_AbortSendEsc := true
    return
}