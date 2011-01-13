{Types} = require '../lib/index'

#############################################
test 'function prototype', ->
  ok Function::createCallback?
  ok Types.isFunction Function::createCallback

test 'create callback', ->
  fn = ->
    ok arguments.length is 2
    Object
    arguments[0] = 'arg1'
    arguments[1] = 'arg2'

  callback = fn.createCallback 'arg1', 'arg1'
  callback 'ignored'