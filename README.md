# :telescope: telescope-env.nvim

# Demo

![Demo](./telescope-env.gif)


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

# Roadmap :blue_car:
- [ ] copy selected value when select an item in picker.
- [ ] use previews because some variables like `PATH` don't fit on screen.
- [ ] ability to add temporary variables.
