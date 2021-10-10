
library(dplyr)
library(ggplot2)
#load("death.Rdata")
head(death)

##(708,7)
dim(death)


### 20 causes of death
count(unique(death["Leading.Cause"]))

#total number of deaths in percents by race from 2007 -2014
by_race<-death%>% group_by(Race.Ethnicity) %>% 
  summarise(percent =sum(Deaths)/418760 *100)
by_race

#total number of deaths in percents by race and  sex from 2007 -2014
p<-death%>% group_by(Race.Ethnicity, Sex) %>% 
  summarise(percent =sum(Deaths)/418760 *100)
p

ggplot(p, aes(x = Race.Ethnicity, y = percent, fill = Sex)) +
  theme_bw() +
  geom_bar(stat = "identity") +
  labs(title ="Percentage of Deaths 2007- 2014", x = "Race", y = "% of Deaths")+
  theme(plot.title = element_text(hjust = 0.5))



#total number of deaths by sex as perecent
t_sex<-death %>%
  group_by(Sex) %>% summarise(count = sum(Deaths)/418760 *100)
t_sex
#total number of deaths by sex and race
Total<-death %>%
  group_by(Race.Ethnicity, Sex) %>% summarise(count = sum(Deaths))
Total




#### leadnig causes of death 2007-2014
##shows 2007 -2009 female white as outliers
Killer_avg<- death %>% group_by(Leading.Cause)%>%summarise(avg = mean(Deaths))  %>% as.data.frame
head(Killer_avg)
Killer_avg<- death %>% group_by(Leading.Cause) %>% as.data.frame
ggplot(Killer_avg, aes(x = Leading.Cause, y = Deaths, fill = Leading.Cause)) +
  geom_boxplot() + theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  theme(legend.position="none") +
  labs(title ="Average Deaths 2007-2014", x = "Cause of Death", y = "Number of Deaths") +
  theme(plot.title = element_text(hjust = 0.5)) 



#avg heart rate 2007-2014
heart_avg<- death %>% filter(Leading.Cause %in% c("Diseases of Heart")) %>%
  group_by(Race.Ethnicity, Sex)%>%summarise(avg = mean(Deaths))  %>% as.data.frame
heart_avg                      
ggplot(heart_avg, aes(x = Race.Ethnicity, y = avg, fill =Sex)) +
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))+
  geom_bar(stat = "identity", position = "dodge") +
  labs(title ="Average Deaths From Heart Disease 2007-2014",x = "Ethnicity", y = "Average Number of Deaths")


#avg cancer death 2007-2014
cancer_avg<- death %>% filter(Leading.Cause %in% c("Malignant Neoplasms (Cancer)")) %>% 
  group_by(Race.Ethnicity, Sex)%>%summarise(avg = mean(Deaths))  %>% as.data.frame
ggplot(cancer_avg, aes(x = Race.Ethnicity, y = avg, fill =Sex)) + 
  theme_classic() +
  theme(plot.title = element_text(hjust = 0.5))+
  geom_bar(stat = "identity", position = "dodge") +
  labs(title ="Average Deaths From Cancer 2007-2014",x = "Ethnicity", y = "Average Number of Deaths")



# heart deaths of  woman and men hispanic 2007-2014
h_heart<- death %>% filter(Leading.Cause %in% 
                             c("Diseases of Heart"),Race.Ethnicity %in% 
                             c("Hispanic")) %>% as.data.frame
head(h_heart)               

ggplot(h_heart, aes(x = Year, y = Deaths, color= Sex)) +
  geom_line() + theme_bw() +
  labs(title ="Hispanic Deaths Due to Heart Disease 2007-2014", x = "Year", y = "Number of Deaths") +
  theme(plot.title = element_text(hjust = 0.5)) 

# cancer deaths of  woman and men hispanic 2007-2014
h_cancer<-death %>% filter(Leading.Cause %in% 
                             c("Malignant Neoplasms (Cancer)"),Race.Ethnicity %in%
                             c("Hispanic")) %>% as.data.frame
ggplot(h_cancer, aes(x = Year, y = Deaths, color= Sex)) +
  geom_line() + theme_bw() +
  labs(title ="Hispanic Deaths Due To Cancer 2007-2014", x = "Year", y = "Number of Deaths") +
  theme(plot.title = element_text(hjust = 0.5))





##number of deaths for cancer and heart disease
top<-death %>% filter(Leading.Cause %in% c("Malignant Neoplasms (Cancer)", "Diseases of Heart")) %>%
  group_by(Leading.Cause, Year)%>%
  summarise(Deaths = sum(Deaths))%>%
  as.data.frame
top 
#percent of deaths attributed to cancer and heart diseases 2006-2014
250405/418760 * 100

top 
ggplot(top, aes(x = Year, y = Deaths, color= Leading.Cause)) +
  geom_line() + theme_bw() +
  labs(title ="Deaths Due To Cancer/Heart Disease 2007-2014", x = "Year", y = "Number of Deaths") +
  theme(plot.title = element_text(hjust = 0.5))








