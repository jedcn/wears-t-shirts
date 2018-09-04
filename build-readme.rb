require("json")

file = File.read("./tshirts.json")
data = JSON.parse(file)

tshirts = data["tshirts"]
require 'erb'

template = <<-EOF
# wears-t-shirts

<% tshirts.each do |tshirt| -%>
* <%= tshirt["name"] %>
<% end -%>

---
<% tshirts.each do |tshirt| %>
## <%= tshirt["name"] %>

<%= tshirt["creator"] %>

<a href="<%= tshirt["link_url"] %>" alt="Buy Now">
  <img src="<%= tshirt["image_url"] %>" width="200" height="200" />
</a>
<% end %>
EOF

puts ERB.new(template, nil, '-').result(binding)
