React = require('react')
Router = require('react-router')
Link = React.createFactory Router.Link
MomentDisplay = React.createFactory require('./MomentDisplay')
Paths = require('antwar-core/PathsMixin')
BlogLink = React.createFactory require('antwar-core/BlogLink')
config = require 'config'
_ = require('lodash')

{ div, li, p, ul, h1, h3, span } = require 'react-coffee-elements'

module.exports = React.createClass

	displayName: 'SectionIndex'

	mixins: [
		Router.State
		Paths
	]

	render: ->
		div {className: 'grid'},
			h1 config.theme.sectionTitle or 'Blog posts'
			ul { className: 'post-list'},
				_.map _.sortBy(@getAllItems(), 'date').reverse(), (item) =>
					li key: item.url,
						h3 {className: 'post-list__heading'},
							BlogLink
								item: item
							, item.title
							if item.draft then span className: 'draft-text', ' Draft'
						if item.date
							MomentDisplay
								datetime: item.date
						p {className: 'post-list__preview'},
							item.preview
