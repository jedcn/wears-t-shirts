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

<img src="<%= tshirt["image_url"] %>" />
<% end %>
EOF

puts ERB.new(template, nil, '-').result(binding)
