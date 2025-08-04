local Constants = require("../constants")
local COMMENT_LINE_LENGTH = Constants.COMMENT_LINE_LENGTH

local Indent = require("./Indent")
local wrap = require("./wrap")
type Indent = Indent.Indent

local function writeLuaComment(src: string, indent: Indent): string
    local comment = `{indent:get()}--[[`
    indent:push()

    local wrappedComment = wrap(src, COMMENT_LINE_LENGTH, indent:get())
    comment ..= `\n{wrappedComment}`

    indent:pop()
    comment ..= `\n{indent:get()}]]`

    return comment
end

return writeLuaComment
