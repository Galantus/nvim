require("focus").setup({
    enable = true,  --enable this plugin
    autoresize = false, --The focussed window will no longer automatically resize
    --excluded_filetypes = {},
    --excluded_buftypes = {},
    --forced_filetypes = {},
    --width = "auto",
    --minwidth = "auto",
    --height = "auto",
    --minheight = "auto",
    --treewidth = "auto",
    --quickfixheight = "auto",
    --bufnew = false, -- when create a new buffer create empty buffer
    --compatible_filetrees = {"nvimtree"},  -- Prevents focus automatically resizing windows based on configured file trees
    --cursorline = true, --Displays a cursorline in the focussed window only
    --signcolumn = true, --Displays a sign column in the focussed window only
    --cursorcolumn = false, --Displays a cursor column in the focussed window only
    --colorcolumn = {enable = false, width = 100}, --Displays a color column in the focussed window only
    --number = true, -- Displays line numbers in the focussed window only
    --relativenumber = true,   --Displays relative line numbers in the focussed window only 
    --hybridnumber = true,   --Displays hybrid line numbers in the focussed window only
    --absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows
    --winhighlight = false  --Enable auto highlighting for focussed/unfocussed windows
})
