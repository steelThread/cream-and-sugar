{Types} = require '../lib/index'

class ScopeFixture
  constructor:  ->
  scope: (scope) -> ok this is scope


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
  fixture = new ScopeFixture
  scoped = (->).createSequence fixture.scope, fixture
  scoped fixture

  notscoped = (->).createSequence fixture.scope
  notscoped global

  notscoped = (->).createSequence fixture.scope, global
  notscoped global
  
#############################################
test 'create interceptor', ->
  target = -> "test"

  interceptor = target.createInterceptor ->
  eq "test", interceptor()

  interceptor = target.createInterceptor -> off
  eq undefined, interceptor() 

#############################################
test 'create interceptor with scope', ->
  target = (scope) -> "test"
  fixture = new ScopeFixture

  interceptor = target.createInterceptor fixture.scope, fixture
  eq "test", interceptor fixture

  interceptor = target.createInterceptor fixture.scope
  eq "test", interceptor global

#############################################
test 'create delegate', ->
  class Fixture
    constructor: (@arg) ->
    test: -> @arg

  fixture = new Fixture "test"
  delegate = fixture.test.createDelegate()
  ok not delegate()?

  delegate = fixture.test.createDelegate fixture
  eq "test", delegate()

#############################################
test 'create delegate append args', ->
  class Fixture
    test: -> arguments
  
  args = ["arg1", "arg2", "arg3", "arg4"]
  fixture = new Fixture
  delegate = fixture.test.createDelegate fixture, args[2..]
  arrayEq args[2..], Array::slice.call delegate("arg1", "arg2"), 0

  delegate = fixture.test.createDelegate fixture, args[2..], true
  arrayEq args, Array::slice.call delegate("arg1", "arg2"), 0
