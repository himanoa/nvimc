local mod = {
  map = function(list, fn)
    local results = {}
    for k,v in pairs(list) do
      results.k = fn(k,v)
    end
    return results
  end,
  anyPredicate = function()
    return true
  end,
  pattern = function(value, patterns)
    -- [[
    -- ## example
    --
    -- ```lua
    -- pattern(value, {{
    --  predicate = function(value) 
    --    return value == 1
    --  end,
    --  andThen = function(value)
    --    return value + 1
    --  end
    -- }, {
    --  predicate = functional.anyPredicate,
    --  andThen = function(value)
    --    print("default")
    --  end
    -- }})
    -- ```
    -- ]]

    for _,pattern in pairs(patterns) do
      if pattern.predicate(value) then
        pattern.and_then(value)
      end
    end
  end,
  combine = function(...)
    local combinedTable = {}
    local arg = {...}

    for k, v in pairs(arg) do
      if type(v) == 'table' then
        for tk, tv in pairs(v) do
            table.insert(combinedTable, tv)
        end
      end
    end

    return combinedTable
  end
}

return mod
