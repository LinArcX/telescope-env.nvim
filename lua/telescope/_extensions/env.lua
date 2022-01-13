local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local entry_display = require("telescope.pickers.entry_display")

local function prepareEnvironmentVariables()
  Items = {}
  for key, value in pairs(vim.fn.environ()) do
    table.insert(Items, { key, value })
  end
  return Items
end

local function showEnvironmentVariables(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Environment Variables",
    finder = finders.new_table({
      results = prepareEnvironmentVariables(),
      entry_maker = function(entry)
        local cols = vim.o.columns
        local width = conf.width or conf.layout_config.width or conf.layout_config[conf.layout_strategy].width or cols
        local tel_win_width
        if width > 1 then
          tel_win_width = width
        else
          tel_win_width = math.floor(cols * width)
        end
        local desc_width = math.floor(cols * 0.05)
        local command_width = 22

        -- NOTE: the width calculating logic is not exact, but approx enough
        local displayer = entry_display.create({
          separator = " ▏",
          items = {
            { width = command_width },
            { width = tel_win_width - desc_width - command_width },
            { remaining = true },
          },
        })

        local function make_display(ent)
          return displayer({
            { entry[1] },
            { entry[2] },
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
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
      end)
      return true
    end,
  }):find()
end

local function run()
  showEnvironmentVariables()
end

return require("telescope").register_extension({
  exports = {
    -- Default when to argument is given, i.e. :Telescope env
    env = run,
  },
})
