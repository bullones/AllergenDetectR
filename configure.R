# configuration file for AllergenDetectR
# 24/06/10

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# DON'T TOUCH: CLEAN START ####
#
# clear the work space
rm(list=ls())
gc()
# set the initial time
T00 <- proc.time()
# /////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# WILL BE PACKAGES UPDATED ####
#
# TRUE: old packages will be updated after installing the absent ones
# FALSE: only absent packages will be installed. No update of older ones

PKG_UPDATE = FALSE
# /////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# PATH TO THE DIRECTORY CONTAINING THE SOURCE FILES ####
#
# You should include here the path where the code can be found on your computer
#
# Example:
#   SOURCE_DIR = "~/usr/local/mycodingfiles/"

SOURCE_DIR = "~/datos_bullones/Bioinformatica/Script/Script_R/AllergenDetectR"
# ///////////////////////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# PATH TO DATA-CONTAINING DIRECTORY ####
#
# You should include here the path where this file is on your computer
# This file should be side-by-side with the input data
# Output files and folders will be created there
#
# Example:
#   WD_DIR = "~/Documents/My_MA_data/this_experiment/"

WD_DIR = "/home/bullones/datos_bullones/Bioinformatica/alergenos/detect_new_allergens/script_R"
# //////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# PATH TO DIAMOND EXECUTABLE ####
path_diamond = "/home/bullones/Programas/diamond"
# ///////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# PATH TO OLIVE TREE ALLERGENS ####
#
# Path to the FASTA file with olive tree allergens
# This file must contain protein sequences

PATH_SUBJECT_ALLERGEN_OLEUR = "/home/bullones/datos_bullones/Bioinformatica/alergenos/detect_new_allergens/uniprotkb_organism_id_4146_AND_allergome_2024_03_05.fasta"
# /////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# PATH TO NON OLIVE TREE ALLERGENS ####
#
# Path to the FASTA file with non-olive tree allergens
# This file must contain protein sequences

PATH_SUBJECT_ALLERGEN_NO_OLEUR = "/home/bullones/datos_bullones/Bioinformatica/alergenos/detect_new_allergens/uniprotkb_NOT_organism_id_4146_AND_allergome_2024_03_05.fasta"
# /////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# PATH TO THE PROTEOME TO DETECT ALLERGENS IN ####
#
# Path to the FASTA file with olive pollen proteome (proteins)
# or transcriptome (nucleotides)

PATH_TEST_PROTEOME="/home/bullones/datos_bullones/Bioinformatica/alergenos/ReprOlive/pollen_transcriptome_v1.1.fasta"

# %%%%
# CHOOSE YOUR INPUT TYPE BETWEEN PROTEIN AND NUCLEOTIDE
# %%%%
# You must choose between:
# 1: Protein
# 2: Nucleotide
#
# Example:
#   fasta_type = 2
fasta_type = 2
# ////////////////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# CPUS FOR DIAMOND ANALYSIS ####
#
# Number of CPU threads to be used with DIAMOND

threads = 5
# /////////////////////////////////////


# %%%%%%%%%%%%%%%%%%%%%%%%%%%
# END CONFIGURATION FILE ####
# %%%%%%%%%%%%%%%%%%%%%%%%%%%

# %%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%
# DO NOT TOUCH THE FOLLOWING
# %%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%

# check if file is protein or nucleotide to choose between BlastP and BlastX modes
if (fasta_type==1) blast_mode <- "blastp"
if (fasta_type==2) blast_mode <- "blastx"

# variable to customise each working directory created ####
HOY <- format(Sys.time(), "%F_%H.%M.%S")

# directory to save results ####
RES_DIR <- paste0(WD_DIR, "/results_", blast_mode, "_", HOY)

# create directory to save results ####
dir.create(file.path(RES_DIR), showWarnings = FALSE)

# load/install libraries ####
librariesToSource <- paste0(SOURCE_DIR, "/libraries.R")
source(librariesToSource)

# path to Rmd ####
render(input = paste0(SOURCE_DIR, "/execute.Rmd"),
       output_dir = RES_DIR,
       output_file = "/ Report.html",
       output_format = html_document(theme = "united",
                                     highlight = "tango",
                                     number_sections = TRUE,
                                     code_folding = "show",
                                     toc = TRUE,
                                     toc_depth = 3,
                                     toc_float = TRUE),
       quiet = TRUE)