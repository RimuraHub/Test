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
  Name = "OneShot[BossSpawns]",
  Description = "",
  Default = false,
  Callback = function(GG)
    Two = GG
  end
})


getgenv().Config = {
    ["Folder Mon"] = "BossSpawns",
    ["Instant Kill"] = "Two",
    ["Radius"] = 15
}
loadstring(game:HttpGet('https://raw.githubusercontent.com/RimuraHub/Test/main/Inkill.lua'))()


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
