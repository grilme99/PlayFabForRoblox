curl -O https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua
rojo sourcemap default.project.json > sourcemap.json

luau-lsp analyze --sourcemap sourcemap.json --platform roblox \
    --definitions globalTypes.d.lua --settings .vscode/settings.json \
    --ignore=Packages/** modules/ common/
