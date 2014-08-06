tell application "Spotify"
  set the sound volume to 0
	play track "spotify:track:TRACKURI" in context "spotify:user:USERNAME:playlist:PLAYLISTURI"
	delay FIRSTTRACKDURATIONINSECONDS
	repeat 10 times
		if sound volume is less than 50 then
			set sound volume to (sound volume + 10)
			delay 3
		end if
	end repeat
end tell
