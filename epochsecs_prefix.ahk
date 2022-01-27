/*
epochsecs.ahk
Generate and prepend the a unix style seconds since epoch timestamp
in the form "TODO"
to the beginning of the current line.
This is intended for "Save file" dialog boxes.
AUTHOR: Ctrl-S
CREATED: 2022-01-27
MODIFIED: 2022-01-27
*/

#SingleInstance Force ; Only run the latest version of this file, single instance running maximum.
#Persistent ; Keep script permanently running
return ; (End of auto-execute section)


GetUnixTime()
{
    ;; Return current time as seconds since epoch
    ;; See also:
    ;;> https://docs.microsoft.com/en-us/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemtimeasfiletime
    ;;> https://www.autohotkey.com/docs/commands/DllCall.htm
    ;;
    ;; From: https://www.autohotkey.com/boards/viewtopic.php?p=258958#p258958
    DllCall("GetSystemTimeAsFileTime", "int64p", t)
    unix_timestamp:=t//10000000-11644473600
    ;;
    return unix_timestamp
}

^+;::
;; Insert unix epoch timespamp prefix on CTRL-SHIFT-;
;; example result: "@1643254998"
UnixTimeStamp := "@" . GetUnixTime()
SendInput {Home}%UnixTimeStamp%
return

^+'::
;; Insert unix epoch timespamp on CTRL-SHIFT-'
;; example result: "@1643254998"
UnixTimeStamp := "@" . GetUnixTime()
SendInput %UnixTimeStamp%
return

^+l::
;; Insert comment unix epoch timespamp prefix on CTRL-SHIFT-l
;; example result: "##  @1643254998"
UnixTimeStamp := "@" . GetUnixTime()
SendInput {Home}{#}{#}  %UnixTimeStamp%
return

^+k::
;; Insert comment unix epoch timespamp prefix on CTRL-SHIFT-k
;; example result: "##  @1643254998 = 20220127T034318Z"
;; Get unix style:
UnixTimeStamp := "@" . GetUnixTime()
;; Get ISO style:
;; https://en.wikipedia.org/wiki/ISO_8601
;; e.g. 20220127T020137Z
FormatTime, DateString, %A_NowUTC%, yyyyMMddTHHmmssZ
;; Send keyboard input:
SendInput {Home}{#}{#}  %UnixTimeStamp% {=} %DateString%
return
