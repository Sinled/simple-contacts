'use strict';

#------------------------------------------------------------------------------
# Add contact view
#------------------------------------------------------------------------------

class App.Views.AddContactView extends Backbone.View
	template: App.template('editContact')

	initialize: ->
		# console.log "init AddContactView" if DEBUG
		console.log "init AddContactView", @model if DEBUG

	events: 
		'submit': 'addContact'
		'click [data-action="close-edit"]': 'closeEdit'

	render: ->
		@$el.html @template(@model.attributes)
		return @

	addContact: (event) ->
		event.preventDefault()
		form = $(event.target)

		@model.set
			first_name: form.find('#first_name-field').val()
			last_name: form.find('#last_name-field').val()
			position: form.find('#position-field').val()
			phone: form.find('#phone-field').val()

		console.log "this model", @model if DEBUG
		App.vent.trigger 'addContact:contact', @model
		@unrender()

	closeEdit: (event) ->
		event.preventDefault()
		@unrender()

	unrender: ->
		console.log "close edit" if DEBUG	
		@$el.parent().fadeOut =>
			@$el.remove()
