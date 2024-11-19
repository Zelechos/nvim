### My Current Configuration of VsCodeVim

---

```json
{
    "editor.suggestSelection": "first",
    "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
    "liveServer.settings.donotShowInfoMsg": true,
    "python.languageServer": "Pylance",
    "files.associations": {
      "*.html": "html"
    },
    "editor.wordWrap": "on",
    "workbench.editorAssociations": {
      "*.ipynb": "jupyter-notebook"
    },
    "files.exclude": {
      "**/.classpath": true,
      "**/.project": true,
      "**/.settings": true,
      "**/.factorypath": true
    },
    "notebook.cellToolbarLocation": {
      "default": "right",
      "jupyter-notebook": "left"
    },
    "javascript.updateImportsOnFileMove.enabled": "always",
    "editor.linkedEditing": true,
    "editor.fontFamily": "'Fira Code', menlo",
    "editor.fontLigatures": true,
    "vsicons.dontShowNewVersionMessage": true,
    "workbench.iconTheme": "vscode-icons",
    "workbench.colorTheme": "GitHub Dark Default",
    "editor.fontSize": 9.5,
    "explorer.confirmDelete": false,
    "[python]": {
      "editor.defaultFormatter": "ms-python.black-formatter",
      "editor.formatOnType": true
    },
    "[javascript]": {
      "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "security.workspace.trust.untrustedFiles": "open",
    "[jsonc]": {
      "editor.defaultFormatter": "vscode.json-language-features"
    },
    "[css]": {
      "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[html]": {
      "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "window.zoomLevel": 2,
    "tabnine.experimentalAutoImports": true,
    "git.openRepositoryInParentFolders": "never",
    "terminal.integrated.env.windows": {},
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
      },
      {
        "before": ["Q", "Q"],
        "after": ["<Esc>"]
      }
    ],
    "vim.visualModeKeyBindings": [
        {
          "before": ["q", "q"],
          "after": ["<Esc>"]
        }
      ],
    "vim.normalModeKeyBindings": [
      {
        "before": ["<leader>","<leader>"],
        "commands": ["workbench.action.toggleSidebarVisibility"]
      },
      {
        "before": ["<S-s>"],
        "commands": ["workbench.action.files.save"]
      },
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
        "before": ["z","b"],
        "commands": ["workbench.action.splitEditor"]
      },
      {
        "before": ["z","v"],
        "commands": ["workbench.action.splitEditorDown"]
      },
      {
        "before": ["<leader>","q"],
        "commands": ["workbench.action.closeActiveEditor"]
      },
    ]
  }
```
