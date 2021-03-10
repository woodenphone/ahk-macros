/*
date_prefix.ahk
Generate and prepend the a datestamp
in the form "2020-05-28.01."
to the beginning of the current line.
This is intended for "Save file" dialog boxes.
AUTHOR: Ctrl-S
CREATED: 2020-05-28
MODIFIED: 2020-05-28
*/

#SingleInstance Force ; Only run the latest version of this file, single instance running maximum.
#Persistent ; Keep script permanently running
return ; (End of auto-execute section)

^+/::
; Insert date prefix on CTRL-SHIFT-/
; example result: "2020-05-28.01."
FormatTime, DateString , , yyyy-MM-dd.01.
SendInput {Home}%DateString%
return