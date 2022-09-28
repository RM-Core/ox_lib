function lib.getIdentifiers(source)
    local identifiers = {}

    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local prefix = string.strsplit(':', GetPlayerIdentifier(source, i))
        identifiers[prefix] = GetPlayerIdentifier(source, i)
    end

    return identifiers
end

return lib