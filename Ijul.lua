redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : ijul piece 2",
  SubTitle = "",
  SaveFolder = ""
})

Window:AddMinimizeButton({
  Button = { Image = "rbxassetid://18751483361", BackgroundTransparency = 0 },
  Corner = { CornerRadius = UDim.new(0, 6) }
})

local Tab1 = Window:MakeTab({"Farm", "Home"})
local Tab2 = Window:MakeTab({"Auto", "swords"})







local Toggle1 = Tab1:AddToggle({
  Name = "FarmBossSpawn",
  Description = "",
  Default = false,
  Callback = function(Hee)
    _G.a = Hee
  end
})

function Attack()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
end

function TP(CFrame)
    pcall(function()
        local humanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame
        else
            wait(2)
        end
    end)
end

spawn(function()
    while true do
        task.wait()  -- ใช้ task.wait() แทน wait()
        pcall(function()
            if _G.a then
                local raidMon = game:GetService("Workspace").BossSpawns.BossSpawn
                for _, v in pairs(raidMon:GetDescendants()) do
                    local humanoid = v:FindFirstChild("Humanoid")
                    local hrp = v:FindFirstChild("HumanoidRootPart")
                    if hrp and humanoid and humanoid.Health > 0 then
                                humanoid.WalkSpeed = 0
                                humanoid.JumpPower = 0
                                v.HumanoidRootPart.CanCollide = false
                                repeat
                                    task.wait()
                                    Attack()
                                    if _G.a and humanoid.Health > 1 then
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                    end
                                until not _G.a or humanoid.Health <= 0
                            end
                end
            end
        end)
    end
end)

local Section = Tab1:AddSection({"One Shot"})

local Toggle1 = Tab1:AddToggle({
  Name = "OneShot",
  Description = "",
  Default = false,
  Callback = function(GG)
    One = GG
  end
})


getgenv().Config = {
    ["Folder Mon"] = "Npcs",
    ["Instant Kill"] = "One",
    ["Radius"] = 15
}
loadstring(game:HttpGet('https://raw.githubusercontent.com/RimuraHub/Test/main/Inkill.lua'))()

local Toggle1 = Tab1:AddToggle({
  Name = "OneShot[BossSpawn]",
  Description = "",
  Default = false,
  Callback = function(GG)
    Two = GG
  end
})


getgenv().Config = {
    ["Folder Mon"] = "nil",
    ["Instant Kill"] = "Two",
    ["Radius"] = 15
}
loadstring(game:HttpGet('https://raw.githubusercontent.com/RimuraHub/Test/main/Inkill2.lua'))()

local Section = Tab1:AddSection({"Kill Aura"})

local Toggle3 = Tab1:AddToggle({
  Name = "Kill Aura",
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

local Toggle1 = Tab2:AddToggle({
  Name = "Auto all",
  Description = "",
  Default = false,
  Callback = function(hhv)
  _G.gg = hhv
while _G.gg do
    wait()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:FindFirstChild("ProximityPrompt") then
            fireproximityprompt(v.ProximityPrompt, 5)
        end
    end
end
  end
})
