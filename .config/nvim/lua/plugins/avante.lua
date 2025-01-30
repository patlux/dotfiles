return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "openai",
      auto_suggestions_provider = "openai",
      -- openai = {
      --   endpoint = "https://openrouter.ai/api/v1",
      --   model = "deepseek/deepseek-chat",
      --   api_key_name = "OPENROUTER_API_KEY_AVANTE",
      --   temperature = 0.0,
      --   max_tokens = 8000,
      -- },
      -- openai = {
      --   endpoint = "https://api.groq.com/openai/v1",
      --   model = "deepseek-r1-distill-llama-70b",
      --   api_key_name = "GROQ_API_KEY",
      --   temperature = 0.0,
      --   max_tokens = 8000,
      --   timeout = 30000,
      -- },
      -- openai = {
      --   endpoint = "https://api.deepseek.com/beta",
      --   model = "deepseek-chat",
      --   api_key_name = "DEEPSEEK_API_KEY",
      --   temperature = 0.0,
      --   max_tokens = 8000,
      -- },
      openai = {
        endpoint = "http://127.0.0.1:1234/v1",
        model = "lmstudio-community/Qwen2.5-Coder-14B-Instruct-MLX-4bit",
        api_key_name = "DEEPSEEK_API_KEY",
        temperature = 0.0,
        max_tokens = 8000,
      },
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

-- return {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   lazy = false,
--   version = false, -- set this if you want to always pull the latest change
--   opts = {
--     provider = "ollama",
--     vendors = {
--       ---@type AvanteProvider
--       ollama = {
--         ["local"] = true,
--         -- LMStudio
--         -- endpoint = "127.0.0.1:1234/v1",
--         -- model = "Qwen2.5-Coder-32B-Instruct-MLX-4bit",
--         -- ollama
--         _inherited_from = "openai",
--         endpoint = "localhost:11434/v1",
--         model = "codegemma:latest",
--         -- model = "sammcj/qwen2.5-coder-32b-128k:q6_k",
--         parse_curl_args = function(opts, code_opts)
--           return {
--             url = opts.endpoint .. "/chat/completions",
--             headers = {
--               ["Accept"] = "application/json",
--               ["Content-Type"] = "application/json",
--             },
--             body = {
--               model = opts.model,
--               messages = require("avante.providers").copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
--               max_tokens = 2048,
--               stream = true,
--             },
--           }
--         end,
--         parse_response_data = function(data_stream, event_state, opts)
--           require("avante.providers").openai.parse_response(data_stream, event_state, opts)
--         end,
--       },
--     },
--   },
--   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   build = "make",
--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "stevearc/dressing.nvim",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     --- The below dependencies are optional,
--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--     "zbirenbaum/copilot.lua", -- for providers='copilot'
--     {
--       -- support for image pasting
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         -- recommended settings
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           -- required for Windows users
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--       -- Make sure to set this up properly if you have lazy=true
--       "MeanderingProgrammer/render-markdown.nvim",
--       opts = {
--         file_types = { "markdown", "Avante" },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- }
