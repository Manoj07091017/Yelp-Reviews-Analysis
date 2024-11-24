library(dplyr)
library(ggplot2)
library(lubridate)

# To read the csv file into the data frame 
data <- read.csv("yelp_reviews.csv")

# To Calculate the statistical summary for stars
stars_summary <- summary(data$stars)

#  To Calculate the statistical summary for review_length
review_length_summary <- summary(data$review_length)

# To Calculate the statistical summary for pos_words
pos_words_summary <- summary(data$pos_words)

# To Calculate the statistical summary for neg_words
neg_words_summary <- summary(data$neg_words)

# To Calculate the statistical summary for net_sentiment
net_sentiment_summary <- summary(data$net_sentiment)

# To Print the statistical summaries
stars_summary
review_length_summary
pos_words_summary
neg_words_summary
net_sentiment_summary


# To Create a table of counts of positive words per review
pos_words_table <- table(data$pos_words)

# To Create a table of counts of negative words per review
neg_words_table <- table(data$neg_words)

# To Plot the first 20 entries for positive words
plot_pos <- barplot(pos_words_table[1:20], main = "Counts of Positive Words per Review",
                    xlab = "Number of Positive Words", ylab = "Count", col = "skyblue")

# To Plot the first 20 entries for negative words
plot_neg <- barplot(neg_words_table[1:20], main = "Counts of Negative Words per Review",
                    xlab = "Number of Negative Words", ylab = "Count", col = "lightcoral")

# To Display both plots side by side
par(mfrow = c(1, 2))
plot_pos
plot_neg

# To Create a table of counts of net sentiment scores
net_sentiment_table <- table(data$net_sentiment)

# To Plot the first 20 entries for net sentiment scores
plot_net_sentiment <- barplot(net_sentiment_table[1:20], main = "Counts of Net Sentiment Scores",
                              xlab = "Net Sentiment Score", ylab = "Count", col = "lightgreen")

# To Display the plot
plot_net_sentiment

# To Calculate the average review length per star category
avg_review_length <- tapply(data$review_length, data$stars, mean)

# To Create a bar plot to visualize the average review length per star category
barplot(avg_review_length, main = "Average Review Length per Star Category",
        xlab = "Star Category", ylab = "Average Review Length", col = "steelblue")

# To Calculate average usefulness per star rating
avg_usefulness <- tapply(data$votes_useful, data$stars, mean)

# To Create a box plot to compare usefulness across star ratings
boxplot(data$votes_useful ~ data$stars, main = "Usefulness of Reviews by Star Rating",
        xlab = "Star Rating", ylab = "Usefulness", col = "lightblue")

# To Calculate correlation between usefulness and review length
correlation <- cor(data$votes_useful, data$review_length)

# To Create a scatter plot to visualize the relationship between usefulness and review length
plot(data$review_length, data$votes_useful, main = "Relationship between Usefulness and Review Length",
     xlab = "Review Length", ylab = "Usefulness", col = "darkgreen")

# To Add correlation coefficient to the plot
text(800, 100, paste("Correlation:", round(correlation, 2)))

# To Add a trend line if needed
abline(lm(data$votes_useful ~ data$review_length))


# To Convert the 'date' column to Date format using as.Date() function
data$date <- as.Date(data$date)

# To Calculate the number of reviews per day
reviews_per_day <- data %>%
  group_by(date) %>%
  summarise(num_reviews = n())

# To Plot the changes over time
ggplot(reviews_per_day, aes(x = date, y = num_reviews)) +
  geom_line() +
  labs(x = "Date", y = "Number of Reviews per Day") +
  ggtitle("Number of Yelp Reviews per Day") +
  theme_minimal()


# For Selecting the best business
best_business <- data %>%
  group_by(business_id) %>%
  summarise(
    average_rating = mean(stars),
    positive_reviews = sum(net_sentiment > 0),
    negative_reviews = sum(net_sentiment < 0),
    total_votes = sum(votes_total),
    total_reviews = n()
  ) %>%
  arrange(desc(average_rating), desc(positive_reviews), negative_reviews, desc(total_votes), desc(total_reviews)) %>%
  slice(1)
best_business

# For Selecting the best user
best_user <- data %>%
  group_by(user_id) %>%
  summarise(
    helpful_votes = sum(votes_useful),
    positive_feedback = sum(votes_total),
    average_rating = mean(stars),
    total_reviews = n()
  ) %>%
  arrange(desc(helpful_votes), desc(positive_feedback), desc(average_rating), desc(total_reviews)) %>%
  slice(1)

best_user
