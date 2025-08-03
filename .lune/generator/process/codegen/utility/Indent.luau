-- Simple indent utility for codegen: push/pop depth and fetch the current indent.
local Indent = {}
Indent.__index = Indent

export type Indent = {
    depth: number,
    tabChar: string,

    push: (self: Indent, n: number?) -> (),
    pop: (self: Indent, n: number?) -> (),
    set: (self: Indent, n: number) -> (),
    get: (self: Indent) -> string,
    scoped: (self: Indent, n: number?, fn: () -> any) -> any,
}

function Indent.new(tabChar: string?, initialDepth: number?): Indent
    local self = setmetatable({}, Indent) :: any
    self.tabChar = tabChar or "\t"
    self.depth = math.max(0, initialDepth or 0)
    return self
end

function Indent.push(self: Indent, n: number?)
    self.depth += n or 1
end

function Indent.pop(self: Indent, n: number?)
    self.depth = math.max(0, self.depth - (n or 1))
end

function Indent.set(self: Indent, n: number)
    self.depth = math.max(0, n)
end

function Indent.get(self: Indent): string
    return string.rep(self.tabChar, self.depth)
end

-- Convenience: temporarily increase indent while running `fn`.
function Indent.scoped(self: Indent, fn: () -> any, n: number?)
    n = n or 1
    self:push(n)
    local ok, result = pcall(fn)
    self:pop(n)
    if not ok then
        error(result, 2)
    end
    return result
end

return Indent
