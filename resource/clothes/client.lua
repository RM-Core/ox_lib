local appearance = {}
appearance.skin = {}
appearance.outfit = {}

local Clothes = {
    male = {},
    female = {}
}

local Skins = {
    male = {},
    female = {}
}

function insert(tbl, value)
    tbl[#tbl + 1] = value
end

CreateThread(function()
    for _, v in pairs(pedClothes.female) do
        if v.category_hashname == "heads" or v.category_hashname == "eyes" or v.category_hashname == "bodies_upper" or
            v.category_hashname == "bodies_lower" or
            v.category_hashname == "hair" then
            if Skins.female[v.category_hashname] == nil then Skins.female[v.category_hashname] = {} end
            local category = Skins.female[v.category_hashname]
            insert(category, v.hash)
        else
            if Clothes.female[v.category_hashname] == nil then Clothes.female[v.category_hashname] = {} end
            local category = Clothes.female[v.category_hashname]
            insert(category, v.hash)
        end
    end

    for _, v in pairs(pedClothes.male) do
        if v.category_hashname == "heads" or v.category_hashname == "eyes" or v.category_hashname == "bodies_upper" or
            v.category_hashname == "bodies_lower" or v.category_hashname == "beards_complete" or
            v.category_hashname == "hair" then
            if Skins.male[v.category_hashname] == nil then Skins.male[v.category_hashname] = {} end
            local category = Skins.male[v.category_hashname]
            insert(category, v.hash)
        else
            if Clothes.male[v.category_hashname] == nil then Clothes.male[v.category_hashname] = {} end
            local category = Clothes.male[v.category_hashname]
            insert(category, v.hash)
        end
    end
end)

function lib.getClothes(sex)
    return Clothes[sex]
end

function lib.getSkins(sex)
    return Skins[sex]
end

function lib.getFeatures()
    return Config.features
end

function lib.getAppearance(appearanceType)
    if appearance[appearanceType] then return appearance[appearanceType] end
end

function lib.fixClothes(ped)
    local pedType = IsPedMale(ped) and "male" or "female"
    while not Natives.IsPedReadyToRender(ped) do Wait(0) end
    if pedType == "male" then
        Natives.ApplyShopItemToPed(ped, 0x158cb7f2, true, true, true)
        Natives.ApplyShopItemToPed(ped, 361562633, true, true, true)
        Natives.ApplyShopItemToPed(ped, 62321923, true, true, true)
        Natives.ApplyShopItemToPed(ped, 3550965899, true, true, true)
        Natives.ApplyShopItemToPed(ped, 612262189, true, true, true)
        Natives.ApplyShopItemToPed(ped, 319152566, true, true, true)
        Natives.ApplyShopItemToPed(ped, 0x2CD2CB71, true, true, true)
        Natives.ApplyShopItemToPed(ped, 0x151EAB71, true, true, true)
        Natives.ApplyShopItemToPed(ped, 0x1A6D27DD, true, true, true)
    else
        Natives.ApplyShopItemToPed(ped, 0x1E6FDDFB, true, true, true)
        Natives.ApplyShopItemToPed(ped, 272798698, true, true, true)
        Natives.ApplyShopItemToPed(ped, 869083847, true, true, true)
        Natives.ApplyShopItemToPed(ped, 736263364, true, true, true)
        Natives.ApplyShopItemToPed(ped, 0x193FCEC4, true, true, true)
        Natives.ApplyShopItemToPed(ped, 0x285F3566, true, true, true)
        Natives.ApplyShopItemToPed(ped, 0x134D7E03, true, true, true)
    end
end

function lib.defaultTorsoAndLegs(ped, value)
    local pedType = IsPedMale(ped) and "male" or "female"
    local torso = nil
    local legs = nil
    local maleTexture = nil
    local femaleTexture = nil
    if value == 1 then
        legs = Skins[pedType].bodies_lower[1]
        torso = Skins[pedType].bodies_upper[1]
        if pedType == "male" then maleTexture = GetHashKey("mp_head_mr1_sc08_c0_000_ab") end
        if pedType == "female" then femaleTexture = GetHashKey("mp_head_fr1_sc08_c0_000_ab") end
    elseif value == 2 then
        legs = Skins[pedType].bodies_lower[3]
        torso = Skins[pedType].bodies_upper[3]
        if pedType == "male" then maleTexture = GetHashKey("head_mr1_sc02_rough_c0_002_a") end
        if pedType == "female" then femaleTexture = GetHashKey("MP_head_fr1_sc03_c0_000_ab") end
    elseif value == 3 then
        legs = Skins[pedType].bodies_lower[8]
        torso = Skins[pedType].bodies_upper[8]
        if pedType == "male" then maleTexture = GetHashKey("MP_head_mr1_sc01_c0_000_ab") end
        if pedType == "female" then femaleTexture = GetHashKey("MP_head_fr1_sc01_c0_000_ab") end
    elseif value == 4 then
        legs = Skins[pedType].bodies_lower[10]
        torso = Skins[pedType].bodies_upper[10]
        if pedType == "male" then maleTexture = GetHashKey("MP_head_mr1_sc03_c0_000_ab") end
        if pedType == "female" then femaleTexture = GetHashKey("MP_head_fr1_sc03_c0_000_ab") end
    elseif value == 5 then
        legs = Skins[pedType].bodies_lower[11]
        torso = Skins[pedType].bodies_upper[11]
        if pedType == "male" then maleTexture = GetHashKey("head_mr1_sc04_rough_c0_002_ab") end
        if pedType == "female" then femaleTexture = GetHashKey("head_fr1_sc04_rough_c0_002_ab") end
    elseif value == 6 then
        legs = Skins[pedType].bodies_lower[30]
        torso = Skins[pedType].bodies_upper[30]
        if pedType == "male" then maleTexture = GetHashKey("MP_head_mr1_sc05_c0_000_ab") end
        if pedType == "female" then femaleTexture = GetHashKey("MP_head_fr1_sc05_c0_000_ab") end
    end
    Natives.ApplyShopItemToPed(ped, legs, false, true, true)
    Natives.ApplyShopItemToPed(ped, torso, false, true, true)
    Natives.ClearSomething(ped)
    if pedType == "male" then
        return maleTexture
    else
        return femaleTexture
    end
end

function lib.renderPed(ped, data)
    local pedType = IsPedMale(ped) and "male" or "female"
    local clothes = Clothes[pedType]
    local skins = Skins[pedType]
    local splitString = string.strsplit("_", data.name, 3)
    while not Natives.IsPedReadyToRender(ped) do Wait(0) end
    if data.type == "clothes" then
        if data.value <= 0 then
            if pedType == "male" then
                Natives.RemoveTagFromMetaPed(ped, GetHashKey(data.name), 0)
            else
                Natives.RemoveTagFromMetaPed(ped, GetHashKey(data.name), 7) -- should we use 7 for females?? i dont really know
            end
        else
            local component = clothes[data.name][data.value]
            Natives.ApplyShopItemToPed(ped, component, false, true, true)
            if appearance.outfit[data.name] and data.value <= 0 then
                appearance.outfit[data.name] = nil
            else
                appearance.outfit[data.name] = {
                    value = data.value,
                    type = data.type
                }
            end
        end
    elseif data.type == "skins" then
        if data.name == "skin" then
            local texture = lib.defaultTorsoAndLegs(ped, data.value)
            if pedType == "male" then texture_types.male.albedo = texture end
            if pedType == "female" then texture_types.female.albedo = texture end
        elseif splitString == "features" then
            local _, featureName = string.strsplit("_", data.name, 2)
            local hash = Shared.features[featureName]
            Natives.SetPedFaceFeature(ped, hash, data.value / 100)
        else
            local component = skins[data.name][data.value]
            Natives.ApplyShopItemToPed(ped, component, false, true, true)
        end
        if appearance.skin[data.name] and data.value <= 0 then
            appearance.skin[data.name] = nil
        else
            appearance.skin[data.name] = {
                value = data.value,
                type = data.type
            }
        end
    end

    Natives.ClearSomething(ped)
    Natives.UpdatePedVariation(ped, 0, 1, 1, 1, 0)
    Citizen.InvokeNative(0xaab86462966168ce, ped, true) -- i dont know what this is doing
    Citizen.InvokeNative(0x704c908e9c405136, ped) -- i dont know what this is doing
    Citizen.InvokeNative(0x59BD177A1A48600A, ped, 1) -- i dont know what this is doing
end