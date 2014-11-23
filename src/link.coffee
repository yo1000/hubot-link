# Description:
#   make links
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ln - Show link entries
#   hubot ln <alias> ["option"] - Send source message
#   hubot ln add <alias> "<source message>" - Add link entry
#   hubot ln rm <alias> - Remove link entry
#   hubot ln remove <alias> - Remove link entry
#
# Author:
#   Yoichi-KIKUCHI
{TextMessage, User} = require "../../hubot"

module.exports = (robot) ->
  BRAIN_KEY_LINK = "link_entry"

  robot.respond /ln$/i, (msg) ->
    messages = ""
    lnEntries = robot.brain.get BRAIN_KEY_LINK
    for lnKey, lnVal of lnEntries
      messages += "#{lnKey} -> \"#{lnVal}\"\n"
    if messages isnt ""
      msg.send messages

  robot.respond /ln (.+)$/i, (msg) ->
    text = msg.match[1]

    if /add (.+) "(.+)"$/i.test text
      ln.add msg, text
    else  if /(?:rm|remove) (.+)$/i.test text
      ln.remove msg, text
    else
      ln.command msg, text

  ln = {}
  ln.add = (msg, text) =>
    match = text.match /add (.+) "(.+)"$/i
    lnKey = match[1]
    lnVal = match[2]
    lnEntries = robot.brain.get BRAIN_KEY_LINK
    lnEntries = if lnEntries? then lnEntries else {}
    lnEntries[lnKey] = lnVal
    robot.brain.set BRAIN_KEY_LINK, lnEntries
    msg.send "Add link: #{lnKey} -> \"#{lnVal}\""

  ln.remove = (msg, text) =>
    match = text.match /(?:rm|remove) (.+)$/i
    lnKey = match[1]
    lnEntries = robot.brain.get BRAIN_KEY_LINK
    lnEntries = if lnEntries? then lnEntries else {}
    delete lnEntries[lnKey]
    robot.brain.set BRAIN_KEY_LINK, lnEntries
    msg.send "Remove link: #{lnKey}"

  ln.command = (msg, text) =>
    match = text.match /([^ ]+)([\s]+.*)?$/i
    lnKey = match[1]
    lnOpt = ""
    if match.length > 2
      lnOpt = if match[2]? then match[2].trim().replace(/^"/, "").replace(/"$/, "") else ""
    lnEntries = robot.brain.get BRAIN_KEY_LINK
    lnEntries = if lnEntries? then lnEntries else {}
    lnCmd = lnEntries[lnKey]
    author = msg.message.user
    message = "#{robot.name}:  #{lnCmd}#{lnOpt}"
    robot.adapter.receive new TextMessage(author, message)