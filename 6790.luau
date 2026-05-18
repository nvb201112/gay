-- // DELTA LIVE CONTAINER - INTENSITY 6790
-- Đã giảm intensity như bạn yêu cầu

print("🔥 DELTA CRASH MODE - INTENSITY 6790 ĐÃ BẬT")

local intensity = 6790
local spawnHeight = 500
local spawnRange = 2000

local workspace = game:GetService("Workspace")
local coregui = game:GetService("CoreGui")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

-- CPU Burn (nhiều luồng)
for i = 1, 12 do
    task.spawn(function()
        while true do
            for k = 1, 1800000 do
                local x = math.pow(math.random(), 9) * math.sin(tick() * 4000 + k) * math.tan(k)
            end
            task.wait(0)
        end
    end)
end

local function getSpawnPosition()
    local root = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root then
        return root.Position + Vector3.new(math.random(-spawnRange, spawnRange), spawnHeight + math.random(200, 450), math.random(-spawnRange, spawnRange))
    else
        return Vector3.new(math.random(-3000, 3000), 700, math.random(-3000, 3000))
    end
end

local function maxEffects(part)
    for i = 1, 25 do
        local p = Instance.new("ParticleEmitter")
        p.Texture = "rbxassetid://243098098"
        p.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.new(math.random(),math.random(),math.random())), ColorSequenceKeypoint.new(1, Color3.new(1,0,0))}
        p.Size = NumberSequence.new(math.random(22,50))
        p.Lifetime = NumberRange.new(5, 11)
        p.Rate = 850
        p.Speed = NumberRange.new(120, 320)
        p.SpreadAngle = Vector2.new(160, 160)
        p.Brightness = 25
        p.Parent = part
    end

    for i = 1, 16 do
        local a0 = Instance.new("Attachment", part)
        local a1 = Instance.new("Attachment", part)
        local beam = Instance.new("Beam", part)
        beam.Attachment0 = a0
        beam.Attachment1 = a1
        beam.Color = ColorSequence.new(Color3.new(math.random(), math.random(), math.random()))
        beam.Width0 = math.random(12,42)
        beam.Width1 = math.random(12,42)
        beam.Segments = 180
    end
end

local function spamEverything()
    -- Sound
    for i = 1, 450 do
        local s = Instance.new("Sound")
        s.SoundId = "rbxassetid://131057809"
        s.Volume = 10
        s.PlaybackSpeed = math.random(20,500)/100
        s.Parent = workspace
        s:Play()
    end

    -- Model
    for i = 1, 900 do
        local model = Instance.new("Model")
        for j = 1, 28 do
            local p = Instance.new("Part")
            p.Size = Vector3.new(math.random(60,160), math.random(60,160), math.random(60,160))
            p.Position = Vector3.new(math.random(-2500,2500), math.random(100,1500), math.random(-2500,2500))
            p.Color = Color3.new(math.random(), math.random(), math.random())
            p.Material = Enum.Material.Neon
            p.Parent = model
        end
        model.Parent = workspace
    end

    -- GUI
    for i = 1, 2200 do
        local f = Instance.new("Frame")
        f.Size = UDim2.new(0, math.random(250,950), 0, math.random(250,950))
        f.Position = UDim2.new(math.random(),0,math.random(),0)
        f.BackgroundColor3 = Color3.new(math.random(), math.random(), math.random())
        f.BackgroundTransparency = 0.2
        f.Parent = coregui
    end
end

-- ====================== MAIN LOOP ======================
while true do
    for i = 1, intensity do
        local part = Instance.new("Part")
        part.Size = Vector3.new(math.random(75,190), math.random(75,190), math.random(75,190))
        part.Position = getSpawnPosition()
        part.Color = Color3.new(math.random(), math.random(), math.random())
        part.Material = Enum.Material.Neon
        part.Transparency = 0.02
        part.Parent = workspace
        
        maxEffects(part)
    end
    
    spamEverything()
    
    for i = 1, 2500000 do
        local x = math.pow(math.random(), 10) * math.sin(tick() * 6000)
    end
    
    task.wait(0)
end
-- ======================================================
