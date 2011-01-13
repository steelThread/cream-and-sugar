#
#  function-utils.coffee: a few utils for working with functions and scope.
#  Inspired by some of the ExtJs Function mixins.
#
#  (C) 2011 Sean McDaniel
#  MIT LICENCE
#
Types = require './types'

#
#  Creates a function with bound args for later execution.  Need a scoped
#  callback, check out createDelegate
#
unless Function::createCallback?
  Function::createCallback = ->
    args = arguments
    fn = this
    return -> return fn.apply fn, args

#
#  Creates a delegate that sets the scope of the call.  Also 
#  supports either overriding or appending of arguments onto
#  the call.
#
#unless Function::createDelegate?
  
#
#
#
#unless Function::createInterceptor?
          
#
#
#
#unless Function::sequence?

#
#
#
#unless Function::defer?
  