-- ╔════════════════════════════════════════════════════════════╗
-- ║  Liquid Glass UI — Layout.lua
-- ║  Matches your screenshot style: Glass + Blue Accents
-- ╚════════════════════════════════════════════════════════════╝

local LiquidGlassUI = {}

function LiquidGlassUI:CreateUI()
    local Players = game:GetService("Players")
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- Cleanup old UI
    if PlayerGui:FindFirstChild("LiquidGlassUI") then
        PlayerGui.LiquidGlassUI:Destroy()
    end

    -- Root ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LiquidGlassUI"
    ScreenGui.Parent = PlayerGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- ══════════════════════════════════════════════════════════════
    -- MAIN WINDOW — Glass Effect
    -- ══════════════════════════════════════════════════════════════
    local MainWindow = Instance.new("Frame")
    MainWindow.Name = "MainWindow"
    MainWindow.Size = UDim2.fromOffset(520, 380)
    MainWindow.Position = UDim2.new(0.5, -260, 0.5, -190)
    MainWindow.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
    MainWindow.BackgroundTransparency = 0.3
    MainWindow.BorderSizePixel = 0
    MainWindow.CornerRadius = UDim.new(0, 16)
    MainWindow.ClipsDescendants = true
    MainWindow.Parent = ScreenGui

    -- Glass Blur & Gradient
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 16)
    UICorner.Parent = MainWindow

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new{
        Color3.fromRGB(45, 55, 75),
        Color3.fromRGB(28, 35, 55)
    }
    UIGradient.Rotation = 90
    UIGradient.Transparency = NumberSequence.new(0.25, 0.15)
    UIGradient.Parent = MainWindow

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Thickness = 1
    UIStroke.Color = Color3.fromRGB(100, 150, 255)
    UIStroke.Transparency = 0.5
    UIStroke.Parent = MainWindow

    -- ══════════════════════════════════════════════════════════════
    -- TITLE BAR
    -- ══════════════════════════════════════════════════════════════
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 50)
    TitleBar.BackgroundTransparency = 1
    TitleBar.Parent = MainWindow

    local HomeIcon = Instance.new("TextLabel")
    HomeIcon.Text = "📁"
    HomeIcon.Font = Enum.Font.GothamBold
    HomeIcon.TextSize = 18
    HomeIcon.TextColor3 = Color3.fromRGB(150, 200, 255)
    HomeIcon.Size = UDim2.fromOffset(30, 30)
    HomeIcon.Position = UDim2.new(0, 15, 0, 10)
    HomeIcon.BackgroundTransparency = 1
    HomeIcon.Parent = TitleBar

    local TitleText = Instance.new("TextLabel")
    TitleText.Text = "Home"
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextSize = 20
    TitleText.TextColor3 = Color3.fromRGB(240, 245, 255)
    TitleText.Size = UDim2.fromOffset(120, 30)
    TitleText.Position = UDim2.new(0, 55, 0, 10)
    TitleText.BackgroundTransparency = 1
    TitleText.Parent = TitleBar

    local SearchBox = Instance.new("TextBox")
    SearchBox.Text = ""
    SearchBox.PlaceholderText = "Search..."
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextSize = 14
    SearchBox.TextColor3 = Color3.fromRGB(220, 230, 245)
    SearchBox.PlaceholderColor3 = Color3.fromRGB(120, 140, 170)
    SearchBox.Size = UDim2.fromOffset(180, 32)
    SearchBox.Position = UDim2.new(1, -200, 0, 9)
    SearchBox.BackgroundColor3 = Color3.fromRGB(40, 55, 80)
    SearchBox.BackgroundTransparency = 0.4
    SearchBox.CornerRadius = UDim.new(0, 8)
    SearchBox.Parent = TitleBar

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Text = "✕"
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 14
    CloseBtn.TextColor3 = Color3.fromRGB(180, 190, 210)
    CloseBtn.Size = UDim2.fromOffset(28, 28)
    CloseBtn.Position = UDim2.new(1, -33, 0, 11)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Parent = TitleBar

    local MinBtn = Instance.new("TextButton")
    MinBtn.Text = "−"
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 16
    MinBtn.TextColor3 = Color3.fromRGB(180, 190, 210)
    MinBtn.Size = UDim2.fromOffset(28, 28)
    MinBtn.Position = UDim2.new(1, -66, 0, 11)
    MinBtn.BackgroundTransparency = 1
    MinBtn.Parent = TitleBar

    -- ══════════════════════════════════════════════════════════════
    -- CONTENT CONTAINER
    -- ══════════════════════════════════════════════════════════════
    local Content = Instance.new("Frame")
    Content.Name = "Content"
    Content.Size = UDim2.new(1, -30, 1, -70)
    Content.Position = UDim2.new(0, 15, 0, 55)
    Content.BackgroundTransparency = 1
    Content.Parent = MainWindow

    -- ─── TOGGLE ───
    local ToggleContainer = Instance.new("Frame")
    ToggleContainer.Size = UDim2.new(1, 0, 0, 44)
    ToggleContainer.BackgroundColor3 = Color3.fromRGB(50, 75, 120)
    ToggleContainer.BackgroundTransparency = 0.5
    ToggleContainer.CornerRadius = UDim.new(0, 8)
    ToggleContainer.Parent = Content

    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Text = "A toggle on Home"
    ToggleLabel.Font = Enum.Font.Gotham
    ToggleLabel.TextSize = 15
    ToggleLabel.TextColor3 = Color3.fromRGB(230, 240, 255)
    ToggleLabel.Size = UDim2.new(1, -55, 1, 0)
    ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    ToggleLabel.Parent = ToggleContainer

    local ToggleSwitch = Instance.new("TextButton")
    ToggleSwitch.Name = "ToggleSwitch"
    ToggleSwitch.Size = UDim2.fromOffset(46, 26)
    ToggleSwitch.Position = UDim2.new(1, -56, 0.5, -13)
    ToggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 200, 90)
    ToggleSwitch.CornerRadius = UDim.new(1, 0)
    ToggleSwitch.Text = ""
    ToggleSwitch.Parent = ToggleContainer

    local ToggleKnob = Instance.new("Frame")
    ToggleKnob.Size = UDim2.fromOffset(20, 20)
    ToggleKnob.Position = UDim2.new(1, -23, 0.5, -10)
    ToggleKnob.BackgroundColor3 = Color3.new(1,1,1)
    ToggleKnob.CornerRadius = UDim.new(1, 0)
    ToggleKnob.Name = "Knob"
    ToggleKnob.Parent = ToggleSwitch

    -- ─── SLIDER ───
    local SliderContainer = Instance.new("Frame")
    SliderContainer.Size = UDim2.new(1, 0, 0, 50)
    SliderContainer.Position = UDim2.new(0, 0, 0, 54)
    SliderContainer.BackgroundTransparency = 1
    SliderContainer.Parent = Content

    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Text = "Slider"
    SliderLabel.Font = Enum.Font.Gotham
    SliderLabel.TextSize = 15
    SliderLabel.TextColor3 = Color3.fromRGB(210, 225, 245)
    SliderLabel.Size = UDim2.new(0, 80, 0, 20)
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    SliderLabel.Parent = SliderContainer

    local SliderValue = Instance.new("TextLabel")
    SliderValue.Name = "ValueLabel"
    SliderValue.Text = "40"
    SliderValue.Font = Enum.Font.Gotham
    SliderValue.TextSize = 14
    SliderValue.TextColor3 = Color3.fromRGB(160, 180, 210)
    SliderValue.Size = UDim2.new(0, 40, 0, 20)
    SliderValue.Position = UDim2.new(1, -40, 0, 0)
    SliderValue.BackgroundTransparency = 1
    SliderValue.TextXAlignment = Enum.TextXAlignment.Right
    SliderValue.Parent = SliderContainer

    local SliderBg = Instance.new("Frame")
    SliderBg.Size = UDim2.new(1, 0, 0, 6)
    SliderBg.Position = UDim2.new(0, 0, 1, -6)
    SliderBg.BackgroundColor3 = Color3.fromRGB(60, 80, 110)
    SliderBg.CornerRadius = UDim.new(1, 0)
    SliderBg.Parent = SliderContainer

    local SliderFill = Instance.new("Frame")
    SliderFill.Name = "Fill"
    SliderFill.Size = UDim2.new(0.4, 0, 1, 0)
    SliderFill.BackgroundColor3 = Color3.fromRGB(60, 150, 255)
    SliderFill.CornerRadius = UDim.new(1, 0)
    SliderFill.Parent = SliderBg

    local SliderKnob = Instance.new("Frame")
    SliderKnob.Name = "Knob"
    SliderKnob.Size = UDim2.fromOffset(18, 18)
    SliderKnob.Position = UDim2.new(0.4, -9, 0.5, -9)
    SliderKnob.BackgroundColor3 = Color3.new(1,1,1)
    SliderKnob.CornerRadius = UDim.new(1, 0)
    SliderKnob.BorderSizePixel = 2
    SliderKnob.BorderColor3 = Color3.fromRGB(60, 150, 255)
    SliderKnob.Parent = SliderBg

    -- ─── DROPDOWN ───
    local DropContainer = Instance.new("Frame")
    DropContainer.Size = UDim2.new(1, 0, 0, 44)
    DropContainer.Position = UDim2.new(0, 0, 0, 114)
    DropContainer.BackgroundTransparency = 1
    DropContainer.Parent = Content

    local DropLabel = Instance.new("TextLabel")
    DropLabel.Text = "Dropdown"
    DropLabel.Font = Enum.Font.Gotham
    DropLabel.TextSize = 15
    DropLabel.TextColor3 = Color3.fromRGB(210, 225, 245)
    DropLabel.Size = UDim2.new(0, 100, 0, 20)
    DropLabel.BackgroundTransparency = 1
    DropLabel.TextXAlignment = Enum.TextXAlignment.Left
    DropLabel.Parent = DropContainer

    local DropBox = Instance.new("TextButton")
    DropBox.Name = "DropBox"
    DropBox.Size = UDim2.new(1, 0, 0, 36)
    DropBox.Position = UDim2.new(0, 0, 0, 8)
    DropBox.BackgroundColor3 = Color3.fromRGB(45, 70, 115)
    DropBox.BackgroundTransparency = 0.5
    DropBox.CornerRadius = UDim.new(0, 8)
    DropBox.Text = "Two"
    DropBox.Font = Enum.Font.Gotham
    DropBox.TextSize = 14
    DropBox.TextColor3 = Color3.fromRGB(230, 240, 255)
    DropBox.TextXAlignment = Enum.TextXAlignment.Left
    DropBox.Parent = DropContainer

    local DropArrow = Instance.new("TextLabel")
    DropArrow.Text = "▼"
    DropArrow.Font = Enum.Font.GothamBold
    DropArrow.TextSize = 10
    DropArrow.TextColor3 = Color3.fromRGB(160, 180, 210)
    DropArrow.Size = UDim2.fromOffset(20, 20)
    DropArrow.Position = UDim2.new(1, -25, 0.5, -10)
    DropArrow.BackgroundTransparency = 1
    DropArrow.Parent = DropBox

    -- ─── MAIN BUTTON ───
    local MainButton = Instance.new("TextButton")
    MainButton.Name = "MainButton"
    MainButton.Size = UDim2.new(1, 0, 0, 44)
    MainButton.Position = UDim2.new(0, 0, 0, 170)
    MainButton.BackgroundColor3 = Color3.fromRGB(50, 130, 255)
    MainButton.CornerRadius = UDim.new(0, 8)
    MainButton.Text = "Button"
    MainButton.Font = Enum.Font.GothamBold
    MainButton.TextSize = 15
    MainButton.TextColor3 = Color3.new(1,1,1)
    MainButton.Parent = Content

    local ButtonGrad = Instance.new("UIGradient")
    ButtonGrad.Color = ColorSequence.new{
        Color3.fromRGB(70, 160, 255),
        Color3.fromRGB(40, 110, 240)
    }
    ButtonGrad.Rotation = 90
    ButtonGrad.Parent = MainButton

    -- ══════════════════════════════════════════════════════════════
    -- BOTTOM NAVIGATION BAR
    -- ══════════════════════════════════════════════════════════════
    local BottomBar = Instance.new("Frame")
    BottomBar.Name = "BottomBar"
    BottomBar.Size = UDim2.new(1, 0, 0, 60)
    BottomBar.Position = UDim2.new(0, 0, 1, -65)
    BottomBar.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
    BottomBar.BackgroundTransparency = 0.4
    BottomBar.Parent = MainWindow

    local NavItems = {
        {Text = "Home", Icon = "🏠"},
        {Text = "Search", Icon = "🔍"},
        {Text = "Library", Icon = "📖"},
        {Text = "Profile", Icon = "👤"},
        {Text = "Settings", Icon = "⚙"}
    }

    for i, item in ipairs(NavItems) do
        local btn = Instance.new("Frame")
        btn.Size = UDim2.new(1/#NavItems, -5, 1, -10)
        btn.Position = UDim2.new((i-1)/#NavItems, 2.5, 0, 5)
        btn.BackgroundTransparency = 1
        btn.Parent = BottomBar

        local icon = Instance.new("TextLabel")
        icon.Text = item.Icon
        icon.Font = Enum.Font.Gotham
        icon.TextSize = 18
        icon.Size = UDim2.new(1, 0, 0, 24)
        icon.BackgroundTransparency = 1
        icon.Parent = btn

        local lbl = Instance.new("TextLabel")
        lbl.Text = item.Text
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 10
        lbl.TextColor3 = i == 1 and Color3.fromRGB(120, 180, 255) or Color3.fromRGB(140, 160, 190)
        lbl.Size = UDim2.new(1, 0, 0, 16)
        lbl.Position = UDim2.new(0, 0, 0, 22)
        lbl.BackgroundTransparency = 1
        lbl.Parent = btn

        if i == 1 then
            local indicator = Instance.new("Frame")
            indicator.Size = UDim2.fromOffset(24, 3)
            indicator.Position = UDim2.new(0.5, -12, 0, -2)
            indicator.BackgroundColor3 = Color3.fromRGB(90, 160, 255)
            indicator.CornerRadius = UDim.new(1,0)
            indicator.Parent = btn
        end
    end

    -- ══════════════════════════════════════════════════════════════
    -- MAKE WINDOW DRAGGABLE
    -- ══════════════════════════════════════════════════════════════
    local dragging, dragStart, startPos = false, nil, nil
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainWindow.Position
            input.Changed:Wait()
            dragging = false
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainWindow.Position = UDim2.new(
                startPos.Scale.X, startPos.Offset.X + delta.X,
                startPos.Scale.Y, startPos.Offset.Y + delta.Y
            )
        end
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Return references so Main.lua can connect features
    return {
        ScreenGui = ScreenGui,
        MainWindow = MainWindow,
        ToggleSwitch = ToggleSwitch,
        ToggleKnob = ToggleKnob,
        SliderFill = SliderFill,
        SliderKnob = SliderKnob,
        SliderValue = SliderValue,
        DropBox = DropBox,
        MainButton = MainButton,
        ToggleContainer = ToggleContainer
    }
end

return LiquidGlassUI
