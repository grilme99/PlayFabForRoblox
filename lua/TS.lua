local Promise = require(script.Parent.Promise)
local TS = {}

local function assertAwait(ok, ...)
	if ok then
		return ...
	else
		error(ok == nil and "The awaited Promise was cancelled" or (...), 2)
	end
end

function TS.await(promise)
	if Promise.is(promise) then
		return assertAwait(promise:await())
	else
		return promise
	end
end

return TS