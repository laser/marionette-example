class window.RawLayoutManagerView extends Backbone.View
  className: "layout-manager"
  initialize: ->
    @activeContentView = new window.HomePageView()
    @regionEls = {}
  template: do ->
    t = '
    <div class="region navigation"></div>
    <div class="region content"></div>
    '
  render: ->
    @$el.append this.template
    @regionEls =
      "navigation": @$el.find(".region.navigation")
      "content": @$el.find(".region.content")
    @regionEls.navigation.append new window.SidebarView().render().$el
    @regionEls.content.append @activeContentView.render().$el
    return @
  swapContentView: (ViewConstructor) ->
    @activeContentView.remove()
    @activeContentView = new ViewConstructor()
    @regionEls.content.append @activeContentView.render().$el
  showRawContacts: ->
    @swapContentView window.ContactsView
  showRawProfile: ->
    @swapContentView window.ProfileView
  showRawHome: ->
    @swapContentView window.HomePageView
