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


# Contribution
If you have any idea to improve this project, please create a pull-request for it. To make changes consistent, i have some rules:
1. Before submit your work, please format it with [StyLua](https://github.com/JohnnyMorganz/StyLua).
    1. Just go to root of the project and call: `stylua .`

2. There should be a one-to-one relation between features and pull requests. Please create separate pull-requests for each feature.
3. Please use [snake_case](https://en.wikipedia.org/wiki/Snake_case) for function names ans local variables
4. If your PR have more than one commit, please squash them into one.
5. Use meaningful name for variables and functions. Don't use abbreviations as far as you can.


# News

* 2022/01/13
  * append environment name to buffer( default behavior `<cr>`)
  * append environment value to buffer( mapping `<c-a>`)
  * edit environment value for the current session( mapping `<c-e>`)
  * fixes issue with fish terminal in multiline values

# Roadmap :blue_car:
- :heavy_check_mark: append environment name/value to buffer. (Thanks to: [sbulav](https://github.com/sbulav))
- :heavy_check_mark: edit environment value for the current session. (Thanks to: [sbulav](https://github.com/sbulav))
- [ ] ability to add new environment variables.
- [ ] use telescope previews, because some variables like `PATH` don't fit on screen.
- [ ] `PATH` is a special variable! It's cool to allow people to add, remove and edit items to/from/of it.
