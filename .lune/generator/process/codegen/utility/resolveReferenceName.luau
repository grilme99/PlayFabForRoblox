local ir = require("../../ir")

local function resolveReferenceName(spec: ir.Spec, definition: ir.Definition): string?
    for name, def in spec.definitions do
        if def == definition then
            return name
        end
    end

    return nil
end

return resolveReferenceName
