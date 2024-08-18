redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Rimura Hub : ijul piece 2",
  SubTitle = "",
  SaveFolder = ""
})

local Tab1 = Window:MakeTab({"one shot", "swords"})






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
loadstring(game:HttpGet('https://raw.githubusercontent.com/Godmey/Inkillallmap/main/inkill.lua'))()
