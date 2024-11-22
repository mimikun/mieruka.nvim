# supplement.nvim

> Distinguish between the infamous en and em dashes

## Install

Use your favourite package manager.

```lua
{
	"mvllow/supplement.nvim",
}
```

## Usage

```lua
require("supplement").setup()
```

Additional helper functions are included to manage the plugin state:

```lua
require("supplement").enable()
require("supplement").disable()
require("supplement").toggle()
```

## Contributing

Pull requests are welcome and appreciated!
