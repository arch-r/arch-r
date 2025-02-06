FROM archlinux:latest

RUN pacman -Syu --noconfirm base-devel r gcc-fortran git libgit2 texlive biber qpdf && pacman -Scc --noconfirm

COPY build_devel.sh build_devel.sh
RUN bash build_devel.sh

RUN R -e "install.packages(c('devtools','roxygen2','xml2','covr','tinytest'),repos='https://cloud.r-project.org')"

