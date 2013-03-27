class window.RawLayoutManagerView extends Backbone.View
  className: "layout-manager"
  initialize: ->
    @regionEls = {}
  template: do ->
    t = '
    <div class="region navigation"></div>
    <div class="region content"></div>
    '
  render: ->
    @$el.append this.template
    @regionEls =
      "navigation" : @$el.find(".region.navigation")
      "content"    : @$el.find(".region.content")
    @regionEls.navigation.append new window.SidebarView().render().$el
    @showHome()
    return @
  swapContentView: (ViewConstructor) ->
    @activeContentView?.remove()
    @activeContentView = new ViewConstructor()
    @regionEls.content.append @activeContentView.render().$el
  showContacts: ->
    @swapContentView window.ContactsView
  showProfile: ->
    @swapContentView window.ProfileView
  showHome: ->
    @swapContentView window.HomePageView

jQuery(document)
  .ready ->
    window.router        = new window.Workspace()
    window.layoutManager = new window.RawLayoutManagerView()
    jQuery("#demo")
      .append window.layoutManager.render().$el
    Backbone.history.start()
