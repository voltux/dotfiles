local M = {}

function M.setup()
  vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

  -- Completion for these buffers is wired up in blink_cmp_conf.lua (the
  -- "dadbod" source). This file used to call require("cmp").setup.buffer,
  -- which did nothing: blink.cmp is the completion engine here, not nvim-cmp.
  -- The omnifunc keeps <C-x><C-o> working independently of the engine.
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "mysql", "plsql", "sqlite" },
    command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
  })
end

return M
