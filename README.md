INSTRUCTIONS ON HOW TO RUN GWIZ.

R version 3.6 is required to run GWIZ. The following R packages are also required 'XML', 'usdm', 'jsonlite', 'pROC', 'glmnet', 'mlr'.

Go to folder “Data”
Here there are two example csv files with GWAS data.
Using the format of those files as a template, load your own data into a csv file in the folder “data”. Take special care to ensure the column names are written exactly as they are in the example csv files. 

Now load “GWAS_call_batch.R”
Go to line 3 and change the working directory to the appropriate location.
Select all and run the code.
A table called aucout should appear with your results.

After running the code two folders will also be created in your working directory. “Results_data” contains the coefficients of the logistic 
regression model created, ROC curve plots and the AUROC.
“Resampled_data” contains the simulated population created from your GWAS summary level data.

Congrats you are now an expert in using GWIZ!

INSTRUCTIONS ON RUNNING GWIZ WITH DOCKER

Install Docker on your local machine using online instructions.

Once Docker is installed locally, pull the GWIZ docker image from Docker Hub to your local machine using the terminal.

```docker pull wishartlab/gwiz```

To run your csv files of interest, note the location of your local folder. You will use the path as part of the docker command.

```docker run -v <YOUR-PATH-TO-CSV-FILES>:/home/r-environment/Data wishartlab/gwiz```

A container will be created and your analysis will begin immediately. The container will stop after analysis is completed. You can copy the result folders from the container to your local machine using the following commands.

```docker ps -a```

Note the containerId of your most recent container. Use this to when copying files to your local location.

```
docker cp <containerId>:/home/r-environment/GWIZ/Results_data <YOUR-LOCAL-LOCATION>

docker cp <containerId>:/home/r-environment/GWIZ/Resampled_data <YOUR-LOCAL-LOCATION>
```

Once done, you can delete the container using the following command.

```docker rm <containerId>```
