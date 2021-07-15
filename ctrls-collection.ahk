/*
"ctrls-collection.ahk"
Single file for my various authohotkey stuff.
AUTHOR: Ctrl-S
CREATED: 2020-08-18
MODIFIED: 2021-07-15
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

^+.::
; Insert datetime prefix on CTRL-SHIFT-.
; example result: "2020-05-28_13-10-05."
FormatTime, DateString , , yyyy-MM-dd_HH-mm-ss.
SendInput {Home}%DateString%
return

^+,::
; Insert comment datetime on CTRL-SHIFT-,
; example result: "## 2020-05-28_13-10-05"
FormatTime, DateString , , yyyy-MM-dd_HH-mm-ss
SendInput {Home}{#}{#} %DateString%
return
