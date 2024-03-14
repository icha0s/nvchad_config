---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- commmon
    ["<leader>w"] = {"<cmd>w<CR>", "Save"},
    ["<leader>ll"] = { "<cmd>TroubleToggle<CR>", "Open Trouble" },
    ["<leader>ft"] = { "<cmd>TodoTelescope<CR>", "Find Todo" },
    -- ["<leader>fc"] = { function() require("telescope.builtin").grep_string() end, desc = "Find word under cursor" }
    ["<leader>fc"] = { "<cmd> Telescope grep_string <CR>", "Find word under cursor" },
    ["|"] = { "<cmd>:vsplit <CR>", "Vertical split" },
    ["<F7>"] = { function() require("nvterm.terminal").toggle "float" end, "Toggle floating term", },

    -- test
    ["<leader>tt"] = { function() require("neotest").run.run() end, "Run nearest test", },
    ["<leader>tf"] = { function() require("neotest").run.run(vim.fn.expand "%") end, "Run file test", },
    ["<leader>to"] = { "<cmd> Neotest output<CR>", "Test output", },
    ["<leader>ts"] = { "<cmd> Neotest summary<CR>", "Test summary",},


    -- Git mappings
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "LazyGit" },
    ["<leader>gl"] = {":Flog<CR>", "Git Log",},
    ["<leader>gf"] = {":DiffviewFileHistory<CR>", "Git File History",},
    ["<leader>gc"] = {":DiffviewOpen HEAD~2<CR>", "Git Last Commit",},
    -- ["<leader>gt"] = {":DiffviewToggleFile<CR>", "Git Toggle File",},


    -- Rest NVIM
    ["<leader>rq"] = { "<Plug>RestNvim", "RestNvim" },
    ["<leader>rp"] = { "<Plug>RestNvimPreview", "RestNvimPreview",},
    ["<leader>rr"] = { "<Plug>RestNvimLast", "RestNvimLast",},

    --tab close
   ["<leader>tq"] = { ":tabclose", "Tab - close" },
   ["<leader>tn"] = { ":tabnew", "Tab - new" },


  },
  v = {
    [">"] = { ">gv", "indent"},
  },
  t = {
    ["<F7>"] = { function() require("nvterm.terminal").toggle "float" end, "Toggle floating term", },
  },
}

M.dap_ui = {
  n = {
    -- dap-ui
    ["<leader>du"] = { function() require("dapui").toggle() end, "Dedug UI", },
    ["<leader>dE"] = {
      function()
        vim.ui.input({ prompt = "Expression: " }, function(expr)
          if expr then require("dapui").eval(expr, { enter = true }) end
        end)
      end,
      "Evaluate Input",
    },
    -- ["<leader>dE"] = { function() require("dapui").eval() end, desc = "Evaluate Input" }
    ["<leader>dh"] = { function() require("dap.ui.widgets").hover() end, "Debugger Hover" },

  }
}

M.dap = {
    -- dap
  n = {
    ["<F5>"] = { function() require("dap").continue() end, "Debugger: Start" },
    ["<F17>"] = { function() require("dap").terminate() end, "Debugger: Stop" }, -- Shift+F5
    ["<F21>"] = { -- Shift+F9
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition then require("dap").set_breakpoint(condition) end
        end)
      end,
      "Debugger: Conditional Breakpoint",
    },
    ["<F29>"] = { function() require("dap").restart_frame() end, "Debugger: Restart" }, -- Control+F5
    ["<F6>"] = { function() require("dap").pause() end, "Debugger: Pause" },
    ["<F9>"] = { function() require("dap").toggle_breakpoint() end, "Debugger: Toggle Breakpoint" },
    ["<F10>"] = { function() require("dap").step_over() end, "Debugger: Step Over" },
    ["<F11>"] = { function() require("dap").step_into() end, "Debugger: Step Into" },
    ["<F23>"] = { function() require("dap").step_out() end, "Debugger: Step Out" }, -- Shift+F11
    ["<leader>db"] = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint (F9)" },
    ["<leader>dB"] = { function() require("dap").clear_breakpoints() end, "Clear Breakpoints" },
    ["<leader>dc"] = { function() require("dap").continue() end, "Start/Continue (F5)" },
    ["<leader>dC"] = {
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition then require("dap").set_breakpoint(condition) end
        end)
      end,
      "Conditional Breakpoint (S-F9)",
    },
    ["<leader>di"] = { function() require("dap").step_into() end, "Step Into (F11)" },
    ["<leader>do"] = { function() require("dap").step_over() end, "Step Over (F10)" },
    ["<leader>dO"] = { function() require("dap").step_out() end, "Step Out (S-F11)" },
    ["<leader>dq"] = { function() require("dap").close() end, "Close Session" },
    ["<leader>dQ"] = { function() require("dap").terminate() end, "Terminate Session (S-F5)" },
    ["<leader>dp"] = { function() require("dap").pause() end, "Pause (F6)" },
    ["<leader>dr"] = { function() require("dap").restart_frame() end, "Restart (C-F5)" },
    ["<leader>dR"] = { function() require("dap").repl.toggle() end, "Toggle REPL" },
    ["<leader>ds"] = { function() require("dap").run_to_cursor() end, "Run To Cursor" },
    ["<leader>dn"] = { function() require("dap").step_over() end, "Step over",},
  },
}

M.gitsigns = {
  n = {
    ["]g"] = { function() require("gitsigns").next_hunk() end, "Next Git hunk" },
    ["[g"] = { function() require("gitsigns").prev_hunk() end, "Previous Git hunk" },
    ["<leader>gb"] = { function() require("gitsigns").blame_line() end, "View Git blame" },
    ["<leader>gB"] = { function() require("gitsigns").blame_line { full = true } end, "View full Git blame" },
    ["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, "Preview Git hunk" },
    ["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, "Reset Git hunk" },
    ["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, "Reset Git buffer" },
    ["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, "Stage Git hunk" },
    ["<leader>gS"] = { function() require("gitsigns").stage_buffer() end, "Stage Git buffer" },
    ["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, "Unstage Git hunk" },
    ["<leader>gd"] = { function() require("gitsigns").diffthis() end, "View Git diff" },
  },
}

M.disabled = {
  n = {
    -- ["gd"] = "",
    -- ["gr"] = "",
  },
}


M.lspoveride = {
   n = {
      ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "definitions" },
      ["gr"] = { "<cmd> Telescope lsp_references <CR>", "references" },
   },
}
-- more keybinds!

return M
