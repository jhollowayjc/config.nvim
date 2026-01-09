return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = { "lua_ls", "stylua", "gopls", "goimports" },
    automatic_enable = true,
  },
  -- init = function()
  --     --
  --     -- LSP config
  --     --
  --     -- Add the same capabilities to ALL server configurations.
  --     -- Refer to :h vim.lsp.config() for more information.
  --     vim.lsp.config("*", {
  --         capabilities = vim.lsp.protocol.make_client_capabilities()
  --     })
  --
  --     vim.api.nvim_create_autocmd("LspAttach", {
  --         callback = function(event)
  --             local map = function(keys, func, desc)
  --                 vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
  --             end
  --
  --             -- disable th
  --             vim.lsp.buf.signature_help({ silent = true })
  --
  --             map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  --             map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  --             map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
  --             map("gI", vim.lsp.buf.declaration, "[G]oto [I]mplementation")
  --             map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  --             map("<leader>ds", vim.lsp.buf.document_symbol, "[D]ocument [S]ymbols")
  --             map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  --             map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  --             map("<leader>lf", vim.lsp.buf.format, "Run [F]ormatting")
  --         end
  --     })

  -- -- Diagnostic Config
  -- -- See :help vim.diagnostic.Opts
  -- vim.diagnostic.config {
  --     severity_sort = true,
  --     float = { border = 'rounded', source = 'if_many' },
  --     underline = { severity = vim.diagnostic.severity.ERROR },
  --     signs = vim.g.have_nerd_font and {
  --         text = {
  --             [vim.diagnostic.severity.ERROR] = '󰅚 ',
  --             [vim.diagnostic.severity.WARN] = '󰀪 ',
  --             [vim.diagnostic.severity.INFO] = '󰋽 ',
  --             [vim.diagnostic.severity.HINT] = '󰌶 ',
  --         },
  --     } or {},
  --     virtual_text = {
  --         source = 'if_many',
  --         spacing = 2,
  --         format = function(diagnostic)
  --             local diagnostic_message = {
  --                 [vim.diagnostic.severity.ERROR] = diagnostic.message,
  --                 [vim.diagnostic.severity.WARN] = diagnostic.message,
  --                 [vim.diagnostic.severity.INFO] = diagnostic.message,
  --                 [vim.diagnostic.severity.HINT] = diagnostic.message,
  --             }
  --             return diagnostic_message[diagnostic.severity]
  --         end,
  --     },
  -- }
  -- end
}
