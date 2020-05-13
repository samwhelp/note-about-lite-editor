---
title: 如何綁定按鍵
nav_order: 22
parent: 設定
---

## 常用快速鍵

常用快速鍵，請參考「[常用快速鍵](https://samwhelp.github.io/note-about-lite-editor/read/spec-keybind.html)」該頁。

## 如何找到按鍵綁定的程式碼

從「[lite/data/core/keymap.lua](https://github.com/rxi/lite/blob/master/data/core/keymap.lua#L86)」這個檔案，可以找到類似如下的程式碼。

``` lua
keymap.add {
  ["ctrl+shift+p"] = "core:command-finder",
  ["ctrl+p"] = "core:file-finder",
  ["ctrl+o"] = "core:open-file",
  ["ctrl+n"] = "core:new-doc",
  ["alt+return"] = "core:toggle-fullscreen",
--  ... 略 ...
}
```

## 如何設定新的按鍵綁定

> 因為有些按鍵跟我在「[openbox](https://github.com/samwhelp/play-ubuntu-20.04-plan/blob/master/prototype/openbox/spec-keybind.md#window-tiling-move--corner)」的綁定相衝，所以做了點調整。

編輯「[lite/data/user/init.lua](https://github.com/rxi/lite/blob/master/data/user/init.lua)」這個檔案，舉例[加入如下的程式碼](https://github.com/samwhelp/note-about-lite-editor/blob/master/demo/config/user/init.lua)。

``` lua
keymap.add { ["ctrl+escape"] = "core:quit" }

keymap.add { ["ctrl+shift+i"] = "root:split-up" }
keymap.add { ["ctrl+shift+u"] = "root:split-down" }
keymap.add { ["ctrl+shift+y"] = "root:split-left" }
keymap.add { ["ctrl+shift+o"] = "root:split-right" }

keymap.add { ["alt+shift+i"] = "root:switch-to-up" }
keymap.add { ["alt+shift+u"] = "root:switch-to-down" }
keymap.add { ["alt+shift+y"] = "root:switch-to-left" }
keymap.add { ["alt+shift+o"] = "root:switch-to-right" }
```

或是也可以寫成

``` lua
keymap.add {
	["ctrl+escape"] = "core:quit",

	["ctrl+shift+i"] = "root:split-up",
	["ctrl+shift+u"] = "root:split-down",
	["ctrl+shift+y"] = "root:split-left",
	["ctrl+shift+o"] = "root:split-right",

	["alt+shift+i"] = "root:switch-to-up",
	["alt+shift+u"] = "root:switch-to-down",
	["alt+shift+y"] = "root:switch-to-left",
	["alt+shift+o"] = "root:switch-to-right",
}
```

## 如何覆寫舊有按鍵綁定

若要覆寫舊有按鍵綁定，第二個參數要設為「true」。

因為我要把舊有的按鍵「Unbind」，所以對應值只要設為空字串就可以了，

可以寫成

``` lua
keymap.add ({ ["alt+return"] = "" }, true)
keymap.add ({ ["alt+1"] = "" }, true)
keymap.add ({ ["alt+2"] = "" }, true)
```

或是也可以寫成

``` lua
keymap.add ({

	["alt+return"] = "",
	["alt+1"] = "",
	["alt+2"] = "",

}, true)

```
