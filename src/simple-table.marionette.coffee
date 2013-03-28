window.TableRow = Backbone.Marionette.ItemView.extend
  tagName: "tr"
  template: do ->
    t = '
    <td><%= first_name %></td>
    <td><%= last_name %></td>
    <td><%= email_address %></td>
    '

window.Table = Backbone.Marionette.CompositeView.extend
  className: "table"
  itemView: window.TableRow
  itemViewContainer: "tbody"
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
