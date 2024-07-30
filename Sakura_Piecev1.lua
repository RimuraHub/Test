redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : Sakura Piece",
  SubTitle = "",
  SaveFolder = ""
})

local Tab1 = Window:MakeTab({"Auto Farm", "swords"})
local Tab2 = Window:MakeTab({"Teleport", "Locate"})
local Tab3 = Window:MakeTab({"Misc", "swords"})
local Tab4 = Window:MakeTab({"MAP", "swords"})
local Tab5 = Window:MakeTab({"Farm Item", "swords"})
local Tab6 = Window:MakeTab({"Discord", "Info"})

redzlib:SetTheme("Dark")


local Section = Tab1:AddSection({"Select Weapon"})

local Weaponlist = {}
local Weapon = nil

    for _,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        table.insert(Weaponlist,v.Name)
    end


local Weaponlist = Tab1:AddDropdown({
  Name = "Select Weapon",
  Description = "",
  Options = Weaponlist,
  Default = nil,
  Flag = "dropdown teste",
  Callback = function(B)
     Weapon = B
  end
})


local Toggle1 = Tab1:AddToggle({
  Name = "Auto Equip",
  Description = "",
  Default = false,
  Callback = function(GG)
    AutoEquiped = GG
  end
})


spawn(function()
  while wait() do
    if AutoEquiped then
      pcall(function()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Weapon))
      end)
    end
  end
end)



local Section = Tab1:AddSection({"Auto FarmMon"})



local Mob = {}

for i, v in pairs(game:GetService("Workspace").Mon:GetChildren()) do
    table.insert(Mob,v.Name)
end

local Dropdown = Tab1:AddDropdown({
    Name = "Select Mob",
    Description = "",
    Options = Mob,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(Value)
        MobFarm = Value
    end
})

local boss = {
     "Gojo Boss",
     "Ax Hand",
     "Lord Dark",
     "Yuta Boss",
     "Chopper",
     "Becky",
     "Yeti",
     "Marine Captain"
}

local Dropdown = Tab1:AddDropdown({
    Name = "Select boss",
    Description = "",
    Options = boss,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(Value)
        bossFarm = Value
    end
})

local Toggle1 = Tab1:AddToggle({
  Name = "Mon Farm",
  Description = "",
  Default = false,
  Callback = function(Hee)
  _G.a = Hee
  end
})

function A()
  game:GetService'VirtualUser':CaptureController()
game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

spawn(function()
    while wait() do
        pcall(function()
            if _G.a then
                for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v.Name == MobFarm and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health >= 1 then
                        repeat
                           A()
                            wait()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                        until _G.a == false or v.Humanoid.Health <= 0
                    end
                end
            end
        end)
    end
end)

local Toggle1 = Tab1:AddToggle({
  Name = "Boss Farm",
  Description = "",
  Default = false,
  Callback = function(Hee)
  _G.a = Hee
  end
})

function A()
  game:GetService'VirtualUser':CaptureController()
game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

spawn(function()
    while wait() do
        pcall(function()
            if _G.a then
                for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v.Name == bossFarm and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health >= 1 then
                        repeat
                           A()
                            wait()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                        until _G.a == false or v.Humanoid.Health <= 0
                    end
                end
            end
        end)
    end
end)


local Section = Tab2:AddSection({
	Name = "TeleportPlayer"
})

local plrs = game.Players

-- Fetch all player names
local playerNames = {}
local players = plrs:GetPlayers()

for _, player in ipairs(players) do
    table.insert(playerNames, player.Name)
end

local Dropdown = Tab2:AddDropdown({
    Name = "Players",
    Default = playerNames[1] or "No Players",
    Options = playerNames,
    Callback = function(selectedplrName)
    plrs = selectedplrName
    end
})

Tab2:AddButton({"Click to teleport", function()
         for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v.Name == plrs then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
            end
        end
    end
})


local Section = Tab2:AddSection({"Teleport"})


Tab2:AddButton({"Starter_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1165.9600830078125, 148.92855834960938, 290.9679260253906)
end})

Tab2:AddButton({"Desert_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(486.03900146484375, 125.90441131591797, -1499.7667236328125)
end})

Tab2:AddButton({"Marine_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2526.18115234375, 143.542724609375, 970.0589599609375)
end})

Tab2:AddButton({"Buggy_Islan", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2221.047607421875, 154.97042846679688, -510.9023132324219)
end})

Tab2:AddButton({"Snow_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-949.1493530273438, 126.75444030761719, -1080.3372802734375)
end})

Tab2:AddButton({"Gojo_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(301.1205139160156, 110.69679260253906, 97.93156433105469)
end})

Tab2:AddButton({"Event_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1276.4683837890625, 203.23435974121094, 1663.792724609375)
end})

local Section = Tab2:AddSection({"TeleportNPC"})

local NPCS = {}

for i, v in pairs(game:GetService("Workspace").NPC.Seller.Accessory:GetChildren()) do
    table.insert(NPCS, v.Name)
end

local Dropdown = Tab2:AddDropdown({
    Name = "Accessory",
    Description = "",
    Options = NPCS,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(WoW)
 NPCNA = WoW
end
})

Tab2:AddButton({"Click to teleport", function()
        for i, v in pairs(game:GetService("Workspace").NPC.Seller.Accessory:GetChildren()) do
            if v.Name == NPCNA then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
            end
        end
    end
})

local NPCS = {}

for i, v in pairs(game:GetService("Workspace").NPC.Seller.Sword:GetChildren()) do
    table.insert(NPCS, v.Name)
end

local Dropdown = Tab2:AddDropdown({
    Name = "Sword",
    Description = "",
    Options = NPCS,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(WoW)
 NPCNA = WoW
end
})

Tab2:AddButton({"Click to teleport", function()
        for i, v in pairs(game:GetService("Workspace").NPC.Seller.Sword:GetChildren()) do
            if v.Name == NPCNA then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
            end
        end
    end
})

local NPCS = {}

for i, v in pairs(game:GetService("Workspace").NPC.Seller.Melee:GetChildren()) do
    table.insert(NPCS, v.Name)
end

local Dropdown = Tab2:AddDropdown({
    Name = "Melee",
    Description = "",
    Options = NPCS,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(WoW)
 NPCNA = WoW
end
})

Tab2:AddButton({"Click to teleport", function()
        for i, v in pairs(game:GetService("Workspace").NPC.Seller.Melee:GetChildren()) do
            if v.Name == NPCNA then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
            end
        end
    end
})

local NPCS = {}

for i, v in pairs(game:GetService("Workspace").NPC.Seller.Crafting:GetChildren()) do
    table.insert(NPCS, v.Name)
end

local Dropdown = Tab2:AddDropdown({
    Name = "Crafting",
    Description = "",
    Options = NPCS,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(WoW)
 NPCNA = WoW
end
})

Tab2:AddButton({"Click to teleport", function()
        for i, v in pairs(game:GetService("Workspace").NPC.Seller.Crafting:GetChildren()) do
            if v.Name == NPCNA then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
            end
        end
    end
})

local Section= Tab3:AddSection({"color ui"})

Tab3:AddButton({"Dark Theme", function()
  redzlib:SetTheme("Dark")
end})

Tab3:AddButton({"Darker Theme", function()
  redzlib:SetTheme("Darker")
end})

Tab3:AddButton({"Dark Purple", function()
  redzlib:SetTheme("Purple")
end})


local Section = Tab3:AddSection({"Tool"})

Tab3:AddButton({"CopyCframe", function()
setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))
end})

local Section = Tab3:AddSection({"shade'[NoLag]"})

Tab3:AddButton({"shade", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Test/main/shade.lua?token=GHSAT0AAAAAACUVPPYXF56VA3NDXQ2VL2YEZUOIQOA"))()
end})

Tab3:AddButton({"shade gui", function()
getgenv().RTX_Name = "rtxnamehere" 
loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))()
end})

local Section= Tab3:AddSection({"script"})

Tab3:AddButton({"fpsboot", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Test/main/Fpsboot.lua", true))()
end})

Tab3:AddButton({"infiniteyield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
end})

Tab3:AddButton({"SimpleSpy", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
end})

Tab3:AddButton({"Fly", function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end})


local KillAllSection = Tab3:AddSection({"Kill AuraMon"})

local Toggle3 = Tab3:AddToggle({
  Name = "Kill AuraMon[Lag]",
  Description = "",
  Default = false,
  Callback = function(KillAll)
    getgenv().G = KillAll
    spawn(function()
      while getgenv().G do
        wait(1)
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 112412400000)
        sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 112412400000)
        for _, d in pairs(game:GetService("Workspace"):GetDescendants()) do
          if d.ClassName == 'Humanoid' and d.Parent.Name ~= game.Players.LocalPlayer.Name then
            d.Health = 0
          end
        end
      end
    end)
  end
})


Tab4:AddButton({"aoto keep[Can't close]", function(mua)
_G.aa = mua
while _G.aa do
          wait()
local args = {
    [1] = "Item",
    [2] = "Keep"
}

game:GetService("ReplicatedStorage").RemoteEvent.InventoryEvent:FireServer(unpack(args))
end
end})


local Toggle1 = Tab4:AddToggle({
  Name = "Auto click toji Dagger",
  Description = "",
  Default = false,
  Callback = function(hhv)
  _G.gg = hhv
while _G.gg do
    wait()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:FindFirstChild("ProximityPrompt") then
            fireproximityprompt(v.ProximityPrompt, 0)
        end
    end
end
  end
})

local Section = Tab4:AddSection({"Gam"})

Tab4:AddButton({"MiningNoClowdown", function()
for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
v.HoldDuration = 0
end
end
end
})

Tab4:AddButton({"Mining_Cave", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1232.8355712890625, 2275.260009765625, -5210.01318359375)
end})

local Toggle1 = Tab4:AddToggle({
  Name = "Auto Mining",
  Description = "",
  Default = false,
  Callback = function(hh)
  _G.gg = hh
while _G.gg do
    wait()
    for i, v in pairs(game:GetService("Workspace")["Mining Gem"]:GetDescendants()) do
        if v:FindFirstChild("ProximityPrompt") then
            fireproximityprompt(v.ProximityPrompt, 0)
        end
    end
end
  end
})

local Section = Tab4:AddSection({"Skill"})

Tab4:AddButton({"Skill No cooldown", function()
v = hookfunction(wait, function(seconds)
return v()
end)
end})

local Section = Tab4:AddSection({"Auto Spam"})

local Section = Tab4:AddSection({"Z"})

local Toggle1 = Tab4:AddToggle({
  Name = "sand fruit",
  Description = "",
  Default = false,
  Callback = function(hhv)
  _G.gg = hhv
while _G.gg do
    wait(0.5)
game:GetService("Players").LocalPlayer.Character.Sand.SkillZ.RemoteEvent:FireServer()
end
  end
})

local Section = Tab4:AddSection({"X"})

local Section = Tab4:AddSection({"C"})

local Toggle1 = Tab4:AddToggle({
  Name = "Cursed Sword[Bug]",
  Description = "",
  Default = false,
  Callback = function(hhv)
  _G.gg = hhv
while _G.gg do
    wait(0.5)
game:GetService("Players").LocalPlayer.Character.CursedSword.SkillC.RemoteEvent:FireServer()
end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "Auto Skill",
  Description = "",
  Default = false,
  Callback = function(hhv)
  _G.gg = hhv
while _G.gg do
    wait(0.5)
game:GetService("Players").LocalPlayer.Character.Sand.SkillZ.RemoteEvent:FireServer()
end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "blue orb[Can't close]",
  Description = "",
  Default = false,
  Callback = function(h3hv)
  _G.gg = h3hv
while _G.gg do
    wait(2)
while wait(1) do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2113.53564453125, 91.59420013427734, -512.038330078125)
end
end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "Red orb[Can't close]",
  Description = "",
  Default = false,
  Callback = function(hh1v)
  _G.gg = hh1v
while _G.gg do
    wait(1)
while wait(2) do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2288.029052734375, 91.59147644042969, -510.5782775878906)
end
end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "iron[Can't close]",
  Description = "",
  Default = false,
  Callback = function(hhv1)
  _G.gg = hhv1
while _G.gg do
    wait(1)
while wait(1) do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(426.9952087402344, 90.93980407714844, -1359.24560546875)
end
end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "Dark orb[Can't close]",
  Description = "",
  Default = false,
  Callback = function(hhv2)
  _G.gg = hhv2
while _G.gg do
    wait(1)
while wait(2) do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(587.2100830078125, 121.95246887207031, -1515.112548828125)
end
end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "sand orb and Bone[Can't close]",
  Description = "",
  Default = false,
  Callback = function(hhv3)
  _G.gg = hhv3
while _G.gg do
    wait(1)
while wait(3) do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(429.08349609375, 90.93980407714844, -1522.064208984375)
end
end
  end
})

Tab6:AddDiscordInvite({
  Name = "Rimura Hub | Community",
  Logo = "rbxassetid://18678079705",
  Invite = "https://discord.com/invite/Dmg8EJ2neK"
})












