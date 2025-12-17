-- RynixHub Executor Module
-- EXACT Gui-to-Lua
-- NO UI CHANGES
-- Draggable added ONLY

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

    -- Instances
    local RynixHub = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local TabHolder = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local SupportedgamesCanbechangetoFeatures = Instance.new("TextLabel")
    local Dash = Instance.new("Frame")
    local TheForge = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")
    local Exit = Instance.new("TextButton")
    local UpdatelogsBasicallyatextlabelitis = Instance.new("TextLabel")
    local Dash_2 = Instance.new("Frame")

    -- Properties (UNCHANGED)
    RynixHub.Name = "RynixHub"
    RynixHub.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    RynixHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Main.Name = "Main"
    Main.Parent = RynixHub
    Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Main.BackgroundTransparency = 0.150
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.229009151, 0, 0.246323526, 0)
    Main.Size = UDim2.new(0, 491, 0, 275)

    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.107942976, 0, -0.0545454547, 0)
    Title.Size = UDim2.new(0, 491, 0, 68)
    Title.Font = Enum.Font.Unknown
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

    SupportedgamesCanbechangetoFeatures.Name = "Supportedgames(Can be change to Features)"
    SupportedgamesCanbechangetoFeatures.Parent = TabHolder
    SupportedgamesCanbechangetoFeatures.BackgroundTransparency = 1.000
    SupportedgamesCanbechangetoFeatures.Position = UDim2.new(0, 0, -0.0218181815, 0)
    SupportedgamesCanbechangetoFeatures.Size = UDim2.new(0, 121, 0, 50)
    SupportedgamesCanbechangetoFeatures.Font = Enum.Font.Unknown
    SupportedgamesCanbechangetoFeatures.Text = "Supported Games"
    SupportedgamesCanbechangetoFeatures.TextColor3 = Color3.fromRGB(255, 255, 255)
    SupportedgamesCanbechangetoFeatures.TextSize = 17.000

    Dash.Name = "Dash"
    Dash.Parent = TabHolder
    Dash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dash.BorderSizePixel = 0
    Dash.Position = UDim2.new(0, 0, 0.156363636, 0)
    Dash.Size = UDim2.new(0, 121, 0, 2)

    TheForge.Name = "TheForge"
    TheForge.Parent = TabHolder
    TheForge.BackgroundTransparency = 1.000
    TheForge.Position = UDim2.new(0, 0, 0.192727268, 0)
    TheForge.Size = UDim2.new(0, 121, 0, 33)
    TheForge.Font = Enum.Font.Unknown
    TheForge.Text = "The Forge(Beta)"
    TheForge.TextColor3 = Color3.fromRGB(177, 177, 177)
    TheForge.TextSize = 17.000

    UICorner_3.Parent = TheForge

    Exit.Name = "Exit"
    Exit.Parent = Main
    Exit.BackgroundTransparency = 1.000
    Exit.Position = UDim2.new(0.963340104, 0, 0.0327272713, 0)
    Exit.Size = UDim2.new(0, 18, 0, 5)
    Exit.Font = Enum.Font.SourceSansBold
    Exit.Text = "X"
    Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
    Exit.TextSize = 28.000

    UpdatelogsBasicallyatextlabelitis.Name = "Update logs(Basically a textlabel it is)"
    UpdatelogsBasicallyatextlabelitis.Parent = Main
    UpdatelogsBasicallyatextlabelitis.BackgroundTransparency = 1.000
    UpdatelogsBasicallyatextlabelitis.Position = UDim2.new(0.281059057, 0, 0.163636357, 0)
    UpdatelogsBasicallyatextlabelitis.Size = UDim2.new(0, 335, 0, 218)
    UpdatelogsBasicallyatextlabelitis.Font = Enum.Font.SourceSansBold
    UpdatelogsBasicallyatextlabelitis.TextColor3 = Color3.fromRGB(252, 252, 252)
    UpdatelogsBasicallyatextlabelitis.TextSize = 25.000

    Dash_2.Name = "Dash"
    Dash_2.Parent = Main
    Dash_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dash_2.BorderSizePixel = 0
    Dash_2.Position = UDim2.new(0.281059057, 0, 0.152727276, 0)
    Dash_2.Size = UDim2.new(0, 335, 0, 2)

    -- Behavior ONLY
    MakeDraggable(Title, Main)

    Exit.MouseButton1Click:Connect(function()
        RynixHub:Destroy()
    end)

    -- Return references ONLY
    return {
        Gui = RynixHub,
        Main = Main,
        Title = Title,
        TabHolder = TabHolder,
        TheForge = TheForge,
        ContentLabel = UpdatelogsBasicallyatextlabelitis
    }
end

return Module
