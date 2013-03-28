class window.Paginator extends Backbone.View
  className: "paginator"
  events:
    "click a" : "_onPageClicked"
  initialize: (options)->
    @data        = options.data
    @rowsPerPage = 5
    @currentPage = 1
    @_paginate @currentPage
    @collection.on("reset", @_updateActiveLink, @)
  render: ()->
    @$el.html(@template)
    @_updateActiveLink()
    return @
  template: do ->
    t = '
    Page:
    <a href="#">1</a>
    <a href="#">2</a>
    <a href="#">3</a>
    '
  _onPageClicked: (e)->
    @_paginate jQuery(e.target).text()
  _paginate: (page)->
    @currentPage  = page
    begin         = (page-1)*5
    end           = begin+@rowsPerPage
    @collection.reset(@data.slice(begin, end))
  _updateActiveLink: ()->
    @$el.find("a").removeClass("active")
    @$el.find(":contains('" + @currentPage + "')").addClass("active")

class window.Contact extends Backbone.Model

class window.Contacts extends Backbone.Collection
  model: window.Contact

jQuery(document)
  .ready ->
    data = []
    _(15).times ()->
      id = Math.round(Math.random()*1000).toString()
      data.push
        "first_name": "erin-" + id
        "last_name": "smith-" + id
        "email_address": "erin-" + id + "@example.com"
    collection = new window.Contacts()
    paginator = new window.Paginator
      collection: collection
      data: data
    table = new window.Table
      collection: collection
    jQuery("#demo").append table.render().$el
    jQuery("#demo").append paginator.render().$el
