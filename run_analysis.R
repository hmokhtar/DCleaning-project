
#read data from files for both test and train data
test_data = read.table("./test/X_test.txt")
train_data = read.table("./train/X_train.txt")

#read labels for test and train data

test_label = read.table("./test/y_test.txt")
train_label=read.table("./train/y_train.txt")

#read subject for test and train 

test_subject = read.table("./test/subject_test.txt")
train_subject=read.table("./train/subject_train.txt")

all_subject<-rbind(test_subject,train_subject)

#merge both datasets into 1 data frame called "all"
all<-rbind(test_data,train_data)
all_label<-rbind(test_label,train_label)

#complete dataframe with data and labels and subject

complete<-cbind(all,all_label)
complete<-cbind(complete,all_subject)

#copy "all" into another dataframe called "data"
data<-data.frame()
data<-complete

#read feature vector file into variable "features"

features<-read.table("./features.txt")

# get the column names for the dataset using the "features" dataframe
names1<-c(t(features[2]),"Activity")
names(data)<-c(names1,"Subject")

# retrieve only features about "mean" and "std" using the function grep

index1=grep("mean",t(features[2]))
index3=grep("Mean",t(features[2]))
index2=grep("std",t(features[2]))


#sort the indices of those matching features into a vector "sorted_index"
index=c(index1,index2)
index<-c(index,index3)
sorted_index=sort(index)

#get the traspose of the "features" dataframe to convert to a vector of feature names

new_features<-t(features[2])
nm<-NULL

#initialize a dataframe with the first column in "features" this data 
#frame should include on the data for required features in "new_features"

first<-sorted_index[1]
rest<-sorted_index[2:length(sorted_index)]

#initialize "sub_data" dataframe with 1st column

sub_data<-data[first]
nm1=NULL
#create a character vector with features names using "new_feature" and "indices"
for(i in sorted_index)
{
  nm1<-c(nm1,new_features[i])
}

nm=NULL
nm<-c(nm1,"Activity")
nm<-c(nm,"Subject")

# complete the remaining columns with mean and std features 

for(i in rest)
{
sub_data<-cbind(sub_data,data[i])
}

#add activity column 
sub_data<-cbind(sub_data,all_label)
sub_data<-cbind(sub_data,all_subject)
#assign column names for the selected 86 columns using "nm" created above

names(sub_data)<-c(nm)

#select rows for each activity for each subject

clean_data<-data.frame()
clean_data<-NULL
  
for(subj in 1:30)
{
  sub1<-subset(sub_data,sub_data[88]==subj)
#  clean_data<-cbind(clean_data,sub)
  
  for (activity in 1:6)
  {
#    clean_data<-cbind(clean_data,activity)
    
    sub<-subset(sub1,sub1[87]==activity)
    average<-lapply(sub[1:86],mean)
#    clean_data<-rbind(clean_data,t(average))
    new_row<-c(activity,subj,t(average))   
    clean_data<-rbind(clean_data,t(new_row))

  }
}


tidy_data<-as.data.frame(clean_data)
nm2=NULL
nm2<-c("Activity","Subject",nm1)
names(tidy_data)<-c(nm2)

#assign activity names

act<-read.table("./activity_labels.txt")

for(i in 1:dim(tidy_data)[2])
{
  if(tidy_data[i,1]==1){tidy_data[1]<-act[1,2]}
  else
  {
    if(tidy_data[i,1]==2){tidy_data[1]<-act[2,2]}
    else
    {
      if(tidy_data[i,1]==3){tidy_data[1]<-act[3,2]}
      else
      {
        if(tidy_data[i,1]==4){tidy_data[1]<-act[4,2]}
        else
        {
          if(tidy_data[i,1]==5){tidy_data[1]<-act[5,2]}
          else
          {tidy_data[1]<-act[,2]}
          
        }
      }
    }
  }
}

#prepare the data to write to the output file using "table.write" command

my.data <- data.frame(lapply(tidy_data, as.character), stringsAsFactors=FALSE)

write.table(my.data, "result2.txt", sep="\t", row.names=FALSE) 