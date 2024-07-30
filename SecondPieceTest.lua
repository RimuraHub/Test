redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : Second Piece",
  SubTitle = "",
  SaveFolder = ""
})

local Tab1 = Window:MakeTab({"Auto Farm", "swords"})
local Tab2 = Window:MakeTab({"Teleport", "Locate"})
local Tab3 = Window:MakeTab({"Misc", "swords"})
local Tab6 = Window:MakeTab({"Discord", "Info"})

redzlib:SetTheme("Dark")


local Section = Tab1:AddSection({"Select Weapon"})

local Weaponlist = {}
local Weapon = nil

    for _,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        table.insert(Weaponlist,v.Name)
    end
end



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



local Section = Tab1:AddSection({"Auto FarmMon"})



local Mob = {}

for i, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
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
                for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v.Name == MobFarm and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health >= 1 then
                        repeat
                           A()
                            wait()
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
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




local Section = Tab2:AddSection({"Teleportisland"})

local island = {}

for i, v in pairs(game:GetService("Workspace").Locations:GetChildren()) do
    table.insert(island, v.Name)
end

local Dropdown = Tab2:AddDropdown({
    Name = "Select island",
    Description = "",
    Options = island,
    Default = nil,
    Flag = "dropdown teste",
    Callback = function(WoW)
 NPCNA = WoW
end
})

Tab2:AddButton({"Click to teleport", function()
        for i, v in pairs(game:GetService("Workspace").Locations:GetChildren()) do
            if v.Name == NPCNA then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, -2)
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


Tab6:AddDiscordInvite({
  Name = "Rimura Hub | Community",
  Logo = "rbxassetid://18678079705",
  Invite = "https://discord.com/invite/Dmg8EJ2neK"
})
