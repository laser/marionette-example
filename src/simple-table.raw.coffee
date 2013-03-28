class window.TableRow extends Backbone.View
  render: ()->
    @$el.html(_.template(@template, @model.toJSON()))
    return @
  tagName: "tr"
  template: do ->
    t = '
    <td><%= first_name %></td>
    <td><%= last_name %></td>
    <td><%= email_address %></td>
    '

class window.Table extends Backbone.View
  className: "table"
  initialize: (options)->
    @rows = []
    @collection.on "reset", @_renderDelegates, this
  render: ()->
    @$el.html @template
    @_renderDelegates()
    return @
  template: do ->
    t = '
    <table>
      <thead>
        <tr>
          <th class="first_name">First Name</th>
          <th class="last_name">Last Name</th>
          <th class="email_address">Email</th>
        </tr>
      </thead>
      <tbody></tbody>
    </table>
    '
  _renderDelegates: ()->
    $tbody = @$el.find("tbody")
    _.each @rows, (row)->
      row.remove()
    _.each @collection.models, (model)=>
      @rows.push new window.TableRow
        model: model
      $tbody.append @rows[@rows.length-1].render().$el
