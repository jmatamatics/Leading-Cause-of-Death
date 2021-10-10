
library(dplyr)
library(ggplot2)
load("death.Rdata")
head(death)
death["Sex"]

female_avg <- death %>% filter(Sex %in% c("Female"))
female_avg<- female_avg %>% group_by(Race.Ethnicity) %>%summarise(avg = mean(Deaths))
female_avg
ggplot(female_avg, aes(x = Race.Ethnicity, y = avg)) +geom_bar(stat = "identity", position = "dodge")

#get the mean of death thruout the years for each ehthnicity

heart_avg<- death %>% filter(Leading.Cause %in% c("Diseases of Heart")) %>% group_by(Race.Ethnicity, Sex)%>%summarise(avg = mean(Deaths))  %>% as.data.frame
heart_avg                      


#avg heart rate throught years
heart_avg<- death %>% filter(Leading.Cause %in% c("Diseases of Heart")) %>% group_by(Race.Ethnicity, Sex)%>%summarise(avg = mean(Deaths))  %>% as.data.frame
heart_avg                      
ggplot(heart_avg, aes(x = Race.Ethnicity, y = avg, fill =Sex)) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))+
  geom_bar(stat = "identity", position = "dodge") +
  labs(title ="Average Deaths From Heart Disease 2007-2014",x = "Ethnicity", y = "Average Number of Deaths")


#ag cancer death
cancer_avg<- death %>% filter(Leading.Cause %in% c("Malignant Neoplasms (Cancer)")) %>% 
  group_by(Race.Ethnicity, Sex)%>%summarise(avg = mean(Deaths))  %>% as.data.frame
ggplot(cancer_avg, aes(x = Race.Ethnicity, y = avg, fill =Sex)) + 
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))+
  geom_bar(stat = "identity", position = "dodge") +
  labs(title ="Average Deaths From Cancer 2007-2014",x = "Ethnicity", y = "Average Number of Deaths")


#### leadnig causes of death

colnames(death)
unique(death["Leading.Cause"])


Killer_avg<- death %>% group_by(Leading.Cause) %>% as.data.frame
ggplot(Killer_avg, aes(x = Leading.Cause, y = Deaths, fill = Leading.Cause)) +
  geom_boxplot() + theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  theme(legend.position="none") +
  labs(title ="Average Deaths 2007-2014", x = "Cause of Death", y = "Number of Deaths") +
  theme(plot.title = element_text(hjust = 0.5)) 
##shows 2007 -2009 female white as outliers

# heart deaths of  woman and men hispanic 
h_heart<- death %>% filter(Leading.Cause %in% c("Diseases of Heart"),Race.Ethnicity %in% c("Hispanic")) %>% as.data.frame
head(h_heart)               

ggplot(h_heart, aes(x = Year, y = Deaths, color= Sex)) +
  geom_line() + theme_bw() +
  labs(title ="Hispanic Deaths 2007-2014", x = "Year", y = "Number of Deaths") +
  theme(plot.title = element_text(hjust = 0.5)) 

# cancer deaths of  woman and men hispanic 
h_cancer<-death %>% filter(Leading.Cause %in% c("Malignant Neoplasms (Cancer)"),Race.Ethnicity %in% c("Hispanic")) %>% as.data.frame
ggplot(h_cancer, aes(x = Year, y = Deaths, color= Sex)) +
  geom_line() + theme_bw() +
  labs(title ="Hispanic Deaths 2007-2014", x = "Year", y = "Number of Deaths") +
  theme(plot.title = element_text(hjust = 0.5))


####do asain shit and you done!!!

head(death, 20)
       
