local Data = require(game:GetService("ReplicatedStorage"):WaitForChild("ClientModules"):WaitForChild("LocalData"))

local module = {}

function module:Initialize()
   local ch = game.Players.LocalPlayer.Character
   local prt = Instance.new("Model", workspace)
   local z1 =  Instance.new("Part", prt)
   z1.Name="Torso"
   z1.CanCollide = false
   z1.Anchored = true

   local z2  =Instance.new("Part", prt)
   z2.Name="Head"
   z2.Anchored = true
   z2.CanCollide = false

   local z3 = Instance.new("Humanoid", prt)
   z3.Name="Humanoid"
   z1.Position = Vector3.new(0,9999,0)
   z2.Position = Vector3.new(0,9991,0)

   game.Players.LocalPlayer.Character=prt
   task.wait()
   game.Players.LocalPlayer.Character=ch
   task.wait(6)
   local plr = game.Players.LocalPlayer
   
   local Hum = Instance.new("Humanoid")
   Hum.Parent = game.Players.LocalPlayer.Character
   
   local root = game.Players.LocalPlayer.Character.HumanoidRootPart
   
   for _, v in next, plr.Character:GetChildren() do
   if v.Name ~= 'Humanoid' then v:Destroy() end
   end
end

function module:Dupe(amount)
   amount += Data:GetData("Gems")
   while task.wait() do
       local data = Data:GetData("Gems")
       if data >= amount then
           break
       end
       game:GetService("ReplicatedStorage").Events.Rebirth:FireServer()
   end
   game.Players.LocalPlayer.Character:Destroy()
end

module:Initialize()

local amount = 100000000

module:Dupe(amount)