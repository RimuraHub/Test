
if not getgenv().Config then
    getgenv().Config = {
        ["Tool"] = {
            ["Distance"] = 5,
            ["Method"] = "Upper",
            ["One Hit Auto Farm"] = false,
            ["Equip Weapon"] = "nil",
        },
        ["Farm"] = {
            ["Select Mon"] = "nil",
            ["Auto Farm SelectMon"] = false,
            ["Auto Farm Ruby"] = false,
        },
        ["Skill"] = {
            ["Z"] = false,
            ["X"] = false,
            ["C"] = false,
            ["V"] = false,
        },
    }
end


function GetName(Folder, Class)
    local names = {}
    for _, v in pairs(Folder:GetChildren()) do
        if v:IsA(Class) then
            table.insert(names, v.Name)
        end
    end
    return names
end
local Numbers = {}
local Mon = workspace["มอนเตอร์"]
local NotCheck = {}
local AllMon = {}
local FolderMon = {}
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Folder = nil
local Hitbox = 10
local Wea = GetName(game.Players.LocalPlayer.Backpack, "Tool")
local Isa = GetName(workspace["คิงลิงกัง"],"Folder")
local Shop = GetName(workspace.Seller,"Model")

for i = 1, 20 do
    table.insert(Numbers, i)
end

for _, N in ipairs(Numbers) do
    local NameF = tostring(N)
    local F = Mon:FindFirstChild(NameF)
    if F then
        for _, v in ipairs(F:GetChildren()) do
            if v:IsA("Model") and not NotCheck[v.Name] then
                table.insert(AllMon, v.Name)
                NotCheck[v.Name] = true
            elseif v:IsA("Folder") then
                table.insert(FolderMon, v.Name)
                if v.Name == getgenv().Config.Farm["Select Mon"] then
                    Folder = NameF
                end
            end
        end
    end
end


--for _, v in pairs(workspace["มอนเตอร์"]:GetChildren()) do
--    if v:IsA("Folder") then
--        v.Changed:Connect(function()
--            if v.Name ~= "Events" and v.Name ~= "Heaven" and not v.Name:match("^%d+$") then
--                v.Name = "Rimuru Hub"
--            end
--        end)
--    end
-- end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

function Z()
    for _, v in pairs(character:GetChildren()) do
        if v:IsA('Tool') then
            local toolName = v.Name
            if character[toolName]:FindFirstChild("SkillZ") and character[toolName].SkillZ:FindFirstChild("RemoteEvent") then
                character[toolName].SkillZ.RemoteEvent:FireServer()
            end
        end
    end
end

function X()
    for _, v in pairs(character:GetChildren()) do
        if v:IsA('Tool') then
            local toolName = v.Name
            if character[toolName]:FindFirstChild("SkillX") and character[toolName].SkillX:FindFirstChild("RemoteEvent") then
                character[toolName].SkillX.RemoteEvent:FireServer()
            end
        end
    end
end

function C()
    for _, v in pairs(character:GetChildren()) do
        if v:IsA('Tool') then
            local toolName = v.Name
            if character[toolName]:FindFirstChild("SkillC") and character[toolName].SkillC:FindFirstChild("RemoteEvent") then
                character[toolName].SkillC.RemoteEvent:FireServer()
            end
        end
    end
end

function V()
    for _, v in pairs(character:GetChildren()) do
        if v:IsA('Tool') then
            local toolName = v.Name
            if character[toolName]:FindFirstChild("SkillV") and character[toolName].SkillV:FindFirstChild("RemoteEvent") then
                character[toolName].SkillV.RemoteEvent:FireServer()
            end
        end
    end
end


local function SetUP(a, b)
    return getgenv().Config[a][b]
end
function Attack()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end

function EquipTool()
  for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:FindFirstChild(SetUP("Tool","Equip Weapon")) then
      game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(SetUP("Tool","Equip Weapon")))
      else
      game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(_G.Weapib))
        end
    end
end



local function AddDropdown(tab, name, options, default, flag, callback)
    tab:AddDropdown({
        Name = name,
        Options = options,
        Default = default,
        Flag = flag,
        Callback = callback
    })
end


local function TP(cframe)
    pcall(function()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
        end
    end)
end

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Godmey/Redz-Ui/refs/heads/main/Ui.lua"))()

local Window = redzlib:MakeWindow({
    Title = "Rimura Hub : " .. NameMap,
    SubTitle = "",
    SaveFolder = "",
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) },
})

local T1 = Window:MakeTab({"Discord", "Info"})
local T2 = Window:MakeTab({"Auto Farm", "Home"})
local T4 = Window:MakeTab({"Teleport", "Signal"})
local T5 = Window:MakeTab({"Misc", "Settings"})

T1:AddDiscordInvite({
    Name = "Rimura Hub | Community",
    Logo = "rbxassetid://18751483361",
    Invite = "https://discord.com/invite/Dmg8EJ2neK",
})

T2:AddSection({"| Auto Farm Mob"})
AddDropdown(T2, "Select Mon", AllMon, SetUP("Farm", "Select Mon") or nil, "Mon", function(Sc)
    _G.SelectMon = Sc
end)

T2:AddToggle({
    Name = "Auto Farm SelectMon",
    Default = SetUP("Farm", "Auto Farm SelectMon") or false,
    Callback = function(fa)
        _G.Auto = fa
    end
})
T2:AddToggle({
    Name = "Auto Farm Ruby",
    Default = SetUP("Farm", "Auto Farm Ruby") or false,
    Callback = function(rowiid)
        _G.AutoRubyMon = rowiid
    end
})


T4:AddSection({"| Island"})
AddDropdown(T4, "Select Island", Isa, nil, "Island", function(ka)
    _G.Is = ka
end)
T4:AddButton({"Teleport Island", function()
   for _, v in pairs(workspace["คิงลิงกัง"][_G.Is]:GetDescendants()) do
      if v:IsA("Part") then
        TP(v.CFrame * CFrame.new(0,100,0))
      end
    end
  end
})
T4:AddSection({"| Shop"})
AddDropdown(T4, "Select Shop", Shop, nil, "Shop", function(akwo)
    _G.Sell = akwo
end)
T4:AddButton({"Teleport Shop", function()
   for _, v in pairs(workspace.Seller:GetChildren()) do
      if v.Name == _G.Sell and v:FindFirstChild("HumanoidRootPart") then
        TP(v.HumanoidRootPart.CFrame)
      end
    end
  end
})


T5:AddSection({"| Weapon"})
AddDropdown(T5, "Select Weapon", Wea, SetUP("Tool","Equip Weapon") or nil, "Weapon", function(Ji)
    _G.Weapib = Ji
end)
AddDropdown(T5, "Select Method", {"Upper","Behind","Below"}, SetUP("Tool","Method") or "Upper", "Method", function(v)
    getgenv().method = v
end)
T5:AddToggle({
    Name = "One Hit",
    Default = SetUP("Tool", "One Hit Auto Farm") or false,
    Callback = function(wiwii)
        _G.OneAutoF = wiwii
    end
})

T5:AddSection({"| Tools"})
T5:AddButton({"Grabtools[pls 1 Click]", function()
       for _, v in pairs(workspace:GetChildren()) do
          if v:IsA("Tool") and not v:FindFirstChild("Active") then
            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
          end
        end
    end
})
T5:AddButton({"Redeem All Code", function()
   for _, v in pairs(game:GetService("Players").LocalPlayer.Codes:GetChildren()) do
       if v.Name then
game:GetService("ReplicatedStorage").RedeemCode:FireServer(v.Name)
       end
    end
end
})
T5:AddSection({"| Skill"})
T5:AddToggle({
    Name = "Auto Skill Z",
    Default = SetUP("Skill","Z") or false,
    Callback = function(zz)
        _G.Z = zz
        while _G.Z do 
            wait() 
            Z()
        end
    end
})

T5:AddToggle({
    Name = "Auto Skill X",
    Default = SetUP("Skill","X") or false,
    Callback = function(xx)
        _G.X = xx
        while _G.X do 
            wait() 
            X()
        end
    end
})

T5:AddToggle({
    Name = "Auto Skill C",
    Default = SetUP("Skill","C") or false,
    Callback = function(cc)
        _G.C = cc
        while _G.C do 
            wait() 
            C()
        end
    end
})

T5:AddToggle({
    Name = "Auto Skill V",
    Default = SetUP("Skill","V") or false,
    Callback = function(vv)
        _G.V = vv
        while _G.V do 
            wait() 
            V() 
        end
    end
})



local function setupMethod()
    local method = getgenv().method
    local offset = SetUP("Tool", "Distance") or 5

    if method == "Behind" then
        return CFrame.new(0, 0, offset)
    elseif method == "Below" then
        return CFrame.new(0, -offset, 0) * CFrame.Angles(math.rad(90), 0, 0)
    elseif method == "Upper" then
        return CFrame.new(0, offset, 0) * CFrame.Angles(math.rad(-90), 0, 0)
    else
        return CFrame.new(0, offset, 0) * CFrame.Angles(math.rad(-90), 0, 0)
    end
end

spawn(function()
    while wait() do
        pcall(function()
            MethodFarm = setupMethod()
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoRubyMon then
                for _, v in ipairs(workspace.Seller["anti found hack"]:GetChildren()) do
                    if v:IsA("Model") and v.Name ~= "Shark " and v:FindFirstChildOfClass("Humanoid") then
                        local humanoid = v:FindFirstChildOfClass("Humanoid")
                        local rootPart = v:FindFirstChild("HumanoidRootPart")
                        if humanoid and humanoid.Health > 0 and rootPart then
                            humanoid.WalkSpeed = 0
                            humanoid.JumpPower = 0
                            rootPart.Size = Vector3.new(10, 10, 10)
                            rootPart.Transparency = 0.9
                            local bodyPosition = Instance.new("BodyPosition")
                            bodyPosition.MaxForce = Vector3.new(4000, 4000, 4000)
                            bodyPosition.P = 10000
                            bodyPosition.Parent = rootPart
                            repeat
                                task.wait()
                                Attack()
                                EquipTool()
                                TP(rootPart.CFrame * MethodFarm)
                                bodyPosition.Position = rootPart.Position
                                if _G.OneAutoF and humanoid.Health < humanoid.MaxHealth and humanoid.Health > 0 then
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", math.huge)
                                    humanoid.Health = 0
                                end
                            until not _G.AutoRubyMon or humanoid.Health <= 0
                            bodyPosition:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto then
                for _, v in ipairs(workspace["มอนเตอร์"]:GetDescendants()) do
                    if v:IsA("Model") and v.Name == _G.SelectMon and v:FindFirstChildOfClass("Humanoid") then
                        local humanoid = v.Humanoid
                        local rootPart = v:FindFirstChild("HumanoidRootPart")
                        if humanoid.Health > 0 and rootPart then
                            humanoid.WalkSpeed = 0
                            humanoid.JumpPower = 0
                            rootPart.Size = Vector3.new(10, 10, 10)
                            rootPart.Transparency = 0.9
                            local bodyPosition = Instance.new("BodyPosition")
                            bodyPosition.MaxForce = Vector3.new(4000, 4000, 4000)
                            bodyPosition.P = 10000
                            bodyPosition.Parent = rootPart
                            repeat
                                task.wait()
                                Attack()
                                EquipTool()
                                TP(rootPart.CFrame * MethodFarm)
                                bodyPosition.Position = rootPart.Position
                                if _G.OneAutoF and humanoid.Health < humanoid.MaxHealth and humanoid.Health > 0 then
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 112412400000)
                                    sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 112412400000)
                                    humanoid.Health = 0
                                end
                            until not _G.Auto or humanoid.Health <= 0
                            bodyPosition:Destroy()
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.Auto or _G.AutoRubyMon then
                for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        v.CanCollide = false
                    end
                end
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and not hrp:FindFirstChild("BodyClip") then
                local noclip = Instance.new("BodyVelocity")
                noclip.Name = "BodyClip"
                noclip.Parent = hrp
                noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                noclip.Velocity = Vector3.new(0, 0, 0)
            end
        else
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and hrp:FindFirstChild("BodyClip") then
                hrp.BodyClip:Destroy()
            end
        end
    end)
end)
