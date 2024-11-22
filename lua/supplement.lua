local Supplement = {}
local enabled = true

local function supplement()
	if not enabled then
		return
	end

	local bufnr = vim.api.nvim_get_current_buf()
	local ns_id = vim.api.nvim_create_namespace("supplement")
	Supplement.clear(bufnr, ns_id)

	local en_dash = "\226\128\147"
	local em_dash = "\226\128\148"

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

function Supplement.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
		group = vim.api.nvim_create_augroup("Supplement", { clear = true }),
		pattern = "*",
		callback = supplement,
	})
end

function Supplement.enable()
	enabled = true
	supplement()
end

function Supplement.disable()
	local bufnr = vim.api.nvim_get_current_buf()
	local ns_id = vim.api.nvim_create_namespace("supplement")
	Supplement.clear(bufnr, ns_id) -- Clear virtual text
	enabled = false
end

function Supplement.toggle()
	if enabled then
		Supplement.disable()
	else
		Supplement.enable()
	end
end

function Supplement.clear(bufnr, ns_id)
	vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
end

return Supplement
