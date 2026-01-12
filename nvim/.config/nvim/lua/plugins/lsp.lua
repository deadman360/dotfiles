return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- Garante que o Mason instale os servidores automaticamente
            servers = {
                -- Java (Configurado via Extra, mas podemos adicionar flags aqui)
                jdtls = {},

                -- Angular
                angularls = {},

                -- QUARKUS: O segredo para suporte a .properties e yaml do Quarkus
                quarkus = {
                    filetypes = { "java", "yaml", "properties" },
                },

                -- XML: Essencial para o pom.xml
                lemminx = {},
            },
            -- Configurações específicas por servidor
            setup = {
                angularls = function(_, opts)
                    -- Dica de 2025: Desativar rename do angularls para evitar conflito com o tsserver
                    opts.server_capabilities = opts.server_capabilities or {}
                    opts.server_capabilities.renameProvider = false
                end,
            },
        },
    },
}
