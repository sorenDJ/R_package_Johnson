ggplot(crabs, aes(x = carapace_length, y = body_depth)) + 
  geom_point(size = 0.5) +        ## making the points small to help see the regression line
  geom_smooth(method = "lm",     ## make a trendline using "lm"
              color = "navy",    ## make the trendline navy
              size = 0.5,        ## make the line small to help see the confidence interval for TUTORIAL REASONS
              fill = "deeppink4") + ## fill for the confidence interval
  labs(x = "Carapace length (mm)", 
       y = "Body depth (mm)", 
       title = "Linear regression to predict crab body depth") + 
  annotate("text",                ## geom to annotate with is text annotation
           x = 20, y = 30,         ## coordinates of the label, decided after trying several places..
           label = "R^2 == 0.966", ## label itself, double equals is needed for use with parse=T
           parse=T,               ## makes label actually show as a formula, with squared as superscript!
           color = "firebrick", size = 5)  + ## font color and size 
  theme_bw()