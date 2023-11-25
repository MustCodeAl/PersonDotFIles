--local uv = require "vim.uv"

vim.g.rustaceanvim = function()
  -- Update this path
  local extension_path = vim.env.HOME .. '/.vscode-insiders/extensions/vadimcn.vscode-lldb-1.10.0/'
  local codelldb_path = extension_path .. 'adapter/codelldb'
  local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
  return {
    dap = {
      adapter = require('rustaceanvim.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
end
--  local this_os = uv.os_uname().sysname;

  -- The path is different on Windows
--  if this_os:find "Windows" then
--    codelldb_path = extension_path .. "adapter\\codelldb.exe"
--    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
--  else
    -- The liblldb extension is .so for Linux and .dylib for MacOS
--    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
--  end

  