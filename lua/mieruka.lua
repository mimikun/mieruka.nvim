-- TODO: https://www.utf8-chartable.de/

local en_dash = "\226\128\147"

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
local em_dash = "\226\128\148"

-- LINE FEED(LF) (U+000A)
local l_f = ""

-- CARRIAGE RETURN(CR) (U+000D)
local c_r = ""

local Mieruka = {}
local enabled = true

local function mieruka()
    if not enabled then
        return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local ns_id = vim.api.nvim_create_namespace("mieruka")
    Mieruka.clear(bufnr, ns_id)

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for line_nr, line in ipairs(lines) do
        local start_pos = 1
        while true do
            local en_dash_pos = line:find(en_dash, start_pos)
            local em_dash_pos = line:find(em_dash, start_pos)

            if en_dash_pos and (not em_dash_pos or en_dash_pos < em_dash_pos) then
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, line_nr - 1, en_dash_pos + #en_dash - 1, {
                    virt_text = { { "-", "Comment" } },
                    virt_text_pos = "inline",
                })
                start_pos = en_dash_pos + #en_dash
            elseif em_dash_pos then
                vim.api.nvim_buf_set_extmark(bufnr, ns_id, line_nr - 1, em_dash_pos + #em_dash - 1, {
                    virt_text = { { "--", "Comment" } },
                    virt_text_pos = "inline",
                })
                start_pos = em_dash_pos + #em_dash
            else
                break
            end
        end
    end
end

function Mieruka.setup(opts)
    opts = opts or {}

    vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
        group = vim.api.nvim_create_augroup("Mieruka", { clear = true }),
        pattern = "*",
        callback = mieruka,
    })
end

function Mieruka.enable()
    enabled = true
    mieruka()
end

function Mieruka.disable()
    local bufnr = vim.api.nvim_get_current_buf()
    local ns_id = vim.api.nvim_create_namespace("mieruka")
    Mieruka.clear(bufnr, ns_id) -- Clear virtual text
    enabled = false
end

function Mieruka.toggle()
    if enabled then
        Mieruka.disable()
    else
        Mieruka.enable()
    end
end

function Mieruka.clear(bufnr, ns_id)
    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
end

return Mieruka
