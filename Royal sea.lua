redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : Royal sea",
  SubTitle = "",
  SaveFolder = ""
})

local Tab1 = Window:MakeTab({"Raid", "swords"})











local Toggle1 = Tab1:AddToggle({
  Name = "Light",
  Description = "",
  Default = false,
  Callback = function(Hee)
  _G.a = Hee
  end
})

function A()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
end

spawn(function()
    while wait() do
        pcall(function()
            if _G.a then
                for i, v in pairs(game:GetService("Workspace").Raid.Light.Mon:GetDescendants()) do
                    -- แก้เงื่อนไขตามความต้องการ
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health >= 1 then
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

function A()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):Button1Down(Vector2.new(1280, 672))
end

spawn(function()
    while wait() do
        pcall(function()
            if _G.a then
                for i, v in pairs(game:GetService("Workspace").Raid.Quake.Mon:GetDescendants()) do
                    -- แก้เงื่อนไขตามความต้องการ
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health >= 1 then
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

Tab1:AddButton({"teleport Quake", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3636.79, 18.4748, 1342.64)
end})
