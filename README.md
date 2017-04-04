# Getting-and-Cleaning-Data-Course-Project


This is my submission for the Coursera Getting and Cleaning Data Week 4 Course Project.

The files contained in this repo (with a description) are:
1. run_analysis.R - This R file
  a.) downloads and unzips the data from the given URL,
  b.) loads activity labels and features to be used as identifiers and measurements from relevant .txt files,
  c.) extracts only the features that contain information on mean and std deviation,
  d.) loads the training and test data,
  e.) merges the training and test data and adds the labels previously loaded,
  f.) turns activities and subjects into factors to use as identifiers,
  g.) melts the data into a tidy data set containing the mean data for each feature and
  h.) reads the tidy data into the "tidy.txt" file.
 
2. tidy.txt - The final tidy data set

3. code_book.MD - A description of the Identifiers, Measurements and Activities used
