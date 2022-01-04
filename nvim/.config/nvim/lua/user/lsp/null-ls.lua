local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- local formatting = null_ls.builtins.formatting
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

-- null_ls.setup({
-- 	debug = false,
-- 	sources = {
-- 		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
-- 		formatting.black.with({ extra_args = { "--fast" } }),
-- 		formatting.stylua,
--     -- diagnostics.flake8
-- 	},
-- })

local M = {}

M.setup = function()
  local null_ls = require 'null-ls'
  local b = null_ls.builtins

  vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath 'config' .. '/.prettierrc'

  -- you don't have to use these helpers and could do it yourself, too
  local eslint = require('null-ls.helpers').conditional(function(utils)
    local project_local_bin = 'node_modules/.bin/eslint'

    return null_ls.builtins.diagnostics.eslint.with {
      command = utils.root_has_file(project_local_bin) and project_local_bin
        or 'eslint_d',
    }
  end)

  null_ls.setup {
    debounce = 150,
    autostart = true,
    sources = {
      eslint,
	  b.formatting.stylua,		
	  b.formatting.black.with({ extra_args = { "--fast" } }),
      b.formatting.prettier.with {
        prefer_local = 'node_modules/.bin',
        filetypes = {
          'typescriptreact',
          'typescript',
          'javascriptreact',
          'javascript',
          'svelte',
          'json',
          'jsonc',
          'css',
          'less',
          'scss',
          'html',
          'yaml',
        },
      },
      b.diagnostics.shellcheck,
      b.code_actions.shellcheck,
      b.formatting.shfmt,
      b.diagnostics.hadolint,
      b.diagnostics.markdownlint,
      b.diagnostics.write_good,
      b.diagnostics.misspell,
      b.formatting.gofumpt,
    },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end
  }
end

return M
