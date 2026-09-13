--========================================================--
--                       ZILO                             --
--              Modern Character Changer                  --
--                     Code: zilo                         --
--========================================================--

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer

--========================================================--
-- CHARACTER LIST
--========================================================--

local Characters = {
    "XP_hhho",
    "banananuii",
    "yChxiSan",
    "virrtualdreams",
    "zzeyonn",
    "XETERENA",
    "sebvered",
    "faak4577",
    "ItsJade_2030",
    "Q66ns",
    "TeufelsliedI",
    "vmpirehunt3r",
    "tyue65656",
    "Ares_cgn",
    "DJGoldielocs",
    "txzarsp",
    "cr0okedSprinkles",
    "lovlymoeru",
    "kays_341",
    "1Azooz787",
    "mar2008marwan",
    "krisswvz",
    "PinkPrincessSeren",
    "msko_eooks",
    "chunyushanshan",
    "Vola_YIS"
}

--========================================================--
-- COLORS
--========================================================--

local BG = Color3.fromRGB(8, 8, 10)
local PANEL = Color3.fromRGB(14, 14, 17)
local CARD = Color3.fromRGB(20, 20, 24)
local CARD_HOVER = Color3.fromRGB(29, 29, 34)

local WHITE = Color3.fromRGB(245, 245, 248)
local GREY = Color3.fromRGB(145, 145, 155)
local DARK_GREY = Color3.fromRGB(75, 75, 85)

local ACCENT = Color3.fromRGB(150, 90, 255)
local ACCENT_DARK = Color3.fromRGB(80, 45, 150)

--========================================================--
-- HELPERS
--========================================================--

local function Corner(Object, Radius)
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, Radius)
    C.Parent = Object
    return C
end

local function Stroke(Object, Transparency)
    local S = Instance.new("UIStroke")
    S.Color = Color3.fromRGB(255, 255, 255)
    S.Transparency = Transparency or 0.9
    S.Thickness = 1
    S.Parent = Object
    return S
end

local function Tween(Object, Time, Properties)
    return TweenService:Create(
        Object,
        TweenInfo.new(Time, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        Properties
    )
end

--========================================================--
-- GUI
--========================================================--

local Gui = Instance.new("ScreenGui")
Gui.Name = "Zilo"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = Player:WaitForChild("PlayerGui")

--========================================================--
-- MAIN WINDOW
--========================================================--

local Main = Instance.new("Frame")
Main.Name = "ZiloWindow"
Main.Size = UDim2.new(0, 440, 0, 570)
Main.Position = UDim2.new(0.5, -220, 0.5, -285)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.Parent = Gui

Corner(Main, 16)
Stroke(Main, 0.88)

--========================================================--
-- TOP BAR
--========================================================--

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1, 0, 0, 70)
Top.BackgroundColor3 = PANEL
Top.BorderSizePixel = 0
Top.Parent = Main

Corner(Top, 16)

-- Logo
local Logo = Instance.new("Frame")
Logo.Size = UDim2.new(0, 44, 0, 44)
Logo.Position = UDim2.new(0, 12, 0, 13)
Logo.BackgroundColor3 = ACCENT_DARK
Logo.BorderSizePixel = 0
Logo.Parent = Top

Corner(Logo, 12)

local LogoText = Instance.new("TextLabel")
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.BackgroundTransparency = 1
LogoText.Text = "Z"
LogoText.TextColor3 = WHITE
LogoText.TextSize = 24
LogoText.Font = Enum.Font.GothamBlack
LogoText.Parent = Logo

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 0, 28)
Title.Position = UDim2.new(0, 68, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "Zilo"
Title.TextColor3 = WHITE
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(0, 220, 0, 20)
Sub.Position = UDim2.new(0, 69, 0, 38)
Sub.BackgroundTransparency = 1
Sub.Text = "Character changer • zilo"
Sub.TextColor3 = GREY
Sub.TextSize = 11
Sub.Font = Enum.Font.Gotham
Sub.TextXAlignment = Enum.TextXAlignment.Left
Sub.Parent = Top

--========================================================--
-- CLOSE BUTTON
--========================================================--

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 34, 0, 34)
Close.Position = UDim2.new(1, -46, 0, 12)
Close.BackgroundColor3 = Color3.fromRGB(35, 20, 24)
Close.BorderSizePixel = 0
Close.Text = "×"
Close.TextColor3 = Color3.fromRGB(255, 100, 110)
Close.TextSize = 23
Close.Font = Enum.Font.GothamBold
Close.AutoButtonColor = false
Close.Parent = Top

Corner(Close, 10)

Close.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

--========================================================--
-- MINIMIZE
--========================================================--

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0, 34, 0, 34)
Minimize.Position = UDim2.new(1, -88, 0, 12)
Minimize.BackgroundColor3 = Color3.fromRGB(28, 28, 33)
Minimize.BorderSizePixel = 0
Minimize.Text = "−"
Minimize.TextColor3 = WHITE
Minimize.TextSize = 20
Minimize.Font = Enum.Font.GothamBold
Minimize.AutoButtonColor = false
Minimize.Parent = Top

Corner(Minimize, 10)

--========================================================--
-- CHAR TAB
--========================================================--

local Tab = Instance.new("TextButton")
Tab.Size = UDim2.new(0, 110, 0, 38)
Tab.Position = UDim2.new(0, 14, 0, 82)
Tab.BackgroundColor3 = ACCENT_DARK
Tab.BorderSizePixel = 0
Tab.Text = "  ✦  CHAR"
Tab.TextColor3 = WHITE
Tab.TextSize = 13
Tab.Font = Enum.Font.GothamBold
Tab.TextXAlignment = Enum.TextXAlignment.Left
Tab.AutoButtonColor = false
Tab.Parent = Main

Corner(Tab, 10)

--========================================================--
-- SEARCH
--========================================================--

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -138, 0, 38)
SearchBox.Position = UDim2.new(0, 132, 0, 82)
SearchBox.BackgroundColor3 = CARD
SearchBox.BorderSizePixel = 0
SearchBox.PlaceholderText = "Search character..."
SearchBox.PlaceholderColor3 = DARK_GREY
SearchBox.Text = ""
SearchBox.TextColor3 = WHITE
SearchBox.TextSize = 12
SearchBox.Font = Enum.Font.Gotham
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = Main

Corner(SearchBox, 10)

--========================================================--
-- LIST
--========================================================--

local List = Instance.new("ScrollingFrame")
List.Name = "CharacterList"
List.Size = UDim2.new(1, -28, 1, -142)
List.Position = UDim2.new(0, 14, 0, 132)
List.BackgroundTransparency = 1
List.BorderSizePixel = 0
List.ScrollBarThickness = 3
List.ScrollBarImageColor3 = ACCENT
List.CanvasSize = UDim2.new(0, 0, 0, 0)
List.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 8)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = List

local Padding = Instance.new("UIPadding")
Padding.PaddingBottom = UDim.new(0, 10)
Padding.Parent = List

--========================================================--
-- SEND COMMAND
--========================================================--

local function SendCommand(Username)

    local Message = "/char " .. Username

    -- Modern Roblox chat
    local Channels = TextChatService:FindFirstChild("TextChannels")

    if Channels then

        local General = Channels:FindFirstChild("RBXGeneral")

        if General then
            task.spawn(function()
                pcall(function()
                    General:SendAsync(Message)
                end)
            end)

            return
        end
    end

    -- Legacy fallback
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local Events =
        ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")

    if Events then

        local Request =
            Events:FindFirstChild("SayMessageRequest")

        if Request then
            pcall(function()
                Request:FireServer(Message, "All")
            end)
        end
    end
end

--========================================================--
-- CREATE CHARACTER CARD
--========================================================--

local Cards = {}

local function CreateCard(Username, Index)

    local Card = Instance.new("TextButton")
    Card.Name = Username
    Card.Size = UDim2.new(1, -6, 0, 68)
    Card.BackgroundColor3 = CARD
    Card.BorderSizePixel = 0
    Card.Text = ""
    Card.AutoButtonColor = false
    Card.LayoutOrder = Index
    Card.Parent = List

    Corner(Card, 11)
    Stroke(Card, 0.94)

    -- Avatar
    local Avatar = Instance.new("ImageLabel")
    Avatar.Name = "Avatar"
    Avatar.Size = UDim2.new(0, 52, 0, 52)
    Avatar.Position = UDim2.new(0, 8, 0.5, -26)
    Avatar.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
    Avatar.BorderSizePixel = 0
    Avatar.Image = ""
    Avatar.ScaleType = Enum.ScaleType.Crop
    Avatar.Parent = Card

    Corner(Avatar, 10)

    -- Avatar is NOT a button.
    -- Clicking the photo will therefore click the card
    -- instead of moving the photo.

    -- Username
    local Name = Instance.new("TextLabel")
    Name.Size = UDim2.new(1, -145, 0, 23)
    Name.Position = UDim2.new(0, 72, 0, 11)
    Name.BackgroundTransparency = 1
    Name.Text = Username
    Name.TextColor3 = WHITE
    Name.TextSize = 14
    Name.Font = Enum.Font.GothamBold
    Name.TextXAlignment = Enum.TextXAlignment.Left
    Name.Parent = Card

    -- Command
    local Command = Instance.new("TextLabel")
    Command.Size = UDim2.new(1, -145, 0, 18)
    Command.Position = UDim2.new(0, 72, 0, 35)
    Command.BackgroundTransparency = 1
    Command.Text = "/char " .. Username
    Command.TextColor3 = GREY
    Command.TextSize = 10
    Command.Font = Enum.Font.Gotham
    Command.TextXAlignment = Enum.TextXAlignment.Left
    Command.Parent = Card

    -- Click indicator
    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0, 35, 0, 30)
    Arrow.Position = UDim2.new(1, -45, 0.5, -15)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "›"
    Arrow.TextColor3 = DARK_GREY
    Arrow.TextSize = 25
    Arrow.Font = Enum.Font.GothamBold
    Arrow.Parent = Card

    -- Load avatar in background
    task.spawn(function()

        local Success, UserId = pcall(function()
            return Players:GetUserIdFromNameAsync(Username)
        end)

        if Success and UserId then

            local Image =
                "rbxthumb://type=AvatarHeadShot&id="
                .. tostring(UserId)
                .. "&w=150&h=150"

            Avatar.Image = Image
        end
    end)

    -- Instant click
    Card.MouseButton1Click:Connect(function()

        SendCommand(Username)

        Tween(Card, 0.08, {
            BackgroundColor3 = ACCENT_DARK
        }):Play()

        Tween(Arrow, 0.08, {
            TextColor3 = WHITE
        }):Play()

        task.delay(0.12, function()

            if Card.Parent then

                Tween(Card, 0.15, {
                    BackgroundColor3 = CARD
                }):Play()

                Tween(Arrow, 0.15, {
                    TextColor3 = DARK_GREY
                }):Play()

            end
        end)
    end)

    -- Hover
    Card.MouseEnter:Connect(function()

        Tween(Card, 0.15, {
            BackgroundColor3 = CARD_HOVER
        }):Play()

        Tween(Arrow, 0.15, {
            TextColor3 = WHITE
        }):Play()

    end)

    Card.MouseLeave:Connect(function()

        Tween(Card, 0.15, {
            BackgroundColor3 = CARD
        }):Play()

        Tween(Arrow, 0.15, {
            TextColor3 = DARK_GREY
        }):Play()

    end)

    table.insert(Cards, {
        Button = Card,
        Username = Username
    })
end

-- Create all cards
for Index, Username in ipairs(Characters) do
    CreateCard(Username, Index)
end

--========================================================--
-- SEARCH FILTER
--========================================================--

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()

    local Query = string.lower(SearchBox.Text)

    for _, Data in ipairs(Cards) do

        local Match =
            Query == ""
            or string.find(
                string.lower(Data.Username),
                Query,
                1,
                true
            )

        Data.Button.Visible = Match
    end

    task.wait()

    List.CanvasSize = UDim2.new(
        0,
        0,
        0,
        Layout.AbsoluteContentSize.Y + 15
    )
end)

--========================================================--
-- UPDATE SCROLL
--========================================================--

Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

    List.CanvasSize = UDim2.new(
        0,
        0,
        0,
        Layout.AbsoluteContentSize.Y + 15
    )

end)

task.wait()

List.CanvasSize = UDim2.new(
    0,
    0,
    0,
    Layout.AbsoluteContentSize.Y + 15
)

--========================================================--
-- MINIMIZE
--========================================================--

local Minimized = false
local OriginalSize = Main.Size

Minimize.MouseButton1Click:Connect(function()

    Minimized = not Minimized

    if Minimized then

        Tween(Main, 0.25, {
            Size = UDim2.new(0, 440, 0, 70)
        }):Play()

        Tab.Visible = false
        SearchBox.Visible = false
        List.Visible = false

    else

        Tween(Main, 0.25, {
            Size = OriginalSize
        }):Play()

        task.delay(0.12, function()

            if Main.Parent then
                Tab.Visible = true
                SearchBox.Visible = true
                List.Visible = true
            end

        end)
    end

end)

--========================================================--
-- DRAG WINDOW
--========================================================--

local Dragging = false
local DragStart
local StartPosition

Top.InputBegan:Connect(function(Input)

    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = Input.Position
        StartPosition = Main.Position

    end

end)

UserInputService.InputChanged:Connect(function(Input)

    if not Dragging then
        return
    end

    if Input.UserInputType == Enum.UserInputType.MouseMovement
        or Input.UserInputType == Enum.UserInputType.Touch then

        local Delta = Input.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )

    end

end)

UserInputService.InputEnded:Connect(function(Input)

    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = false

    end

end)

--========================================================--
-- OPEN ANIMATION
--========================================================--

Main.Size = UDim2.new(0, 400, 0, 0)

Tween(Main, 0.35, {
    Size = OriginalSize
}):Play()

print("Zilo loaded • zilo")
