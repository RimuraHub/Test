redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : Royal sea",
  SubTitle = "",
  SaveFolder = ""
})

local Tab1 = Window:MakeTab({"Raid", "swords"})
local Tab = Window:MakeTab({"AutoFarm", "swords"})














Tab:AddButton({"Auto farm level", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuraHub/MAP/main/AllMAP"))()
end})

local Toggle1 = Tab1:AddToggle({
  Name = "Light",
  Description = "",
  Default = false,
  Callback = function(Hee)
  _G.a = Hee
  end
})

function Attack()
    local VirtualUser = game:GetService'VirtualUser'
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(1280, 672), game)
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
                local raidMon = game:GetService("Workspace").Raid.Light.Mon
                for _, y in pairs(raidMon:GetDescendants()) do
                    local humanoid = y:FindFirstChild("Humanoid")
                    local hrp = y:FindFirstChild("HumanoidRootPart")
                    if hrp and humanoid and humanoid.Health > 0 then
                                humanoid.WalkSpeed = 0
                                humanoid.JumpPower = 0
                                y.HumanoidRootPart.Size = Vector3.new(20,20,20)
                                y.HumanoidRootPart.Transparency = 0.9
                                y.HumanoidRootPart.CanCollide = false
                                repeat
                                    task.wait()
                                    Attack()
                                    if _G.a and humanoid.Health > 1 then
                                        TP(y.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                    end
                                until not _G.a or humanoid.Health <= 0
                            end
                end
            end
        end)
    end
end)

Tab1:AddButton({"teleport Light", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4102.52, 20.3929, 1239.33)
end})

local Toggle1 = Tab1:AddToggle({
  Name = "Quake",
  Description = "",
  Default = false,
  Callback = function(Hee)
    _G.a = Hee
  end
})

function Attack()
    local VirtualUser = game:GetService'VirtualUser'
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(1280, 672), game)
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
                local raidMon = game:GetService("Workspace").Raid.Quake.Mon
                for _, w in pairs(raidMon:GetDescendants()) do
                    local humanoid = w:FindFirstChild("Humanoid")
                    local hrp = w:FindFirstChild("HumanoidRootPart")
                    if hrp and humanoid and humanoid.Health > 0 then
                                humanoid.WalkSpeed = 0
                                humanoid.JumpPower = 0
                                w.HumanoidRootPart.Size = Vector3.new(20,20,20)
                                w.HumanoidRootPart.Transparency = 0.9
                                w.HumanoidRootPart.CanCollide = false
                                repeat
                                    task.wait()
                                    Attack()
                                    if _G.a and humanoid.Health > 1 then
                                        TP(w.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                    end
                                until not _G.a or humanoid.Health <= 0
                            end
                end
            end
        end)
    end
end)

Tab1:AddButton({"teleport Quake", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3636.79, 18.4748, 1342.64)
end})




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
