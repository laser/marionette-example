class window.RolodexCard extends Backbone.View
  className: "rolodex-card"
  template: do ->
    t = '
    <div class="name">Name: <%= getFullName() %></div>
    <div class="phone">Phone Number: <%= phone %></div>
    <div class="home_city">Home City: <%= getCity("home") %></div>
    '
  render: ->
    @$el.append _.template(@template, _.extend(@model.toJSON(), @viewHelpers))
    return @
  viewHelpers:
    getFullName: ->
      return this.first_name + " " + this.last_name
    getCity: (type)->
      address = _.find this.addresses, (address)->
        return address.type == type
      return address.city + ", " + address.state
