local function request_command(command, arguments, callback)
	local clients =
			vim.lsp.get_clients { name = "purescriptls", bufnr = vim.api.nvim_get_current_buf() }
	if #clients == 0 then
		vim.notify("No active clients", vim.log.levels.WARN)
		return
	end

	for _, client in ipairs(clients) do
		client.request("workspace/executeCommand", {
			command = command,
			arguments = arguments,
		}, function(err, result, ctx)
			if err then vim.notify("Error in request_command: " .. vim.inspect(err), vim.log.levels.ERROR) end
			if callback then callback(err, result, ctx) end
		end)
	end
end

local function get_active_pos_info()
	local bufnr = vim.api.nvim_get_current_buf()
	local winnr = vim.api.nvim_get_current_win()
	local cursor = vim.api.nvim_win_get_cursor(winnr)
	local uri = vim.uri_from_bufnr(bufnr)

	return {
		pos = { line = cursor[1] - 1, character = cursor[2] },
		uri = uri,
		bufnr = bufnr,
	}
end
local function debug_print(value)
  vim.api.nvim_echo({{vim.inspect(value), 'None'}}, true, {})
end
local mod = {}

mod.case_split = function()
    vim.ui.input({ prompt = "Parameter type:" }, function(ty)
      if not ty then
        vim.notify("No type provided", vim.log.level.WARN)
        return
      end

      local info = get_active_pos_info()
      request_command(
        "purescript.caseSplit-explicit",
        {info.uri, info.pos.line, info.pos.character, ty},
        function (err, result)
          if err then
            vim.notify("Error in case split" .. vim.inspect(err), vim.log.leve.ERROR)
            return
          end
          debug_print(result)
          vim.notify("Case split applied successfully", vim.log.levels.INFO)
        end
      )
    end)
  end

mod.add_clause = function()
  local info = get_active_pos_info()
  request_command(
    "purescript.addClause-explicit",
    {info.uri, info.pos.line, info.pos.character},
    function (err, result)
      if err then
        vim.notify("Error in add clause" .. vim.inspect(err), vim.log.leve.ERROR)
        return
      end
      debug_print(result)
      vim.notify("Clause added successfully", vim.log.levels.INFO)
    end
  )
end


mod.load = function()
  vim.api.nvim_create_user_command(
    "PursCaseSplit",
    function(opts)
      mod.case_split()
    end,
    {}
  )

  vim.api.nvim_create_user_command(
    "PursAddClause",
    function(opts)
      mod.add_clause()
    end,
    {}
  )
end

return mod
