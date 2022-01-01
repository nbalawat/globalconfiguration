vim.g.maplocalleader = " "
vim.g.neoformat_try_node_exe = 1
vim.cmd [[autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier]]
