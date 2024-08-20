redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : ijul piece 2",
  SubTitle = "",
  SaveFolder = ""
})

local Tab1 = Window:MakeTab({"one shot", "swords"})
local Tab2 = Window:MakeTab({"Auto", "swords"})






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
