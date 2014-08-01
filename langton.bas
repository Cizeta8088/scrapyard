'LANGTON
'Czq'bqymc, 2014-08-01

declare function sanitize$(pattern$)
defsng a-z
steps=0
direction=0
x=512
y=384
input "pattern";pattern$
input "number of steps";maxsteps
cleanpattern$=sanitize$(pattern$)
if cleanpattern$="" then cleanpattern$="RL"
maxcolor=len(cleanpattern$)
dim patterncolor(maxcolor)
for c=1 to maxcolor
  t$=mid$(cleanpattern$,c,1)
  if t$="L" then patterncolor(c-1)=0
  if t$="R" then patterncolor(c-1)=1
next c
screenres 1024,768,8
do while done=0
  v=point(x,y)
  if patterncolor(v)=1 then
      direction+=1
      if direction=4 then direction=0
  else
      direction-=1
      if direction=-1 then direction=3
  end if
  v+=1
  if v=maxcolor then v=0
  pset (x,y),v
  select case direction
    case 0: 'up
      y-=1
      if y=-1 then y=767
    case 1: 'right
      x+=1
      if x=1024 then x=0
    case 2: 'down
      y+=1
      if y=768 then y=0
    case 3: 'left
      x-=1
      if x=-1 then x=1023
  end select
  steps+=1:if steps=maxsteps then done=1
  k$=inkey$:if k$=chr$(27) then done=1
loop
sleep

function sanitize$(pattern$)
  clean$=""
  for c=1 to len(pattern$)
    t$=ucase$(mid$(pattern$,c,1))
    if t$="L" or t$="R" then clean$=clean$+t$
  next c
  sanitize$=clean$
end function