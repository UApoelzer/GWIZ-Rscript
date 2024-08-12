FROM rocker/r-ver:3.6.3

# Make a directory in the container
RUN mkdir /home/r-environment

# Update the package list and install the libgdal-dev package

RUN apt-get update && apt-get install -y libgdal-dev


# Copy our R script to the container
WORKDIR /home/r-environment/GWIZ

COPY . .

# Install R dependencies
RUN R -e "install.packages('XML', repos = 'http://www.omegahat.net/R')"
RUN R -e "install.packages(c('usdm', 'jsonlite','pROC','glmnet', 'mlr'), repos = 'http://cran.rstudio.com/')"

# Run the R script
CMD R -e "source('GWAS_call_batch.R')"
