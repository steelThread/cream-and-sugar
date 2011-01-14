{Types} = require '../lib/index'

#############################################
test 'function prototype', ->
  ok Function::createCallback?
  ok Types.isFunction Function::createCallback

#############################################
test 'create callback', ->
  fn = ->
    eq 2, arguments.length
    eq 'arg1', arguments[0]
    eq 'arg2', arguments[1]

  callback = fn.createCallback 'arg1', 'arg2'
  result = callback 'ignored'

#############################################
test 'create sequence', ->
  hi  = (arg) -> 
    eq 'arg', arg
    'first'

  sequence = hi.createSequence (arg) -> eq 'arg', arg
  eq 'first', sequence 'arg'

#############################################
test 'create sequence with scope', ->
  class Fixture
    constructor: ->
    test: (scope) -> ok this is scope

  fixture = new Fixture
  scoped = (->).createSequence fixture.test, fixture
  scoped fixture

  scoped = (->).createSequence fixture.test
  scoped global
  