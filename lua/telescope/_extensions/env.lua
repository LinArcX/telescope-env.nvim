local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local entry_display = require("telescope.pickers.entry_display")
local conf = require("telescope.config").values

local function prepare_environment_variables()
  local items = {}
  for key, value in pairs(vim.fn.environ()) do
    table.insert(items, { key, value })
  end
  return items
end

local function append_environment_name(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  actions.close(prompt_bufnr)
  if selection.value == "" then
    return
  end
  if vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "modifiable") then
    vim.api.nvim_put({ selection.value[1] }, "b", true, true)
  end
end

local function append_environment_value(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  actions.close(prompt_bufnr)
  if selection.value == "" then
    return
  end
  if vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "modifiable") then
    vim.api.nvim_put({ selection.value[2] }, "b", true, true)
  end
end

local function edit_environment_value(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  actions.close(prompt_bufnr)
  local value = vim.fn.input("[ENV] Enter new value: ", selection.value[2])
  if value == "" then
    return
  end
  print("Setting env %s=%s", selection.value[1], value)
  -- Only works for the current session
  vim.fn.setenv(selection.value[1], value)
end

local function show_environment_variables(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Environment Variables",
    finder = finders.new_table({
      results = prepare_environment_variables(),
      entry_maker = function(entry)
        local columns = vim.o.columns
        local tmp = conf.width
          or conf.layout_config.width
          or conf.layout_config[conf.layout_strategy].width
          or columns
        local width = require("telescope.config.resolve").resolve_width(tmp)(columns, vim.o.lines)
        local telescope_width
        if width > 1 then
          telescope_width = width
        else
          telescope_width = math.floor(columns * width)
        end
        local env_name_width = math.floor(columns * 0.05)
        local env_value_width = 22

        -- NOTE: the width calculating logic is not exact, but approx enough
        local displayer = entry_display.create({
          separator = " ▏",
          items = {
            { width = env_value_width },
            { width = telescope_width - env_name_width - env_value_width },
            { remaining = true },
          },
        })

        local function make_display()
          -- concatenating multiline env values
          local concatenated_width = entry[2]:gsub("\r?\n", " ")
          return displayer({
            { entry[1] },
            { concatenated_width },
          })
        end

        return {
          value = entry,
          display = make_display,
          ordinal = string.format("%s %s", entry[1], entry[2]),
        }
      end,
    }),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(append_environment_name)
      map("i", "<c-a>", append_environment_value)
      map("i", "<c-e>", edit_environment_value)
      return true
    end,
  }):find()
end

local function run()
  show_environment_variables()
end

return require("telescope").register_extension({
  exports = {
    -- Default when to argument is given, i.e. :Telescope env
    env = run,
  },
})
