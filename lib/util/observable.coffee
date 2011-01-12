{EventEmitter} = require 'events'

#
# Observable base type for OhOh CoffeeScript (blasphmey)
# The goal here is to ensure that listeners are really
# registering for supported events.  This is just to head
# off potential bugs early one.  In addition we add the 'un' 
# sugar to EventEmitter.
#
class Observable extends EventEmitter
  constructor: (@events...) ->
    events.push 'newListener'
  
  # 
  # allow attaching multiple listener at once
  #
  addListener: (event, listener) ->
    @assert event
    super event, listener

  #
  # allow attaching multiple listeners at once
  #
  on: (event, listener) -> @addListener event, listener

  #
  # register a one time listener
  #
  once: (event, listener) ->
    @assert event
    super event, listener

  #
  # removeListener sugar
  #
  un: (event, listener) -> @removeListener event, listener

  #
  # asserts the event is supported
  #
  assert: (event) ->
    throw new Error "#{event} is not a supported event" unless @supports event 

  #
  # determines if an event is supported
  #
  supports: (event) -> event in @events 

module.exports = Observable