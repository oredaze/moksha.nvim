for k in pairs(package.loaded) do
    if k:match(".*moksha.*") then package.loaded[k] = nil end
end

require('moksha').setup()
require('moksha').colorscheme()
