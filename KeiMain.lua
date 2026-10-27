-- ╔════════════════════════════════════════════════════════════╗
-- ║  Main.lua — COMPLETE VERSION
-- ║  Loads Layout + Speed / Jump / Fly / Noclip Functions
-- ╚════════════════════════════════════════════════════════════╝

-- ===================== CONFIG =====================
-- 👇 REPLACE THIS URL WITH YOUR GITHUB RAW LINK TO Layout.lua
local LAYOUT_URL = "https://raw.githubusercontent.com/keidecio6-crypto/Keidecio/refs/heads/main/KeiLayout.lua"
-- ===================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Character, Humanoid, RootPart

-- ══════════════════════════════════════════════════════════════
-- FEATURE STATES & SETTINGS
-- ══════════════════════════════════════════════════════════════
local Features = {
    Speed = { Enabled = false, Value = 16, Default = 16 },
    JumpPower = { Enabled = false, Value = 50, Default = 50 },
    Fly = { Enabled = false, Speed = 50 },
    Noclip = { Enabled = false }
}

local Connections = {}

-- ══════════════════════════════════════════════════════════════
-- UPDATE CHARACTER REFERENCES
-- ══════════════════════════════════════════════════════════════
local function UpdateCharacter()
    Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    Humanoid = Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
end
UpdateCharacter()
LocalPlayer.CharacterAdded:Connect(UpdateCharacter)

-- ══════════════════════════════════════════════════════════════
-- 🚀 SPEED FUNCTION
-- ══════════════════════════════════════════════════════════════
local function SetSpeed(amount)
    Features.Speed.Value = amount
    if Humanoid then
        Humanoid.WalkSpeed = Features.Speed.Enabled and amount or Features.Speed.Default
    end
end

local function ToggleSpeed()
    Features.Speed.Enabled = not Features.Speed.Enabled
    SetSpeed(Features.Speed.Value)
end

-- ══════════════════════════════════════════════════════════════
-- ⬆️ JUMP FUNCTION
-- ══════════════════════════════════════════════════════════════
local function SetJumpPower(amount)
    Features.JumpPower.Value = amount
    if Humanoid then
        Humanoid.JumpPower = Features.JumpPower.Enabled and amount or Features.JumpPower.Default
    end
end

local function ToggleJump()
    Features.JumpPower.Enabled = not Features.JumpPower.Enabled
    SetJumpPower(Features.JumpPower.Value)
end

-- ══════════════════════════════════════════════════════════════
-- 🕊️ FLY FUNCTION
-- ══════════════════════════════════════════════════════════════
local function UpdateFly()
    if not Features.Fly.Enabled or not RootPart then return end
    
    local camCF = workspace.CurrentCamera.CFrame
    local moveDir = Vector3.new()
    
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += camCF.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir -= camCF.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir -= camCF.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += camCF.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir += Vector3.new(0, 1, 0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir -= Vector3.new(0, 1, 0) end
    
    moveDir = moveDir.Unit * Features.Fly.Speed
    RootPart.Velocity = Vector3.new(moveDir.X, moveDir.Y, moveDir.Z)
end

local function ToggleFly()
    Features.Fly.Enabled = not Features.Fly.Enabled
    if Features.Fly.Enabled then
        Humanoid.PlatformStand = true
        Connections.FlyLoop = RunService.RenderStepped:Connect(UpdateFly)
    else
        Humanoid.PlatformStand = false
        if Connections.FlyLoop then Connections.FlyLoop:Disconnect() end
        if RootPart then RootPart.Velocity = Vector3.new() end
    end
end

-- ══════════════════════════════════════════════════════════════
-- 👻 NOCLIP FUNCTION
-- ══════════════════════════════════════════════════════════════
local function UpdateNoclip()
    if not Features.Noclip.Enabled or not Character then return end
    for _, part in pairs(Character:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = false end
    end
end

local function ToggleNoclip()
    Features.Noclip.Enabled = not Features.Noclip.Enabled
    if Features.Noclip.Enabled then
        Connections.NoclipLoop = RunService.Stepped:Connect(UpdateNoclip)
    else
        if Connections.NoclipLoop then Connections.NoclipLoop:Disconnect() end
        if Humanoid then
            for _, part in pairs(Character:GetDescendants()) do
                if part:IsA("BasePart") and part ~= Humanoid.RootPart then
                    part.CanCollide = true
                end
            end
        end
    end
end

-- ══════════════════════════════════════════════════════════════
-- 📥 LOAD UI FROM GITHUB
-- ══════════════════════════════════════════════════════════════
local function LoadUI()
    local success, result = pcall(function()
        return loadstring(game:HttpGet(LAYOUT_URL))()
    end)
    
    if not success then
        warn("[!] Failed to load UI: " .. tostring(result))
        return nil
    end
    
    local UI = result:CreateUI()
    return UI
end

-- ══════════════════════════════════════════════════════════════
-- 🔗 CONNECT UI TO FUNCTIONS
-- ══════════════════════════════════════════════════════════════
local UI = LoadUI()
if UI then
    -- Toggle State
    local toggleState = true -- starts ON like your screenshot
    
    -- Connect Toggle Button
    UI.ToggleSwitch.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        TweenService:Create(UI.ToggleKnob, TweenInfo.new(0.15), {
            Position = toggleState and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
        }):Play()
        UI.ToggleSwitch.BackgroundColor3 = toggleState and Color3.fromRGB(40, 200, 90) or Color3.fromRGB(90, 95, 110)
        
        -- When main toggle turns OFF, disable all features
        if not toggleState then
            Features.Speed.Enabled = false
            Features.JumpPower.Enabled = false
            Features.Fly.Enabled = false
            Features.Noclip.Enabled = false
            if Humanoid then
                Humanoid.WalkSpeed = Features.Speed.Default
                Humanoid.JumpPower = Features.JumpPower.Default
                Humanoid.PlatformStand = false
            end
            if Connections.FlyLoop then Connections.FlyLoop:Disconnect() end
            if Connections.NoclipLoop then Connections.NoclipLoop:Disconnect() end
        end
    end)
    
    -- Slider logic (controls Speed value)
    local sliderMin, sliderMax = 16, 100
    local sliderVal = 40
    local function UpdateSlider(input)
        local pos = math.clamp((input.Position.X - UI.SliderFill.AbsolutePosition.X) / UI.SliderFill.AbsoluteSize.X, 0, 1)
        sliderVal = math.floor(sliderMin + pos * (sliderMax - sliderMin))
        UI.SliderValue.Text = tostring(sliderVal)
        UI.SliderFill.Size = UDim2.new(pos, 0, 1, 0)
        UI.SliderKnob.Position = UDim2.new(pos, -9, 0.5, -9)
        SetSpeed(sliderVal)
    end
    
    local draggingSlider = false
    UI.SliderKnob.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = true end end)
    UserInputService.InputChanged:Connect(function(i) if draggingSlider and i.UserInputType == Enum.UserInputType.MouseMovement then UpdateSlider(i) end end)
    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = false end end)
    
    -- Dropdown options
    local dropOptions = {"Speed", "Jump", "Fly", "Noclip"}
    local selectedIndex = 2 -- "Two" → default selection
    UI.DropBox.MouseButton1Click:Connect(function()
        selectedIndex = selectedIndex % #dropOptions + 1
        UI.DropBox.Text = dropOptions[selectedIndex]
    end)
    
    -- Main Button: activates selected feature
    UI.MainButton.MouseButton1Click:Connect(function()
        if not toggleState then return end -- main toggle must be ON
        
        local selected = dropOptions[selectedIndex]
        if selected == "Speed" then ToggleSpeed()
        elseif selected == "Jump" then ToggleJump()
        elseif selected == "Fly" then ToggleFly()
        elseif selected == "Noclip" then ToggleNoclip()
        end
    end)
    
    print("[✓] Liquid Glass UI Loaded Successfully")
end
