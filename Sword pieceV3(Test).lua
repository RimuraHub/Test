redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : Sword Piece",
  SubTitle = "by Rimura4643",
  SaveFolder = ""
})

Window:AddMinimizeButton({
  Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

local Tab1 = Window:MakeTab({"Auto Farm", "Home"})
local Tab2 = Window:MakeTab({"Teleport", "Locate"})
local Tab3 = Window:MakeTab({"Misc", "cherry"})
local Tab4 = Window:MakeTab({"SpamSkills", "swords"})
local Tab5 = Window:MakeTab({"SpamSkillsV2", "swords"})
local Tab6 = Window:MakeTab({"MAP", "Home"})
local Tab7 = Window:MakeTab({"Discord", "Info"})


local Section = Tab1:AddSection({"Select Weapon"})

local Weaponlist = {}
local Weapon = nil

local function refreshWeaponList()
    Weaponlist = {}
    for _,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        table.insert(Weaponlist,v.Name)
    end
end

refreshWeaponList()

local Dropdown = Tab1:AddDropdown({
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

local Section= Tab1:AddSection({"Fast Attack[equipweapon]"})

local Toggle1 = Tab1:AddToggle({
  Name = "King_Sword",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait()
        local args = {
    [1] = game:GetService("Players").LocalPlayer.Character.King_Sword.Handle
}

game:GetService("Players").LocalPlayer.Character.King_Sword.Combo.C1:FireServer(unpack(args))
    end
  end
})



local Section = Tab1:AddSection({"Auto FarmMon"})



local Mob = {
	"Baboon (Lv.200)",
    "FakeAngle (Lv.500)",
    "Bandit (Lv.1)",
    "Marine (Lv.100)",
    "MarinePRO (Lv.1,000)",
    "Fishman (Lv.600)",
    "SkyMan (Lv.350)",
    "Muscle man (Lv.20)",
    "Noob (Lv.50)",
    "Redman (Lv.1200)",
    "CandyMan (Lv.2000)",
    "NoobRobot (Lv.2500)",
    "[Boss] God Angle (Lv.800)",
    "(Boss] Devli(Lv.3500)",
    "Pink_Boss(Lv.3000)",
    "Edward Oldgate(Lv.3500)",
    "[Boss] Sword Master (Lv.400)",
    "[Boss] Tushita (Lv.1800)",
    "[Boss] Red Hair (Lv.500)",
    "[Boss] Yama (Lv.1500)",
    "Metal_Boss(Lv.4000)",
    "[Boss] Arlong (Lv.1000)",
    " TreeMan (Lv.3000)",
    "Oden(Lv.2500)",
    "Red_Boss(Lv.4000)",
    "SeaKing",
    "Katakuri_Boss(Lv.4500)",
    "Gojo",
    "CID_Boss",
    "Light_Boss(Lv.2500)"
}

for i, v in pairs(game:GetService("Workspace").Mob:GetDescendants()) do
    table.insert(Mob, Name)
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

local Toggle1 = Tab1:AddToggle({
  Name = "Auto Farm",
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
                for i, v in pairs(game:GetService("Workspace").Mob:GetDescendants()) do
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


local Section = Tab2:AddSection({"TeleportNPC"})

local NPCS = {}

for i, v in pairs(game:GetService("Workspace").NPC:GetChildren()) do
    table.insert(NPCS, v.Name)
end

local Dropdown = Tab2:AddDropdown({
    Name = "Select NPC",
    Description = "",
    Options = NPCS,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(WoW)
 NPCNA = WoW
end
})

Tab2:AddButton({"Click to teleport", function()
        for i, v in pairs(game:GetService("Workspace").NPC:GetChildren()) do
            if v.Name == NPCNA then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
            end
        end
    end
})

Tab2:AddButton({"Click to teleport[BugFix]", function()
        for i, v in pairs(game:GetService("Workspace").NPC:GetChildren()) do
            if v.Name == NPCNA then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, -2)
            end
        end
    end
})

local Section = Tab2:AddSection({"Teleport"})

Tab2:AddButton({"Alone_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-448.27337646484375, 66.60079193115234, 82.97445678710938)
end})

Tab2:AddButton({"Starter_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-130.31344604492188, 20.529998779296875, 369.0207824707031)
end})

Tab2:AddButton({"Noob_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new( -347.5494384765625, 20.94811248779297, 883.9833374023438)
end})

Tab2:AddButton({"Marine_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(309.8626403808594, 20.358110427856445, -199.6346893310547)
end})

Tab2:AddButton({"Baboon_Islan", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-731.5245361328125, 20.358110427856445, -274.16937255859375)
end})

Tab2:AddButton({"Skyisland", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-79.29106903076172, 87.0345458984375, -543.7308349609375)
end})

Tab2:AddButton({"Arlong_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-791.1946411132812, 28.551923751831055, 476.9998474121094)
end})

Tab2:AddButton({"Marineford_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(716.3748168945312, 12.088098526000977, -1025.708251953125)
end})

Tab2:AddButton({"Vonalco_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1360.1378173828125, 25.64848518371582, -53.375732421875)
end})

Tab2:AddButton({"Candy_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-558.9735717773438, 13.736052513122559, -1118.565185546875)
end})

Tab2:AddButton({"Snow_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-752.9354858398438, 22.753276824951172, 1485.57421875)
end})

Tab2:AddButton({"BigTree_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1579.7244873046875, 20.62343406677246, -101.03346252441406)
end})

Tab2:AddButton({"Moai_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-59.6111069, 15.5288982, 2304.18384, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end})

local Section = Tab2:AddSection({"TeleportBossIsland - วาปเกาะบอส"})

Tab2:AddButton({"Shank_island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(580.7437133789062, 62.638710021972656, 392.1752014160156)
end})

Tab2:AddButton({"Wano_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(653.5064086914062, 16.33466148376465, 1371.4091796875)
end})

Tab2:AddButton({"Light_Island[safe zone]", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(952.4696655273438, 21.544837951660156, 662.9339599609375)
end})

Tab2:AddButton({"BlackPink", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-709.4248046875, 49441.72265625, -1197.458251953125)
end})

Tab2:AddButton({"SeaKing_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1472.300048828125, 105.96843719482422, 1341.03955078125)
end})

Tab2:AddButton({"SeaKing_Island2", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1441.73583984375, 21.603845596313477, 1327.4365234375)
end})

Tab2:AddButton({"CID_Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(189.59649658203125, 159.18881225585938, -1668.1658935546875)
end})

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

local Toggle1 = Tab3:AddToggle({
  Name = "BringHeadPlayer",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait()
local LP = game:GetService("Players").LocalPlayer

while wait() do

for i,v in pairs(game:GetService("Players"):GetPlayers()) do

if v and v.Character and v ~= LP and v.Character:FindFirstChild("Head") then

local hrp = v.Character:FindFirstChild("Head") 

hrp:BreakJoints()

hrp.Transparency = 0

hrp.BrickColor = v.TeamColor

hrp.Anchored = true

hrp.CanCollide = false

pcall(function()

hrp.CFrame = LP.Character.HumanoidRootPart.CFrame * CFrame.new(1,0,-3.5)

end)

end

end

end


    end
  end
})


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

Tab4:AddButton({"NoCoolDown", function()
z = hookfunction(wait, function(seconds)
return z()
end)
end})

local Section= Tab4:AddSection({"Skill Z"})


local Toggle1 = Tab4:AddToggle({
  Name = "King_Sword",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Character.King_Sword.SkillZ.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab4:AddToggle({
  Name = "Reaper_Scythe",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Character.Reaper_Scythe.SkillZ.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab4:AddToggle({
  Name = "Guitar",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait()
        game:GetService("Players").LocalPlayer.Character.Guitar.SkillZ.Fire:FireServer()
    end
  end
})

local Section= Tab4:AddSection({"Skill X"})

local Toggle1 = Tab4:AddToggle({
  Name = "King_Sword",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Character.King_Sword.SkillX.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab4:AddToggle({
  Name = "Reaper_Scythe",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Character.Reaper_Scythe.SkillX.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab4:AddToggle({
  Name = "DoughTrident",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Character.DoughTrident.SkillX.Fire:FireServer()
    end
  end
})

local Section= Tab4:AddSection({"Skill C"})

local Toggle1 = Tab4:AddToggle({
  Name = "Reaper_Scythe",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Character.Reaper_Scythe.SkillC.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab4:AddToggle({
  Name = "Ice fruit",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait()
        game:GetService("Players").LocalPlayer.Character.Ice.SkillC.Fire:FireServer()
    end
  end
})

local Section= Tab5:AddSection({"Skill Z"})



local Toggle1 = Tab5:AddToggle({
  Name = "King_Sword",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Backpack.King_Sword.SkillZ.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "Reaper_Scythe",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Backpack.Reaper_Scythe.SkillZ.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "Guitar",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait()
        game:GetService("Players").LocalPlayer.Backpack.Guitar.SkillZ.Fire:FireServer()
    end
  end
})

local Section= Tab5:AddSection({"Skill X"})

local Toggle1 = Tab5:AddToggle({
  Name = "King_Sword",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Backpack.King_Sword.SkillX.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "Reaper_Scythe",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Backpack.Reaper_Scythe.SkillX.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "DoughTrident",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Backpack.DoughTrident.SkillX.Fire:FireServer()
    end
  end
})

local Section= Tab5:AddSection({"Skill C"})

local Toggle1 = Tab5:AddToggle({
  Name = "Reaper_Scythe",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait(0.3)
        game:GetService("Players").LocalPlayer.Backpack.Reaper_Scythe.SkillC.Fire:FireServer()
    end
  end
})

local Toggle1 = Tab5:AddToggle({
  Name = "Ice fruit",
  Description = "",
  Default = false,
  Callback = function(me)
         _G.Auto = me
    while _G.Auto do
        wait()
        game:GetService("Players").LocalPlayer.Backpack.Ice.SkillC.Fire:FireServer()
    end
  end
})



Tab6:AddButton({"HideName", function()
game:GetService("Players").LocalPlayer.PlayerGui.statsscreen.Enabled = false
game:GetService("Players").LocalPlayer.PlayerGui.ValueGui.TextLabel.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.StatsGui.MenuFrame.NTextLabel.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.StatsGui.BigFrame.NTextLabel.Visible = false
 game.Players.LocalPlayer.Character.Head.NameTag.UpperText.Visible = false
end})

local Section= Tab6:AddSection({"Summon"})

Tab6:AddButton({"Get All[Inventory]", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/Test/main/GetAll.lua"))()
end})

local Section= Tab6:AddSection({"Melee"})

local WeaponlistMelee = {}

for i, v in pairs(game.Players.LocalPlayer.InventoryListMelee:GetChildren()) do
    table.insert(WeaponlistMelee, v.Name)
end

Tab6:AddDropdown({
    Name = "Select Melee Weapon",
    Description = "",
    Options = WeaponlistMelee,
    Default = nil,
    Flag = "dropdown melee",
    Callback = function(selectedOption)
        local args = {
            [1] = selectedOption
        }

        game.ReplicatedStorage.Remotes.InventoryM:FireServer(unpack(args))
    end
})

local Section= Tab6:AddSection({"Sword"})


local Weaponlist = {}

for i, v in pairs(game.Players.LocalPlayer.InventoryList:GetChildren()) do
    table.insert(Weaponlist, v.Name)
end

local Dropdown = Tab6:AddDropdown({
    Name = "Select Weapon",
    Description = "",
    Options = Weaponlist,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(selectedOption)
        local args = {
            [1] = selectedOption
        }

        game.ReplicatedStorage.Remotes.Inventory:FireServer(unpack(args))
    end
})


Tab6:AddButton({"Guitar", function()
game:GetService("ReplicatedStorage").Remotes.Inventory:FireServer("Guitar")
end})

Tab7:AddDiscordInvite({
  Name = "RIMURA Hub | Community",
  Logo = "rbxassetid://18678079705",
  Invite = "https://discord.com/invite/Dmg8EJ2neK"
})










