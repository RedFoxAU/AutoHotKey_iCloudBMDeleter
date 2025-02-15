#Persistent  ; Keeps the script running

; Prevent the computer from going to sleep
DllCall("SetThreadExecutionState", "UInt", 0x80000003)

; Define DeleteA and DeleteB coordinates
DeleteA_x := 320
DeleteA_y := 956
DeleteB_x := 671
DeleteB_y := 656
TargetColor := 0x48484B  ; The color to check for at DeleteA
SetMouseDelay, 50  ; Delay between mouse actions for smoothness
DeleteBTimeout := 60000  ; Timeout in milliseconds (60 seconds)

; Wait 5 seconds before starting
Sleep, 5000

Loop
{
    ; Move to DeleteA
    MouseMove, DeleteA_x, DeleteA_y
    Sleep, 1000  ; Wait for 1 second

    ; Check color at DeleteA coordinates
    PixelGetColor, color, DeleteA_x, DeleteA_y, RGB

    ; Debugging: Display color being checked at DeleteA
    ToolTip, Checking DeleteA: %color%
    Sleep, 1000  ; Display the tooltip for 1 second
    ToolTip  ; Clear the tooltip

    ; If color matches TargetColor at DeleteA, click
    if (color = TargetColor)
    {
        Click
        ToolTip, Clicked at DeleteA!  ; Visual feedback for successful click
        Sleep, 2000  ; Wait 1 second after clicking
        ToolTip  ; Clear the tooltip
    }
    else
    {
        ; If color does not match, continue checking DeleteA
        ToolTip, Waiting for color match at DeleteA...  ; Show when waiting for color match
        Sleep, 1000  ; Wait 1 second before re-checking color
        ToolTip  ; Clear the tooltip
        continue  ; Skip moving to DeleteB and restart the loop at DeleteA
    }

    ; Move to DeleteB after successful click at DeleteA
    MouseMove, DeleteB_x, DeleteB_y
    Sleep, 2000  ; Wait for 1 second

    ; Track time at DeleteB
    startTime := A_TickCount  ; Record current time
    while (A_TickCount - startTime < DeleteBTimeout)
    {
        ; Click at DeleteB
        Click
        ToolTip, Clicked at DeleteB!  ; Visual feedback for DeleteB click
        Sleep, 1000  ; Wait 1 second after clicking

        ; Exit the loop after clicking at DeleteB
        break
    }

    ; Check if timeout occurred at DeleteB
    if (A_TickCount - startTime >= DeleteBTimeout)
    {
        ; Failsafe: Click at DeleteB, wait 2 seconds, and move back to DeleteA
        Click
        ToolTip, Failsafe triggered! Timeout at DeleteB. Returning to DeleteA...
        Sleep, 2000  ; Wait 2 seconds
        MouseMove, DeleteA_x, DeleteA_y  ; Move back to DeleteA
        ToolTip  ; Clear the tooltip
        continue  ; Restart the loop at DeleteA
    }

    ; Clear any tooltips
    ToolTip
}
