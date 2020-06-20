' vars
dim as integer mx ' mouse x
dim as integer my ' mouse y
dim as integer realmx ' mouse x - does not change if mouse goes off screen
dim as integer realmy ' mouse y - does not change if mouse goes off screen
dim as integer mb ' mouse buttons
dim as integer bx ' ball x
dim as integer by ' ball y
dim as integer bxad ' add to ball x
dim as integer byad ' add to ball y
dim as single pause ' speed of ball (lower the faster)
dim as integer bsize ' bar size (size of all 4 bars)
dim as integer points ' number of points
dim as integer sleepon ' sleep for a second if ball reset
bx=rnd*540+50
by=rnd*380+50
bxad=1
byad=1
pause=5.0
bsize=40

' set screen 18 (res = 640 x 480) - 24 bit color depth
screen 18,24
screenres 640,480,24

here:
getmouse (mx,my, ,mb)
if mx > -1 then
	realmx = mx
end if
if my > -1 then
	realmy = my
end if

' >> this line was put in at a later date <<
if multikey(16) then end ' if 'q' key pressed then end the program
' >> this line was put in at a later date <<

if mb=4 then end

' if it hits off the bars turn the ball around
if (bx < 20 or bx > 620) and (by > realmy-bsize and by < realmy+bsize) then
	' 1 more point per ball and bar collision
	points=points+1
	
	bxad = bxad * -1
end if
if (by < 20 or by > 460) and (bx > realmx-bsize and bx < realmx+bsize) then
	' 1 more point per ball and bar collision
	points=points+1
	
	byad = byad * -1
end if

' if the ball goes off screen then rerandomise a location on screen
if (bx < -20 or bx > 660) then
	bx=rnd*540+50
	by=rnd*380+50
	bxad=bxad*-1
	
	bsize=40
	pause=5.0
	
	sleepon=1
end if
if (by < -20 or by > 500) then
	bx=rnd*540+50
	by=rnd*380+50
	byad=byad*-1
	
	bsize=40
	pause=5.0
	
	sleepon=1
end if

' ball gets faster (higher this number the faster the ball speeds up)
pause=pause-0.0001

' next position of ball
bx=bx+bxad
by=by+byad

' background
line (0,0)-(640,480),0,bf

' bars (rgb = 0,240,0)
line (realmx-bsize,5)-(realmx+bsize,15),61440,bf
line (realmx-bsize,465)-(realmx+bsize,475),61440,bf
line (5,realmy-bsize)-(15,realmy+bsize),61440,bf
line (625,realmy-bsize)-(635,realmy+bsize),61440,bf

' ball (rgb = 0,0,240)
circle (bx,by),10,240, , , ,F

' bottom of playing area
'line (0,478)-(640,490),rgb(200,0,0),bf

' indicators
draw string (300,30),"points = " + str(points),rgb(200,0,0)
draw string (300,80),"pause = " + str(pause),rgb(200,0,0)


'locate 300,20
'print "points = " + str(points)
'locate 260,70
'print "pause = " + str(pause)
'locate 0,0

if sleepon=1 then
	goto showdirection
	showdirectionreturn:
	
	sleepon=0
end if

sleep pause
goto here

showdirection:
if bxad>0 and byad>0 then
	line (bx,by)-(bx+40,by+40),240
end if
if bxad<0 and byad>0 then
	line (bx,by)-(bx-40,by+40),240
end if
if bxad>0 and byad<0 then
	line (bx,by)-(bx+40,by-40),240
end if
if bxad<0 and byad<0 then
	line (bx,by)-(bx-40,by-40),240
end if
	
sleep 1000
goto showdirectionreturn

' not included VV -- END HERE -- END HERE --
' not included VV -- END HERE -- END HERE --

'go:
'Dim As Integer x, y, buttons, res
' Set video mode and enter loop
'ScreenRes 640, 480, 8
'Do
    ' Get mouse x, y and buttons. Discard wheel position.
    'res = GetMouse (x, y, , buttons)
    'Locate 1, 1
    'If res <> 0 Then '; Failure

	'#IFDEF __FB_DOS__
        'Print "Mouse or mouse driver not available"
	'#ELSE
        'Print "Mouse not available or not on window"
	'#ENDIF

    'Else
        'Print Using "Mouse position: ###:###  Buttons: "; x; y;
        'If buttons And 1 Then Print "L";
        'If buttons And 2 Then Print "R";
        'If buttons And 4 Then Print "M";
        'Print "   "
    'End If
'Loop While Inkey = ""
'End
