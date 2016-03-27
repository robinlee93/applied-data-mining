# different versions of the graph

table1 = NApattern[1]
var = names(table1)
tab=NApattern[1][[1]]

df = data.frame(tab[1:19,])
df[,"class"] = rownames(df)
glimpse(df)

tab2 = tab[1:19,]
df2 = as.data.frame(tab2)
df2
df2[,"class"] = rownames(df2)
df2

# wide to long, because it's easier to plot

library(reshape2)
df3 = melt(df2)
names(df3) = c("class","response", "frequency")
df3$response = addNA(df3$response)
levels(df3$response)[is.na(levels(df3$response))] <- "missing"
levels(df3$response)

ggplot(df3, aes(x = class, y = frequency, fill = response))+
  geom_bar(stat = "identity")+
  coord_flip()+
  labs(title = paste("Is there informative missingness in variable",var, "?",
                     "\n", "Yes, there is!"))

# the color theme need to be changed. 
# informative missigness doesn't make sesne
# y labels is confusing
# X is not clear
# the title is not a statement

ggplot(df3, aes(x = class, y = frequency, fill = response))+
  geom_bar(stat = "identity")+
  scale_fill_manual(values=c("#56B4E9", "#D55E00", "grey"))+
  coord_flip()+
  labs(title=paste( "In variable ",var, ", missing values do not", "\n", 
                    "occur randomly across types of soybean", sep=""),
       x = ("Different types of Soybean"),
       y = (paste("Frequency of responses in variable", var))
  )+
  theme_classic()

# change the color scene to missing and not missing
# change y labels to type 1, type 2, etc.

