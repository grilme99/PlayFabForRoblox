# Requires you to install https://github.com/JohnnyMorganz/wally-package-types
# Installs Wally packages and re-exports types. This is super useful for PlayFab!!!

wally install

rojo sourcemap default.project.json --output sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages/
