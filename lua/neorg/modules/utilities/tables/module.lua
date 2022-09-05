--[[
    DATEINSERTER
    This module is responsible for handling the insertion of date and time into a neorg buffer.
--]]

require('neorg.modules.base')
require('neorg.events')

local module = neorg.modules.create("utilities.dateinserter")
local log = require('neorg.external.log')

module.load = function()
  log.info("DATEINSERTER loaded!")
  neorg.events.broadcast_event(neorg.events.create(module, "utilities.dateinserter.events.our_event"))
end

module.on_event = function(event)
  log.info("Received event:", event)
end

module.public = {

  version = "0.1",

  insert_datetime = function()
    vim.cmd("put =strftime('%c')")
  end

}

module.events.defined = {

  our_event = neorg.events.define(module, "our_event")

}

module.events.subscribed = {

  ["utilities.dateinserter"] = {
    our_event = true
  }

}

return module
