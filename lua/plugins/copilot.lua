-- heavily influenced by https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/copilot-chat-v2.lua
local prompts = {
  -- Code related prompts
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
  FixCode = "Please fix the following code to make it work as intended.",
  FixError = "Please explain the error in the following text and provide a solution.",
  BetterNamings = "Please provide better names for the following variables and functions.",
  Documentation = "Please provide documentation for the following code.",
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
  -- Text related prompts
  Summarize = "Please summarize the following text.",
  Spelling = "Please correct any grammar and spelling errors in the following text.",
  Wording = "Please improve the grammar and wording of the following text.",
  Concise = "Please rewrite the following text to make it more concise.",
}

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
    { "MunifTanjim/nui.nvim" },
  },
  opts = {
    prompts = prompts,
    window = {
      layout = "vertical",
      border = "single",
    },
  },
  keys = {
    -- Quick chat with Copilot
    {
      "<leader>aq",
      function()
        local Input = require "nui.input"
        local event = require("nui.utils.autocmd").event

        local input = Input({
          relative = "win",
          position = {
            row = "30%",
            col = "50%",
          },
          size = 100,
          border = {
            style = "rounded",
            text = {
              top = "[ CoPilot Quick Chat ]",
              top_align = "left",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal",
          },
        }, {
          prompt = "> ",
          on_submit = function(value)
            require("CopilotChat").ask(value)
          end,
        })
        -- mount/open the component
        input:mount()

        -- unmount input by pressing `<Esc>` in normal mode
        input:map("n", "<Esc>", function()
          input:unmount()
        end, { noremap = true })

        -- unmount component when cursor leaves buffer
        input:on(event.BufLeave, function()
          input:unmount()
        end)
      end,
      desc = "CopilotChat - Quick chat",
    },

    -- Show help actions with telescope
    {
      "<leader>ah",
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end,
      desc = "CopilotChat - Help actions",
    },
    -- Show prompts actions with telescope
    {
      "<leader>ap",
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      desc = "CopilotChat - Prompt actions",
    },
    {
      "<leader>ap",
      ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
      mode = "x",
      desc = "CopilotChat - Prompt actions",
    },
    -- Code related commands
    { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
    { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
    { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
    { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
    { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
    -- Debug
    { "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
    -- Fix the issue with diagnostic
    { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
    -- Clear buffer and chat history
    { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
    -- Toggle Copilot Chat Vsplit
    { "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
  },
}
