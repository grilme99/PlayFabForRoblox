local TAB_SIZE = 4 -- number of spaces per tab character

--[[
	Formats `src` so that each visual line (including a left‑hand indent)
	stays ≤ `maxChars` long.
	@param src      string  -- text to wrap
	@param maxChars number  -- max characters per line *including* the indent
	@param indent   string? -- left padding (defaults to "\t")
	@return string          -- wrapped text
]]
local function wrap(src: string, maxChars: number, indent_: string?): string
    local indent = indent_ or "\t"
    local indentLength = if indent == "\t" then TAB_SIZE else #indent
    local available = maxChars - indentLength -- space left for actual content
    if available <= 0 then
        error("maxChars must be larger than indent length")
    end

    local lines = {}

    -- Process each existing line separately
    for paragraph in string.gmatch(src, "([^\n]*)\n?") do
        if paragraph ~= "" then
            local words = {}
            for w in string.gmatch(paragraph, "%S+") do
                table.insert(words, w)
            end

            local line = indent
            local len = 0 -- length *sans* indent

            for _, word in ipairs(words) do
                local wordLen = #word
                local extra = if len == 0 then wordLen else wordLen + 1

                if len + extra > available then
                    table.insert(lines, line) -- commit current line
                    line = indent .. word
                    len = wordLen
                else
                    if len > 0 then
                        line ..= " "
                        len += 1
                    end
                    line ..= word
                    len += wordLen
                end
            end
            table.insert(lines, line)
        else
            -- Preserve empty lines
            table.insert(lines, "")
        end
    end

    return table.concat(lines, "\n")
end

return wrap
