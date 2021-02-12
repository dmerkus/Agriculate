Maps := ["Esseles", "Fostar Haven", "Galitan", "Nadiri Dockyards", "Sissubo", "Yavin", "Zavian Abyss"]
SelectedMap := 0
SelectedFaction := 0

; Create the Custom Match setup GUI
Gui, Agriculate:New

Gui, Add, Text,, Faction

Gui, Add, Radio, vSelectedFaction gUpdate Checked, Random
Gui, Add, Radio, gUpdate, New Republic
Gui, Add, Radio, gUpdate, Galactic Empire

Gui, Add, Text,, Map
Gui, Add, Radio, vSelectedMap gUpdate Checked, Random
for Index, MapName in Maps
{
    Gui, Add, Radio, gUpdate, %MapName%
}

Gui, Show
Return


Update:

    Gui, Submit, NoHide




StartPractice(Faction, Map)
{
    SetKeyDelay, 300, 50

    CreateCustomMatch(Map)
    
    Sleep, 5000

    StartMatch(Faction)

    Sleep, 5000

    ReadyUp()
}

CreateCustomMatch(Map)
{
    OpenCustomMatch()
    LoadCustomMatchPreset()

    SetCustomMatchMap(Map)
    CreateMatchAsPilot()
}

OpenCustomMatch()
{
    Send {Right}
    Confirm()

    Loop 3 {
        Send {Down}
    }
    Confirm()
}

LoadCustomMatchPreset()
{
    Confirm() ; Load Preset
    Confirm() ; Practice Preset
    Confirm() ; Confirm Overwrite Settings
}

SetCustomMatchMap(Map)
{
    ; Move to Basic Settings
    Loop 2 {
        Send {Down}
    }
    Confirm()

    ; Move to Map Select
    Loop 2 {
        Send {Down}
    }
    Confirm()

    SelectMap(Map)

    Send {Escape}
}

CreateMatchAsPilot()
{
    Loop 3 {
        Send {Down}
    }

    Confirm() ; Create Match
    Confirm() ; Confirm Selection
}

StartMatch(Faction)
{
    SelectFaction(Faction)

    Send b
    Confirm()
}

ReadyUp()
{
    Send b
}

QuitPractice()
{

}

SelectFaction(Faction)
{
    Send {Right %Faction%}

    Confirm()
}

SelectMap(Map)
{
    MsgBox,, Title, %Map%
    Send {Right %Map%}

    Confirm()
}

Confirm()
{
    Send {Enter}

}

^+a::
    Gui, Agriculate:Show
    Return


^+s::
    MsgBox,, Title, %SelectedMap% %SelectedFaction%,

    StartPractice(SelectedFaction, SelectedMap)
    Return



^+r::
    MsgBox,, Title, Restarting,
    Return

^+q::
    MsgBox,, Title, Quitting to Main Menu,
    Return
