function lib.loadModel(model)
    if type(model) ~= "number" then model = GetHashKey(model) end
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end
    end
end

function lib.instancePlayer(instance)
    if instance then
        NetworkStartSoloTutorialSession()
    else
        NetworkEndTutorialSession()
    end
end

function lib.createCam(coords, rot, shouldRender)
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
    if type(coords) ~= "vector3" then coords = vector3(coords.x, coords.y, coords.z) end
    if type(rot) ~= "vector3" then rot = vector3(coords.x, coords.y, coords.z) end
    SetCamCoord(cam, coords.x, coords.y, coords.z)
    SetCamRot(cam, rot.x, rot.y, rot.z)
    SetCamActive(cam, true)
    if shouldRender then
        RenderScriptCams(true, false, 1, true, true)
    end
    return cam
end