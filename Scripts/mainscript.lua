local Date = "0"
local wtMainPanel
local buffs = {}
local description = {}
local votedbuffs = {}
local images = {}
local OrderHeader = stateMainForm:GetChildChecked("TheOrder", false):GetChildChecked("TheOrder", false):GetChildChecked("Ratings", false):GetChildChecked("Header", false)
local achiev = {}
local Tabs = OrderHeader:GetChildChecked("Tabs", false)
Tabs:SetOnShowNotification( true )

function SetPos(wt,posX,sizeX,posY,sizeY,highPosX,highPosY,alignX, alignY)
  if wt then
    local p = wt:GetPlacementPlain()
    if posX then p.posX = posX end
    if sizeX then p.sizeX = sizeX end
    if posY then p.posY = posY end
    if sizeY then p.sizeY = sizeY end
    if highPosX then p.highPosX = highPosX end
    if highPosY then p.highPosY = highPosY end
	if alignX then p.alignX = alignX end
	if alignY then p.alignY = alignY end
    wt:SetPlacementPlain(p) 
  end
end

local wtMainPanel =  mainForm:GetChildChecked( "MainPanel", false )
local wtVotePanel =  mainForm:GetChildChecked( "VotePanel", false )
SetPos(wtVotePanel,nil,320,nil,300,nil,nil,WIDGET_ALIGN_CENTER, WIDGET_ALIGN_CENTER)
wtVotePanel:Show(false)
local VoteButton = wtVotePanel:GetChildChecked( "VoteForBuffs", false )
VoteButton:SetVal("button_label", userMods.ToWString(GTL("VoteButton")) )
local wtWindow = mainForm:GetChildChecked( "MainPanel", false ):GetChildChecked( "Window", false ) -- главное окно
local CheckBox = wtVotePanel:GetChildChecked( "CheckBox", false )
wtWindow:Show(true)
wtMainPanel:SetClipContent( false )
wtWindow:SetClipContent( false )
local wtMainWindow = mainForm:GetChildChecked( "MainPanel", false ):GetChildChecked( "Window", false ):GetChildChecked( "Ability", false ) -- окно с разделенными бафами
local wtCurrWindow = mainForm:GetChildChecked( "MainPanel", false ):GetChildChecked( "Window", false ):GetChildChecked( "Ability", false ):GetChildChecked( "Currency", false ) -- сами бафы и текст
wtMainWindow:SetTransparentInput( true )
SetPos(wtWindow,15,425,33,320,10)
SetPos(wtMainWindow,5,415,33,60)
if ShowMW then
wtMainPanel:Show(true)
else wtMainPanel:Show(false) end
-------------------------------------------------------------------------
local desc = wtMainWindow:GetWidgetDesc()
local wtPanel1 = mainForm:CreateWidgetByDesc( desc )
wtWindow:AddChild( wtPanel1 )
wtPanel1:Show(true)
SetPos(wtPanel1,5,415,30,60)
-------------------------------------------------------------------------
local wtPanel2 = mainForm:CreateWidgetByDesc( desc)
wtWindow:AddChild( wtPanel2 )
wtPanel2:Show(true)
SetPos(wtPanel2,5,415,90,60)
-------------------------------------------------------------------------
local wtPanel3 = mainForm:CreateWidgetByDesc(desc)
wtWindow:AddChild( wtPanel3 )
wtPanel3:Show(true)
SetPos(wtPanel3,5,415,150,60)
--------------------------------------------------------------------------
local wtPanelDate = mainForm:CreateWidgetByDesc( desc )
wtWindow:AddChild( wtPanelDate )
wtPanelDate:Show(true)
SetPos(wtPanelDate,5,415,210,100)
--------------------------------------------------------------------------

local wtPanelIco = mainForm:CreateWidgetByDesc( desc )
wtPanelDate:AddChild( wtPanelIco )
wtPanelIco:Show(true) -- color icon
SetPos(wtPanelIco,5,100,5,90)
--------------------------------------------------------------------------
local wtPanelTimes = mainForm:CreateWidgetByDesc(desc)
wtPanelDate:AddChild( wtPanelTimes )
wtPanelTimes:Show(true)
SetPos(wtPanelTimes,105,305,5,90)
-------------------------------------------------------------------------
local desc = wtCurrWindow:GetWidgetDesc()
local wtCurrency1 = mainForm:CreateWidgetByDesc( desc )
wtCurrency1:Show(true)
SetPos(wtCurrency1,70,340,5,50)
wtPanel1:AddChild(wtCurrency1)
-------------------------------------------------------------------------
local wtCurrency2 = mainForm:CreateWidgetByDesc( desc )
wtCurrency2:Show(true)
SetPos(wtCurrency2,70,340,5,50)
wtPanel2:AddChild(wtCurrency2)
-------------------------------------------------------------------------
local wtCurrency3 = mainForm:CreateWidgetByDesc( desc)
wtCurrency3:Show(true)
SetPos(wtCurrency3,70,340,5,50)
wtPanel3:AddChild(wtCurrency3)
--------------------------------------------------------------------------
local wtBuffBG1 = mainForm:CreateWidgetByDesc( desc)
wtBuffBG1:Show(true)
SetPos(wtBuffBG1,12,50,6,50)
wtPanel1:AddChild(wtBuffBG1)
local wtBuffBG2 = mainForm:CreateWidgetByDesc( desc)
wtBuffBG2:Show(true)
SetPos(wtBuffBG2,12,50,6,50)
wtPanel2:AddChild(wtBuffBG2)
local wtBuffBG3 = mainForm:CreateWidgetByDesc( desc)
wtBuffBG3:Show(true)
SetPos(wtBuffBG3,12,50,6,50)
wtPanel3:AddChild(wtBuffBG3)
--------------------------------------------------------------------------
local wtDateFon = mainForm:CreateWidgetByDesc( desc)
wtDateFon:Show(true)
SetPos(wtDateFon,325,35,227,25)
wtWindow:AddChild(wtDateFon)
--------------------------------------------------------------------------
local TextHeader = wtMainPanel:GetChildChecked( "TextHeader", false )
SetPos(TextHeader,110,100,35,30,110,nil,WIDGET_ALIGN_BOTH)
TextHeader:SetVal("name", GTL('Text') )
TextHeader:SetPriority(50)
TextHeader:SetBackgroundColor( { r = 0.17; g = 0.19; b = 0.15; a = 1.0 } )
--------------------------------------------------------------------------
SetPos(wtMainPanel,nil,450,-50,400,nil,nil,WIDGET_ALIGN_CENTER, WIDGET_ALIGN_CENTER)
local Header = wtMainPanel:GetChildChecked( "Header", false )
SetPos(Header,70,150,-17,45,70,nil,WIDGET_ALIGN_BOTH)
Header:SetPriority(50)
Header:SetBackgroundColor( { r = 0.0; g = 0.0; b = 0.0; a = 0.0 } )
local wtHeader = mainForm:CreateWidgetByDesc( Header:GetWidgetDesc() )
wtMainPanel:AddChild(wtHeader)
SetPos(wtHeader,70,150,-15,45,70,nil,WIDGET_ALIGN_BOTH)
local Text = wtMainPanel:GetChildChecked( "Text", false )
local TextVote = wtVotePanel:GetChildChecked( "TextVote", false )
local CountVote = wtVotePanel:GetChildChecked( "CountVote", false )
local Desc = wtMainPanel:GetChildChecked( "Desc", false )
local desc = Text:GetWidgetDesc() 
local wtText = mainForm:CreateWidgetByDesc( desc )
wtCurrency1:AddChild( wtText )
SetPos(wtText,10,nil,0,60,nil,nil,WIDGET_ALIGN_BOTH)
local wtText2 = mainForm:CreateWidgetByDesc(desc  )
wtCurrency2:AddChild( wtText2 )
SetPos(wtText2,10,nil,0,60,nil,nil,WIDGET_ALIGN_BOTH)
local wtText3 = mainForm:CreateWidgetByDesc( desc )
wtCurrency3:AddChild( wtText3 )
SetPos(wtText3,10,nil,0,60,nil,nil,WIDGET_ALIGN_BOTH)
local wtDate = mainForm:CreateWidgetByDesc(desc )
wtWindow:AddChild( wtDate )
SetPos(wtDate,70,nil,230,60,nil,nil,WIDGET_ALIGN_BOTH)
wtDate:SetPriority( 50 )
wtDate:SetVal("name", GTL('DateEnd') )
------------------------------------------------------------
local wtAlarm = mainForm:CreateWidgetByDesc( desc )
wtMainPanel:AddChild( wtAlarm )
SetPos(wtAlarm,30,nil,355,60,nil,nil,WIDGET_ALIGN_BOTH)
wtAlarm:SetPriority( 50 )
wtAlarm:SetVal("name", GTL('Alarm'))
wtAlarm:SetClassVal("class", "tip_red" )	
------------------------------------------------------------
local wtDateMS = mainForm:CreateWidgetByDesc( desc )
wtWindow:AddChild( wtDateMS )
SetPos(wtDateMS,280,nil,230,60,nil,nil,WIDGET_ALIGN_BOTH)
wtDateMS:SetPriority( 50 )
local wtVote = mainForm:CreateWidgetByDesc( desc )
wtWindow:AddChild( wtVote )
wtVote:SetPriority( 50 )
SetPos(wtVote,110,200,260,100,nil,nil,WIDGET_ALIGN_BOTH)
local wtWeight = mainForm:CreateWidgetByDesc( desc  )
wtWindow:AddChild( wtWeight )
wtWeight:SetPriority( 50 )
SetPos(wtWeight,110,200,280,100,nil,nil,WIDGET_ALIGN_BOTH)
----------------------------------------------------------------
local wtIcon = wtMainPanel:GetChildChecked( "Image", false )
wtIcon:Show(false)
local desc =  wtIcon:GetWidgetDesc()
local wtBuffone = mainForm:CreateWidgetByDesc( desc )
wtPanel1:AddChild( wtBuffone )
SetPos(wtBuffone,12,50,6,50)
wtBuffone:Show(true)
local wtBufftwo = mainForm:CreateWidgetByDesc( desc )
wtPanel2:AddChild( wtBufftwo )
SetPos(wtBufftwo,12,50,6,50)
wtBufftwo:Show(true)
local wtBuffthree = mainForm:CreateWidgetByDesc( desc )
wtPanel3:AddChild( wtBuffthree )
SetPos(wtBuffthree,12,50,6,50)
wtBuffthree:Show(true)
local wtOderIco = mainForm:CreateWidgetByDesc( desc)
wtWindow:AddChild( wtOderIco )
SetPos(wtOderIco,12,90,215,90)
wtOderIco:Show(true)
wtOderIco:SetPriority( 50 )
----------------------------------------------------------------
local desc = Desc:GetWidgetDesc()
local wtDesc = mainForm:CreateWidgetByDesc( desc )
SetPos(wtDesc,75,60,25,30,nil,nil,WIDGET_ALIGN_BOTH)
wtDesc:SetEllipsis( true )
wtPanel1:AddChild( wtDesc )
wtDesc:Show(true)
local wtDesc2 = mainForm:CreateWidgetByDesc( desc)
wtPanel2:AddChild( wtDesc2 )
SetPos(wtDesc2,75,60,25,30,nil,nil,WIDGET_ALIGN_BOTH)
wtDesc2:SetEllipsis( true )		
local wtDesc3 = mainForm:CreateWidgetByDesc(desc )
wtPanel3:AddChild( wtDesc3 )
SetPos(wtDesc3,75,60,25,30,nil,nil,WIDGET_ALIGN_BOTH)
wtDesc3:SetEllipsis( true )
----------------------------------------------------------------
--MINIPANEL
-------------------------------------------------------------------------
local wtMini = mainForm:GetChildChecked( "MiniPanel", false )
SetPos(wtMini,-150,130,-150,70,nil,nil,WIDGET_ALIGN_CENTER, WIDGET_ALIGN_CENTER)
wtMini:SetBackgroundColor( { r = 1.0; g = 1.0; b = 1.0; a = 0.0 } )
if ShowMini then
wtMini:Show(true)
else wtMini:Show(false) end
local wtOn = wtMini:GetChildChecked( "Enable", false )
local wtOff = wtMini:GetChildChecked( "Disable", false )
local ButtonInfo = wtMini:GetChildChecked( "ButtonVote", false)
SetPos(ButtonInfo,0,24,44,24, 5)
wtOn:Show(false)
wtOff:Show(false)
local wtMiniBuffBG1 = mainForm:CreateWidgetByDesc( wtCurrWindow:GetWidgetDesc() )
wtMiniBuffBG1:Show(true)
SetPos(wtMiniBuffBG1,0,40,0,40)
wtMini:AddChild(wtMiniBuffBG1)
local wtMiniBuffBG2 = mainForm:CreateWidgetByDesc( wtCurrWindow:GetWidgetDesc() )
wtMiniBuffBG2:Show(true)
SetPos(wtMiniBuffBG2,45,40,0,40)
wtMini:AddChild(wtMiniBuffBG2)
local wtMiniBuffBG3 = mainForm:CreateWidgetByDesc( wtCurrWindow:GetWidgetDesc() )
wtMiniBuffBG3:Show(true)
SetPos(wtMiniBuffBG3,90,40,0,40)
wtMini:AddChild(wtMiniBuffBG3)
wtMiniBuffBG1:SetBackgroundColor( { r = 1.0; g = 1.0; b = 1.0; a = 1.0 } )
wtMiniBuffBG2:SetBackgroundColor( { r = 1.0; g = 1.0; b = 1.0; a = 1.0 } )
wtMiniBuffBG3:SetBackgroundColor( { r = 1.0; g = 1.0; b = 1.0; a = 1.0 } )
wtMiniBuffBG1:SetTransparentInput( true )
wtMiniBuffBG2:SetTransparentInput( true )
wtMiniBuffBG3:SetTransparentInput( true )
local desc = wtIcon:GetWidgetDesc()
local wtMiniBuff1 = mainForm:CreateWidgetByDesc( desc )
wtMini:AddChild( wtMiniBuff1 )
SetPos(wtMiniBuff1,0,40,0,40)
wtMiniBuff1:Show(true)
local desc = wtIcon:GetWidgetDesc()
local wtMiniBuff2 = mainForm:CreateWidgetByDesc( desc )
wtMini:AddChild( wtMiniBuff2 )
SetPos(wtMiniBuff2,45,40,0,40)
wtMiniBuff2:Show(true)
local desc = wtIcon:GetWidgetDesc()
local wtMiniBuff3 = mainForm:CreateWidgetByDesc( desc )
wtMini:AddChild( wtMiniBuff3 )
SetPos(wtMiniBuff3,90,40,0,40)
wtMiniBuff3:Show(true)
local desc = wtIcon:GetWidgetDesc()
wtMiniBuff1:SetPriority(50)
wtMiniBuff2:SetPriority(50)
wtMiniBuff3:SetPriority(50)
wtMiniBuff1:SetTransparentInput( true )
wtMiniBuff2:SetTransparentInput( true )
wtMiniBuff3:SetTransparentInput( true )
local desc = Text:GetWidgetDesc()
local wtMiniWeight = mainForm:CreateWidgetByDesc( desc )
wtMini:AddChild( wtMiniWeight )
wtMiniWeight:SetPriority( 50 )
SetPos(wtMiniWeight,50,200,47,30,nil,nil,WIDGET_ALIGN_BOTH)
SetPos(wtOn,5,32,40,32)
SetPos(wtOff,2,32,40,32)
wtOn:SetPriority(50)
wtOff:SetPriority(50)
local desc = wtMainWindow:GetWidgetDesc()
local wtDecsMini = mainForm:CreateWidgetByDesc( desc )
wtMini:AddChild( wtDecsMini )
wtDecsMini:Show(true)
wtDecsMini:SetBackgroundColor( { r = 1.0; g = 1.0; b = 1.0; a = 0.9 } )
SetPos(wtDecsMini,0,100,45,23)
local desc = wtCurrWindow:GetWidgetDesc()
local wtMiniTime = mainForm:CreateWidgetByDesc( desc )
wtMiniTime:Show(true)
SetPos(wtMiniTime,35,30,3,18)
wtDecsMini:AddChild(wtMiniTime)
local desc = Text:GetWidgetDesc()
local wtTextMini = mainForm:CreateWidgetByDesc( desc )
wtTextMini:Show(true)
SetPos(wtTextMini,2,30,3,18)
wtDecsMini:AddChild(wtTextMini)
-------------------------------------------------------------------------
local wtTextBuffInfo = mainForm:CreateWidgetByDesc(Header:GetWidgetDesc())
wtTextBuffInfo:SetBackgroundColor( { r = 0; g = 0; b = 0; a = 0 } )
SetPos(wtTextBuffInfo,nil,nil,5)
wtTextBuffInfo:SetVal("name", GTL('BT'))
wtTextBuffInfo:SetClassVal("class", "tip_white" )
wtVotePanel:AddChild(wtTextBuffInfo)

function math.round(num, ind)
local nur = 10^(ind or 0)
  return math.floor(num * nur + 0.9) / nur 
end

function BIType()
	local date = common.GetLocalDateTime()
	local timed = math.floor(date.overallMs/86400000/14)
	if timed%2 == 1 then
	return "long"
	elseif timed%2 == 0 then
	return "fast"
--	else LogInfo(timed%2)
	end
end 	

function GetSeasonStart()
	order.RequestOrderInfo()
	local orderdate = order.GetSeasonStartDate()
	if orderdate then
	local ms = common.GetMsFromDateTime(orderdate)
	local msend = ms+1209600000
	local today = common.GetLocalDateTime().overallMs
	local dayleft = tostring(math.round((msend-today)/86400000, 0))
	Date = userMods.ToWString(dayleft) -- дней до конца сезона
	if tonumber(dayleft) == 1 then 
	wtAlarm:Show(true)
	else wtAlarm:Show(false) 
		end
	end
end 

function RequestOrderInfo()
local bonus = order.GetVotedBonuses()
	if bonus then
	for _, v in pairs(bonus) do
	local bonuses = order.GetOrderBonusInfo(v)
	table.insert(buffs, bonuses.name)
	table.insert(images, bonuses.image)
	table.insert(description, bonuses.description)
	end
	wtText:SetVal("name", buffs[1] )
	wtText2:SetVal("name", buffs[2] )
	wtText3:SetVal("name", buffs[3] )
	wtBuffone:SetBackgroundTexture(images[1])
	wtBufftwo:SetBackgroundTexture(images[2])
	wtBuffthree:SetBackgroundTexture(images[3])
	wtDesc:SetVal("name", description[1] )
	wtDesc:SetClassVal("class", "GrayQuestName" )
	wtDesc2:SetVal("name", description[2] )
	wtDesc2:SetClassVal("class", "GrayQuestName" )
	wtDesc3:SetVal("name", description[3] )
	wtDesc3:SetClassVal("class", "GrayQuestName" )
	wtDateMS:SetVal("name", Date )	
	if tonumber(Date) == 1 then
	wtTextMini:SetClassVal("class", "tip_red" )
	wtDateMS:SetClassVal("class", "tip_red" )
	else	
	wtTextMini:SetClassVal("class", "tip_yellow" )
	wtDateMS:SetClassVal("class", "tip_yellow" )
	end
	wtTextMini:SetVal("name", Date )
	GetBuufs()
	wtMiniBuff1:SetBackgroundTexture(images[1])
	wtMiniBuff2:SetBackgroundTexture(images[2])
	wtMiniBuff3:SetBackgroundTexture(images[3])
	end
end
		
function Load()
local num = order.GetMainPlayerOrder()
if num then
	RequestOrderInfo()
	GetSeasonStart()
	local orderInfo = order.GetOrderInfo( num ) 
	Header:SetVal("name", orderInfo.name)
	if orderInfo.sysName == "OrderRed" then
	wtPanelIco:SetBackgroundColor( { r = 1.0; g = 0.1; b = 0.1; a = 1.0 } )
	elseif orderInfo.sysName == "OrderBlue" then
	wtPanelIco:SetBackgroundColor( { r = 0.2; g = 0.5; b = 1.0; a = 1.0 } )
	elseif orderInfo.sysName == "OrderGreen" then
	wtPanelIco:SetBackgroundColor( { r = 0.1; g = 1.0; b = 0.1; a = 1.0 } )
	end 
	wtOderIco:SetBackgroundTexture(orderInfo.image)
	end
end

function Reset()
buffs = nil buffs = {}
images = nil images = {}
description = nil description = {}
end

function GetVoteBuffs()
local a, b, c
order.RequestOrderInfo()
votedbuffs = nil votedbuffs = {}
local listvote = order.GetBonusVoitingList() 
if listvote then
table.sort(listvote, function(a,b ) return a.voteCount>b.voteCount end)
for k, v in pairs(listvote) do
if not v.disabled then
wtTextBuffInfo:Show(true)
local wtBuffname = mainForm:CreateWidgetByDesc(TextVote:GetWidgetDesc())
		wtBuffname:Show(true)
		wtVotePanel:AddChild(wtBuffname)
		SetPos(wtBuffname,32)
local wtBuffvote = mainForm:CreateWidgetByDesc(CountVote:GetWidgetDesc())
		wtBuffvote:Show(true)
		SetPos(wtBuffvote,nil,nil,nil,nil,40)
		wtVotePanel:AddChild(wtBuffvote)
local wtBufficon = mainForm:CreateWidgetByDesc(wtIcon:GetWidgetDesc())
		wtBufficon:Show(true)
		wtVotePanel:AddChild(wtBufficon)
		SetPos(wtBufficon,5,22,nil,22)
local wtCheckBox = mainForm:CreateWidgetByDesc(CheckBox:GetWidgetDesc())
		wtCheckBox:SetName(userMods.FromWString(v.name))
		wtCheckBox:Show(true)
		wtVotePanel:AddChild(wtCheckBox)
		SetPos(wtCheckBox,280)
local wtId = v.id
table.insert(votedbuffs, {wtBufficon=wtBufficon, wtBuffname=wtBuffname, wtBuffvote=wtBuffvote, wtCheckBox=wtCheckBox, wtId=wtId })
wtBuffname:SetVal("name", userMods.FromWString(v.name))
wtBuffvote:SetVal("name", tostring(v.voteCount))
wtBufficon:SetBackgroundTexture(v.image)
	updateBuffs()
			end
		end
	end
end

function clearVG()
	for k = #votedbuffs, 1, -1 do
			votedbuffs[k].wtBuffname:DestroyWidget()
			votedbuffs[k].wtBuffvote:DestroyWidget()
			votedbuffs[k].wtBufficon:DestroyWidget()
			votedbuffs[k].wtCheckBox:DestroyWidget()
			table.remove(votedbuffs, k)
			
		end
	updateBuffs()
end

function updateBuffs()
local a,b
	local pos = 1
	for k,v in pairs(votedbuffs) do
		local textpp = votedbuffs[k].wtBuffname:GetPlacementPlain()
		local votepp = votedbuffs[k].wtBuffvote:GetPlacementPlain()
		local voteico = votedbuffs[k].wtBufficon:GetPlacementPlain()
		local votecb = votedbuffs[k].wtCheckBox:GetPlacementPlain()
		textpp.posY = pos * 30
		votepp.posY = pos * 30
		voteico.posY = pos * 30
		votecb.posY = pos * 30
		votedbuffs[k].wtBuffname:SetPlacementPlain(textpp)
		votedbuffs[k].wtBuffvote:SetPlacementPlain(votepp)
		votedbuffs[k].wtBufficon:SetPlacementPlain(voteico)
		votedbuffs[k].wtCheckBox:SetPlacementPlain(votecb)
		pos = pos + 1
	end
	SetPos(wtVotePanel,nil,nil,nil,pos*30+40)
end

local count = 0

function ReactionCBox(pars)
if pars.sender == pars.widget:GetName() then
	if pars.widget:GetVariant()==0 then 
	pars.widget:SetVariant(1)
	count = count+1
else 
	pars.widget:SetVariant(0)
	count = count-1
		end
	end
end 

function CBcount()
for k,v in pairs(votedbuffs) do
	if count >= 3 and votedbuffs[k].wtCheckBox:GetVariant()==0 then
	votedbuffs[k].wtCheckBox:Enable( false )
	VoteButton:Show(true)
	elseif count <=3 and votedbuffs[k].wtCheckBox:GetVariant()==0 then
	votedbuffs[k].wtCheckBox:Enable( true )
	VoteButton:Show(false)
		end
	end
end

function EnableVote()
local CanVote = order.CanVote()
for k,v in pairs(votedbuffs) do
	if CanVote then
	votedbuffs[k].wtCheckBox:Enable( true )
	else
	votedbuffs[k].wtCheckBox:Enable( false)
		end
	end
end

function VoteSelectedBuffs()
local t = {}
for k,v in pairs(votedbuffs) do
		if votedbuffs[k].wtCheckBox:GetVariant()>0  then
		table.insert(t, votedbuffs[k].wtId)
			end
		end
	order.SendBonusVotes(t)
	wtVotePanel:Show(false)
	VoteButton:Show(false)
end

function ResetOnZero()
local dat = common.GetLocalDateTime()
local spam = order.GetMainPlayerOrder()
	if spam then 
	if math.fmod(dat.s, 10) == 0 then
	Reset()
	Load()
		end
	end
end

function CloseSettings()
if wtMainPanel:IsVisible() then	
	wtMainPanel:Show(false)
	end
end 

function CloseVoteList()
ShowVoteList()
end 

function ShowVoteList()
if wtVotePanel:IsVisible() then	
	wtVotePanel:Show(false)
	else 
	clearVG()
	wtVotePanel:Show(true)
	GetVoteBuffs()
	EnableVote()
	count = 0
	end
end 

function GetBuufs()
	local weight = order.GetMainPlayerVoteWeight()
	local CanVote = order.CanVote()
	if weight then
	wtWeight:SetVal("name", GTL('Weight')..tostring(weight)) 
	wtWeight:SetClassVal("class", "GrayQuestName" )
	wtMiniWeight:SetVal("name", tostring(weight)) 
	if CanVote then
	wtOn:Show(true)
	wtOff:Show(false)
	wtVote:SetClassVal("class", "tip_green" )
	wtVote:SetVal("name", GTL('VoteTrue') )
	elseif not CanVote then
	wtOn:Show(false)
	wtOff:Show(true)
	wtVote:SetClassVal("class", "GrayQuestName" )
	wtVote:SetVal("name", GTL('VoteFalse') )
		end
	end 
end 
 
function ShowMenu(params)  
local text = userMods.FromWString(params.text)
	if text == "/oi" then 
	if not wtMainPanel:IsVisible() then 
	wtMainPanel:Show(true)
	elseif wtMainPanel:IsVisible() then 
	wtMainPanel:Show(false)
		end 
	end
	if text == "/resetoi" then
	Reset() 
	RequestOrderInfo()
	end
	if text == "/buffsoi" then
	ShowVoteList()
	end
end 

function LeftMini()
if not wtMainPanel:IsVisible() then 
	wtMainPanel:Show(true)
elseif wtMainPanel:IsVisible() then 
	wtMainPanel:Show(false)
	end 
end
function RightMini()
ShowVoteList()
end

function RatingPrevSeason()
	achiev = nil achiev = {}
	local rs = order.GetRatingSections()
	if not rs then return end
	for i, v in pairs(rs) do
		local pat = order.GetPreviousAchievementTop(rs[i].raitingEventId)
		if pat then
			achiev[i] = pat.achievement
		end
	end
	if GetTableSize(achiev) > 0 then
		for i, v in pairs(achiev) do
			local achv = OrderHeader:GetChildUnchecked("achv"..i, false)
			if not achv then
				achv = mainForm:CreateWidgetByDesc(Text:GetWidgetDesc())
				achv:SetName(i.."achv")
				OrderHeader:AddChild(achv)
			end
			achv:SetFormat("<body alignx='center' aligny='middle' fontsize='16' shadow='1' color='0xFFFFE4B5'><r name='value'/></body>") 
			SetPos(achv,(i-1)*80+25,70,20,40,nil,nil,WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW)
			achv:SetVal( "value", ""..achiev[i] )
		end
	end
end

function ShowOrderTabs(params)
if params.widget:GetName()~="Tabs" then return end
local children = Tabs:GetNamedChildren()
for i = 0, GetTableSize( children ) - 1 do
local icon = children[i]:GetChildChecked("Icon", false)
SetPos(icon,-20)
	end
end
	
function Init()
	order.RequestOrderInfo()
	order.RequestRatingAchivements()
	common.RegisterEventHandler( RatingPrevSeason, "EVENT_ORDER_ACHIEVEMENTS_CHANGED" )
	common.RegisterEventHandler( ShowMenu, "EVENT_UNKNOWN_SLASH_COMMAND" )
	common.RegisterEventHandler( GetBuufs, "EVENT_ORDER_CAN_VOTE_CHANGED" )
	common.RegisterEventHandler( RequestOrderInfo, "EVENT_ORDER_INFO_CHANGED" )
--	common.RegisterEventHandler( GetSeasonStart, "EVENT_ORDER_INFO_CHANGED" ) 
	common.RegisterEventHandler( Load, "EVENT_ORDER_CHANGED" )
	common.RegisterEventHandler( RequestOrderInfo, "EVENT_ORDER_CHANGED" )
	common.RegisterEventHandler( ResetOnZero, "EVENT_SECOND_TIMER" )
	common.RegisterEventHandler( ShowOrderTabs, "EVENT_WIDGET_SHOW_CHANGED" )
	common.RegisterReactionHandler( CloseSettings, "mouse_left_click" )
	common.RegisterReactionHandler( CloseVoteList, "mouse_click" )
	common.RegisterReactionHandler( LeftMini, "LEFT_CLICK" )
	common.RegisterReactionHandler( RightMini, "RIGHT_CLICK" )
	common.RegisterReactionHandler( ShowVoteList, "ShowBuffsVote" )
	common.RegisterReactionHandler( ReactionCBox, "checkbox" )
	common.RegisterReactionHandler( CBcount, "checkbox" )
	common.RegisterReactionHandler( VoteSelectedBuffs, "ButtonVote" )
	Load() 
	DnD.Init(wtMainPanel,wtMainPanel,true)
	DnD.Init(wtVotePanel,wtVotePanel,true)
	DnD.Init(wtMini, wtMini, true, true, nil, KBF_SHIFT ) 
end 

if (avatar.IsExist()) then Init()
else common.RegisterEventHandler(Init, "EVENT_AVATAR_CREATED")	
end
--ver. 1.3