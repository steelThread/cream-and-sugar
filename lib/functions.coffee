#
#  function-utils.coffee: a few utils for working with functions and scope.
#  Inspired by some of the ExtJs Function mixins.
#
#  (C) 2011 Sean McDaniel
#  MIT LICENCE
#
{Types} = require './types'

#
#  Creates a function with bound args for later execution wiht
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
#unless Function::createDelegate?
#  Function::createCallback = ->
#    args = arguments
#    scope = args
#    fn = this
#    return -> return fn.apply this, args
  
#
#
#
#unless Function::createInterceptor?
          
#
# create a sequence using an optional scope
#
unless Function::createSequence?
  Function::createSequence = (fn, scope) ->
    me = this
    unless Types.isFunction fn
      me
    else ->
      ret = me.apply this ? global, arguments 
      fn.apply scope ? this ? global, arguments
      ret
#
#
#
#unless Function::defer?
  