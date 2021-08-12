FROM mlfcore/base:1.2.0

# Install the conda environment
COPY environment.yml .
RUN conda env create -f environment.yml && conda clean -a

# Activate the environment
RUN echo "source activate liver_ct_seg_pkg" >> ~/.bashrc
ENV PATH /home/user/miniconda/envs/liver_ct_seg_pkg/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name liver_ct_seg_pkg > liver_ct_seg_pkg_environment.yml

# Currently required, since mlflow writes every file as root!
USER root
