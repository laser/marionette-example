window.RolodexCard = Backbone.Marionette.ItemView.extend
  className: "rolodex-card"
  template: do ->
    t = '
    <div class="name">Name: <%= getFullName() %></div>
    <div class="phone">Phone Number: <%= phone %></div>
    <div class="home_city">Home City: <%= getCity("home") %></div>
    '
  templateHelpers:
    getFullName: ->
      return this.first_name + " " + this.last_name
    getCity: (type)->
      address = _.find this.addresses, (address)->
        return address.type == type
      return address.city + ", " + address.state
