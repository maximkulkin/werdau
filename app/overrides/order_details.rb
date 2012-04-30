Deface::Override.new(
  :name => 'order_fields',
  :virtual_path => 'spree/shared/_order_details',
  :replace_contents => 'div.steps-data',
  :partial => 'spree/shared/order_steps_data'
)

Deface::Override.new(
  :name => 'order_fields',
  :virtual_path => 'spree/admin/orders/customer_details/_form',
  :insert_top => 'table[data-hook="customer_guest"] tbody',
  :text => "
    <tr>
      <td class='lbl-col'><%= f.label :name, t(:person_name) %></td>
      <td class='val-col' colspan='3'><%= f.text_field :name, :class => 'fullwidth' %></td>
      <td class='lbl-col'><%= f.label :phone, t(:phone) %></td>
      <td class='val-col' colspan='3'><%= f.text_field :phone %></td>
    </tr>
  "
)
