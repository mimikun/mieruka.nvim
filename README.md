# supplement.nvim

**Mieruka ( 見える化 )** confusing characters

## Install

### lazy.nvim

```lua
{
    "mimikun/mieruka.nvim",
    opts = {},
}
```

## Default configuration

```lua
{
    -- virtual text characters
    alt = "👀",
    chars = {
        -- IDEOGRAPHIC SPACE (U+3000)
        -- NO-BREAK SPACE (U+00A0)
        -- OGHAM SPACE MARK (U+1680)
        -- EN QUAD (U+2000)
        -- EM QUAD (U+2001)
        -- EN SPACE (U+2002)
        -- EM SPACE (U+2003)
        -- THREE-PER-EM SPACE (U+2004)
        -- FOUR-PER-EM SPACE (U+2005)
        -- SIX-PER-EM SPACE (U+2006)
        -- FIGURE SPACE (U+2007)
        -- PUNCTUATION SPACE (U+2008)
        -- THIN SPACE (U+2009)
        -- HAIR SPACE (U+200A)
        -- ZERO WIDTH SPACE (U+200B)
        -- NARROW NO-BREAK SPACE (U+202F)
        -- ZERO WIDTH NO-BREAK SPACE (U+FEFF)
        -- MEDIUM MATHEMATICAL SPACE (U+205F)
        -- MONGOLIAN VOWEL SEPARATOR (U+180E)
        -- EM DASH (U+2014)
        -- LINE FEED(LF) (U+000A)
        -- CARRIAGE RETURN(CR) (U+000D)
    }
},
```

## Usage

You will now see virtual text supplementing some chars like so:

```txt
WIP
```

_Notice the some chars are followed by 👀, respectively._

Additional helper functions are included to manage the plugin state:

```lua
require("mieruka").enable()
require("mieruka").disable()
require("mieruka").toggle()
```

## Contributing

Pull requests are welcome and appreciated!

## Original

[mvllow/supplement.nvim](https://github.com/mvllow/supplement.nvim)
