-- AXSenseiHub v1.0 | PlayerGui Version | Mobile Executor Safe

local SenseiHub = Instance.new("ScreenGui") local Frame = Instance.new("Frame") local UICorner = Instance.new("UICorner") local title = Instance.new("TextLabel") local ScrollingFrame = Instance.new("ScrollingFrame") local UIListLayout = Instance.new("UIListLayout")

-- Use PlayerGui instead of CoreGui for mobile-safe support SenseiHub.Name = "AXSenseiHub" SenseiHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- GUI Setup Frame.Size = UDim2.new(0, 240, 0, 350) Frame.Position = UDim2.new(0.5, -120, 0.5, -175) Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) Frame.Parent = SenseiHub

UICorner.CornerRadius = UDim.new(0, 10) UICorner.Parent = Frame

title.Text = "AXSenseiHub 🧠" title.Size = UDim2.new(1, 0, 0, 40) title.BackgroundTransparency = 1 title.TextColor3 = Color3.fromRGB(255, 255, 255) title.Font = Enum.Font.SourceSansBold title.TextScaled = true title.Parent = Frame

ScrollingFrame.Size = UDim2.new(1, 0, 1, -40) ScrollingFrame.Position = UDim2.new(0, 0, 0, 40) ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 800) ScrollingFrame.BackgroundTransparency = 1 ScrollingFrame.Parent = Frame

UIListLayout.Padding = UDim.new(0, 6) UIListLayout.Parent = ScrollingFrame

local function makeButton(text, callback) local btn = Instance.new("TextButton") btn.Text = text btn.Size = UDim2.new(1, -20, 0, 40) btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30) btn.TextColor3 = Color3.fromRGB(255, 255, 255) btn.Font = Enum.Font.SourceSans btn.TextScaled = true btn.Parent = ScrollingFrame btn.MouseButton1Click:Connect(callback)

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = btn

end

-- FEATURES --

makeButton("Auto TP Red Light Green Light", function() for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do if v:IsA("Part") and v.Name == "FinishPart" then game.Players.LocalPlayer.Character:PivotTo(v.CFrame + Vector3.new(0, 3, 0)) end end end)

makeButton("Auto Complete Dalgona", function() game:GetService("ReplicatedStorage").RemoteEvent:FireServer("DalgonaSuccess", true) end)

makeButton("Auto Tug of War", function() task.spawn(function() while task.wait(0.2) do local tug = game:GetService("ReplicatedStorage"):FindFirstChild("ClickEvent") if tug then tug:FireServer() end end end) end)

makeButton("Auto TP to Hider", function() for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Name ~= game.Players.LocalPlayer.Name then game.Players.LocalPlayer.Character:PivotTo(v:GetPivot()) end end end)

makeButton("Enable Noclip", function() task.spawn(function() while true do task.wait(0.1) for _,part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if part:IsA("BasePart") then part.CanCollide = false end end end end) end)

makeButton("Reveal Glass Bridge", function() for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do if v:IsA("Part") and v.Name == "GlassStep" then v.Transparency = 0.3 v.Material = Enum.Material.Neon end end end)

makeButton("Sky Launch Troll", function() local char = game.Players.LocalPlayer.Character if char and char:FindFirstChild("HumanoidRootPart") then char:PivotTo(char.HumanoidRootPart.CFrame + Vector3.new(0, 999, 0)) end end)

makeButton("Enable Fly", function() local plr = game.Players.LocalPlayer local UIS = game:GetService("UserInputService") local flying = false local speed = 3 local bodyGyro, bodyVelocity

local function fly()
	bodyGyro = Instance.new("BodyGyro", plr.Character.HumanoidRootPart)
	bodyGyro.P = 9e4
	bodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	bodyGyro.cframe = plr.Character.HumanoidRootPart.CFrame

	bodyVelocity = Instance.new("BodyVelocity", plr.Character.HumanoidRootPart)
	bodyVelocity.velocity = Vector3.new(0,0.1,0)
	bodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)

	while flying do
		task.wait()
		bodyGyro.cframe = plr.Character.HumanoidRootPart.CFrame
		local direction = Vector3.new()
		if UIS:IsKeyDown(Enum.KeyCode.W) then direction += workspace.CurrentCamera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then direction -= workspace.CurrentCamera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then direction -= workspace.CurrentCamera.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then direction += workspace.CurrentCamera.CFrame.RightVector end
		bodyVelocity.velocity = direction * speed
	end
end

flying = not flying
if flying then fly() else
	if bodyGyro then bodyGyro:Destroy() end
	if bodyVelocity then bodyVelocity:Destroy() end
end

end)

