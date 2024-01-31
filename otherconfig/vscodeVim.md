### My Current Configuration of VsCodeVim

---

```json
  "vim.leader": "<space>",
  "vim.easymotion": true,
  "vim.incsearch": true,
  "vim.useSystemClipboard": true,
  "vim.useCtrlKeys": true,
  "vim.hlsearch": true,
  "vim.insertModeKeyBindings": [
    {
      "before": ["q", "q"],
      "after": ["<Esc>"]
    }
  ],
  "vim.normalModeKeyBindings": [
    {
      "before": ["L"],
      "after": ["$"]
    },
    {
      "before": ["H"],
      "after": ["I", "<Esc>", "l"]
    },
    {
      "before": ["<leader>", "c"],
      "after": ["v", "i", "w", "y"]
    },
    {
      "before": ["<leader>", "v"],
      "after": ["v", "i", "w", "p"]
    },
    {
      "before": ["<leader>", "s"],
      "after": ["b", "v", "e"]
    },
    {
      "before": ["<leader>", "<Tab>"],
      "after": ["o", "<Esc>"]
    },
    {
      "before": ["<leader>", "<leader>"],
      "after": ["i", "<Space>", "<Esc>", "l"]
    }
  ]
```
