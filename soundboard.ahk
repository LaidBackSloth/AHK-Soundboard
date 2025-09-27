#NoEnv
#SingleInstance, force
SendMode Input


;config start

global device = "SFX (Elgato Wave:1)" ;set this to the audio device to play

global f1n1s = ""
global f1n1v = 1
global f1n2s = ""
global f1n2v = 1
global f1n3s = ""
global f1n3v = 1
global f1n4s = ""
global f1n4v = 1
global f1n5s = ""
global f1n5v = 1
global f1n6s = ""
global f1n6v = 1

global f2n1s = ""
global f2n1v = 1
global f2n2s = ""
global f2n2v = 1
global f2n3s = ""
global f2n3v = 1
global f2n4s = ""
global f2n4v = 1
global f2n5s = ""
global f2n5v = 1
global f2n6s = ""
global f2n6v = 1

global f3n1s = ""
global f3n1v = 1
global f3n2s = ""
global f3n2v = 1
global f3n3s = ""
global f3n3v = 1
global f3n4s = ""
global f3n4v = 1
global f3n5s = ""
global f3n5v = 1
global f3n6s = ""
global f3n6v = 1

global f4n1s = ""
global f4n1v = 1
global f4n2s = ""
global f4n2v = 1
global f4n3s = ""
global f4n3v = 1
global f4n4s = ""
global f4n4v = 1
global f4n5s = ""
global f4n5v = 1
global f4n6s = ""
global f4n6v = 1

global disabledSound = ""
global disabledVolume = 1

;config end


global deviceNumber
global stream
global n
global t1 = false
global t2 = false
global t3 = false
global t4 = false
global t5 = false
global t6 = false
global t7 = false
global t8 = false
global t9 = false
global t10 = false
global t11 = false
global t12 = false

;init
DllCall("LoadLibrary", "str", A_ScriptDir "\bass.dll")

Loop {
    VarSetCapacity(info, 16, 0)
    DllCall(A_ScriptDir "\bass.dll\BASS_GetDeviceInfo", "uint", A_Index, "uint", &info)
    name := NumGet(info, 0, "ptr")
    name := StrGet(Name, "cp0")
    if (name = device) {
        deviceNumber := A_Index
        break
    } else if not name {
        MsgBox Device not found
        return
    }
}

DllCall(A_ScriptDir "\bass.dll\BASS_Init", "int", deviceNumber, "uint", 48000, "uint", 0, "ptr", 0, "ptr", 0)
DllCall(A_ScriptDir "\bass.dll\BASS_Start", "int")


;plays a sound for the given absolute path, can also change the volume
PlaySound(fileName, volume=0.5) {
    StopSound()
    stream := DllCall(A_ScriptDir "\bass.dll\BASS_StreamCreateFile", "int", 0, "astr", fileName, "uint", 0, "uint", 0, "uint", 0, "uint", 48000)
    if (volume > 1) {
        volume := 1
    } else if (volume < 0) {
        volume := 0
    }
    DllCall(A_ScriptDir "\bass.dll\BASS_ChannelSetAttribute", "uint", stream, "uint", 2, "float", volume)
    DllCall(A_ScriptDir "\bass.dll\BASS_ChannelPlay", "uint", stream, "int", 1)
}

;stops the current sound
StopSound() {
    if (stream) {
        DllCall(A_ScriptDir "\bass.dll\BASS_ChannelStop", "uint", stream)
    }
}

;handles the key press and optionally plays the sound
Handle(f, fileName, volume=0.5) {
    key = F%f%
    if (GetKeyState(key, "P")) {
        PlaySound(fileName, volume)
        UpdateT(f, true)
        KeyWait %n%
        return false
    }
    return true
}

;handles the CTRL F1-F12 press and delays it
HandleF(f) {
    key = F%f%
    KeyWait %key%
    if (GetT(f)) {
        send, ^{%key%}
    }
    UpdateT(f, false)
    return
}

UpdateT(t, b) {
    switch t {
        case 1: t1 := b
        case 2: t2 := b
        case 3: t3 := b
        case 4: t4 := b
        case 5: t5 := b
        case 6: t6 := b
        case 7: t7 := b
        case 8: t8 := b
        case 9: t9 := b
        case 10: t10 := b
        case 11: t11 := b
        case 12: t12 := b
    }
}

GetT(t) {
    b := false
    switch t {
        case 1: b := t1
        case 2: b := t2
        case 3: b := t3
        case 4: b := t4
        case 5: b := t5
        case 6: b := t6
        case 7: b := t7
        case 8: b := t8
        case 9: b := t9
        case 10: b := t10
        case 11: b := t11
        case 12: b := t12
    }
    return !b
}

PressedF() {
    return GetKeyState("F1", "P") || GetKeyState("F2", "P") || GetKeyState("F3", "P") || GetKeyState("F4", "P")
}

#If PressedF()    
$^1::
    n = 1
    if (Handle(1, f1n1s, f1n1v)) {
        if (Handle(2, f2n1s, f2n1v)) {
            if (Handle(3, f3n1s, f3n1v)) {
                Handle(4, f4n1s, f4n1v)
            }
        }
    }
    return

#If PressedF()    
$^2::
    n = 2
    if (Handle(1, f1n2s, f1n2v)) {
        if (Handle(2, f2n2s, f2n2v)) {
            if (Handle(3, f3n2s, f3n2v)) {
                Handle(4, f4n2s, f4n2v)
            }
        }
    }
    return

#If PressedF()    
$^3::
    n = 3
    if (Handle(1, f1n3s, f1n3v)) {
        if (Handle(2, f2n3s, f2n3v)) {
            if (Handle(3, f3n3s, f3n3v)) {
                Handle(4, f4n3s, f4n3v)
            }
        }
    }
    return

#If PressedF()    
$^4::
    n = 4
    if (Handle(1, f1n4s, f1n4v)) {
        if (Handle(2, f2n4s, f2n4v)) {
            if (Handle(3, f3n4s, f3n4v)) {
                Handle(4, f4n4s, f4n4v)
            }
        }
    }
    return

#If PressedF()    
$^5::
    n = 5
    if (Handle(1, f1n5s, f1n5v)) {
        if (Handle(2, f2n5s, f2n5v)) {
            if (Handle(3, f3n5s, f3n5v)) {
                Handle(4, f4n5s, f4n5v)
            }
        }
    }
    return

#If PressedF()    
$^6::
    n = 6
    if (Handle(1, f1n6s, f1n6v)) {
        if (Handle(2, f2n6s, f2n6v)) {
            if (Handle(3, f3n6s, f3n6v)) {
                Handle(4, f4n6s, f4n6v)
            }
        }
    }
    return

#If PressedF()    
$^7::
    n = 7
    if (GetKeyState("F4", "P")) {
        PlaySound(disabledSound, disabledVolume)
        UpdateT(4, true)
        Sleep, 2000
        if (GetKeyState("7", "P")) {
            DllCall(A_ScriptDir "\bass.dll\BASS_Free")
            ExitApp
        }
        return
    } else if (GetKeyState("F1", "P")) {
        StopSound()
        UpdateT(1, true)
        KeyWait F1
        return
    }
    return

$^F1::
    HandleF(1)
    return

$^F2::
    HandleF(2)
    return

$^F3::
    HandleF(3)
    return

$^F4::
    HandleF(4)
    return
