#
#  observable.coffee: small wrapper around node's EventEmitter 
#
#  (C) 2011 Sean McDaniel
#  MIT LICENCE
#
{EventEmitter} = require 'events'

#
#  Observable base type for OhOh CoffeeScript.  Blasphmey you 
#  say. Well... perhaps but it's just so damn nice.
#
#  The goal here is to ensure that listeners are really
#  registering for supported events.  This is just to head
#  off potential bugs early one.  In addition we add the 'un' 
#  sugar to EventEmitter and the ability to register multiple
#  listeners at once
#
class Observable extends EventEmitter
  constructor: (@events...) -> events.push 'newListener'
  
  # 
  #  allow attaching multiple listener at once
  #
  addListener: (event, listener) ->
    unless typeof event is 'object'
      @assert event
      super event, listener
    else
      for ev of event 
        @addListener ev, event[ev]      

  #
  #  on override with assert guard
  #
  on: (event, listener) -> @addListener event, listener

  #
  #  register a one time listener
  #
  once: (event, listener) ->
    @assert event
    super event, listener

  #
  #  removeListener sugar
  #
  un: (event, listener) -> @removeListener event, listener

  #
  #  asserts the event is supported
  #
  assert: (event) ->
    throw new Error "#{event} is not a supported event" unless @supports event 

  #
  #  determines if an event is supported
  #
  supports: (event) -> event in @events 

  #
  #  removes all event listeners
  #
  purgeListeners: -> @removeAllListeners event for event in @events

exports.Observable = Observable