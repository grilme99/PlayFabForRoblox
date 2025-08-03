local DateTime = require("@lune/datetime")

local Constants = {}

local formattedTime = DateTime.now():formatUniversalTime("%Y-%m-%d at %H:%M UTC")

local NO_EDIT_HEADER = `This file was generated on {formattedTime}. Do not edit directly.`
Constants.NO_EDIT_HEADER = NO_EDIT_HEADER

local COMMENT_LINE_LENGTH = 80
Constants.COMMENT_LINE_LENGTH = COMMENT_LINE_LENGTH

return Constants
