{mapValues} = require 'lodash'

components =
  actions: require './actions'
  types: require './types'
  reducers: require './reducers'

module.exports = components

module.exports.createApi = -> mapValues(components, -> {})