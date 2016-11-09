core.system = {}
core.requirements_to_systems = {}


local function importance_func(x1, x2)
	return game.systems[x1].importance > game.systems[x2].importance
end
local function __genOrderedIndex( t )
    local orderedIndex = {}
    if not t then
    	return {}
    end
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex, importance_func )
    return orderedIndex
end

local function orderedNext(t, state)
    -- Equivalent of the next function, but returns the keys in the alphabetic
    -- order. We use a temporary ordered key table that is stored in the
    -- table being iterated.

    key = nil
    --print("orderedNext: state = "..tostring(state) )
    if state == nil then
        -- the first time, generate the index
        if not t then return end
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
    else
        -- fetch the next value
        for i = 1,table.getn(t.__orderedIndex) do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i+1]
            end
        end
    end

    if key then
        return key, t[key]
    end

    -- no more value to return, cleanup
    t.__orderedIndex = nil
    return
end

function core.system.orderedPairs(t)
    -- Equivalent of the pairs() function on tables. Allows to iterate
    -- in order
    return orderedNext, t, nil
end
function core.system.add(system,typ) 
	if not system.importance then
		print("HOI")
		system.importance = 1
	end

	-- update requirements_to_systems array
		for k,v in pairs(system.requirements) do
			if core.requirements_to_systems[k] == nil then
				core.requirements_to_systems[k] = {}
			end
			core.requirements_to_systems[k][#core.requirements_to_systems[k]+1] = system
		end
	--

	system.targets = {}
	system.system_entities = {}
	local  b = { __mode = "v" }
	setmetatable(system.targets, b) 
	-- Add entity targets
	for k,v in pairs( game.entities ) do
		possible = true
		for requirement, _ in pairs(system.requirements) do
			if v[requirement] == nil then
				possible=  false
			end
		end
		if possible then
			system.targets[entity.id] = v
			entity.systems[system.name] = system
			if system.register then
					system.register(entity)
			end
		end
	end

	-- Store reference to system
	game.systems[system.name] = system
	system.id = #game.systems
	local found = false
	if type(typ) == "string" then
		typ = {typ}
	end
	for k,v in pairs( typ ) do
			if not game.system_categories[v]  then
				game.system_categories[v] = {}
			end
			game.system_categories[v][system.name] = system
			found = true
	
		
	end

	if found then
		return
	end
		error("Incorrect type ".. typ)

	
end


function core.system.remove(system)
	-- remove system from possible results from requirement
	
	for k,v in pairs(system.requirements)  do
		for l,w in pairs(core.requirements_to_systems[k]) do
			if w == system then
				core.requirements_to_systems[k][l] = nil
			end
		end
	end
	for k,v in pairs(system.targets) do
		if system.unregister then

			system.unregister(v)
			v.systems[system.name] = nil
		end
	end
	game.systems[system.name] = nil
	for k,v in pairs(game.system_categories) do
		if game.system_categories[v] then
			game.system_categories[v][system.name] = nil
		end
	end
	
	
end