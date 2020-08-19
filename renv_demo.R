library(renv)



###############################################################################
###                         Upgrade renv Version                            ###
###############################################################################

# upgrade renv
#renv::upgrade()

#                                                     -------------------------
#                                                     !!! restart R session !!!
#                                                     -------------------------





###############################################################################
###              Initialization of a Project-local Library                  ###
###############################################################################

# initialize project-local library with a private R library
renv::init()
# project infrastructure changes are:
#   - renv.lock file: repositories & package metadata
#   - .Rprofile file: calls the ~/renv/activate.R script
#   - renv/library subfolder: holds the project libraries
#   - .gitignore: updated


# library path
.libPaths()
# library path:
#   - system library: 29 base & recommended packages
#   - project library: all contributed packages used in you project
#   - completely local


# repositories
getOption("repos")
# not yet changed!


# show used packages
renv::dependencies()





###############################################################################
###                   Check Status of Project-local Library                 ###
###############################################################################

# show status of local library
renv::status()

# some packages already updated on Data42:

# package     MRAN        Data42
# -------   ---------   ---------
# nlme       3.1-139     3.1-147
# lattice    0.20-38     0.20-41
# mgcv       1.8-28      1.8-31
# Matrix     1.2-17      1.2-18
# MASS       7.3-51.4    7.3-51.6






###############################################################################
###                    Save the Project-local Library                       ###
###############################################################################

# write changes to local lockfile
renv::snapshot()






###############################################################################
###                         Install additional package                      ###
###############################################################################

#                                                ------------------------------
#                                                !!! uncomment library call !!!
#                                                ------------------------------
#library(ggplot2)


# show used packages
renv::dependencies()

# MRAN 2020-04-27: ggplot2 v3.3.0
install.packages("ggplot2")
# same as renv::install("ggplot2")

# check dependencies
renv::dependencies()

# check status
renv::status()

# write changes to lockfile
renv::snapshot()


#                                                 -----------------------------
#                                                 !!! commit project to git !!!
#                                                 -----------------------------





###############################################################################
###                 Change repository from MRAN to CRAN                     ###
###############################################################################

# CRAN server:
# https://cloud.r-project.org

renv::modify()






###############################################################################
###                  Install newer Version of a Package                     ###
###############################################################################

# starting with ggplot2 v3.3.0 from MRAN snapshot 2020-04-27
packageVersion("ggplot2")

# update to v3.3.1
renv::install("ggplot2@3.3.1")

# update to v3.3.2
renv::install("ggplot2@3.3.2")






###############################################################################
###               Restore project library state from lockfile               ###
###############################################################################

# restore from renv snapshot
renv::restore()






###############################################################################
###                          Refresh Library Packages                       ###
###############################################################################

# query active R package repositories and update in-memory cache
renv::refresh()

# update out-of-date packages
renv::update()

# check status
renv::status()

# save project library state
renv::snapshot()





