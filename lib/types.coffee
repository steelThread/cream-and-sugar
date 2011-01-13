#
#  types.coffee: verify types
#
#  (C) 2011 Sean McDaniel
#  MIT LICENCE
#
class Types
  constructor: ->
  
  string:   (val) -> typeof val is 'string'
  boolean:  (val) -> typeof val is 'boolean'
  number:   (val) -> typeof val is 'number' and isFinite val
  primitive:(val) -> @string(val) or @boolean(val) or @number(val)
  date:     (val) -> @assert val, '[object Date]'
  object:   (val) -> @assert val, '[object Object]'
  function: (val) -> @assert val, '[object Function]'
  array:    (val) -> @assert val, '[object Array]'
  
  assert: (val, expected) -> expected is toString.apply val

exports.Types = Object.seal(new Types)