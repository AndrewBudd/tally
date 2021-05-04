property audioMuteBtn : "Mute audio"
property audioUnmuteBtn : "Unmute Audio"
property videoStopBtn : "Stop Video"

if application "zoom.us" is running then
    tell application "System Events"
        -- activate
        tell application process "zoom.us"
            if exists (menu item audioMuteBtn of menu 1 of menu bar item "Meeting" of menu bar 1) then
                set returnValue to "Audio"
            else if exists (menu item audioUnmuteBtn of menu 1 of menu bar item "Meeting" of menu bar 1) then
                if exists (menu item videoStopBtn of menu 1 of menu bar item "Meeting" of menu bar 1) then
                    set returnValue to "Video"
                else
                    set returnValue to "Muted"
                end if
            else
                set returnValue to "Off"
            end if
        end tell
    end tell
else
    set returnValue to "Off"
end if

return returnValue
