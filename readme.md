an opinionated nvim colorscheme

![](https://user-images.githubusercontent.com/6236829/253806385-37a92aef-8b57-4e26-9311-d9743bf939c3.jpg)
(that's how it looks in my terminal with solarized-dark theme)

## features, flavors, limits
* dark theme, it forces &background=dark
* only for terminal with 8-bit color, it uses color code 0-255
    * which also means you should define the color palette in your terminal
    * and you have `&termguicolors=0`
* no much colors, it uses almost 4 colors
* no trying to be compatible with 3rd plugins
* no much styles (bold,underline...)
* support builtin highlight groups: treesitter, diagnostic

## prerequisites
* nvim 0.9.*
* haolian9/infra.nvim
