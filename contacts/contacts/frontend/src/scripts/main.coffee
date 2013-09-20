window.App =
	Models: {}
	Collections: {}
	Views: {}
	Router: {}
	template: (templateName) ->
		_.template($("[data-template=#{templateName}]").html())

	vent: _.extend {}, Backbone.Events
