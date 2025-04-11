local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
    Title = "Universal Script",
    SubTitle = "by YourNameHere",
    SaveFolder = "UniversalScriptConfig"
})

Window:AddMinimizeButton({
    Button = {
        Image = "rbxassetid://71014873973869",
        BackgroundTransparency = 0
    },
    Corner = {
        CornerRadius = UDim.new(0, 8)
    }
})

customSpeed = 16
customJump = 50
customGravity = 196.2
local speedEnabled = false
local jumpEnabled = false
local gravityEnabled = false
local infiniteJumpEnabled = false
local jumpConnection

local MainCheatsTab = Window:MakeTab({"Universal Exploits", "bug"})

MainCheatsTab:AddSection({"Speed Hacks"})

local Toggle1 = MainCheatsTab:AddToggle({
    Name = "Enable Speed Hack",
    Description = "Use this to toggle your <font color='rgb(0, 0, 225)'>speed</font>",
    Default = false 
})
Toggle1:Callback(function(Value)
    speedEnabled = Value
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = Value and customSpeed or 16
    else
        error("Humanoid not found.")
    end
end)

MainCheatsTab:AddTextBox({
    Name = "Speed Modifier Textbox",
    Description = "Use this to change your <font color='rgb(0, 0, 225)'>speed</font>",
    PlaceholderText = "Enter speed value",
    Callback = function(Value)
        local speedValue = tonumber(Value)
        if not speedValue then
            error("Invalid input. Please enter a valid number for speed.")
        end
        customSpeed = speedValue

        if speedEnabled then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = customSpeed
            end
        end
    end
})

MainCheatsTab:AddSection({"JumpPower Hacks"})

local JumpToggle = MainCheatsTab:AddToggle({
    Name = "Enable JumpPower Hack",
    Description = "Use this to toggle your <font color='rgb(0, 255, 255)'>JumpPower</font>",
    Default = false 
})
JumpToggle:Callback(function(Value)
    jumpEnabled = Value
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = Value and customJump or 50
    else
        error("Humanoid not found.")
    end
end)

MainCheatsTab:AddTextBox({
    Name = "JumpPower Modifier Textbox",
    Description = "Use this to change your <font color='rgb(0, 255, 255)'>JumpPower</font>",
    PlaceholderText = "Enter jump power value",
    Callback = function(Value)
        local jumpValue = tonumber(Value)
        if not jumpValue then
            error("Invalid input. Please enter a valid number for JumpPower.")
        end
        customJump = jumpValue

        if jumpEnabled then
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = customJump
            end
        end
    end
})

MainCheatsTab:AddSection({"Gravity Modification"})

local GravityToggle = MainCheatsTab:AddToggle({
    Name = "Enable Gravity Modification",
    Description = "Use this to toggle your <font color='rgb(128, 128, 128)'>Gravity</font>",
    Default = false 
})
GravityToggle:Callback(function(Value)
    gravityEnabled = Value
    game.Workspace.Gravity = Value and customGravity or 196.2
end)

MainCheatsTab:AddTextBox({
    Name = "Gravity Modifier Textbox",
    Description = "Use this to change your <font color='rgb(128, 128, 128)'>Gravity</font>",
    PlaceholderText = "Enter gravity value",
    Callback = function(Value)
        local gravValue = tonumber(Value)
        if not gravValue then
            error("Invalid input. Please enter a valid number for Gravity.")
        end
        customGravity = gravValue

        if gravityEnabled then
            game.Workspace.Gravity = customGravity
        end
    end
})

MainCheatsTab:AddSection({"Infinite Jump"})

local InfiniteJumpToggle = MainCheatsTab:AddToggle({
    Name = "Enable Infinite Jump",
    Description = "Use this to toggle <font color='rgb(255, 0, 0)'>Infinite Jump</font>",
    Default = false
})
InfiniteJumpToggle:Callback(function(Value)
    infiniteJumpEnabled = Value
    if Value then
        if not jumpConnection then
            jumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                if infiniteJumpEnabled then
                    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState("Jumping")
                    end
                end
            end)
        end
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
    end
end)

local UniversalScriptsTab = Window:MakeTab({"Universal Scripts", "code"})

UniversalScriptsTab:AddButton({
    Name = "<font color='rgb(255, 0, 0)'>Infinite Yield</font>",
    Description = "Loads Infinite Yield.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

UniversalScriptsTab:AddButton({
    Name = "<font color='rgb(128, 128, 128)'>Dex Explorer</font>",
    Description = "Loads Dex Explorer.",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
    end
})
