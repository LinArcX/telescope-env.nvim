# :telescope: telescope-env.nvim

Watch environment variables with telescope

# Demo

![Demo](https://user-images.githubusercontent.com/10884422/148600299-b318fe61-93f5-45dd-bea3-31b19426390a.gif)

# Installation

### Vim-Plug

```viml
Plug "nvim-telescope/telescope.nvim"
Plug "LinArcX/telescope-env.nvim"
```

### Packer

```lua
use { "nvim-telescope/telescope.nvim" }
use { "LinArcX/telescope-env.nvim" }
```

# Setup and Configuration

```lua
require('telescope').load_extension('env')
```

# Usage
`:Telescope env`

### Key mappings
| key     | Usage                                           |
|---------|-------------------------------------------------|
| `<cr>`  | append environment name to buffer               |
| `<c-a>` | append environment value to buffer              |
| `<c-e>` | edit environment value(for the current session) |


# Roadmap :blue_car:
- [x] copy selected value when select an item in picker.
- [ ] use previews because some variables like `PATH` don't fit on screen.
- [ ] ability to add temporary variables.
