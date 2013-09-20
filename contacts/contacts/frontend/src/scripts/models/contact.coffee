'use strict';

#------------------------------------------------------------------------------
# Contact model
#------------------------------------------------------------------------------

class App.Models.ContactModel extends Backbone.Model
	defaults:
		first_name: "John"
		last_name: "Smith"
		position: "whatever"
		phone: "066 999 99 99"

	initialize: ->
		console.log "init ContactModel" if DEBUG
		@.on 'change', ->
			console.log 'test' if DEBUG

	validate: (attrs) ->
		'A contact requires a valid Name' unless $.trim(attrs.first_name)
		'A contact requires a valid Last name' unless $.trim(attrs.last_name)
		'A contact requires a valid position' unless $.trim(attrs.position)
		'A contact requires a valid phone' unless $.trim(attrs.phone)
