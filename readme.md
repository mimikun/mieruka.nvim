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

Run the initial setup:

```lua
require("supplement").setup()
```

You will now see virtual text supplementing en and em dashes like so:

> "Self-reflection—--the key to understanding one's place in the universe—--requires a delicate balance between inner peace and external engagement, an age–-old challenge that spans centuries of human thought."

_Notice the en and em dashes are followed by one and two hyphens, respectively._

Additional helper functions are included to manage the plugin state:

```lua
require("supplement").enable()
require("supplement").disable()
require("supplement").toggle()
```

## Contributing

Pull requests are welcome and appreciated!
