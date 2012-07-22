# encoding: utf-8
Deface::Override.new(
  :name => 'add_pros_and_cons_to_admin_reviews_table',
  :virtual_path => 'spree/admin/reviews/index',
  :replace => 'code[erb-loud]:contains("h review.review")',
  :text => '
<p>Достоинства: <%= review.pros %></p>
<p>Недостатки: <%= review.cons %></p>
<p>Комментарий: <%= review.review %></p>
  '
)
