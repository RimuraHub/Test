redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : Sakura Piece",
  SubTitle = "",
  SaveFolder = ""
})

local Tab1 = Window:MakeTab({"Raid", "swords"})














local Toggle1 = Tab1:AddToggle({
  Name = "Farm Raid",
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
                local raidMon = game.workspace["Raid Island"].Enemy
                for _, y in pairs(raidMon:GetChildren()) do
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

local Toggle1 = Tab1:AddToggle({
  Name = "OneShot",
  Default = false,
  Callback = function(OON)
    getgenv().Config = {
    ["Folder Mon"] = "nil",
    ["Instant Kill"] = OON,
    ["Radius"] = 30
}
print("By : kill Hub")
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Config["Instant Kill"] then
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                sethiddenproperty(player, "SimulationRadius", 112412400000)
                sethiddenproperty(player, "MaxSimulationRadius", 112412400000)
                
                local Den
                if getgenv().Config["Folder Mon"] == "nil" then
                    Den = game.workspace["Raid Island"].Enemy:GetChildren()
                else
                    Den = game.Workspace[getgenv().Config["Folder Mon"]]:GetDescendants()
                end
                
                for _, v in pairs(Den) do
                    if v:IsA("Humanoid") and v.Parent and v.Parent:IsA("Model") then
                        local MonPoz = v.Parent:FindFirstChild("HumanoidRootPart") and v.Parent.HumanoidRootPart.Position
                        local PlayerPoz = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position
                        
                        if MonPoz and PlayerPoz and (MonPoz - PlayerPoz).Magnitude <= getgenv().Config["Radius"] then
                            if v.Health < v.MaxHealth then
                                wait(.1)
                                v.Health = 0
                            end
                        end
                    end
                end
            end
        end)
    end
end)
  end
})




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
