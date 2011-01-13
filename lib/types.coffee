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
  date:     (val) -> @assert val, '[object Date]'
  object:   (val) -> @assert val, '[object Object]'
  function: (val) -> @assert val, '[object Function]'
  array:    (val) -> @assert val, '[object Array]'
    
  assert: (val, expected) -> toString.apply(val) is expected


#types.object  = (val) -> typeof val is 'object'
#types.date  = (val) -> typeof val is '[object Date]'
#types.isString = (val) -> typeof v is 'string'
#types.isString = (val) -> typeof v is 'string'
#types.isString = (val) -> typeof v is 'string'
#types.isString = (val) -> typeof v is 'string'

exports.Types = new Types