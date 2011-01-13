{Types} = require '../lib/types'

#############################################
test 'string', ->
  ok Types.string 'event'
  ok not Types.string false  

#############################################
test 'boolean', ->
  ok Types.boolean true
  ok not Types.boolean 'true'

#############################################
test 'number', ->
  ok Types.number 123
  ok not Types.number '123'
  ok not Types.number Number.NaN
  ok not Types.number 1.7976931348623157E+10308
  ok not Types.number -1.7976931348623157E+10308

#############################################
test 'date', ->
  ok Types.date new Date()
  ok not Types.date 'today'

#############################################
test 'object', ->
  ok Types.object {}
  ok not Types.object '{}'

#############################################
test 'function', ->
  ok Types.function ->
  ok Types.function toString
  ok not Types.function ''

#############################################
test 'array', ->
  ok Types.array []
  ok not Types.function ''