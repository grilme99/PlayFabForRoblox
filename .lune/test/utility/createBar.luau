local stdio = require("@lune/stdio")

local CLEAR_LINE = "\x1b[2K\r"
local BAR_CHARS = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉" }

function createBar(percent: number?, text: string?)
	local bar = {
		percent = math.clamp(percent or 0, 0, 1),
		length = 10,
		text = tostring(text or ""),
	}

	function bar.setLength(newLength: number)
		bar.length = math.clamp(newLength, 2, 100)
	end

	function bar.setPercent(newPercent: number)
		bar.percent = math.clamp(newPercent, 0, 1)
	end

	function bar.setText(newText: string)
		bar.text = tostring(newText)
	end

	function bar.render()
		local wholeWidth = math.floor(bar.percent * bar.length)
		local remainderWidth = (bar.percent * bar.length) % 1
		local partWidth = math.floor(remainderWidth * 8)
		local partChar = if wholeWidth >= bar.length then "" else BAR_CHARS[partWidth + 1]

		local barText = "["
			.. string.rep("█", wholeWidth)
			.. partChar
			.. string.rep(" ", bar.length - wholeWidth - 1)
			.. "]"

		stdio.write(
			CLEAR_LINE
					.. stdio.style("dim")
					.. stdio.color("green")
					.. barText
					.. stdio.style("bold")
					.. string.format(" %.1f%% ", bar.percent * 100)
					.. stdio.style("reset")
					.. stdio.color("reset")
					.. bar.text
				or ""
		)
	end

	function bar.clear()
		stdio.write(CLEAR_LINE)
		bar.percent = 0
		bar.text = ""
	end

	return bar
end

return createBar
