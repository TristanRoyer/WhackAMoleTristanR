-- Title: Whack A Mole
-- Created by: Wal Wal
-- Modified by: Ms Raffin
-- Modified by: Ms Raffin
-- Date: Nov. 10th, 2014
-- Course: ICS2O/3C
-- This program places a random object on the screen. If the user clicks on it in
-- time, the score increases by

-- local variables
local scoreText
local score = 0
local scoreTimer

display.setStatusBar(display.HiddenStatusBar)



-- Creating Background
local bkg = display.newRect(0,0 display.contentWidth,display.contentHeight)

display.setDefault("background",200/255, 180/255,98/255)

-- Setting Position
bkg.anchorX = 0
bkg.anchorY = 0
bkg.x = 0
bkg.y = 0

-- Creating Mole
local mole = display.newImage( "Images/mole.png", 0,0)

-- Setting Position
mole.x = display.contentCenterX
mole.y = display.contentCenterY

mole.yScale = 2/3

mole.isVisible = false

local function UpdateScore
	score = score + 1
	scoreText.Text = "score:" .. score

 --displays the score
 local scoreText = display.newText("score:" .. score, 0,0, nil, 50)
 scoreText:setFillColor(1,1,0)



------------------------------Functions------------------------------------

-- This function that makes the mole appear in a random (x,y) position on the 
-- screen before calling the Hide function
function PopUp()

-- choosing random position on the screen between 0 and the size of the screen
mole.x = math.random( 0, display.contentWidth)
mole.y = math.random( 0, display.contentHeight)
mole.isVisible = true
timer.performWithDelay(1000,Hide)
end

-- This function calls the popup function after 3 seconds
function PopUpDelay()
timer.performWithDelay(3000,PopUp)
end
 function Hide()
-- makes the mole invisible
mole.isVisible = false
PopUp()
end

--This function starts the game
function GameStart()
PopUpDelay
end

--This function increments the score only if the mole is clicked.It then
--displays the new score
function Whacked( event )
-- If touch phase just  started
if (event.phase == "began") then
	UpdateScore()
	audio.play
end
end

--------------------------------Event Listeners----------------------------
-- I add the event listener to the moles so that if the mole is touched, the Whacked 
-- function is called
mole:addEventListener("touch",Whacked )

------------------------------Start the game-------------------------------
GameStart()