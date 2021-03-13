FROM archlinux/base:latest

RUN pacman -Syu --noconfirm base-devel r gcc-fortran git libgit2 texlive-core && pacman -Scc --noconfirm

COPY add_inconsolata.sh add_inconsolata.sh
RUN bash add_inconsolata.sh

COPY build_devel.sh build_devel.sh
RUN bash build_devel.sh

RUN R -e "install.packages(c('devtools','roxygen2','covr'),repos='https://cloud.r-project.org')"
RUN Rdevel -e "install.packages(c('devtools','roxygen2','covr'),repos='https://cloud.r-project.org')"

