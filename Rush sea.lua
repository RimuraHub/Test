local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
 
local UI = Library:NewWindow("Rimuru Hub : Rung Sea")
 
local Tab1 = UI:NewSection("Slow")
local Tab2 = UI:NewSection("Fast")

local Gem = workspace.Seller.Ruby
local Coin = workspace.Island.TD

Tab1:CreateToggle("Auto Gem Slow", function(Gea)
  getgenv().Gem123 = Gea
end)
Tab1:CreateToggle("Auto Coin Slow", function(Con)
  getgenv().Coin123 = Con
end)
Tab2:CreateToggle("Auto Gem Fast [Ping]", function(Gea1222)
  getgenv().GemFast = Gea1222
end)
Tab2:CreateToggle("Auto Coin Fast [Ping]", function(Con293838)
  getgenv().CoinFast = Con293838
end)


spawn(function()
  while task.wait() do 
    pcall(function()
      if getgenv().Gem123 then
        for i = 1, 5 do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Gem.CFrame
        fireproximityprompt(Gem.ProximityPrompt)
        end
      end
    end)
  end
end)

spawn(function()
  while task.wait() do 
    pcall(function()
      if getgenv().Coin123 then
        for i = 1, 5 do 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Coin.CFrame
        fireproximityprompt(Coin.ProximityPrompt)
        end
      end
    end)
  end
end)

spawn(function()
  while task.wait() do 
    pcall(function()
      if getgenv().GemFast then game:GetService("RunService").Stepped:Connect(function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Gem.CFrame
        fireproximityprompt(Gem.ProximityPrompt)
        end)
      end
    end)
  end
end)

spawn(function()
  while task.wait() do 
    pcall(function() 
      if getgenv().CoinFast then
game:GetService("RunService").Stepped:Connect(function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Coin.CFrame
        fireproximityprompt(Coin.ProximityPrompt)
        end)
      end
    end)
  end
end)
