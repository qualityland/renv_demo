


###############################################################################
###                         Current renv Version                            ###
###############################################################################
packageVersion("renv")






###############################################################################
###                         Upgrade renv Version                            ###
###############################################################################

# upgrade renv
#renv::upgrade(version = "0.11.0")
#                                                     -------------------------
#                                                     !!! restart R session !!!
#                                                     -------------------------


###############################################################################
###              Initialization of a Project-local Library                  ###
###############################################################################
library(renv)

# initialize project-local library with a private R library
renv::init()


# library path
.libPaths()
# library path:
#   - project library:          all contributed packages used in you project
#   - system library:           29 base & recommended packages
#   - completely local


# project infrastructure changes are:
#   - renv/library subfolder:   holds the project libraries
#   - renv.lock file:           repositories & package metadata
#   - .Rprofile file:           calls the ~/renv/activate.R script
#   - renv/.gitignore:          updated


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

# on Data42: some packages already updated (compared to MRAN 2020-04-27)

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

# Data42:   MRAN 2020-04-27 with ggplot2 v3.3.0
# DaVinci:  MRAN 2019-11-22 with ggplot2 v3.2.1
#install.packages("ggplot2")
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

#                                                               ---------------
#                                                               !!! Data 42 !!!
#                                                               ---------------
# CRAN server:
# https://cloud.r-project.org

#                                                               ---------------
#                                                               !!! DaVinci !!!
#                                                               ---------------
# MRAN server:
# last R-3.6 snapshot
# https://cran.microsoft.com/snapshot/2020-04-24/

renv::modify()






###############################################################################
###                  Install newer Version of a Package                     ###
###############################################################################

# starting with ggplot2 v3.3.0 from MRAN snapshot 2020-04-27
packageVersion("ggplot2")



#                                                               ---------------
#                                                               !!! Data 42 !!!
#                                                               ---------------
# update to v3.3.1
renv::install("ggplot2@3.3.1")

# update to v3.3.2
renv::install("ggplot2@3.3.2")



#                                                               ---------------
#                                                               !!! DaVinci !!!
#                                                               ---------------
# update to v3.3.0
renv::install("ggplot2@3.3.0")






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







###############################################################################
###                              Not yet evaluated                          ###
###############################################################################

# - cache shared among multiple users
# - restore project library from an old renv.lock file (commited to gitlab)









###############################################################################
###                          checkpoint vs. renv                            ###
###############################################################################

# PRO checkpoint
# - maintained by Microsoft
# - more lightweight


# CONTRA checkpoint
# - same package version re-built for every MRAN snapshot
# - per user cache


# PRO renv
# - maintained by RStudio
# - fast, since binaries are cached too
# - same package version built only once
# - prepared to share cache among multiple users
# - possibility to restore old library state (even from git)


# CONTRA renv
# - a bit more complex

