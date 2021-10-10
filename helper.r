

hispanic<-read.csv("~/leadingdeath/data/h.csv")
black<-read.csv("~/leadingdeath/data/b.csv")
white<-read.csv("~/leadingdeath/data/w.csv")
asian<-read.csv("~/leadingdeath/data/a.csv")
#going to have to death oout of shiny folder

                         
#####newwork
filtered.death <- death %>% filter(Year ==2013, Race.Ethnicity=="Hispanic", Sex =="W")
g <- ggplot(data= filtered.death,aes(x= Leading.Cause)) 
#aslo determine how to get exact number of deaths
  
g + geom_bar(aes(fill=Leading.Cause))# + xlab("Year")+ylab("Death")


    coord_cartesian(xlim = c(2007)) #coord to cahnge year input#add layer for sex
   
     #facet_grid(.~Sex)
    #geom_bar(position= "dodge")

#we make 4 different datatables one for each race 
b <-filter(death, Race.Ethnicity== "Black Non-Hispanic")
a <-filter(death, Race.Ethnicity== "Asian and Pacific Islander")
h <-filter(death, Race.Ethnicity== "Hispanic")
w <-filter(death, Race.Ethnicity== "White Non-Hispanic")

write.table(death, file="d.csv",sep=",",row.names=F)
#write.table(dt, file="mydata.csv",sep=",",row.names=F)


death <-death[!(death$Race.Ethnicity=="Not Stated/Unknown"),]
death <-death[!(death$Race.Ethnicity=="Other Race/ Ethnicity"),]

selectInput("var", # choose the residents
            label = "Choose a variable to display",
            choices = c("White", "Black",
                        "Hispanic", "Asian"),
            selected = "Hispanic")
g + theme(axis.text.x = element_text(angle = 90, hjust = 1))
