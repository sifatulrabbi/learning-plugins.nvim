local M = {}

M.setup = function()
    print("Learning to build neovim plugins")
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
end

return M
