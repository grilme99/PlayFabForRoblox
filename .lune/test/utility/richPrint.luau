local stdio = require("@lune/stdio")

local function richPrint(color: stdio.Color, style: stdio.Style, ...)
    -- stylua: ignore
	stdio.write(
		stdio.color(color)
		.. stdio.style(style)
		.. (...)
		.. "\n"
		.. stdio.color("reset")
		.. stdio.style("reset")
	)
end

return richPrint
