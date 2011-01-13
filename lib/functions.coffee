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
    return ->
      return fn.apply fn, args

#
#  Creates a delegate that sets the scope of the call.  Also 
#  supports either overriding or appending of arguments onto
#  the call.
#
#createDelegate = (fn, scope, args, appendArgs) ->
  
#
#
#
#unless Function.prototype.createInterceptor?
#  Trait.compose Function.prototype, Trait 
#    createInterceptor: (fn, scope) ->#
#     outter = this
#      return outter if not Types.function fn
#      return ->
#        me = this
#        args = arguments
#        fn.target = me
#        fn.method = this
#        return -> fn.apply(scope ? me, args)
          
#
#
#
#createSequence = ->

#
#
#
#defer = ->
  