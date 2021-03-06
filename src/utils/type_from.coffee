actions  = require '../actions'
reducers = require '../reducers'

DEFAULT_ENDPOINT_TYPE = 'rest'

module.exports = (endpoint, settings) ->
  type = if typeof endpoint is 'object'
    endpoint.type || settings.type || DEFAULT_ENDPOINT_TYPE
  else
    DEFAULT_ENDPOINT_TYPE

  throw "Unknown endpoint type \"#{type}\"" unless actions[type]? && reducers[type]?

  type
