# Install the required package
install.packages('rvest')

# Load the rvest library
library(rvest)


link = read_html("https://en.prothomalo.com/international/middle-east/0bt1n1i6zr")
heading = html_node(link, '#container')
text = html_text(heading)

print(text)
paragraph = html_nodes(link, 'p')
p_text = html_text(paragraph)
print(head(p_text))

paragraph1 = html_nodes(link, 'title')
h_text = html_text(paragraph1)
print(head(h_text))

