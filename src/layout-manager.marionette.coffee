window.LayoutManager = Backbone.Marionette.Layout.extend
  className: "layout-manager"
  template: do ->
    t = '
    <div class="region navigation"></div>
    <div class="region content"></div>
    '
  regions:
    "navigation" : ".region.navigation"
    "content"    : ".region.content"
  onRender: ->
    @navigation.show new window.SidebarView()
    @showHome()
  showContacts: ->
    @content.show new window.ContactsView()
  showProfile: ->
    @content.show new window.ProfileView()
  showHome: ->
    @content.show new window.HomePageView()
