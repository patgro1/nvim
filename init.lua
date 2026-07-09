vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local ok, parsers = pcall(require, "nvim-treesitter.parsers")
    if ok then
      -- Get the metatable of a node safely
      local node = vim.treesitter.get_node()
      if node then
        local mt = getmetatable(node)
        if mt and not mt.range then
          -- Map the old 'range' to the new 'get_range'
          mt.range = function(self) return self:get_range() end
        end
      end
    end
  end,
})
require("config.options")
require("config.lazy")
require("config.floating-terminal")
require("config.navigation")
