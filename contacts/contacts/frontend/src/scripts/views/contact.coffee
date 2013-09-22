'use strict';

#------------------------------------------------------------------------------
# contact view
#------------------------------------------------------------------------------

class App.Views.ContactView extends Backbone.View
	tagName: "tr"
	template: App.template('contactRow')

	initialize: ->
		console.log "init ContactView" if DEBUG
		# console.log "init ContactView", @model if DEBUG
		@model.on 'destroy', @unrender, @
		@model.on 'change', @render, @

	events:
		'click [data-action="model-edit"]': 'editModel'
		'click [data-action="model-remove"]': 'removeModel'

	render: ->
		console.log 'render' if DEBUG
		@$el.html @template(@model.toJSON())
		return @

	editModel: (event) =>
		event.preventDefault()
		console.log "edit" if DEBUG

		editContactView = new App.Views.EditContactView
			model: @model

		$('[data-role="edit-contact"]').html(editContactView.render().el).hide().fadeIn()


	removeModel: (event) ->
		event.preventDefault()
		console.log "remove" if DEBUG
		console.log @model if DEBUG
		@model.destroy()

	unrender: ->
		console.log 'unrender' if DEBUG
		@remove()


#------------------------------------------------------------------------------
# contact collection view
#------------------------------------------------------------------------------

class App.Views.ContactsCollectionView extends Backbone.View
	tagName: "tbody"

	initialize: ->
		App.vent.on 'addContact:contact', @addNew
		App.vent.on 'search:contact', @filterContacts

		console.log "init ContactsCollectionView" if DEBUG

		@collection.on 'add', @addOne
		@collection.on 'change', ->
			console.log "collection changed" if DEBUG


	events:
		'click .show-collection': 'showCollection'

	render: =>
		@collection.each(@addOne)
		return @

	addOne: (contact) =>
		contactView = new App.Views.ContactView
			model: contact

		@$el.append(contactView.render().$el)
		console.log "ContactsCollection", @collection if DEBUG

	addNew: (contact) =>
		@collection.add contact
		console.log "updated collection", @collection if DEBUG

	showCollection: (event) ->
		event.preventDefault()
		console.log 'ContactsCollectionView', @collection if DEBUG

	filterContacts: (query) =>
		console.log query if DEBUG
		allRows = @$el.find('tr')
		allRows.hide()

		allRows.filter(':contains("' + query + '")').show().toLowerCase()
