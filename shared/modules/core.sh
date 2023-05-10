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
# These modules are build with the < gompi/foss-2020a + GCC/GCCcore-9.3.0 > toolchain
module use -a /apps/kir/eb/${ARCH}/modules/all

# Add the BMRC "in development" to the MODULEPATH environment variable
# Most of these are built with the same toolchain
module use -a /apps/eb/dev/${ARCH}/modules/all


# make sure we start from a clean environment
module purge

# 2. Load modules
# ------------

# To ensure compatibility all modules should be built with the same toolchain
# We use the < gompi/foss-2020a + GCC/GCCcore-9.3.0 > toolchain.

# note: to find modules we can either:
# (1) module avail 2>&1 | grep -i foo # case insensitive
# or (2) module avail foo  # case sensitive

# load a core set of modules

# Programming languages

# Python
module load Python/3.8.2-GCCcore-9.3.0

# R with key dependencies
module load nodejs/12.16.1-GCCcore-9.3.0
module load R/4.1.2-foss-2020a-bare

# Java
module load Java/11.0.2 # is this compatible ?

# Perl
module load Perl/5.30.2-GCCcore-9.3.0

# Other software

# tmux
module load tmux/3.2-GCCcore-9.3.0

# SQLite
module load SQLite/3.31.1-GCCcore-9.3.0

# Emacs
module load Emacs/27.1-GCCcore-9.3.0

# OpenSSL
module load OpenSSL/1.1.1e-GCCcore-9.3.0


# SNS 26/6/2022 - These modules are no longer  loaded by default because they
#    spam the PYTHONPATH environment variable and
#    causes package number conflicts (e.g. with numba and numpy)

# module load snakemake/5.26.1-foss-2020a-Python-3.8.2
# module load GDAL/3.0.4-foss-2020a-Python-3.8.2

# we also need replacements for the following (list compiled from KGen)
# apps/boost/1.60.0
module load Boost/1.72.0-gompi-2020a
# apps/bzip2/1.0.6
module load bzip2/1.0.8-GCCcore-9.3.0
# apps/curl/7.60.0              
module load cURL/7.69.1-GCCcore-9.3.0
# apps/gcc/9.1.0 -> 9.3.0 will be loaded as a dependency of e.g. Python/R
# apps/geos/3.8.1
module load GEOS/3.8.1-GCC-9.3.0-Python-3.8.2
# apps/ghostscript/9.18
module load Ghostscript/9.52-GCCcore-9.3.0
# apps/gmp/6.1.2                
module load GMP/6.2.0-GCCcore-9.3.0
# apps/gsl/2.4                  
module load GSL/2.6-GCC-9.3.0
# apps/hdf5/1.8.20
module load HDF5/1.10.6-gompi-2020a  # more recent version has a conflict
# apps/libevent/2.0.22
module load libevent/2.1.11-GCCcore-9.3.0
# apps/libxml2/2.9.8
module load libxml2/2.9.10-GCCcore-9.3.0
# apps/pandoc/2.1.1             
module load Pandoc/2.13 # is this compatible?
# apps/pcre/8.40                
module load PCRE/8.44-GCCcore-9.3.0
# apps/zlib/1.2.8
module load zlib/1.2.11-GCCcore-9.3.0
# git
module load git/2.23.0-GCCcore-9.3.0-nodocs
# texlive
# this is problematic for compile pipeline reports
# but required for building sphinx documentation
# for now, it can be loaded manually as needed
# module load texlive/20220321-foss-2020a

# We see to be missing * compatible * replacements for the following

# apps/nmslib/1.6
# bio/igraph/0.7.1              
# apps/texinfo/6.5


# Unload unwanted modules
module unload SciPy-bundle

