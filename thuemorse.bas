'THUEMORSE
'Czq'bqymc, 2014-08-05

seq$="0"
for i=1 to 16
  cseq$=""
  for j=1 to len(seq$)
    if mid$(seq$,j,1)="1" then cseq$=cseq$+"0" else cseq$=cseq$+"1"
  next j
  seq$=seq$+cseq$
next i
print len(seq$)
screenres 640,480,8
for y=0 to 255
  for x=0 to 255
    if mid$(seq$,(y*256)+x,1)="1" then
      pset (x+192,y+112),31
    else
      pset (x+192,y+112),18
    end if
  next x
next y
sleep
