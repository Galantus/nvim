local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 30, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
        ["<bs>"] = "BSPC",
        ["<esq>"] = "ESC",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 5, max = 30 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

-- Modes
--   normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


local opts_n = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings_n = {
    ["1"] = { "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", "window 1" },
    ["2"] = { "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", "window 2" },
    ["3"] = { "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", "window 3" },
    ["4"] = { "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", "window 4" },
    ["5"] = { "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", "window 5" },
    ["6"] = { "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", "window 6" },
    ["7"] = { "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", "window 7" },
    ["8"] = { "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", "window 8" },
    ["9"] = { "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", "window 9" },
    ["0"] = {},
    ["$"] = {},
    ["-"] = {},
    ["+"] = {},
    ["a"] = { name = "Addons",
        a = { "<cmd>Alpha<cr>", "Dashboard" },
        t = { "<cmd>CmpTabnineHub<cr>}", "TabNine Hub" },
        c = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
        n = { "<cmd>Neogen<cr>", "Neogen" },
        f = { "<cmd>FocusToggle<cr>", "FocusToggle"}
    },
    ["b"] = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Buffers", },
    c = {
        name = "Comments",
        l = { "<cmd>lua require('nvim-comment-frame').add_comment()<CR>", "single line" },
        m = { "<cmd>lua require('nvim-comment-frame').add_multiline_comment()<CR>", "multi line" },
        v = { ":'<,'>CommentToggle<cr>", "visual" },
        f = { "<cmd>lua require('neogen').generate({ type = 'func'})<CR>", "gen func" },
        s = { "<cmd>lua require('neogen').generate({ type = 'class' })<CR>", "gen class" },
        t = { "<cmd>lua require('neogen').generate({ type = 'type' })<CR>", "gen type" },
        F = { "<cmd>lua require('neogen').generate({ type = 'file' })<CR>", "gen file" }
    },
    ["d"] = {
        name = "Debug",
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "breakpoint" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "continue" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "step over" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "step into" },
        r = { "<cmd>lua require'dap'.repl.open()<cr>", "REPL" },
    },
    ["t"] = {
        name = "Tests",
        v = { "<cmd>lua require('dap-python').debug_selection()<cr>", "debug selection" },
        m = { "<cmd>lua require('dap-python').test_method()<cr>", "test method" },
        c = { "<cmd>lua require('dap-python').test_class()<cr>", "test class" },
        r = { '<cmd>lua require("neotest").run.run()<cr>', "run nearest" },
        f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', "run current file" },
        d = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', "run with dap" },
        s = { '<cmd>lua require("neotest").run.stop()<cr>', "stop tests" },
        a = { '<cmd>lua require("neotest").run.attach()<cr>', "attach tests" }

    },
    ["e"] = {
        name = "Explorer",
        o = { "<cmd>NvimTreeOpen<cr>", "open" },
        t = { "<cmd>NvimTreeToggle<cr>", "toggle" },
        q = { "<cmd>NvimTreeClose<cr>", "close" },
        f = { "<cmd>NvimTreeFocus<cr>", "focus" },
        r = { "<cmd>NvimTreeRefresh<cr>", "refresh" },
        d = { "<cmd>NvimTreeFindFile<cr>", "find file" },
        s = { "<cmd>NvimTreeFindFileToggle<cr>", "find file togle" },
        v = { "<cmd>NvimTreeClipboard<cr>", "clipboard" },
        h = { "<cmd>NvimTreeResize<cr>", "resize" },
        c = { "<cmd>NvimTreeCollapse<cr>", "colapse" },
        k = { "<cmd>NvimTreeCollapseKeepBuffers<cr>", "colapse buffers" }
    },
    ["w"] = {
        name = "Windows",
        p = { "<cmd>BufferLinePick<cr>", "pick" },
        d = { "<cmd>Bdelete<cr>", 'close-current-windows' },
        h = { "<cmd>FocusSplitLeft<cr>", "split window left" },
        j = { "<cmd>FocusSplitDown<cr>", "split window down" },
        k = { "<cmd>FocusSplitUp<cr>", "split window up" },
        l = { "<cmd>FocusSplitRight<cr>", "split window right" },
        m = { "<cmd>FocusMaximise<cr>", "maximise window" },
        e = { "<cmd>FocusEqualise<cr>", "equalise windows" },
        t = { "<cmd>FocusMaxOrEqual<cr>", "toggle max or equal" }
    },
    ["f"] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
    },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    g = {
        name = "Git",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    },
    r = {
        name = "Run",
        R = { "<cmd>lua require'sniprun'.run()<cr>", "run" },
        n = { "<cmd>lua require'sniprun'.run('n')<cr>", "normal mode" },
        v = { "<cmd>lua require'sniprun'.run('v')<cr>", "visual mode" },
        i = { "<cmd>lua require'sniprun'.info()<cr>", "info" },
        r = { "<cmd>lua require'sniprun'.reset()<cr>", "reset" },
        C = { "<cmd>lua require'sniprun'.clear_repl()<cr>", "clean repl" },
        Q = { "<cmd>lua require'sniprun.display'.close_all()<cr>", "close all" },
        T = { "<cmd>lua require'sniprun.live_mode'.toggle()<cr>", "toggle" },
        p = { "<cmd>CRProjects<cr>", "projects" },
        t = { "<cmd>CRFiletype<cr>", "filetype" },
        q = { "<cmd>RunClose<cr>", "close" },
        g = { "<cmd>RunProject<cr>", "run projects" },
        f = { "<cmd>RunFile<cr>", "run file standart" },
        F = { "<cmd>RunFile tab<cr>", "run file" },
        c = { "<cmd>RunCode<cr>", "run code" }

    },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics", },
        w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics", },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        F = { "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic", },
        k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        R = { "<cmd>lua vim.lsp.buf.range_code_action()<cr>", "[v] Refacror" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
    },
    s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        ["+"] = { ":lua require('telescope').extensions.neoclip.default()<cr>", "clipboard +" },
        m = { ":lua require('telescope').extensions.macroscope.default()<cr>", "Macros" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    },

    m = {
        name = "Terminal",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
        t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "iPython" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { '<cmd>ToggleTerm size=10 direction=horizontal dir="%:p:h"<cr>', "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
        r = { '<cmd>TermExec cmd="python3 %"<cr>', "Run Python3 File" },
        c = { '<cmd>TermExec dir="%:p"<cr>', "in current dir" },
        b = { '<cmd>TermExec cmd="./%"<cr>', "bash file" }
    },
    q = {
        name = "Quit",
        q = { "<cmd>qa!<cr>", "close nvim" },
        s = { "<cmd>wqa! <cr>", "save and quit" },
        b = { "<cmd>Bdelete!<cr>", "close buffer" }
    },

}

local opts_v = {
    mode = "v", -- visual mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}



which_key.setup(setup)
which_key.register(mappings_n, opts_n)
which_key.register(mappings_n, opts_v)
