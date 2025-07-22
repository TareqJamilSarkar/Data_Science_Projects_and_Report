install.packages("rvest")
install.packages("tm")
install.packages("SnowballC")
install.packages("tidytext")
install.packages("dplyr")


library(rvest)
library(tm)
library(SnowballC)
library(tidytext)
library(dplyr)


# Read the HTML pages
link1 <- read_html("https://en.prothomalo.com/international/middle-east/0bt1n1i6zr")
link2 <- read_html("https://en.prothomalo.com/international/middle-east/1e9849x5dw")
link3 <- read_html("https://en.prothomalo.com/international/middle-east/ow2b4r98xy")
link4 <- read_html("https://en.prothomalo.com/international/middle-east/lwynuvdqba")

# Extract full text (optional)
heading1 <- html_node(link1, '#container')
text1 <- html_text(heading1)
print(text1)

heading2 <- html_node(link2, '.XAZul') 
text2 <- html_text(heading2)
print(text2)

heading3 <- html_node(link3, '.XAZul , .IiRps') 
text3 <- html_text(heading3)
print(text3)

heading4 <- html_node(link4, '#container') 
text4 <- html_text(heading4)
print(text4)

# Extract paragraphs
paragraphs1 <- html_nodes(link1, 'p')
p_text1 <- html_text(paragraphs1)
print(head(p_text1))

paragraphs2 <- html_nodes(link2, 'p')
p_text2 <- html_text(paragraphs2)
print(head(p_text2))

paragraphs3 <- html_nodes(link3, 'p')
p_text3 <- html_text(paragraphs3)
print(head(p_text3))

paragraphs4 <- html_nodes(link4, 'p')
p_text4 <- html_text(paragraphs4)
print(head(p_text4))

# Extract titles
title1 <- html_text(html_node(link1, 'title'))
title2 <- html_text(html_node(link2, 'title'))
title3 <- html_text(html_node(link3, 'title'))
title4 <- html_text(html_node(link4, 'title'))

print("Title from link 1:")
print(title1)

print("Title from link 2:")
print(title2)

print("Title from link 3:")
print(title3)

print("Title from link 4:")
print(title4)

# Combine into data frames
df1 <- data.frame(
  Title = title1,
  Paragraph = p_text1,
  stringsAsFactors = FALSE
)

df2 <- data.frame(
  Title = title2,
  Paragraph = p_text2,
  stringsAsFactors = FALSE
)

df3 <- data.frame(
  Title = title3,
  Paragraph = p_text3,
  stringsAsFactors = FALSE
)

df4 <- data.frame(
  Title = title4,
  Paragraph = p_text4,
  stringsAsFactors = FALSE
)

# Combine all data frames
scraped_data <- rbind(df1, df2, df3, df4)

# Save to CSV
write.csv(scraped_data, "scraped_data.csv", row.names = FALSE)

# Print a preview
print(head(scraped_data))


# ----------------------------
# Step 2: Data Preprocessing
# ----------------------------

# Combine Paragraphs by Title
scraped_data_clean <- scraped_data %>%
  group_by(Title) %>%
  summarise(Text = paste(Paragraph, collapse = " "), .groups = "drop")

# Convert Text to Lowercase
scraped_data_clean$Text <- tolower(scraped_data_clean$Text)

# Tokenization
tokens <- scraped_data_clean %>%
  unnest_tokens(word, Text)

# Remove Stop Words, Punctuation, Numbers
data("stop_words")  # Built-in in tidytext

clean_tokens <- tokens %>%
  filter(!word %in% stop_words$word) %>%       # Remove stopwords
  filter(!grepl("[0-9]", word)) %>%            # Remove numbers
  filter(!grepl("[[:punct:]]", word)) %>%      # Remove punctuation
  filter(nchar(word) > 1)                      # Remove short words

# Apply Stemming
clean_tokens$stemmed <- wordStem(clean_tokens$word, language = "en")

# ----------------------------
# Step 3: Save Final Output
# ----------------------------

# Save Cleaned Token Data
write.csv(clean_tokens, "preprocessed_data.csv", row.names = FALSE)

# Preview
print(head(clean_tokens))

