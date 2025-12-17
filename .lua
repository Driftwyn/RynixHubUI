-- Rynix Hub Module
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Module = {}

-- ===== DRAG (NON-DESTRUCTIVE) =====
local function MakeDraggable(dragHandle, frame)
	local dragging = false
	local dragStart, startPos

	dragHandle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
		end
	end)

	dragHandle.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

-- ===== CREATE =====
function Module.Create()
	-- Instances:
	local RynixHub = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local TabHolder = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Features = Instance.new("TextLabel")
	local Dash = Instance.new("Frame")
	local TheForge = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local Exit = Instance.new("TextButton")
	local ContentLabel = Instance.new("TextLabel")
	local Dash_2 = Instance.new("Frame")

	-- Properties:
	RynixHub.Name = "RynixHub"
	RynixHub.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
	RynixHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = RynixHub
	Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Main.BackgroundTransparency = 0.150
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.229, 0, 0.246, 0)
	Main.Size = UDim2.new(0, 491, 0, 275)

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.1079, 0, -0.0545, 0)
	Title.Size = UDim2.new(0, 491, 0, 68)
	Title.Font = Enum.Font.ArialBold
	Title.Text = "RYNIX HUB"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 34.000

	UICorner.Parent = Main

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Main
	TabHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabHolder.BorderSizePixel = 0
	TabHolder.Size = UDim2.new(0, 121, 0, 275)

	UICorner_2.Parent = TabHolder

	Features.Name = "Features"
	Features.Parent = TabHolder
	Features.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Features.BackgroundTransparency = 1.000
	Features.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Features.BorderSizePixel = 0
	Features.Position = UDim2.new(0.2975, 0, 0.0509, 0)
	Features.Size = UDim2.new(0, 48, 0, 12)
	Features.Font = Enum.Font.ArialBold
	Features.Text = "Features"
	Features.TextColor3 = Color3.fromRGB(255, 255, 255)
	Features.TextSize = 17.000

	Dash.Name = "Dash"
	Dash.Parent = TabHolder
	Dash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Dash.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Dash.BorderSizePixel = 0
	Dash.Position = UDim2.new(0, 0, 0.1563, 0)
	Dash.Size = UDim2.new(0, 121, 0, 2)

	TheForge.Name = "TheForge"
	TheForge.Parent = TabHolder
	TheForge.BackgroundColor3 = Color3.fromRGB(176, 176, 176)
	TheForge.BackgroundTransparency = 1.000
	TheForge.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TheForge.BorderSizePixel = 0
	TheForge.Position = UDim2.new(0, 0, 0.1927, 0)
	TheForge.Size = UDim2.new(0, 121, 0, 33)
	TheForge.Font = Enum.Font.Arial
	TheForge.Text = "The Forge(Beta)"
	TheForge.TextColor3 = Color3.fromRGB(177, 177, 177)
	TheForge.TextSize = 17.000

	UICorner_3.Parent = TheForge

	Exit.Name = "Exit"
	Exit.Parent = Main
	Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Exit.BackgroundTransparency = 1.000
	Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Exit.BorderSizePixel = 0
	Exit.Position = UDim2.new(0.9633, 0, 0.0327, 0)
	Exit.Size = UDim2.new(0, 18, 0, 5)
	Exit.Font = Enum.Font.SourceSansBold
	Exit.Text = "X"
	Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
	Exit.TextSize = 28.000

	ContentLabel.Name = "UpdateLabel"
	ContentLabel.Parent = Main
	ContentLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ContentLabel.BackgroundTransparency = 1.000
	ContentLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContentLabel.BorderSizePixel = 0
	ContentLabel.Position = UDim2.new(0.2810, 0, 0.1636, 0)
	ContentLabel.Size = UDim2.new(0, 335, 0, 218)
	ContentLabel.Font = Enum.Font.SourceSansBold
	ContentLabel.TextColor3 = Color3.fromRGB(252, 252, 252)
	ContentLabel.TextSize = 25.000

	Dash_2.Name = "Dash"
	Dash_2.Parent = Main
	Dash_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Dash_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Dash_2.BorderSizePixel = 0
	Dash_2.Position = UDim2.new(0.2810, 0, 0.1527, 0)
	Dash_2.Size = UDim2.new(0, 335, 0, 2)

	-- Make draggable
	MakeDraggable(Title, Main)

	-- Exit button
	Exit.MouseButton1Click:Connect(function()
		RynixHub:Destroy()
	end)

	-- ===== HELPER FUNCTIONS =====

	local function AddButton(name, callback)
		local Btn = Instance.new("TextButton")
		Btn.Parent = Main
		Btn.Size = UDim2.new(0, 150, 0, 35)
		Btn.Position = UDim2.new(0, 20, 0, 50 + (#Main:GetChildren() * 40)) -- stacked
		Btn.Text = name
		Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
		Btn.TextColor3 = Color3.fromRGB(255,255,255)
		Btn.BorderSizePixel = 0
		Btn.Font = Enum.Font.SourceSansBold
		Btn.TextSize = 18
		Btn.MouseButton1Click:Connect(callback)
		return Btn
	end

	local function UpdateLabel(text)
		ContentLabel.Text = text
	end

	-- Return everything
	return {
		Gui = RynixHub,
		Main = Main,
		Title = Title,
		TabHolder = TabHolder,
		TheForge = TheForge,
		ContentLabel = ContentLabel,
		AddButton = AddButton,
		UpdateLabel = UpdateLabel
	}
end

return Module
