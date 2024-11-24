# Yelp Reviews Analysis

This repository contains the statistical analysis and visualizations of Yelp reviews for restaurants and cafes. The project explores trends, patterns, and sentiments in Yelp reviews to provide insights into customer behavior and the impact of online reviews on businesses.

---

## Project Overview

This project was completed as part of COMP 5070 - Statistical Programming for Data Science. The objectives of this analysis include:
1. **Exploring review sentiment trends**: Positive and negative word usage and their correlation with review ratings.
2. **Analyzing review usefulness**: Understanding factors that influence the perceived usefulness of reviews.
3. **Identifying top businesses and customers**: Based on custom-defined criteria for excellence.
4. **Investigating review dynamics**: Trends over time and relationships between review length and star ratings.

---

## Files in the Repository

- **`yelp_reviews_final.R`**: R script containing the code used for analysis and visualizations.
- **`yelp Reviews Report.pdf`**: PDF report summarizing the analysis and findings.
- **`yelp_reviews.csv`**: Dataset of Yelp reviews with detailed information about reviewers, ratings, and sentiment metrics.
- **`COMP5070_Assignment2_SP2_2023.docx`**: Assignment guidelines for the analysis.

---

## Data Description

The dataset contains:
- **Attributes**:
  - `user_id`: Anonymized Yelp reviewer ID.
  - `business_id`: Anonymized business ID.
  - `date`: Date of the review.
  - `stars`: Star rating (1 to 5).
  - `review_length`: Length of the review in characters.
  - `votes_*`: Various types of votes (funny, useful, cool).
  - `pos_words` and `neg_words`: Count of positive and negative words in the review.
  - `net_sentiment`: Sentiment score derived from positive and negative word counts.
- **Scope**: Reviews for restaurants and cafes.

---

## Key Analysis Steps

1. **Statistical Summary**:
   - Descriptive statistics for `stars`, `review_length`, `pos_words`, `neg_words`, and `net_sentiment`.

2. **Trends in Sentiment**:
   - Frequency distributions and visualizations of positive and negative words.
   - Insights into net sentiment trends.

3. **Review Length and Ratings**:
   - Analysis of average review lengths across star ratings.
   - Visualizations to identify patterns.

4. **Usefulness of Reviews**:
   - Correlation analysis between review length, star ratings, and `votes_useful`.

5. **Review Trends Over Time**:
   - Time-series analysis of daily review counts.

6. **Top Businesses and Customers**:
   - Selection of the best business and customer using custom criteria.

---

## Results

- Most reviews were positive, with 4- and 5-star ratings dominating the dataset.
- Negative sentiment words were less frequent, showing a favorable review climate.
- Longer reviews were generally more useful, with a moderate positive correlation between length and usefulness.
- The best business and customer were identified based on review scores, sentiment, and engagement metrics.

---
