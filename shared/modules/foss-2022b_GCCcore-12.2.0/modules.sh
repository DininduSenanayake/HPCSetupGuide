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
mods="Python/3.10.8-GCCcore-12.2.0"
mods=$mods" Java/11.0.20"
mods=$mods" Perl/5.36.0-GCCcore-12.2.0"
mods=$mods" nodejs/18.12.1-GCCcore-12.2.0" # dependency for R.
# mods=$mods" R/4.3.1-foss-2022b-bare"
mods=$mods" gfbf/2022b"
mods=$mods" pybind11/2.10.3-GCCcore-12.2.0"
mods=$mods" R/4.3.1-foss-2022b-bare-noSciPy"

# general


mods=$mods" Boost/1.81.0-GCC-12.2.0"
mods=$mods" bzip2/1.0.8-GCCcore-12.2.0"
mods=$mods" CMake/3.24.3-GCCcore-12.2.0"
mods=$mods" CPLEX/22.1.1"
mods=$mods" cURL/7.86.0-GCCcore-12.2.0"
mods=$mods" Emacs/28.2-GCCcore-12.2.0"
mods=$mods" GEOS/3.11.1-GCC-12.2.0"
mods=$mods" Ghostscript/10.0.0-GCCcore-12.2.0"
mods=$mods" GMP/6.2.1-GCCcore-12.2.0"
mods=$mods" GSL/2.7-GCC-12.2.0"
mods=$mods" HDF5/1.14.0-gompi-2022b"
mods=$mods" libevent/2.1.12-GCCcore-12.2.0"
mods=$mods" libxml2/2.10.3-GCCcore-12.2.0"
mods=$mods" OpenSSL/1.1"
mods=$mods" Pandoc/2.13"
mods=$mods" PCRE/8.45-GCCcore-12.2.0"
mods=$mods" SQLite/3.39.4-GCCcore-12.2.0"
mods=$mods" tmux/3.3a-GCCcore-12.2.0"
mods=$mods" zlib/1.2.12-GCCcore-12.2.0"
mods=$mods" git/2.38.1-GCCcore-12.2.0-nodocs"

# load modules for analysis of next-generation sequencing data.
mods=$mods" BEDTools/2.30.0-GCC-12.2.0"
mods=$mods" FastQC/0.11.9-Java-11"
mods=$mods" HISAT2/2.2.1-gompi-2022b"
mods=$mods" Kent_tools/450-GCC-12.2.0"
mods=$mods" SAMtools/1.17-GCC-12.2.0"
mods=$mods" Salmon/1.10.0-GCC-12.2.0"
mods=$mods" Subread/2.0.4-GCC-12.2.0"
mods=$mods" cutadapt/4.4-GCCcore-12.2.0"
mods=$mods" kallisto/0.48.0-gompi-2022b"
mods=$mods" picard/2.25.1-Java-11"

# load modules for single-cell data analysis.
mods=$mods" CellRanger/7.1.0"

module load $mods &> /dev/null

 
## Unload unwanted modules
## This is no longer necessary because we now have a clean
## build of R.
# module unload SciPy-bundle

## Optional modules 

# texlive - if needed can be loaded with.
# mods=$mods" texlive/20230313-GCC-12.2.0"
 


