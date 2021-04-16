wait(5)
pcall(function()
    repeat
        wait()
    until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SpawnGUI") and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Chat")
    wait(3)
    function TeleportToRandomServer()
        local HttpService = game:GetService("HttpService")
        local Instances = {}
        local AmountCheck = 0
        local TotalCollectionSize = HttpService:JSONDecode(game:HttpGet("https://www.roblox.com/games/getgameinstancesjson?placeId=" .. game.PlaceId .. "&startindex=0")).TotalCollectionSize
        local FloorCollectionSize = math.floor(TotalCollectionSize / 10) * 10
        for a=0,FloorCollectionSize / 10 do
            spawn(function()
                local GameInst = HttpService:JSONDecode(game:HttpGet("https://www.roblox.com/games/getgameinstancesjson?placeId=" .. game.PlaceId .. "&startindex=".. a*10))
                for a,b in pairs(GameInst.Collection) do
                    if b.Capacity > #b.CurrentPlayers then
                        table.insert(Instances, b.Guid)
                    end
                end
                AmountCheck = AmountCheck + 1
            end)
        end
        repeat
            wait(.1)

        until AmountCheck >= (FloorCollectionSize / 10) - 1
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Instances[math.random(1, #Instances)])
    end
spawn(function()
wait(120)
TeleportToRandomServer()
end)
spawn(function()
   while wait() do
       if game.Players.LocalPlayer.Name == "Rejoin" then
           TeleportToRandomServer()
          end
      end
end)
    _G.noclip = true
    spawn(function()
        while game:GetService("RunService").RenderStepped:wait() do
            if _G.noclip and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
            end
        end
    end)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
    for i,v in pairs(getnilinstances()) do
        if v.Name == "HumanoidRootPart" then
            v.Parent = game.Players.LocalPlayer.Character
        end
    end


    local a = game:GetService("Workspace").ObjectSelection
    local allowed = {"Cash", "SmashCash", "ATM", "SlotMachine", "Steal", "JewelBox", "StealTV"}
    local heists = game:GetService("ReplicatedStorage").HeistStatus
    local cargo = game:GetService("Workspace").CargoPlane


    function check(name)
        for i = 0, #allowed do
            if allowed[i] == name then
                return true
            end
        end
        return false
    end

    function rob(name)
        for i,v in pairs(a:GetDescendants()) do
            if v:IsA("RemoteEvent") and v.Parent:IsA("Script") and v.Parent.Parent:IsA("Part") and v.Parent.Parent.Parent:IsA("Model") and v.Parent.Parent.Name == name then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.Parent.CFrame*CFrame.new(0,5,0)
                wait(0.15)
                v:FireServer()
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=  game:GetService("Workspace").ObjectSelection.CriminalDummy.CriminalDummy.CFrame*CFrame.new(15,0,-30)        end
    end

    for i,v in pairs(a:GetDescendants()) do
        if v:IsA("RemoteEvent") and v.Parent:IsA("Script") and v.Parent.Parent:IsA("Part") and v.Parent.Parent.Parent:IsA("Model") and check(v.Parent.Parent.Name)== true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.Parent.CFrame*CFrame.new(0,5,0)
            wait(0.15)
            v:FireServer()
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=  game:GetService("Workspace").ObjectSelection.CriminalDummy.CriminalDummy.CFrame*CFrame.new(15,0,-30)
    end
    _G.noclip = true
    wait(1)
    if cargo:FindFirstChild("Plane") ~= nil then
        rob("PlaneCrate")
    end
    wait(1)
    _G.noclip = true
    if heists.Club.Robbing.Value == true then
        for i,v in pairs(game.Workspace.ObjectSelection:GetChildren()) do
            if v.Name == "ClubDiamond" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.ClubDiamond.CFrame
                v.ClubDiamond.ClubDiamond.Event:FireServer()
                wait(0.1)
            end
        end
        rob("Files")
    end
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=  game:GetService("Workspace").ObjectSelection.CriminalDummy.CriminalDummy.CFrame*CFrame.new(15,0,-30)
    _G.noclip = false
    wait(1)
    _G.noclip = true
    if heists.Pyramid.Locked.Value == false or heists.Pyramid.Robbing.Value == true then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Pyramid.Tele.Core1.CFrame
        wait()
        for i,v in pairs(game.Workspace.ObjectSelection:GetChildren()) do
            if v.Name == "TreasurePyramid" and v:FindFirstChild("TreasurePyramid") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.TreasurePyramid.CFrame
                v.TreasurePyramid.TreasurePyramid.Event:FireServer()
                wait(0.1)
            end
        end

    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=  game:GetService("Workspace").ObjectSelection.CriminalDummy.CriminalDummy.CFrame*CFrame.new(15,0,-30)    _G.noclip = false
    wait(1)
    _G.noclip = true
    for i,v in pairs(game:GetService("Workspace").Heists.JewelryStore.EssentialParts.JewelryBoxes:GetChildren()) do
        if v.Name == "JewelBox" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            wait()
            for i = 1, 3 do
                local A_1 = v
                local Event = game:GetService("Workspace").Heists.JewelryStore.EssentialParts.JewelryBoxes.JewelryManager.Event
                Event:FireServer(A_1)
            end
            wait()
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=  game:GetService("Workspace").ObjectSelection.CriminalDummy.CriminalDummy.CFrame*CFrame.new(15,0,-30)    _G.noclip = false
    wait(3)
    for i = 1, 50 do
        local A_1 = "GoldTrain"
        local Event = game:GetService("ReplicatedStorage").RemoteEvent
        Event:FireServer(A_1)
    end
    _G.noclip = true


    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=  game:GetService("Workspace").ObjectSelection.CriminalDummy.CriminalDummy.CFrame*CFrame.new(15,0,-30)    _G.noclip = false
    wait(5)
    game.Players.LocalPlayer.Name = "Rejoin"
    TeleportToRandomServer()
end)
