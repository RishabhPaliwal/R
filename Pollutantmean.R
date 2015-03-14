# R
pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        if(grep("specdata", directory) == 1) {
		directory <- ("./specdata/")
	}
	mean_vector <- c()
	all_files <- as.character(list.files(directory))
	files_paths <- paste(directory, all_files, sep="")
	for(i in id) {
	current_file <- read.csv(files_paths[i], header = T, sep = ",")
	head(current_file)
	pollutant
	na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]	
	mean_vector <- c(mean_vector, na_removed)
	}
 result <- mean(mean_vector)
 return(round(result, 3))
}



pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "sulfate", 1:20)
pollutantmean("specdata", "sulfate", 1:30)
pollutantmean("specdata", "sulfate", 1:332)
