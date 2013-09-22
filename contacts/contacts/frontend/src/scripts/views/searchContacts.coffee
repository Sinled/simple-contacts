'use strict';


#------------------------------------------------------------------------------
# Search contact view
#------------------------------------------------------------------------------

class App.Views.SearchContactsView extends Backbone.View
	el: '.search-table-block'

	initialize: ->
		console.log 'init SearchContactView' if DEBUG

		searchField = @$('#search-field')

		console.log searchField if DEBUG

		searchField.on 'keyup', @searchContacts

	searchContacts: (event) =>
		# console.log $(event.target).val() if DEBUG
		App.vent.trigger 'search:contact', $(event.target).val() 
