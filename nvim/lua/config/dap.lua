local dap = require("dap")

if not dap.adapters then dap.adapters = {} end
dap.adapters["probe-rs-debug"] = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.expand("$HOME/.cargo/bin/probe-rs"),
        args = { "dap-server", "--port", "${port}" },
    },
}

--dap.configurations["probe-rs-debug"] = {
--    {
--        name = "Attach to probe-rs process",
--        type = "probe-rs-debug",
--        request = "attach",
--        pid = require("dap.utils").pick_process,
--        args = {},
--    }
--}
--require("dap.ext.vscode").load_launchjs()
require("dap.ext.vscode").type_to_filetypes["probe-rs-debug"] = { "rust" }

dap.listeners.before["event_probe-rs-rtt-channel-config"]["plugins.nvim-dap-probe-rs"] = function(session, body)
  local utils = require "dap.utils"
  utils.notify(
    string.format('probe-rs: Opening RTT channel %d with name "%s"!', body.channelNumber, body.channelName)
  )
  local file = io.open("probe-rs.log", "a")
  if file then
    file:write(
      string.format(
        '%s: Opening RTT channel %d with name "%s"!\n',
        os.date "%Y-%m-%d-T%H:%M:%S",
        body.channelNumber,
        body.channelName
      )
    )
  end
  if file then file:close() end
  session:request("rttWindowOpened", { body.channelNumber, true })
end
-- After confirming RTT window is open, we will get rtt-data-events.
-- I print them to the dap-repl, which is one way and not separated.
-- If you have better ideas, let me know.
dap.listeners.before["event_probe-rs-rtt-data"]["plugins.nvim-dap-probe-rs"] = function(_, body)
  local message =
    string.format("%s: RTT-Channel %d - Message: %s", os.date "%Y-%m-%d-T%H:%M:%S", body.channelNumber, body.data)
  local repl = require "dap.repl"
  repl.append(message)
  local file = io.open("probe-rs.log", "a")
  if file then file:write(message) end
  if file then file:close() end
end
-- Probe-rs can send messages, which are handled with this listener.
dap.listeners.before["event_probe-rs-show-message"]["plugins.nvim-dap-probe-rs"] = function(_, body)
  local message = string.format("%s: probe-rs message: %s", os.date "%Y-%m-%d-T%H:%M:%S", body.message)
  local repl = require "dap.repl"
  repl.append(message)
  local file = io.open("probe-rs.log", "a")
  if file then file:write(message) end
  if file then file:close() end
end

vim.keymap.set('n', '<Leader><space>', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').toggle_breakpoint() end)
--vim.keymap.set('n', '<Leader>k', function() require('dap').step_over() end)
--vim.keymap.set('n', '<Leader>I', function() require('dap').step_into() end)
--vim.keymap.set('n', '<Leader>O', function() require('dap').step_out() end)
