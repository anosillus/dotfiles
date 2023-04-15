wget -qO- https://github.com/yuru7/udev-gothic/releases/download/v1.2.0/UDEVGothic_NF_v1.2.0.zip | \
  unzip -j - UDEVGothic_NF_v1.2.0/*.otf -d ~/.local/share/fonts/

fc-cache -fv
