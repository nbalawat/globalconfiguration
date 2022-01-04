local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

-- Configure prettier
-- Eslint
-- Configure for Typescript, Javascript, React, Lua, Go and Rust, Json etc
-- Keep customizing this setup to use proper formatting and other stuff

local vim = vim
local prettierConfig = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
    stdin = true
  }
end

local formatterConfig = {
  vue = {
    function()
      return {
        exe = "prettier",
        args = {
          "--stdin-filepath",
          vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
          "--single-quote",
          "--parser",
          "vue"
        },
        stdin = true
      }
    end
  },
  rust = {
    -- Rustfmt
    function()
      return {
        exe = "rustfmt",
        args = {"--emit=stdout"},
        stdin = true
      }
    end
  },
  r = {
    function()
      return {
        exe = "R",
        args = {
          "--slave",
          "--no-restore",
          "--no-save",
          "-e",
          '\'con <- file("stdin"); styler::style_text(readLines(con)); close(con)\'',
          "2>/dev/null"
        },
        stdin = true
      }
    end
  },
  ["*"] = {
    function()
      return {
        -- remove trailing whitespace
        exe = "sed",
        args = {"-i", "'s/[ \t]*$//'"},
        stdin = false
      }
    end
  }
}
local commonFT = {
  "css",
  "scss",
  "html",
  "java",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "markdown",
  "markdown.mdx",
  "json",
  "yaml",
  "xml",
  "svg"
}
for _, ft in ipairs(commonFT) do
  formatterConfig[ft] = {prettierConfig}
end
-- Setup functions
formatter.setup(
  {
    logging = true,
    filetype = formatterConfig
  }
)
