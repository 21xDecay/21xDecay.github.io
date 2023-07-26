local CurrentVersion = "Insurgent Hub - V11"
-- Local Varibales
local Areas = {}
Areas["Forest"] = {22833.2285, 44.1195908, 70.0717697}
Areas["Desert"] = {22828.7188, 43.8390083, 314.477264}
Areas["Sunflower Field"] = {22839.8184, 43.6312904, 553.034668}
Areas["Honeycomb"] = {22830.8164, 43.6312904, 788.35022}
Areas["Ice Land"] = {22837.2852, 43.5677223, 1028.98779}
Areas["Beach"] = {22836.7695, 43.2469063, 1269.18445}
Areas["Candy Land"] = {22837.5254, 42.6857643, 1503.35913}
Areas["The Mines"] = {22836.1621, 43.4218254, 1740.96533}
Areas["Lava Lands"] = {22831.0195, 41.8781471, 1960.96375}
Areas["Enchanted Forest"] = {22831.0195, 41.8781471, 2204.0083}
Areas["Toxic Lands"] = {22822.7012, 41.8781471, 2440.13574}
Areas["Jester Castle"] = {22828.3672, 41.8403015, 2642.56689}

local npcList = {
    ["Forest"] = {"Forest Wizard", "Mushroom King"},
    ["Desert"] = {"Desert Bandit", "Desert Scout"},
    ["Sunflower Field"] = {"Floral Girl", "Magic Floral Man"},
    ["Honeycomb"] = {"Bee King", "Onett"},
    ["Ice Land"] = {"Ice Skier", "Ice Golem"},
    ["Beach"] = {"Beach Boy", "Pufferfish King"},
    ["Candy Land"] = {"Sparkletime King", "Pastel Guardian"},
    ["The Mines"] = {"Mining Guy", "Elemental King"},
    ["Lava Lands"] = {"Lava Lord", "Headless Doombringer"},
    ["Enchanted Forest"] = {"Enchanted Golem", "Ud'zal"},
    ["Toxic Lands"] = {"Toxic Sparkletime King", "Toxic Wastelander"},
    ["Jester Castle"] = {"Neon Jester", "Prince"},
}

local Worlds = {"Forest", "Desert", "Sunflower Field", "Honeycomb", "Ice Land", "Beach", "Candy Land", "The Mines", "Lava Lands", "Enchanted Forest", "Toxic Lands", "Jester Castle"}

local Bosses = {"Forest Wizard", "Desert Scout", "Magic Floral Man", "Onett", "Ice Golem", "Pufferfish King", "Pastel Guardian", "Elemental King", "Headless Doombringer", "Ud'zal", "Toxic Wastelander", "Prince"}

local toolsID = {47, 43, 39, 35, 31, 27, 23, 19, 16, 8}
local tools = {
    "Radiant Smasher",
    "Radioactive Smasher",
    "Enchanted Hammer",
    "Molten Scythe",
    "Crystalized Scythe",
    "Peppermint Scythe",
    "Beach Scythe",
    "Atlantis Basher",
    "Stinger Scythe",
    "Taliscythe"
}

local Eggs = {"Starter", "Desert", "Honeycomb", "Candy", "Molten", "Jester"}

local EggsLocation = {}

local Codes = {"Release", "FreeCoins", "FreeGems", "Dungeons", "ReleaseComp", "FreeCurrency", "FreePet", "InterByte", "InterByte", "TimeTrials", "YTitsJohn", "SubToCrazyfoxplayz", "FreeLuck"}

-- Window
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = CurrentVersion,
    LoadingTitle = "",
    LoadingSubtitle = "by Insurgent Softwares",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = InsurgentConfig, 
        FileName = "Insurgent Config"
     },
     Discord = {
        Enabled = true,
        Invite = "https://discord.gg/32b5qdPSfK", 
        RememberJoins = true 
     },
     KeySystem = false, 
     KeySettings = {
        Title = "InsurgentHub",
        Subtitle = "Key System",
        Note = "Get Key here: t.ly/Xu7jh",
        FileName = "Key", 
        SaveKey = true, 
        GrabKeyFromSite = false, 
        Key = {"scripthubrelease", "LvQnrdNhos9yFNWKeogq1Nn07Uu6GS"} 
     }
})


local FarmsTab = Window:CreateTab("Farms", nil)
local FarmWarningLabel = FarmsTab:CreateLabel("Warning only works with npcs from unlocked worlds")

local Dropdown = FarmsTab:CreateDropdown({
    Name = "Select Boss",
    Options = Bosses,
    CurrentOption = {Bosses[1]},
    MultipleOptions = false,
    Flag = "Dropdown1", 
    Callback = function(Option)
    end,
})

local AutoFarmToggle = FarmsTab:CreateToggle({
    Name = "Toggle Auto Farm",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(Value)
        LoopEnabledAutoFarm = Value
        if LoopEnabledAutoFarm then
            while LoopEnabledAutoFarm do
                task.wait(.25)
                BasicAutoFarm(Value)
            end
        end
    end,
})

local RankUpToggle = FarmsTab:CreateToggle({
    Name = "Auto Buy Rankup",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        LoopEnabledRankUp = Value
        if LoopEnabledRankUp then
            while LoopEnabledRankUp do
                task.wait(3)
                RankUp()
            end
        end
    end
})

local ZoneBuy = FarmsTab:CreateToggle({
    Name = "Auto Buy Zones",
    CurrentValue = false, 
    Flag = "Toggle4",
    Callback = function(Value)
        LoopEnabledZoneBuy = Value
        if LoopEnabledZoneBuy then
            while LoopEnabledZoneBuy do
                task.wait(5)
                AutoBuyZones()
            end
        end
    end
})

local PrestigeToggle = FarmsTab:CreateToggle({
    Name = "Auto Prestige",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Value)
        LoopEnabledPrestige = Value
        if LoopEnabledPrestige then
            while LoopEnabledPrestige do
                task.wait(3)
                Prestige()
            end
        end
    end
})

local PrivateTab = Window:CreateTab("Private Server", nil)
local PrivateWarningLabel = PrivateTab:CreateLabel("Warning: Only use this in private servers or you will be banned")

local FpsButton = PrivateTab:CreateButton({
    Name = "Boost FPS",
    Callback = function()
        _G.Settings = {
            Players = {
                ["Ignore Me"] = true,
                ["Ignore Others"] = true
            },
            Meshes = {
                Destroy = false,
                LowDetail = true
            },
            Images = {
                Invisible = true,
                LowDetail = false,
                Destroy = false,
            },
            ["No Particles"] = true,
            ["No Camera Effects"] = true,
            ["No Explosions"] = true,
            ["No Clothes"] = true,
            ["Low Water Graphics"] = true,
            ["No Shadows"] = true,
            ["Low Rendering"] = true,
            ["Low Quality Parts"] = true
        }
        
        -- Execute the saved script
        local parentPath = workspace.decoration["Ban Land"]

local function deleteObjectsInPath(parent)
    for _, worldFile in ipairs(parent:GetChildren()) do
        if worldFile:IsA("Folder") then
            local objectsToDelete = {
                "rocks", "hills", "trees", "grass",
                "pier", "beach balls", "buckets", "umbrellas", "sand", "lollipops", "bushes", "candy bars", 
                "tumbleweed", "cacti", "bones", "lamps", "logs", "fences", "flowers", "waterfall", "waterfountain", 
                "mushrooms", "picnic setting", "path", "stones", "lights", "honey dippers", "honey spots", "honeycombs", 
                "ice spikes", "snow", "crystals", "center", "flowers", "pickaxes", "barrels", "tracks", 
                "tunnels", "tnt", "mining carts", "rock", "waterfalls", "islands", "pixies", "pipes", "poison", "walls", 
                "towers", "platform", "foilage", "water", "enchant", "swords", "hammers"
            }
            
            for _, objectName in ipairs(objectsToDelete) do
                local object = worldFile:FindFirstChild(objectName)
                if object then
                    object:Destroy()
                end
            end
        end
    end
end

deleteObjectsInPath(parentPath)

-- Delete Lighting object
local lighting = game:GetService("Lighting")
lighting:ClearAllChildren()
        
        -- Execute the FPS booster script
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InsurgenceHub/IncurgenceHub.github.io/main/InsurgentFpsBoost.lua"))()
    end
})

local WorldDropdown = PrivateTab:CreateDropdown({
    Name = "Select World",
    Options = Worlds,
    CurrentOption = {"Forest"},
    MultipleOptions = false, 
    Flag = "worlddropdown",
    Callback = function(Value)
    end
})

local BossToggle = PrivateTab:CreateToggle({
    Name = "Target Boss",
    CurrentValue = false,
    Flag = "Toggle22",
    Callback = function(Value)
    end
})

local ToolsTab = Window:CreateTab("Tools")

local BuyAllWeaponsButton = ToolsTab:CreateButton({
    Name = "Buy All Weapons",
    Callback = function()
        BuyAllWeapons()
    end
})

local BuyAllTalismenButton = ToolsTab:CreateButton({
    Name = "Buy All Talismen",
    Callback = function()
        BuyAllTalismen()
    end
})

local BuyBestWeaponToggle = ToolsTab:CreateToggle({
    Name = "Equip Best Weapon",
    CurrentValue = false,
    Flag = "BestWeaponToggle",
    Callback = function(Value)
        LoopEnabledEquipWeapon = Value
        if LoopEnabledEquipWeapon then
            -- Start the loop
            while LoopEnabledEquipWeapon do
                EquipBestWeapon()
            end
        end
    end,
})

local TrialsTab = Window:CreateTab("Time Trials", nil)

local WarningTrialsLabel = TrialsTab:CreateLabel("DONT MOVE ONCE THE AUTO KILL TRIALS TPD YOU")

local AutoKillToggle = TrialsTab:CreateToggle({
    Name = "Auto Kill In Trials",
    Callback = function(Value)
        _G.AutoKillloop = Value
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(22304, 135, 1323))
        while _G.AutoKillloop do
            AutoKillTrials()
            wait(1)
        end
    end
})

local PetsTab = Window:CreateTab("Eggs", nil)
local PetsSection = PetsTab:CreateSection("Auto Hatch")

local WarningLabel = PetsTab:CreateLabel("Warning need to be next to the egg")
local EggDropdown = PetsTab:CreateDropdown({
    Name = "Select Egg",
    Options = Eggs,
    CurrentOption = {"Starter"},
    MultipleOptions = false,
    Flag = "Dropdown2",
    Callback = function(Option)
    end,
})

local TripleToggle = PetsTab:CreateToggle({
    Name = "Triple Hatch (Needs Gamepass)",
    CurrentValue = false,
    Flag = "TripleToggle",
    Callback = function(Value)
    end
})

local VoidToggle = PetsTab:CreateToggle({
    Name = "Toggle Void",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
    end,
})

local HatchingToggle = PetsTab:CreateToggle({
    Name = "Toggle Hatching",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Value)
        local Amount = 1
        if TripleToggle.CurrentValue then
            Amount = 3
        end
        LoopEnabledHatching = Value
        if LoopEnabledHatching then
            -- Start the loop
            while LoopEnabledHatching do
                task.wait(.5)
                HatchEgg(Amount, EggDropdown.CurrentOption[1], VoidToggle.CurrentValue)
            end
        end
    end,
})

local FasterAutoFarmToggle = PrivateTab:CreateToggle({
    Name = "Toggle Auto Farm",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(Areas[WorldDropdown.CurrentOption[1]][1],Areas[WorldDropdown.CurrentOption[1]][2],Areas[WorldDropdown.CurrentOption[1]][3]))
        wait(1)
        local Counter = 0
        local BossT = 1
        if BossToggle.CurrentValue == true then
            BossT = 2
        end
        LoopEnabledFasterAutoFarm = Value
        if LoopEnabledFasterAutoFarm then
            while LoopEnabledFasterAutoFarm do
                if HatchingToggle.CurrentValue then
                    if require(game:GetService("Players").LocalPlayer.PlayerScripts.bsx_client.modules.eggs.isHatching).getIsHatching() == false then
                        if VoidToggle.CurrentValue then
                            TpToEgg(EggDropdown.CurrentOption, "void")
                        else
                            TpToEgg(EggDropdown.CurrentOption, "regular")
                        end
                        task.wait(.2)
                    end
                end
                FastAutoFarm(BossT, WorldDropdown.CurrentOption[1], "Nothing")
                task.wait(.1)
                Counter = Counter + 1
                if Counter == 2000 then
                    ResetFastAutoFarm()
                    local Counter = 0
                end
            end
        end
    end
})

local PlayerTab = Window:CreateTab("Player", nil)

local TeleportDropdown = PlayerTab:CreateDropdown({
    Name = "Teleport World: Ban Land",
    Options = Worlds,
    CurrentOption = {" "},
    MultipleOptions = false,
    Flag = "Dropdown4",
    Callback = function(Option)
        TpToZone(Option)
    end
})

local CodesButton = PlayerTab:CreateButton({
    Name = "Redeem all codes",
    Callback = function()
        for i, code in ipairs(Codes) do
            local args = {
                [1] = "9BA36207-9043-4F46-97E9-4CD53B24E0AE",
                [2] = {
                    [1] = code
                }
            }

            game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("media/redeemCode"):FireServer(unpack(args))
        end
    end
})

local WalkSpeedSlider = PlayerTab:CreateSlider({
    Name = "Walkspeed",
    Range = {0, 500},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Slider1",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

-- Functions
function BasicAutoFarm(Value)
    for _,v in pairs(game.Workspace.npcs:GetChildren()) do
        if string.find(v.Name, Dropdown.CurrentOption[1]) then 
            pcall(function()
                v:FindFirstChild("HumanoidRootPart").Anchored = false
                v:FindFirstChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(1,1,-2)
            end)
        end
    end

   function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end

    local args = {
        [1] = getNil("Headless Doombringer", "Model")
    }

    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("damageNPC"):FireServer(unpack(args))

    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("damageNPC"):FireServer(unpack(args))
    local args = {
        [1] = workspace:WaitForChild("npcs"):WaitForChild(Dropdown.CurrentOption[1]),
        [2] = false
    }
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("damageNPC"):FireServer(unpack(args))
end

function AutoBuyZones()
    for i, world in ipairs(Worlds) do
        task.wait(1)
        local args = {
            [1] = "B6FA05B1-DE75-45BF-A291-622BBB939474",
            [2] = {
                [1] = "Ban Land",
                [2] = world
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("purchaseZone"):FireServer(unpack(args))
    end
end

function Prestige ()
    local args = {
        [1] = "Ban Land"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("worldPrestige/claimPrestige"):FireServer(unpack(args))    
end

function RankUp ()
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("unlockRank"):FireServer()
end

function FastAutoFarm(BossT, currentoption, CurrentZone)
    for _, v in pairs(game.Workspace.npcs:GetChildren()) do
        if v.Name == npcList[currentoption][BossT] then
            print("attacked")
            game.Players.LocalPlayer.Character:MoveTo(v.HumanoidRootPart.Position)
            task.wait(0.1)
            local args = {
                [1] = v,
                [2] = false
            }
            game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("damageNPC"):FireServer(unpack(args))
        end
    end
end

function ResetFastAutoFarm()
    FasterAutoFarmToggle.CurrentValue = false
    task.wait(10)
    FasterAutoFarmToggle.CurrentValue = true
end

function AutoKillTrials()
    local CheckTrials = game:GetService("Workspace").trials:GetChildren()
    if type(next(CheckTrials)) ~= "nil" then
        local Npcs = game:GetService("Workspace").trials.map.npcs:GetChildren()
        for i, v in Npcs do
            local NpcPos = v.HumanoidRootPart.Position
            --game.Players.LocalPlayer.Character:MoveTo(NpcPos)
            NpcsPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

            wait(0.1)
            local args = {
            [1] = v,
            [2] = true
            }
            game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("damageNPC"):FireServer(unpack(args))
        end
        wait(1)
    end
end

function BuyAllWeapons()
    local Num = 0
    while Num ~= 47 do
    local args = {
        [1] = Num+1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("weapons/purchaseWeapon"):FireServer(unpack(args))
        Num = Num + 1
    end
end

function BuyAllTalismen()
    local num = 0
    while num ~= 8 do
        local args = {
            [1] = num+1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("talismans/purchaseTalisman"):FireServer(unpack(args))
        num = num + 1
    end
end

function EquipBestWeapon()
    for i, v in ipairs(tools) do
        local args = {[1] = toolsID[i]}
        game:GetService("ReplicatedStorage")
            :WaitForChild("rbxts_include"):WaitForChild("node_modules")
            :WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out")
            :WaitForChild("_NetManaged"):WaitForChild("weapons/changeWeapon"):FireServer(unpack(args))

        task.wait(.5)

        local player = game.Players.LocalPlayer
        local character = player.Character
        local tools = character:GetChildren()

        local equippedTool = nil
        for i1, v1 in ipairs(tools) do
            if v1:IsA("Tool") then
                equippedTool = v1.Name
                break
            end
        end

        if equippedTool == v then
            break
        end
        task.wait(.1)
    end
    task.wait(1)
end    

function EquipBestTalisman()
    -- Working on it
end

function GetRank()
    -- Working on it
end

function HatchEgg(Amount, Egg, Void)
    local args = {
        [1] = "80BCDD63-4F04-46F6-8FB2-38A6E9BE21D7",
        [2] = {
            [1] = Amount,
            [2] = Egg,
            [3] = Void
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("eggs/hatchEgg"):FireServer(unpack(args))
end

function TpToEgg(Egg, Void)
    game.Players.LocalPlayer.Character:MoveTo(EggsLocation[Egg[1]][Void])
    local triple = 1
    if TripleToggle.CurrentValue then
        triple = 3
    end
    if Void == "void" then
        Void = true
    else
        Void = false
    end
    HatchEgg(triple, Egg, Void)
end

function TpToZone(Option)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Areas[Option[1]][1], Areas[Option[1]][2], Areas[Option[1]][3], Areas[Option[1]][4], Areas[Option[1]][5], Areas[Option[1]][6], Areas[Option[1]][7], Areas[Option[1]][8], Areas[Option[1]][9], Areas[Option[1]][10], Areas[Option[1]][11], Areas[Option[1]][12])
end

-- Credits
local CreditsTab = Window:CreateTab("Credits", nil)

local Person1 = CreditsTab:CreateLabel("Developer: Bat | TrilogScripts on YouTube")
local Person2 = CreditsTab:CreateLabel("Developer: Chris")
local discordlabel = CreditsTab:CreateLabel("Join: https://discord.gg/32b5qdPSfK || t.ly/Xu7jh")

local UpdateLogTab = Window:CreateTab("Update Log")

local Version11_0 = UpdateLogTab:CreateLabel("-- V11 --")
local Version11_1 = UpdateLogTab:CreateLabel(" - Removed Auto Tp To Next World")
local Version11_2 = UpdateLogTab:CreateLabel(" + Added Trials AutoKill")

local Version10_0 = UpdateLogTab:CreateLabel("-- V10 --")
local Version10_1 = UpdateLogTab:CreateLabel(" + Added The Ability To Hatch And AutoFarm (Only Works With Private Server Tab Farm)")

local Version9_0 = UpdateLogTab:CreateLabel("-- V9 --")
local Version9_1 = UpdateLogTab:CreateLabel(" + Added Auto Tp To Next Area")
local Version9_2 = UpdateLogTab:CreateLabel(" + Added FPS booster in private tab")
local Version9_3 = UpdateLogTab:CreateLabel(" + Moved teleport to player tab")

local Version8_0 = UpdateLogTab:CreateLabel("-- V8 --")
local Version8_1 = UpdateLogTab:CreateLabel(" + Added Tools Tab")
local Version8_2 = UpdateLogTab:CreateLabel(" + Added Equip Best Weapon")
local Version8_3 = UpdateLogTab:CreateLabel(" > Made Op AutoFarm Even Better")

local Version7_0 = UpdateLogTab:CreateLabel("-- V7 --")
local Version7_1 = UpdateLogTab:CreateLabel(" + Added New Op AutoFarm")
local Version7_2 = UpdateLogTab:CreateLabel(" < Fixed Somethings In Old AutoFarm")

local Version6_0 = UpdateLogTab:CreateLabel("-- V6 --")
local Version6_1 = UpdateLogTab:CreateLabel(" < Fixed AutoFarm")
local Version6_2 = UpdateLogTab:CreateLabel(" > Updated Autohatch With New Event Egg")
