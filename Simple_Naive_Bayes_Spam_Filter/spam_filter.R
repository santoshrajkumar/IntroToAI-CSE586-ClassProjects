
## Loading tidycerse library
library(tidyverse)

# loading string cleaner (cleans special characters & gaps )
source("string_cleaner.R")

# loading dataset containing spam & ham classified
email_dataset <- read_csv("email_data1.csv") 

# dataset of spams
spam_dataset <- email_dataset %>%
  filter(spam==1)
#dataset of hams
ham_dataset <- email_dataset %>%
  filter(spam==0)

# Cleaning the emails to contain only words (removing smal numbers & special characters)
spam_words_cleaned <- spam_dataset %>%
  mutate(textn = string_cleaner(.$text)) 
# Cleaning the emails to contain only words (removing smal numbers & special characters)
ham_words_cleaned <- ham_dataset %>%
  mutate(textn = string_cleaner(.$text)) 

# listing unique spam words per email for all spam emails (a single list)
spam_unique_per_email<- c()
for(i in 1:length(spam_words_cleaned$textn)) {
  spam_unique_per_email <- c(spam_unique_per_email,unique(unlist(spam_words_cleaned$textn[i])))
}

# listing unique ham words per email for all ham emails (a single list)
ham_unique_per_email<- c()
for(i in 1:length(ham_words_cleaned$textn)) {
  ham_unique_per_email <- c(ham_unique_per_email,unique(unlist(ham_words_cleaned$textn[i])))
}

## converting lists of words into data frames
ham_unique_per_email <- data.frame(words=ham_unique_per_email)
spam_unique_per_email <- data.frame(words=spam_unique_per_email)

# Computing probabilities of each word given ham
ham_unique_per_email <- ham_unique_per_email %>%
  filter(words != "subject") %>%
  group_by(words) %>%
  mutate(count= n()) %>%
  mutate(prob = (count+1) / (length(ham_dataset$text) +2) ) 

# Computing probabilities of each word given spam
spam_unique_per_email <- spam_unique_per_email %>%
  filter(words != "subject") %>%
  group_by(words) %>%
  mutate(count= n())  %>%
  mutate(prob = (count+1) / ((length(spam_dataset$text) +2) )) 

# Calculating probabilities of ham & spam
pH = length(ham_dataset$text)/length(email_dataset$text);
pS = length(spam_dataset$text)/length(email_dataset$text);


iter =1;

# While loop just to take input sentances / emails for test
while (iter == 1) {
  inPutEmail = readline(prompt="Enter Email (Enter X for exit ): ")
  
  if(inPutEmail == "X"){
    break
  } 
  else {
    
    # clean the input email to words
    inPutEmail <- unique(unlist(string_cleaner(inPutEmail)))
    
    # filter the words in the email that are in ham list
    ham_unique_per_email_filtered <- ham_unique_per_email %>%
      filter(words %in% inPutEmail) %>%
      group_by(words)%>%
      unique()
    
    # filter the words in the email that are in spam list
    spam_unique_per_email_filtered <- spam_unique_per_email %>%
      filter(words %in% inPutEmail) %>%
      group_by(words) %>%
      unique()
    # Calculate log probability of spam
    S = log(pS) + sum(log(spam_unique_per_email_filtered$prob))
    # Calculate log probability oh ham
    H = log(pH) + sum(log(ham_unique_per_email_filtered$prob))
    
    if (S>H){
      print("Its a Spam")
    } 
    else {
      print("It's a ham")
    }
  
    }
  
}







