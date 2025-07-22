install.packages("rvest")
install.packages("tm")
install.packages("SnowballC")
install.packages("tidytext")
install.packages("dplyr")
install.packages("textstem")
install.packages("topicmodels")
install.packages("textmineR")
install.packages("LDAvis")
install.packages("ggplot2")
install.packages("slam")
install.packages("wordcloud")


library(rvest)
library(tm)
library(SnowballC)
library(tidytext)
library(dplyr)
library(textstem)
library(topicmodels)
library(textmineR)
library(LDAvis)
library(ggplot2)
library(slam)
library(wordcloud)



link1 <- read_html("https://en.prothomalo.com/international/middle-east/0bt1n1i6zr")
link2 <- read_html("https://en.prothomalo.com/international/middle-east/1e9849x5dw")
link3 <- read_html("https://en.prothomalo.com/international/middle-east/ow2b4r98xy")
link4 <- read_html("https://en.prothomalo.com/international/middle-east/lwynuvdqba")
link5 <- read_html("https://en.prothomalo.com/international/middle-east/dd92decez5")
link6 <- read_html("https://en.prothomalo.com/international/middle-east/l0h0h3zld7")
link7 <- read_html("https://en.prothomalo.com/international/cr6kg2qpdb")
link8 <- read_html("https://en.prothomalo.com/international/middle-east/3950m4jhv5")
link9 <- read_html("https://en.prothomalo.com/international/middle-east/tetta8kle9")
link10 <- read_html("https://en.prothomalo.com/international/middle-east/hwdc2xj5uh")



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

heading5 <- html_node(link5, '.XAZul') 
text5 <- html_text(heading5)
print(text5)

heading6 <- html_node(link6, '#container') 
text6 <- html_text(heading6)
print(text6)

heading7 <- html_node(link7, '#container') 
text7 <- html_text(heading7)
print(text7)

heading8 <- html_node(link8, '#container') 
text8 <- html_text(heading8)
print(text8)

heading9 <- html_node(link9, '#container') 
text9 <- html_text(heading9)
print(text9)

heading10 <- html_node(link10, '#container') 
text10 <- html_text(heading10)
print(text10)


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

paragraphs5 <- html_nodes(link5, 'p')
p_text5 <- html_text(paragraphs5)
print(head(p_text5))

paragraphs6 <- html_nodes(link6, 'p')
p_text6 <- html_text(paragraphs6)
print(head(p_text6))

paragraphs7 <- html_nodes(link7, 'p')
p_text7 <- html_text(paragraphs7)
print(head(p_text7))

paragraphs8 <- html_nodes(link8, 'p')
p_text8 <- html_text(paragraphs8)
print(head(p_text8))

paragraphs9 <- html_nodes(link9, 'p')
p_text9 <- html_text(paragraphs9)
print(head(p_text9))

paragraphs10 <- html_nodes(link10, 'p')
p_text10 <- html_text(paragraphs10)
print(head(p_text10))


title1 <- html_text(html_node(link1, 'title'))
title2 <- html_text(html_node(link2, 'title'))
title3 <- html_text(html_node(link3, 'title'))
title4 <- html_text(html_node(link4, 'title'))
title5 <- html_text(html_node(link5, 'title'))
title6 <- html_text(html_node(link6, 'title'))
title7 <- html_text(html_node(link7, 'title'))
title8 <- html_text(html_node(link8, 'title'))
title9 <- html_text(html_node(link9, 'title'))
title10 <- html_text(html_node(link10, 'title'))

print("Title from link 1:")
print(title1)

print("Title from link 2:")
print(title2)

print("Title from link 3:")
print(title3)

print("Title from link 4:")
print(title4)

print("Title from link 5:")
print(title5)

print("Title from link 6:")
print(title6)

print("Title from link 7:")
print(title7)

print("Title from link 8:")
print(title8)

print("Title from link 9:")
print(title9)

print("Title from link 10:")
print(title10)

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

df5 <- data.frame(
  Title = title5,
  Paragraph = p_text5,
  stringsAsFactors = FALSE
)

df6 <- data.frame(
  Title = title6,
  Paragraph = p_text6,
  stringsAsFactors = FALSE
)

df7 <- data.frame(
  Title = title7,
  Paragraph = p_text7,
  stringsAsFactors = FALSE
)

df8 <- data.frame(
  Title = title8,
  Paragraph = p_text8,
  stringsAsFactors = FALSE
)

df9 <- data.frame(
  Title = title9,
  Paragraph = p_text9,
  stringsAsFactors = FALSE
)

df10 <- data.frame(
  Title = title10,
  Paragraph = p_text10,
  stringsAsFactors = FALSE
)


scraped_data <- rbind(df1, df2, df3, df4, df5, df6, df7, df8, df9, df10)


write.csv(scraped_data, "scraped_data.csv", row.names = FALSE)



scraped_data_clean <- scraped_data %>%
  group_by(Title) %>%
  summarise(Text = paste(Paragraph, collapse = " "), .groups = "drop")


scraped_data_clean$Text <- tolower(scraped_data_clean$Text)


tokens <- scraped_data_clean %>%
  unnest_tokens(word, Text)

data("stop_words")


clean_tokens <- tokens %>%
  filter(!word %in% stop_words$word) %>%
  filter(!grepl("[0-9]", word)) %>%
  filter(!grepl("[[:punct:]]", word)) %>%
  filter(nchar(word) > 1)


clean_tokens$lemma <- lemmatize_words(clean_tokens$word)


write.csv(clean_tokens, "lemmatized_data.csv", row.names = FALSE)


print(head(clean_tokens))



dtm_input <- clean_tokens %>%
  count(Title, lemma) %>%
  cast_dtm(document = Title, term = lemma, value = n)


lda_model <- LDA(dtm_input, k = 3, control = list(seed = 1234))

topic_terms <- tidy(lda_model, matrix = "beta")

top_terms <- topic_terms %>%
  group_by(topic) %>%
  slice_max(beta, n = 10) %>%
  ungroup() %>%
  arrange(topic, -beta)


top_terms %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(beta, term, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  scale_y_reordered() +
  labs(
    title = "Top 10 Words per Topic",
    x = "Importance (Beta)",
    y = NULL
  ) +
  theme_minimal()


topic_range <- 2:10
perplexities <- c()
log_liks <- c()

for (k in topic_range) {
  model <- LDA(dtm_input, k = k, control = list(seed = 1234))
  perplexities <- c(perplexities, perplexity(model, dtm_input))
  log_liks <- c(log_liks, logLik(model))
}

eval_df <- data.frame(
  Topics = topic_range,
  Perplexity = perplexities,
  LogLikelihood = log_liks
)


ggplot(eval_df, aes(x = Topics, y = Perplexity)) +
  geom_line(color = "red", size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Perplexity vs Number of Topics",
    y = "Perplexity",
    x = "Number of Topics"
  ) +
  theme_minimal()


ggplot(eval_df, aes(x = Topics, y = LogLikelihood)) +
  geom_line(color = "blue", size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Log Likelihood vs Number of Topics",
    y = "Log Likelihood",
    x = "Number of Topics"
  ) +
  theme_minimal()


phi <- topicmodels::posterior(lda_model)$terms
theta <- topicmodels::posterior(lda_model)$topics

vocab <- colnames(phi)
doc_length <- row_sums(as.matrix(dtm_input))
term_freq <- col_sums(as.matrix(dtm_input))

json_lda <- createJSON(
  phi = phi,
  theta = theta,
  vocab = vocab,
  doc.length = doc_length,
  term.frequency = term_freq
)

serVis(json_lda, open.browser = TRUE)


for (i in 1:3) {
  topic_words <- top_terms %>% filter(topic == i)
  wordcloud(
    words = topic_words$term,
    freq = topic_words$beta,
    max.words = 50,
    colors = brewer.pal(8, "Dark2"),
    random.order = FALSE
  )
}

