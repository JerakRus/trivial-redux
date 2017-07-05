actionTypesFor = require '../action_types'

defaultState =
  lastUpdatedAt: null
  data: null
  fetching: false

createFetchReducerFor = (entity_name, initialState) ->
  indexTypes = actionTypesFor('fetch', entity_name)
  (state = initialState, action) ->
    switch action.type
      when indexTypes.load
        Object.assign({}, state, fetching: true)
      when indexTypes.success
        lastUpdatedAt: new Date().getTime(), data: Object.assign({}, action.payload), fetching: false
      when indexTypes.failure
        Object.assign({}, state, Object.assign({}, action.payload), fetching: false)
      else
        state

createFetchReducerFor.defaultState = defaultState

module.exports = createFetchReducerFor
