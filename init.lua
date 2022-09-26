local fn = vim.fn
local impatient_install_path = fn.stdpath('data') .. '/site/pack/packer/start/impatient.nvim'
if fn.empty(fn.glob(impatient_install_path)) > 0 then
    print "Impatient not present, skipping"
else
    require("impatient")
end

require("pat.options")
require("pat.keymaps")
require("pat.plugins")
