{Observable} = require '../lib/observable'

class Fixture extends Observable
  constructor: -> super 'event', 'anotherEvent'
  fireEvent: -> @emit 'event', 'arg'
  fireAnotherEvent: -> @emit 'anotherEvent', 'arg'

fixture = new Fixture

#############################################
test "should support", ->
  ok fixture.supports 'event'  
  ok fixture.supports 'anotherEvent'

#############################################
test "should not support", ->
  ok not fixture.supports 'notSupported'  

#############################################
test "assert", ->
  try fixture.assert 'notSupported'
  catch error
    ok true
    
#############################################
test "on", ->
  ok fixture.listeners('event').length is 0
  fixture.on 'event', ->  
  ok fixture.listeners('event').length is 1

#############################################
test "on with unsupported event", ->
  try 
    fixture.on 'notSupported', -> 
    ok false
  catch error
    ok true

#############################################
test "on with multiple listeners", ->
  fixture = new Fixture
  fixture.on
    "event": ->
    "anotherEvent": ->
  ok fixture.listeners 'event' is 1
  ok fixture.listeners 'anotherEvent' is 1

#############################################
test "once with unsupported event", ->
  try 
    fixture.once 'notSupported', -> 
    ok false
  catch error
    ok true

#############################################
test "un", ->
  callback = ->
  fixture = new Fixture
  fixture.on 'event', callback
  ok callback in fixture.listeners 'event'
  fixture.un 'event', callback
  ok callback not in fixture.listeners 'event'

#############################################
test "purge listeners", ->
  fixture.on
    "event": ->
    "anotherEvent": ->
  fixture.purgeListeners()
  ok fixture.listeners 'event' is 0
  ok fixture.listeners 'anotherEvent' is 0