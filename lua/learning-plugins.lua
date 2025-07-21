local M = {}

M.setup = function()
    print("Learning to build neovim plugins")
end

-- @param lines string: Lines to show in the floating window
-- @param opts table: Floating window options.
local open_floating_window = function(lines, opts)
    local default_opts = {
        relative = "editor",
        width = math.floor(vim.o.columns * 0.6),
        height = math.floor(vim.o.lines * 0.6),
        row = math.floor(vim.o.lines * 0.2),
        col = math.floor(vim.o.columns * 0.2),
        style = "minimal",
        border = "rounded",
    }
    opts = vim.tbl_extend("force", default_opts, opts or {})

    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
    vim.bo[bufnr].modifiable = false

    local win = vim.api.nvim_open_win(bufnr, true, opts)

    return bufnr, win
end

-- @class present.Slides
-- @fields slides string[]

-- @param text string[]: The lines in the buffer
-- @return present.Slides
local parse_text = function(text)
    local separator = "^# "
    local slides = { slides = {} }
    local current_slide = {}
    for _, line in ipairs(text) do
        local sep_location = line:find(separator)
        if sep_location then
            if #current_slide > 0 then
                table.insert(slides.slides, current_slide)
            end
            current_slide = {}
        end
        table.insert(current_slide, line)
    end
    if #current_slide > 0 then
        table.insert(slides.slides, current_slide)
    end

    return slides
end

M.start_presentation = function(opts)
    opts = opts or {}
    opts.bufnr = opts.bufnr or 0
    local lines = vim.api.nvim_buf_get_lines(opts.bufnr, 0, -1, false)
    local slides = parse_text(lines)
    open_floating_window(slides.slides[1])
end

vim.api.nvim_create_user_command("StartPresentation", function()
    require("learning-plugins").start_presentation()
end, {})

return M
