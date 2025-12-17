-- RynixHub UI Module (Tabbed)
-- The Forge = Tab

local RynixHubUI = {}
RynixHubUI.__index = RynixHubUI

function RynixHubUI:Create(parent)
    parent = parent or game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- ScreenGui
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "RynixHub"
    Gui.Parent = parent

    -- Main
    local Main = Instance.new("Frame")
    Main.Parent = Gui
    Main.BackgroundColor3 = Color3.fromRGB(0,0,0)
    Main.BackgroundTransparency = 0.15
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.229,0,0.246,0)
    Main.Size = UDim2.new(0,491,0,275)
    Instance.new("UICorner", Main)

    -- Title
    local Title = Instance.new("TextLabel", Main)
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.108,0,-0.055,0)
    Title.Size = UDim2.new(0,491,0,68)
    Title.Text = "RYNIX HUB"
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    Title.TextSize = 34
    Title.Font = Enum.Font.Unknown

    -- Tabs holder
    local TabHolder = Instance.new("Frame", Main)
    TabHolder.BackgroundColor3 = Color3.fromRGB(40,40,40)
    TabHolder.BorderSizePixel = 0
    TabHolder.Size = UDim2.new(0,121,0,275)
    Instance.new("UICorner", TabHolder)

    -- Header
    local Header = Instance.new("TextLabel", TabHolder)
    Header.BackgroundTransparency = 1
    Header.Size = UDim2.new(1,0,0,50)
    Header.Text = "Supported Games"
    Header.TextColor3 = Color3.fromRGB(255,255,255)
    Header.TextSize = 17
    Header.Font = Enum.Font.Unknown

    -- Indicator
    local Indicator = Instance.new("Frame", TabHolder)
    Indicator.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Indicator.BorderSizePixel = 0
    Indicator.Position = UDim2.new(0,0,0.156,0)
    Indicator.Size = UDim2.new(1,0,0,2)

    -- Content Holder
    local ContentHolder = Instance.new("Frame", Main)
    ContentHolder.BackgroundTransparency = 1
    ContentHolder.Position = UDim2.new(0.281,0,0.153,0)
    ContentHolder.Size = UDim2.new(0,335,0,222)

    -- =========================
    -- TABS
    -- =========================

    local Tabs = {}

    local function createTab(name, order)
        local Button = Instance.new("TextButton", TabHolder)
        Button.BackgroundTransparency = 1
        Button.Position = UDim2.new(0,0,0.193 + (order * 0.12),0)
        Button.Size = UDim2.new(1,0,0,33)
        Button.Text = name
        Button.TextColor3 = Color3.fromRGB(177,177,177)
        Button.TextSize = 17
        Button.Font = Enum.Font.Unknown
        Instance.new("UICorner", Button)

        local Content = Instance.new("Frame", ContentHolder)
        Content.Size = UDim2.new(1,0,1,0)
        Content.Visible = false
        Content.BackgroundTransparency = 1

        Tabs[name] = {Button = Button, Content = Content}
        return Tabs[name]
    end

    local function switchTab(tabName)
        for name, tab in pairs(Tabs) do
            local active = (name == tabName)
            tab.Content.Visible = active
            tab.Button.TextColor3 = active
                and Color3.fromRGB(255,255,255)
                or Color3.fromRGB(177,177,177)
        end
    end

    -- Create Forge Tab
    local ForgeTab = createTab("The Forge (Beta)", 0)

    -- Example content
    local Label = Instance.new("TextLabel", ForgeTab.Content)
    Label.Size = UDim2.new(1,0,1,0)
    Label.BackgroundTransparency = 1
    Label.Text = "The Forge Content"
    Label.TextColor3 = Color3.fromRGB(255,255,255)
    Label.TextSize = 25
    Label.Font = Enum.Font.SourceSansBold

    ForgeTab.Button.MouseButton1Click:Connect(function()
        switchTab("The Forge (Beta)")
    end)

    -- Default tab
    switchTab("The Forge (Beta)")

    return {
        Gui = Gui,
        Tabs = Tabs,
        SwitchTab = switchTab
    }
end

return RynixHubUI
