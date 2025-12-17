-- Rynix Hub UI Module
-- Executor-compatible
-- Tabs + Draggable
-- Converted & structured by Driftwyn

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local Library = {}
Library.__index = Library

-- =========================
-- DRAG FUNCTION
-- =========================
local function makeDraggable(topbar, frame)
    local dragging, dragStart, startPos

    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    topbar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UIS.InputChanged:Connect(function(input)
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

-- =========================
-- CREATE UI
-- =========================
function Library:Create()
    local self = setmetatable({}, Library)

    -- ScreenGui
    self.Gui = Instance.new("ScreenGui")
    self.Gui.Name = "RynixHub"
    self.Gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Main
    self.Main = Instance.new("Frame", self.Gui)
    self.Main.BackgroundColor3 = Color3.fromRGB(0,0,0)
    self.Main.BackgroundTransparency = 0.15
    self.Main.BorderSizePixel = 0
    self.Main.Position = UDim2.new(0.229,0,0.246,0)
    self.Main.Size = UDim2.new(0,491,0,275)
    Instance.new("UICorner", self.Main)

    -- Title (drag handle)
    self.Title = Instance.new("TextLabel", self.Main)
    self.Title.BackgroundTransparency = 1
    self.Title.Position = UDim2.new(0.108,0,-0.055,0)
    self.Title.Size = UDim2.new(0,491,0,68)
    self.Title.Text = "RYNIX HUB"
    self.Title.TextColor3 = Color3.fromRGB(255,255,255)
    self.Title.TextSize = 34
    self.Title.Font = Enum.Font.Unknown

    makeDraggable(self.Title, self.Main)

    -- Exit
    self.Exit = Instance.new("TextButton", self.Main)
    self.Exit.BackgroundTransparency = 1
    self.Exit.Position = UDim2.new(0.963,0,0.033,0)
    self.Exit.Size = UDim2.new(0,18,0,5)
    self.Exit.Text = "X"
    self.Exit.TextColor3 = Color3.fromRGB(255,255,255)
    self.Exit.TextSize = 28
    self.Exit.Font = Enum.Font.SourceSansBold

    self.Exit.MouseButton1Click:Connect(function()
        self.Gui:Destroy()
    end)

    -- Tab Holder
    self.TabHolder = Instance.new("Frame", self.Main)
    self.TabHolder.BackgroundColor3 = Color3.fromRGB(40,40,40)
    self.TabHolder.BorderSizePixel = 0
    self.TabHolder.Size = UDim2.new(0,121,0,275)
    Instance.new("UICorner", self.TabHolder)

    local Header = Instance.new("TextLabel", self.TabHolder)
    Header.BackgroundTransparency = 1
    Header.Size = UDim2.new(1,0,0,50)
    Header.Text = "Supported Games"
    Header.TextColor3 = Color3.fromRGB(255,255,255)
    Header.TextSize = 17
    Header.Font = Enum.Font.Unknown

    -- Content Holder
    self.ContentHolder = Instance.new("Frame", self.Main)
    self.ContentHolder.BackgroundTransparency = 1
    self.ContentHolder.Position = UDim2.new(0.281,0,0.153,0)
    self.ContentHolder.Size = UDim2.new(0,335,0,222)

    self.Tabs = {}
    self.TabCount = 0

    return self
end

-- =========================
-- CREATE TAB
-- =========================
function Library:CreateTab(name)
    self.TabCount += 1

    local Button = Instance.new("TextButton", self.TabHolder)
    Button.BackgroundTransparency = 1
    Button.Position = UDim2.new(0,0,0.19 + (self.TabCount-1)*0.12,0)
    Button.Size = UDim2.new(1,0,0,33)
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(177,177,177)
    Button.TextSize = 17
    Button.Font = Enum.Font.Unknown
    Instance.new("UICorner", Button)

    local Page = Instance.new("Frame", self.ContentHolder)
    Page.Size = UDim2.new(1,0,1,0)
    Page.Visible = false
    Page.BackgroundTransparency = 1

    Button.MouseButton1Click:Connect(function()
        self:SwitchTab(name)
    end)

    self.Tabs[name] = {
        Button = Button,
        Page = Page
    }

    if self.TabCount == 1 then
        self:SwitchTab(name)
    end

    return Page
end

-- =========================
-- SWITCH TAB
-- =========================
function Library:SwitchTab(name)
    for tabName, tab in pairs(self.Tabs) do
        local active = tabName == name
        tab.Page.Visible = active
        tab.Button.TextColor3 = active
            and Color3.fromRGB(255,255,255)
            or Color3.fromRGB(177,177,177)
    end
end

-- =========================
-- CREATE BUTTON
-- =========================
function Library:CreateButton(tabPage, text, callback)
    local Button = Instance.new("TextButton", tabPage)
    Button.Size = UDim2.new(1,-10,0,40)
    Button.Position = UDim2.new(0,5,0,5 + (#tabPage:GetChildren()-1)*45,0)
    Button.BackgroundColor3 = Color3.fromRGB(25,25,25)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255,255,255)
    Button.TextSize = 16
    Button.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", Button)

    Button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    return Button
end

return Library
