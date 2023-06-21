local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local opts = {
	prompt_title = 'Change Directory',
	dir_command = {'fd', '--type=d', '--hidden', '--max-depth=3', '.', os.getenv('HOME')},
	command_executer = {'bash', '-c'},
	previewer_command = 'ls -a',
	pager_command = 'bat --plain --paging=always --pager="less -Rs"',
	entry_maker = function(line)
		return {
			value = line,
			display = function(entry)
				return ' '.. line:gsub(os.getenv('HOME') .. '/', ''),
				{ { {1, 3}, 'Directory' } }
			end,
			ordinal = line
		}
	end,
}

--[[ local function setup(o)
	o = o or {}
	opts = vim.tbl_deep_extend('force', opts, o)
end ]]

telescopecd = {}
telescopecd.cd = function(o)
	o = o and vim.tbl_deep_extend('force', opts, o) or {}
	pickers.new(o, {
		prompt_title = o.prompt_title,
		finder = finders.new_oneshot_job(o.dir_command, o),
		previewer = previewers.new_termopen_previewer({
			get_command = function(entry)
				return vim.tbl_flatten({
					o.command_executer,
					o.previewer_command
					.. ' '
					.. '"'
					.. entry.value
					.. '"'
					.. '|'
					.. o.pager_command
				})
			end
		}),
		sorter = sorters.get_fuzzy_file(),
		attach_mappings = function(prompt_bufnr, _)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local directory = action_state.get_selected_entry()
				if directory ~= nil then
					vim.api.nvim_command('cd ' .. directory.value)
				end
			end)
			return true
		end
	}):find()
end

return telescopecd
