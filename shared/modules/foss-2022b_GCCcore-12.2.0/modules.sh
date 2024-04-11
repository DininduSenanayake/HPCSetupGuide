# Sansom lab core modules V2 [ gompi/foss-2022b + GCC/GCCcore-12.2.0 toolchain ]
#
# 1. Add modulesets to the MODULEPATH
# -----------------------------------

# Determine the CPU architecture:
if [ $HOSTNAME != "kir00.cloud.in.bmrc.ox.ac.uk" ]
then
    ARCH=`cat /sys/devices/cpu/caps/pmu_name`
else
    # unfortunately rworkbench has been installed in a VM
    # so the above does not work.
    ARCH="skylake"
fi
   
# Add the KIR module directory to the MODULEPATH environment variable
module use -a /apps/kir/eb/${ARCH}/modules/all

# Add the BMRC "in development" to the MODULEPATH environment variable
# Most of these are built with the same toolchain
module use -a /apps/eb/dev/${ARCH}/modules/all

# make sure we start from a clean environment
module purge

# 2. Load modules
# ---------------

# To ensure compatibility all modules should be built with the same toolchain

# note: to find modules we can either:
# (1) module avail 2>&1 | grep -i foo # case insensitive
# or (2) module avail foo  # case sensitive

# load a core set of modules

## Programming languages
module load Python/3.10.8-GCCcore-12.2.0
module load Java/11.0.2 # is this compatible ?
module load Perl/5.36.0-GCCcore-12.2.0
module load nodejs/18.12.1-GCCcore-12.2.0 # dependency for R.
module load R/4.3.1-foss-2022b-bare

# general
module load Boost/1.81.0-GCC-12.2.0
module load bzip2/1.0.8-GCCcore-12.2.0
module load CMake/3.24.3-GCCcore-12.2.0
# module load CPLEX/22.1.1-GCCcore-9.3.0-Python-3.8.2 – not yet available in the new stack
module load cURL/7.86.0-GCCcore-12.2.0
module load Emacs/28.2-GCCcore-12.2.0
module load GEOS/3.11.1-GCC-12.2.0
module load Ghostscript/10.0.0-GCCcore-12.2.0
module load GMP/6.2.1-GCCcore-12.2.0
module load GSL/2.7-GCC-12.2.0
module load HDF5/1.14.0-gompi-2022b  
module load libevent/2.1.12-GCCcore-12.2.0
module load libxml2/2.10.3-GCCcore-12.2.0
module load OpenSSL/1.1
module load Pandoc/2.13 
module load PCRE/8.45-GCCcore-12.2.0
module load SQLite/3.39.4-GCCcore-12.2.0
module load tmux/3.3a-GCCcore-12.2.0
module load zlib/1.2.12-GCCcore-12.2.0
module load git/2.38.1-GCCcore-12.2.0-nodocs

# Unload unwanted modules
module unload SciPy-bundle

# load modules for analysis of next-generation sequencing data.
module load BEDTools/2.30.0-GCC-12.2.0
module load FastQC/0.11.9-Java-11
module load HISAT2/2.2.1-gompi-2022b
module load Kent_tools/450-GCC-12.2.0
module load SAMtools/1.17-GCC-12.2.0
module load Salmon/1.10.0-GCC-12.2.0
module load Subread/2.0.4-GCC-12.2.0
module load cutadapt/4.4-GCCcore-12.2.0
module load kallisto/0.48.0-gompi-2022b
module load picard/2.25.1-Java-11 &> /dev/null
 
# load modules for single-cell data analysis.
module load CellRanger/7.1.0 

## Optional modules 

# texlive - if needed can be loaded with.
# module load texlive/20230313-GCC-12.2.0
 


