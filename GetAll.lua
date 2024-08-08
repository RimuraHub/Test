for _, v in pairs(game.Players.LocalPlayer.InventoryList:GetChildren()) do
    if v:IsA("BoolValue") then
        v.Value = true
    end
end
for _, y in pairs(game.Players.LocalPlayer.InventoryListMelee:GetChildren()) do
    if y:IsA("BoolValue") then
        y.Value = true
    end
end
