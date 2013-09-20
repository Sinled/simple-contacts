'use strict';

#------------------------------------------------------------------------------
# App Router
#------------------------------------------------------------------------------

class App.Router extends Backbone.Router
	routes: 
		"": "index"

	index: ->
		console.log "hello from index router" if DEBUG

	start: ->
		Backbone.history.start
			pushState: on
