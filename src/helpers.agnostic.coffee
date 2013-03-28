jQuery(document)
  .ready ->
    window.contact = new Backbone.Model
      "first_name": "Erin"
      "last_name": "Swenson-Healey"
      "phone": "555-1212"
      "addresses": [
        "type": "home"
        "city": "Duvall"
        "state": "WA"
      ,
        "type": "office"
        "city": "Santa Monica"
        "state": "CA"
      ]
    window.rolodexCard = new window.RolodexCard
      "model": window.contact
    jQuery("#demo")
      .append window.rolodexCard.render().$el
