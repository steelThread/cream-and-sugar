#
#  functions.coffee: a few Function mixins for working with functions and scope.
#  Inspired by some of the ExtJs Function mixins.
#
#  (C) 2011 Sean McDaniel
#  MIT LICENCE
#
{Types} = require './types'

#
#  Creates a function with bound args for later execution with
#  global scope.  Need a scoped callback then check out 
#  createDelegate
#
unless Function::createCallback?
  Function::createCallback = ->
    me = this
    args = arguments
    -> me.apply global, args

#
#  Creates a delegate that sets the scope of the call.  Also 
#  supports either overriding or appending of arguments onto
#  the call.
#
unless Function::createDelegate?
  join = (arguments, args) -> Array::slice.call(arguments, 0).concat args
  Function::createDelegate = (scope = global, args = [], append = false) ->
    me = this
    -> me.apply scope, if append then join arguments, args else args 
    
#
#  Creates an interceptor function. The passed function
#  will act as the interceptor.  The interceptor can
#  stop the execution by returning false.  The returned
#  value of the resulting function returns the value of
#  the intercepted function unless of course it isn't 
#  called, ie when the interceptor returns false
#
unless Function::createInterceptor?
  Function::createInterceptor = (fn, scope = global) ->
    me = this
    if not Types.isFunction fn then me
    else ->
      if fn.apply(scope, arguments) isnt false
        me.apply this ? global, arguments

#
#  Create an advisor.  Similar to an interceptor except may
#  change the arguments and return values of the advised
#  function, a la decorators.  The returned value is the
#  return value of the advisor function
#         
#unless Function::createProxy?
#  Function::createProxy = (fn, scope = global) ->
#    me = this
#    if not Types.isFunction fn then me
#    else ->
#      if fn.apply(scope, arguments) isnt false
#        me.apply this ? global, arguments

#
# create a sequence using an optional scope
#
unless Function::createSequence?
  Function::createSequence = (fn, scope = global) ->
    me = this
    if not Types.isFunction fn then me
    else ->
      ret = me.apply this ? global, arguments 
      fn.apply scope, arguments
      ret