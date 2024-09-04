function CheckLevel()
    local level = game.Players.LocalPlayer.Data.Levels.Value
    local Mon, Quest, CFrameMap
    if level >= 1 and level <= 29 then
        Mon = "Bandit"
        Quest = "Quest Lv.1"
    elseif level >= 30 and level <= 49 then
        Mon = "StrongBandit"
        Quest = "BossQuest Lv.30"
    elseif level >= 50 and level <= 99 then
        Mon = "DesertBandit"
        Quest = "Quest Lv.50"
    elseif level >= 100 and level <= 149 then
        Mon = "SandBoss"
        Quest = "BossQuest Lv.100"
    elseif level >= 150 and level <= 249 then
        Mon = "Clown"
        Quest = "Quest Lv.150"
    elseif level >= 250 and level <= 299 then
        Mon = "Buggy"
        Quest = "BossQuest Lv.250"
    elseif level >= 300 and level <= 399 then
        Mon = "Monkey"
        Quest = "Quest Lv.300"
    elseif level >= 400 and level <= 499 then
        Mon = "GorillaKing"
        Quest = "BossQuest Lv.400"
    elseif level >= 500 and level <= 649 then
        Mon = "SkyNewbie"
        Quest = "Quest Lv.500"
    elseif level >= 650 and level <= 749 then
        Mon = "SkyElite"
        Quest = "BossQuest Lv.650"
    elseif level >= 750 and level <= 899 then
        Mon = "PinkWeak"
        Quest = "Quest Lv.750"
    elseif level >= 900 and level <= 999 then
        Mon = "PinkStrong"
        Quest = "BossQuest Lv.900"
    elseif level >= 1000 and level <= 1149 then
        Mon = "SnowBandit"
        Quest = "Quest Lv.1000"
    elseif level >= 1150 and level <= 1499 then
        Mon = "IceMan"
        Quest = "BossQuest Lv.1150"
    elseif level >= 1500 and level <= 1999 then
        Mon = "DonutMan"
        Quest = "Quest Lv.1500"
    elseif level >= 2000 and level <= 2499 then
        Mon = "SuperDonutMan"
        Quest = "BossQuest Lv.2000"
    elseif level >= 2500 and level <= 2999 then
        Mon = "Warrior"
        Quest = "Quest Lv.2500"
    elseif level >= 3000 and level <= 3499 then
        Mon = "StrongWarrior"
        Quest = "BossQuest Lv.3000"
    elseif level >= 3500 and level <= 3999 then
        Mon = "LavaMan"
        Quest = "Quest Lv.3500"
    elseif level >= 4000 and level <= 4499 then
        Mon = "VolcanoMan"
        Quest = "BossQuest Lv.4000"
    elseif level >= 4500 and level <= 4999 then
        Mon = "CakeMan"
        Quest = "Quest Lv.4500"
    elseif level >= 5000 and level <= 10000 then
        Mon = "SuperCakeMan"
        Quest = "BossQuest Lv.5000"
    end
    
    return Mon, Quest, CFrameMap
end

function Attack()
    local VirtualUser = game:GetService("VirtualUser")
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(1280, 672), game:GetService("Workspace").Camera.CFrame)
end

function TP(CFrame)
    pcall(function()
        local humanoidRootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame
        else
            task.wait()
        end
    end)
end

function Hitbox(v)
    local humanoid = v:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
    end
    local hrp = v:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.Size = Vector3.new(20, 20, 20)
        hrp.Transparency = 0.9
        hrp.CanCollide = false
    end
end

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmlv then
                local Mon, Quest, CFrameMap = CheckLevel()
                local Gui = game.Players.LocalPlayer.Quest.Num.Value
                if Gui ~= Quest then
                    for _, a in pairs(game:GetService("Workspace").NPCS.Quest:GetChildren()) do
                        if a.Name == Quest and a:FindFirstChild("HumanoidRootPart") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = a.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                            task.wait()
                            for _, v in pairs(a:GetDescendants()) do
                                if v:IsA("ProximityPrompt") then
                                    fireproximityprompt(v)
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while true do
        task.wait()
        pcall(function()
            if _G.AutoFarmlv then
                local Mon, Quest, CFrameMap = CheckLevel()
                for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v.Name == Mon then
                        local humanoid = v:FindFirstChild("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                        if hrp and humanoid and humanoid.Health > 0 then
                            Hitbox(v)
                            repeat
                                task.wait()
                                Attack()
                                if _G.AutoFarmlv and humanoid.Health > 1 then
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 6, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                                end
                            until not _G.AutoFarmlv or humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.AutoFarmlv then
            local character = game.Players.LocalPlayer.Character
            if character then
                for _, v in ipairs(character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        v.CanCollide = false
                    end
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
