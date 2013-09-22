'use strict';

#------------------------------------------------------------------------------
# App view
#------------------------------------------------------------------------------
console.log( "app views" ,JSON.parse(JSON.stringify(window.App.Views)));

# console.log "app views" , App.Views if DEBUG


class App.Views.Application extends Backbone.View
	initialize: ->
		console.log 'init Application' if DEBUG
		# console.log 'Application collection', @collection if DEBUG

		contactsView = new App.Views.ContactsCollectionView
			collection: @collection

		new App.Views.SearchContactsView

		$('#contactList').append contactsView.render().el

		$('[data-action="add-contact"]').on 'click', @addContact


	render: ->
		compiled = @template
		return @

	
	addContact: (event) =>
		event.preventDefault()
		model = new App.Models.ContactModel

		addContactView = new App.Views.AddContactView
			model: model

		$('[data-role="edit-contact"]').html(addContactView.render().el).hide().fadeIn()
