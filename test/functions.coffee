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
  hi  = (name) -> 
    eq 'Fred', name
    true

  bye = (name) -> eq 'Fred', name
  sequence = hi.createSequence bye
  ok sequence 'Fred'