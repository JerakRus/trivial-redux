actionTypesFor = require '../action_types'

module.exports = (entity_name, endpoint, settings) ->
  format = (url) -> if settings?.skipFormat then url else url + '.json'

  index: ->
    types: actionTypesFor('index', entity_name)
    meta:
      fetch:
        url: format(endpoint)
  show: (id) ->
    types: actionTypesFor('show', entity_name)
    meta:
      fetch:
        url:  format("#{endpoint}/#{id}")
  create: (data) ->
    types: actionTypesFor('create', entity_name)
    meta:
      fetch:
        url: endpoint
        data: data
        method: 'POST'
  update: (id, data) ->
    types: actionTypesFor('update', entity_name)
    meta:
      fetch:
        url: format("#{endpoint}/#{id}")
        method: "PUT"
        data: data
  destroy: (id) ->
    types: actionTypesFor('destroy', entity_name)
    meta:
      fetch:
        url: format("#{endpoint}/#{id}")
        method: "DELETE"