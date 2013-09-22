'use strict';

#------------------------------------------------------------------------------
# Edit contact view
#------------------------------------------------------------------------------

class App.Views.EditContactView extends Backbone.View
	template: App.template('editContact')

	initialize: ->
		console.log "init EditContactView", @model if DEBUG

	events: 
		'submit': 'saveContact'
		'click [data-action="close-edit"]': 'closeEdit'

	render: ->
		@$el.html @template(@model.attributes)
		return @

	saveContact: (event) ->
		event.preventDefault()
		form = $(event.target)

		@model.set
			first_name: form.find('#first_name-field').val()
			last_name: form.find('#last_name-field').val()
			position: form.find('#position-field').val()
			phone: form.find('#phone-field').val()

		console.log 'EditContactView save', @model if DEBUG

		@unrender()

	closeEdit: (event) ->
		event.preventDefault()
		@unrender()

	unrender: ->
		console.log "close edit" if DEBUG	
		@$el.parent().fadeOut =>
			@$el.remove()
