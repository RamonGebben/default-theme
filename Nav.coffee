React = require 'react'
Router = require 'react-router'
PathsMixin = require 'antwar-core/PathsMixin'
Link = React.createFactory Router.Link
_ = require 'lodash'
Config = require 'config'

{ nav, div, a, input, label } = require 'react-coffee-elements'

module.exports = React.createClass

	displayName: 'Nav'

	mixins: [ PathsMixin ]

	render: ->
		div {className: 'nav__wrapper'},
			input type: 'checkbox', className: 'nav__toggle', id: 'nav__toggle'
			label {className: 'nav__toggle-label', htmlFor: 'nav__toggle'}
			nav {className: 'nav'},
				_.map Config.theme.navigation, (link) ->
					Link
						className: 'nav__link'
						to: link.path
						key: link.path
					, link.title
