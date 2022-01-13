# :telescope: telescope-env.nvim

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

# Contribution
If you have any idea to improve this project, please create a pull-request for it. To make changes consistent, i have some rules:
1. Before submit your work, please format it with [StyLua](https://github.com/JohnnyMorganz/StyLua).
    1. Just go to root of the project and call: `stylua .`

2. There should be a one-to-one relation between features and pull requests. Please create separate pull-requests for each feature.
3. Please use [snake_case](https://en.wikipedia.org/wiki/Snake_case) for function names ans local variables

# Roadmap :blue_car:
- [ ] copy selected value when select an item in picker.
- [ ] ability to add temporary variables.
- [ ] use previews, because some variables like `PATH` don't fit on screen.
- [ ] `PATH` is a special variable! It's cool to allow people to add, remove and edit items of it.
