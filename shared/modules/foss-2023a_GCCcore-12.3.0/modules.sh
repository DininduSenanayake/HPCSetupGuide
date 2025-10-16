# Sansom lab core modules V3 [ gompi/foss-2023a + GCC/GCCcore-12.3.0 toolchain ]
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

# make sure we start from a clean environment
module purge

# Add needed BMRC module directorys to the environment
module use -a /apps/eb/2020b/${ARCH}/modules/all
module use -a /apps/eb/2022b/${ARCH}/modules/all

# Add the KIR module directory to the MODULEPATH environment variable
module use -a /apps/kir/eb/${ARCH}/modules/all

# Add the BMRC "in development" to the MODULEPATH environment variable
# Most of these are built with the same toolchain
module use -a /apps/eb/dev/${ARCH}/modules/all


# 2. Load modules
# ---------------

# To ensure compatibility all modules should be built with the same toolchain

# note: to find modules we can either:
# (1) module avail 2>&1 | grep -i foo # case insensitive
# or (2) module avail foo  # case sensitive

# load a core set of modules

## Programming languages
mods="Python/3.10.8-GCCcore-12.3.0"
mods=$mods" Java/11.0.20"
mods=$mods" Perl/5.36.1-GCCcore-12.3.0"
mods=$mods" nodejs/18.17.1-GCCcore-12.3.0" # dependency for R.
# mods=$mods" R/4.3.1-foss-2022b-bare"
mods=$mods" gfbf/2023a"
mods=$mods" pybind11/2.11.1-GCCcore-12.3.0"
mods=$mods" R/4.5.1-gfbf-2023a-bare-noSciPy"

# general


mods=$mods" Boost/1.82.0-GCC-12.3.0"
mods=$mods" bzip2/1.0.8-GCCcore-12.3.0"
mods=$mods" CMake/3.31.8"
mods=$mods" CPLEX/22.1.1"
mods=$mods" cURL/8.0.1-GCCcore-12.3.0"
mods=$mods" Emacs/30.1-GCCcore-12.3.0"
mods=$mods" GEOS/3.12.0-GCC-12.3.0"
mods=$mods" Ghostscript/10.01.2-GCCcore-12.3.0"
mods=$mods" GMP/6.2.1-GCCcore-12.3.0"
mods=$mods" GSL/2.7-GCC-12.3.0"
mods=$mods" HDF5/1.14.0-gompi-2023a"
mods=$mods" libevent/2.1.12"
mods=$mods" libxml2/2.11.4-GCCcore-12.3.0"
mods=$mods" OpenSSL/1.1"
mods=$mods" Pandoc/3.6.2"
mods=$mods" PCRE/8.45-GCCcore-12.3.0"
mods=$mods" SQLite/3.42.0-GCCcore-12.3.0"
mods=$mods" tmux/3.5a"
mods=$mods" zlib/1.2.13"
mods=$mods" git/2.41.0-GCCcore-12.3.0-nodocs"

# load modules for analysis of next-generation sequencing data.
mods=$mods" BEDTools/2.31.0-GCC-12.3.0"
mods=$mods" FastQC/0.12.1-Java-11"
mods=$mods" HISAT2/2.2.1-gompi-2023a"
mods=$mods" Kent_tools/468-GCC-12.3.0"
mods=$mods" SAMtools/1.18-GCC-12.3.0"
mods=$mods" Salmon/1.10.3-GCC-12.3.0"
mods=$mods" Subread/2.0.6-GCC-12.3.0"
mods=$mods" cutadapt/4.9-GCCcore-12.3.0"
mods=$mods" kallisto/0.51.1-gompi-2023a"
mods=$mods" picard/2.25.1-Java-11"

# load modules for single-cell data analysis.
mods=$mods" CellRanger/9.0.0"

module load $mods &> /dev/null

 
## Unload unwanted modules
## This is no longer necessary because we now have a clean
## build of R.
# module unload SciPy-bundle

## Optional modules 

# texlive - if needed can be loaded with.
# mods=$mods" texlive/20230313-GCC-12.2.0"
 


