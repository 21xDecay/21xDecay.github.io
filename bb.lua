local CurrentVersion = "Insurgent Hub | Bid Battles V1"

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = CurrentVersion,
    LoadingTitle = "",
    LoadingSubtitle = "by Insurgent Softwares",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "InsurgentConfig",
        FileName = "InsurgentConfig"
    },
    Discord = {
        Enabled = true,
        Invite = "32b5qdPSfK",
        RememberJoins = true
    },
})

local delete = game:GetService("ReplicatedStorage"):WaitForChild("Events"):GetChildren()
for i, v in delete do
    if v == "RemoteEvent" then
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvent"):Destroy()
    end
end

local ValueTab = Window:CreateTab("Auction Values", nil)

local Value1 = ValueTab:CreateLabel("Storage 1 >")
local Value2 = ValueTab:CreateLabel("Storage 2 >")
local Value3 = ValueTab:CreateLabel("Storage 3 >")

local Warning1 = ValueTab:CreateLabel("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
local Warning2 = ValueTab:CreateLabel("This Is the value of SHOWN items.")
local Warning3 = ValueTab:CreateLabel("Anything in a box is not added to the total")

local LabelTable = {
    ["1"] = Value1,
    ["2"] = Value2,
    ["3"] = Value3}

    local ValueToggle = ValueTab:CreateToggle({
        Name = "Get Values",
        Callback = function(Value)
            _G.loop1 = Value
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
            Value1:Set("Storage 1 >")
            Value2:Set("Storage 2 >")
            Value3:Set("Storage 3 >")
            end
        end
    })

    local FarmTab = Window:CreateTab("Auto Farm", nil)
    local FarmLabel = FarmTab:CreateLabel("Automatically farms the store auction and sells all items +500 profit in one auction max")
    
    local function AutoFarmScript()
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
                        wait(1) -- Add a short delay between bids
                    end
                    _G.offering = false
                end
                
                wait(1) -- A short delay before selling items
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Auctions"):WaitForChild("SellAllItems"):InvokeServer("Default", {})
                
                -- Destroy certain GUI elements after selling all items
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
                
                wait(1) -- Add a short delay before starting the loop again
            end
        end
    end
    
    local Toggle = FarmTab:CreateToggle({
        Name = "Auto Farm",
        CurrentValue = false,
        Flag = "Toggle1",
        Callback = function(Value)
            _G.Main = Value
            if Value then
                coroutine.wrap(AutoFarmScript)() -- Use coroutine.wrap to create a new thread for AutoFarmScript
            else
                _G.offering = false -- Turn off bidding when the toggle is turned off
            end
        end,
    })
    
    
    
local QuestTab = Window:CreateTab("Quest", nil)

local QuestNextLabel = QuestTab:CreateLabel("Next Quest >")
local QuestTypeLabel = QuestTab:CreateLabel("Quest >")
local QuestDoneLabel = QuestTab:CreateLabel("Done >")
local QuestTotalLabel = QuestTab:CreateLabel("Total >")
local QuestGemsLabel = QuestTab:CreateLabel("Gems >")

local AutoQuestToggle = QuestTab:CreateToggle({
    Name = "Auto Claim Quest",
    Callback = function(Value)
        _G.AutoQuest = true
        while _G.AutoQuest do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Quests"):WaitForChild("CheckComplete"):InvokeServer()
            local a = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Quests"):WaitForChild("GetQuest"):InvokeServer()
            if a["TimeLeft"] == nil then
                QuestNextLabel:Set("Next Quest > Do your current Quest first")
                QuestTypeLabel:Set("Quest > "..a["Type"])
                QuestDoneLabel:Set("Done > "..a["Total"])
                QuestTotalLabel:Set("Total > "..a["Goal"])
                QuestGemsLabel:Set("Gems > "..a["GemsPerGoal"]*a["Goal"])
            else
                local time = math.ceil(a["TimeLeft"]/60)
                QuestNextLabel:Set("Next Quest in "..time.." minutes")
                QuestTypeLabel:Set("Quest > ")
                QuestDoneLabel:Set("Done > ")
                QuestTotalLabel:Set("Total > ")
                QuestGemsLabel:Set("Gems > ")
            end
            task.wait(1)
        end
    end
})

local PlayerTab = Window:CreateTab("Misc", nil)

local GamePassButton = PlayerTab:CreateButton({
    Name = "Free Tp",
    Callback = function()
        game:GetService("Players").LocalPlayer.Gamepasses.Teleport.Value = true
    end
})
