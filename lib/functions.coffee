#
#  function-utils.coffee: a few utils for working with functions and scope.
#  Inspired by some of the ExtJs Function mixins.
#
#  (C) 2011 Sean McDaniel
#  MIT LICENCE
#
Trait = require 'traits'


#
#  Creates a function with bound args for later execution
#
#unless Function.prototype.createCallback?
#  Trait.compose Function.prototype, Trait {
#    createCallback: () ->
#  }

#
#  Creates a delegate that sets the scope of the call.  Also 
#  supports either overriding or appending of arguments onto
#  the call.
#
#createDelegate = (fn, scope, args, appendArgs) ->
  
#
#
#
unless Function.prototype.createInterceptor?
  Trait.compose Function.prototype, Trait 
    createInterceptor: (fn, scope) ->
	  method = this
	  
      	


#
#
#
#createSequence = ->

#
#
#
#defer = ->
  