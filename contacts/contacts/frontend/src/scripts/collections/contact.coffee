'use strict';

#------------------------------------------------------------------------------
# Contacts Collection
#------------------------------------------------------------------------------
class App.Collections.ContactsCollection extends Backbone.Collection
	model: App.Models.ContactModel

	initialize: ->
		console.log "init ContactsCollection" if DEBUG

