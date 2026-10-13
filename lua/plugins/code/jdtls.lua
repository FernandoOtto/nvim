return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    local jdtls = require("jdtls")

    local mason_path = vim.fn.stdpath("data") .. "/mason"
    local jdtls_path = mason_path .. "/packages/jdtls"
    local config_path = jdtls_path .. "/config_linux" -- Troque para config_mac se estiver no macOS

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. project_name
    local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

    local function on_attach(_, bufnr)
      local opts = { buffer = bufnr, silent = true }

      vim.keymap.set("n", "<leader>oi", "<cmd>lua require('jdtls').organize_imports()<cr>", vim.tbl_extend("force", opts, { desc = "Java: Organizar Imports" }))
      vim.keymap.set("n", "<leader>ev", "<cmd>lua require('jdtls').extract_variable()<cr>", vim.tbl_extend("force", opts, { desc = "Java: Extrair Variável" }))
      vim.keymap.set("n", "<leader>em", "<cmd>lua require('jdtls').extract_method()<cr>", vim.tbl_extend("force", opts, { desc = "Java: Extrair Método" }))
      vim.keymap.set("n", "<leader>uc", "<cmd>lua require('jdtls').update_project_config()<cr>", vim.tbl_extend("force", opts, { desc = "Java: Atualizar Config Projeto" }))
    end

    -- 3. Tabela de Configuração do Servidor
    local config = {
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx2G",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", launcher_jar,
        "-configuration", config_path,
        "-data", workspace_dir,
      },

      root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
      on_attach = on_attach,

      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" },
          completion = {
            favoriteStaticMembers = {
              "org.junit.jupiter.api.Assertions.*",
              "org.mockito.Mockito.*",
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
        },
      },
    }

    -- 4. Autocommand para iniciar o JDTLS ao abrir arquivos .java
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        jdtls.start_or_attach(config)
      end,
    })
  end,
}
