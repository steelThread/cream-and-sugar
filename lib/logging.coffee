#
#  logging.coffee: brighten up your log files.  The log api uses util.log 
#  for timestamping entries while the puts api is really just console.log 
#  with the ability to stringify, via util.inspect, passed objects.
#
#  (C) 2011 Sean McDaniel
#  MIT LICENCE
#
require 'colors'
puts           = console.log
{Types}        = require './types'
{log, inspect} = require 'util'

exports.log       = (msg) -> log msg.green
exports.log.error = (msg) -> log msg.red

exports.puts       = (obj) -> puts stringify obj
exports.puts.green = (obj) -> puts stringify(obj).green
exports.puts.red   = (obj) -> puts stringify(obj).red
exports.puts.grey  = (obj) -> puts stringify(obj).grey

stringify = (obj) -> if Types.isString obj then obj else inspect obj