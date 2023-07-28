local CurrentVersion = "Insurgent Hub | Bid Battles (Premium)"

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/InsurgenceHub/IncurgenceHub.github.io/main/MurcuryUi.lua"))()

local GUI = Mercury:Create{
    Name = CurrentVersion,
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/InsurgentHub/Best-Scripts"
}

-- Credits
GUI:Credit{
	Name = "Bat | TrilogScripts on YouTube",
	Description = "Developer",
	Discord = "21xdecay"
}

GUI:Credit{
	Name = "Chris",
	Description = "Developer",
	Discord = "chrissypants77"
}

-- Delete the error log Remote
local delete = game:GetService("ReplicatedStorage"):WaitForChild("Events"):GetChildren()
for i, v in delete do
    if v == "RemoteEvent" then
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvent"):Destroy()
    end
end

-- Value Tab
local ValueTab = GUI:Tab{
	Name = "Auction Values",
	Icon = "rbxassetid://6034996695"
}

-- Value Labels
ValueTab:Label{
    Text = "This is the value of ONLY SHOWN items.",
    Description = "Anything in a box is not added to the total",
}

local Value1 = ValueTab:Label{
    Text = "Storage 1:",
    Description = "",
}

local Value2 = ValueTab:Label{
    Text = "Storage 2:",
    Description = "",
}

local Value3 = ValueTab:Label{
    Text = "Storage 3:",
    Description = "",
}

-- Set Text to value feature
local LabelTable = {
    ["1"] = Value1,
    ["2"] = Value2,
    ["3"] = Value3}

    ValueTab:Toggle{
        Name = "Get Values",
        StartingState = false,
        Description = nil,
        Callback = function(state) 
            _G.loop1 = state
            while _G.loop1 do
                local v1 = require(game.ReplicatedStorage.Modules.Items)
                local auctions = game:GetService("Workspace").Debris.Auctions:GetChildren()
                for i, v in auctions do
                    local test = game:GetService("Workspace").Debris.Auctions:WaitForChild(tostring(v)):WaitForChild("Items"):GetChildren()
                    price = 0
                    for i, v in test do
                        if v1[tostring(v.Name)] ~= nil then
                        price = price + v1[tostring(v.Name)].Price
                        end
                    end
                LabelTable[tostring(i)]:Set("Storage "..tostring(i).." > "..tostring(price))
                end
            task.wait(1)
            Value1:SetText("Storage 1 >")
            Value2:SetText("Storage 2 >")
            Value3:SetText("Storage 3 >")
            end
        end
    }

-- Auto Farm Tab
local FarmTab = GUI:Tab{
	Name = "Auto Farm",
	Icon = "rbxassetid://6034996695"
}

-- Auto Farm Info Label
FarmTab:Label{
    Text = "Automatically farms the store auction (cant lose store)",
    Description = "sells all items +500 profit in one auction max",
}

-- Auto Farm Function
function AutoFarmScript()
    while _G.Main do
        local a = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Auctions"):WaitForChild("EnterQueue"):InvokeServer("3")
        if a then
            wait(7)
            _G.offering = true
            while _G.offering do
                local offer = 0
                while offer < 1800 do
                    offer = offer + 50
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Auctions"):WaitForChild("PlaceBid"):InvokeServer(offer)
                    wait(1)
                end
                _G.offering = false
            end
            
            wait(1)
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Auctions"):WaitForChild("SellAllItems"):InvokeServer("Default", {})
            local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
            if playerGui then
                local itemsWonGui = playerGui:FindFirstChild("ItemsWon")
                if itemsWonGui then
                    itemsWonGui:Destroy()
                end
                local coverGui = playerGui:FindFirstChild("CoverGUI")
                if coverGui then
                    coverGui:Destroy()
                end
                local circleGui = playerGui:FindFirstChild("Circle")
                if circleGui then
                    circleGui:Destroy()
                end
            end 
            wait(1)
        end
    end
end

-- Auto Farm Toggle
FarmTab:Toggle{
    Name = "Auto Farm",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.Main = state
        if state then
            coroutine.wrap(AutoFarmScript)()
        else
            _G.offering = false
        end
    end,
}

-- Quest Tab
local QuestTab = GUI:Tab{
	Name = "Quests",
	Icon = "rbxassetid://6034996695"
}

-- Quest Info Labels
local QuestNextLabel = QuestTab:Label{
    Text = "Next Quest:",
    Description = "",
}

local QuestTypeLabel = QuestTab:Label{
    Text = "Current Quest: ",
    Description = "",
}

local QuestDoneLabel = QuestTab:Label{
    Text = "Progress: ",
    Description = "",
}

local QuestTotalLabel = QuestTab:Label{
    Text = "Total: ",
    Description = "",
}

local QuestGemsLabel = QuestTab:Label{
    Text = "Reward (Gems): ",
    Description = "",
}

-- Auto Quests Toggle
QuestTab:Toggle{
    Name = "Auto Quests",
    StartingState = false,
    Description = nil,
    Callback = function(state)
        _G.AutoQuest = true
        while _G.AutoQuest do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Quests"):WaitForChild("CheckComplete"):InvokeServer()
            local a = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Quests"):WaitForChild("GetQuest"):InvokeServer()
            if a["TimeLeft"] == nil then
                QuestNextLabel:SetText("Next Quest: Do your current Quest first")
                QuestTypeLabel:SetText("Current Quest: "..a["Type"])
                QuestDoneLabel:SetText("Progress: "..a["Total"])
                QuestTotalLabel:SetText("Total: "..a["Goal"])
                QuestGemsLabel:SetText("Reward (Gems): "..a["GemsPerGoal"]*a["Goal"])
            else
                local time = math.ceil(a["TimeLeft"]/60)
                QuestNextLabel:SetText("Next Quest in: "..time.." minutes")
                QuestTypeLabel:SetText("Current Quest: ")
                QuestDoneLabel:SetText("Progress: ")
                QuestTotalLabel:SetText("Total: ")
                QuestGemsLabel:SetText("Reward (Gems): ")
            end
            task.wait(1)
        end
    end
}

-- Player Tab
local PlayerTab = GUI:Tab{
	Name = "Player",
	Icon = "rbxassetid://6034996695"
}

-- Free Gamepass Button
PlayerTab:Button{
	Name = "Free Teleport Gamepass",
	Description = nil,
	Callback = function() 
        game:GetService("Players").LocalPlayer.Gamepasses.Teleport.Value = true
    end
}
