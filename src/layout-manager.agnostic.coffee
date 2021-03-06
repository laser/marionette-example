class window.Workspace extends Backbone.Router
  routes:
    "home"     : "showHome"
    "profile"  : "showProfile"
    "contacts" : "showContacts"
  showContacts: ->
    window.layoutManager.showContacts()
  showHome: ->
    window.layoutManager.showHome()
  showProfile: ->
    window.layoutManager.showProfile()

class window.ProfileView extends Backbone.View
  class: "profile"
  template: do ->
    t = '
    <h2>Viewing Your Profile</h1>
    <p>here is your profile information</p>
    '
  render: ->
    @$el.append this.template
    return @

class window.HomePageView extends Backbone.View
  class: "home"
  template: do ->
    t = '
    <h2>Welcome Home</h1>
    <p>Lorem Ipsum blah blah blah blah
    Lorem Ipsum blah blah blah blah
    Lorem Ipsum blah blah blah blah
    Lorem Ipsum blah blah blah blah
    Lorem Ipsum blah blah blah blah</p>
    '
  render: ->
    @$el.append this.template
    return @

class window.ContactsView extends Backbone.View
  class: "contacts"
  template: do ->
    t = '
    <h2>Manage Your Contacts</h2>
    <ul>
      <li>first contact</li>
      <li>second contact</li>
      <li>third contact</li>
    </ul>
    '
  render: ->
    @$el.append this.template
    return @

class window.SidebarView extends Backbone.View
  className: "sidebar"
  template: do ->
    t = '
    <h2>bunch of links here</h2>
    <a href="#home">Home</a>
    <a href="#profile">Your Profile</a>
    <a href="#contacts">Your Contacts</a>
    '
  render: ->
    @$el.append this.template
    return @

jQuery(document)
  .ready ->
    window.router        = new window.Workspace()
    window.layoutManager = new window.LayoutManager()
    jQuery("#demo")
      .append window.layoutManager.render().$el
    Backbone.history.start()
