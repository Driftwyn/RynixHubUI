local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Module = {}

-- ===== DRAG =====
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
	local RynixHub = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local TabHolder = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Features = Instance.new("TextLabel")
	local Dash = Instance.new("Frame")
	local Exit = Instance.new("TextButton")
	local ContentLabel = Instance.new("TextLabel")
	local Dash_2 = Instance.new("Frame")

	-- GUI Setup
	RynixHub.Name = "RynixHub"
	RynixHub.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
	RynixHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = RynixHub
	Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Main.BackgroundTransparency = 0.1
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.229, 0, 0.246, 0)
	Main.Size = UDim2.new(0, 491, 0, 275)

	UICorner.CornerRadius = UDim.new(0, 12)
	UICorner.Parent = Main

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0.107, 0, -0.054, 0)
	Title.Size = UDim2.new(0, 491, 0, 68)
	Title.Font = Enum.Font.ArialBold
	Title.Text = "RYNIX HUB"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 34
	Title.TextStrokeTransparency = 0.8

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Main
	TabHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TabHolder.BorderSizePixel = 0
	TabHolder.Size = UDim2.new(0, 140, 0, 275)
	UICorner_2.CornerRadius = UDim.new(0, 10)
	UICorner_2.Parent = TabHolder

	Features.Name = "Features"
	Features.Parent = TabHolder
	Features.BackgroundTransparency = 1
	Features.Position = UDim2.new(0.15, 0, 0.03, 0)
	Features.Size = UDim2.new(0, 100, 0, 20)
	Features.Font = Enum.Font.ArialBold
	Features.Text = "Features"
	Features.TextColor3 = Color3.fromRGB(255, 255, 255)
	Features.TextSize = 18

	Dash.Name = "Dash"
	Dash.Parent = TabHolder
	Dash.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Dash.BorderSizePixel = 0
	Dash.Position = UDim2.new(0, 0, 0.1, 0)
	Dash.Size = UDim2.new(0, 140, 0, 2)

	Exit.Name = "Exit"
	Exit.Parent = Main
	Exit.BackgroundTransparency = 1
	Exit.Position = UDim2.new(0.95, 0, 0.02, 0)
	Exit.Size = UDim2.new(0, 25, 0, 25)
	Exit.Font = Enum.Font.SourceSansBold
	Exit.Text = "X"
	Exit.TextColor3 = Color3.fromRGB(255, 0, 0)
	Exit.TextSize = 30

	ContentLabel.Name = "UpdateLabel"
	ContentLabel.Parent = Main
	ContentLabel.BackgroundTransparency = 1
	ContentLabel.Position = UDim2.new(0.3, 0, 0.18, 0)
	ContentLabel.Size = UDim2.new(0, 335, 0, 218)
	ContentLabel.Font = Enum.Font.SourceSansBold
	ContentLabel.TextColor3 = Color3.fromRGB(252, 252, 252)
	ContentLabel.TextSize = 25
	ContentLabel.TextWrapped = true

	Dash_2.Name = "Dash"
	Dash_2.Parent = Main
	Dash_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Dash_2.BorderSizePixel = 0
	Dash_2.Position = UDim2.new(0.3, 0, 0.16, 0)
	Dash_2.Size = UDim2.new(0, 335, 0, 2)

	-- Draggable
	MakeDraggable(Title, Main)

	Exit.MouseButton1Click:Connect(function()
		RynixHub:Destroy()
	end)

	-- Dynamic Buttons Table
	local buttons = {}
	local baseY = 0.15
	local spacing = 0.09

	local function UpdateButtonPositions()
		for i, btn in ipairs(buttons) do
			btn.Position = UDim2.new(0, 0, baseY + (i - 1) * spacing, 0)
		end
	end

	-- Add a button with smooth hover effect
	local function AddButton(name, callback)
		local Btn = Instance.new("TextButton")
		local UICornerBtn = Instance.new("UICorner")
		Btn.Name = name
		Btn.Parent = TabHolder
		Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		Btn.Size = UDim2.new(0, 140, 0, 35)
		Btn.Font = Enum.Font.Arial
		Btn.Text = name
		Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		Btn.TextSize = 16
		UICornerBtn.CornerRadius = UDim.new(0, 8)
		UICornerBtn.Parent = Btn

		-- Hover effect with TweenService
		local hoverTweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local hoverTween = TweenService:Create(Btn, hoverTweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 0, 0)})
		local leaveTween = TweenService:Create(Btn, hoverTweenInfo, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})

		Btn.MouseEnter:Connect(function()
			hoverTween:Play()
		end)
		Btn.MouseLeave:Connect(function()
			leaveTween:Play()
		end)

		Btn.MouseButton1Click:Connect(callback)
		table.insert(buttons, Btn)
		UpdateButtonPositions()
		return Btn
	end

	local function UpdateLabel(text)
		ContentLabel.Text = text
	end

	return {
		Gui = RynixHub,
		Main = Main,
		Title = Title,
		TabHolder = TabHolder,
		ContentLabel = ContentLabel,
		AddButton = AddButton,
		UpdateLabel = UpdateLabel
	}
end

return Module
