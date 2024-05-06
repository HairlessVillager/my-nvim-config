return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            local util = require('lspconfig.util')
            local coq = require("coq")
            -- lspconfig.flake8.setup(coq.lsp_ensure_capabilities {})
            -- lspconfig.jedi_language_server.setup(coq.lsp_ensure_capabilities {
            --     cmd = {
            --         "D:/Anaconda/anaconda3/Scripts/jedi-language-server.exe",
            --     }
            -- })
            lspconfig.pylsp.setup(coq.lsp_ensure_capabilities {
                cmd = {
                    "D:/Anaconda/anaconda3/Scripts/pylsp.exe",
                },
                root_dir = function(fname)
                    local root_files = {
                      '.env',
                      'pyproject.toml',
                      'setup.py',
                      'setup.cfg',
                      'requirements.txt',
                      'Pipfile',
                    }
                    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
                end,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle  = {
                                maxLineLength = 120,
                            },
                            pydocstyle = {
                                convention = "numpy",
                            },
                        }
                    }
                }
            })

            --lspconfig.flake8.setup {}
            --lspconfig.tsserver.setup {}

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev)
            vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, {
                    -- Use a sharp border with `FloatBorder` highlights
                    border = "rounded",
                    -- add the title in hover float window
                    title = "hover",
                }
            )
    
            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    -- vim.keymap.set('n', '<leader>wl', function()
                    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
                    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    -- vim.keymap.set('n', '<leader>f', function()
                    --     vim.lsp.buf.format { async = true }
                    -- end, opts)
                end,
            })
        end
    },
}
