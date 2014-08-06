Spotify wake up music AppleScript
=======

www.aderca.net/spotify-alarm

Wake up with Spotify alarm

My buzzer alarm clock goes up at around 0730. Beside the killing alarm clock it would be nice to hear some cool tunes in the morning. So my music should start at 0730 as well. I snooze till 0800 or so and then get ready and leave the apartment at around 0900. And this is also the time I would like the music to stop.

Here we go:

First you’ll need to make a Spotify playlist for your morning. Lets call it Wakeup. Put in the music you like. Make sure your firs two tracks are the same. We’ll startup the first song of this playlist mute. Put up the volume after it’s played and then shuffle between all our songs in this playlist. That’s how you wont freak out by hearing the same first song every time the alarm goes off.

Right click the playlist and copy the Spotify URI. Paste it somewhere. You’ll need the code displayed after the “spotify:user:yourusername:playlist:”. Lets call it PLAYLISTURI.

Now select the first song in your playlist and right click it. Copy the Spotify URI and past is somewhere. You’ll need the code displayed after the “spotify:track:" Lets called it TRACKURI.

Open up AppleScript Editor. (hit cmd+space and type AppleScript Editor and hit enter.)

Paste the spotify_play_wakeup.scpt code in to the AppleScript editor:

Change the USERNAME with your Spotify username

Change the TRACKURI with the code you’ve put aside before

Change the PLAYLISTURI with the code you’ve put aside before

Change the FIRSTTRACKDURATIONINSECONDS with the duration of your first song in seconds. Let’s say “305”. This is also the time your alarm music will not yet be heard after firing up. Consider this later when scheduling the script in crontab.

You can change the 50 with anything from 0 to 100 if you would like to change the Spotify wakeup volume.
Save it to your /Users/OSXUSERNAME/Documents/Scripts/ folder as spotify_play_wakeup.scpt

We need to setup the stop command for Spotify now. Open up a new AppleScript window and past the spotify_pause.scpt code into it:

Save it to your /Users/OSXUSERNAME/Documents/Scripts/ folder as spotify_pause.scpt

Now open the Terminal (hit cmd+space and type Terminal and hit enter.)

Enter the command: “crontab -e”. This will bring you in to the vi editor.

Press “i" to insert the schedule command. Click here to read more about the crontab job editing. So you can setup your own alarm time.

Type: “25 7 * * 1-5 osascript /Users/OSXUSERNAME/Documents/Scripts/spotify_play_wakeup.scpt”. This will fire up the script we created before to start playing our tunes at 0725 from Monday till Friday.

Type in a new row: “0 9 * * 1-5 osascript /Users/OSXUSERNAME/Documents/Scripts/spotify_pause.scpt" This will fire up the script we created before to stop playing our tunes at 0900 from Monday till Friday.

Hit esc

Type the command “:wq" to save and quit the crontab editor. Close the Terminal and your all done.
You can create more scripts and scheduled times. I have one script set to a lower volume at a later time for the weekends. You could make a different script to play a different playlist for every other day. Tweak around.
