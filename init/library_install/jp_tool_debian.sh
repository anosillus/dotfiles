# Install MeCab
sudo apt install -y --no-install-recommends mecab libmecab-dev mecab-ipadic-utf8 
pip install mecab-python3

# Install mecab-ipadic-NEologd
git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git /tmp/neologd \
  /tmp/neologd/bin/install-mecab-ipadic-neologd -n -a -y \
  sed -i -e "s|^dicdir.*$|dicdir = /usr/lib/mecab/dic/mecab-ipadic-neologd|" /etc/mecabrc \
  rm -rf /tmp/neologd

# Install CRF++
wget -O /tmp/CRF++-0.58.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ" \
  cd $HOME \
tar zxf CRF++-0.58.tar.gz 
cd CRF++-0.58 
./configure 
make 
make install 
cd .. 
rm CRF++-0.58.tar.gz 
rm -rf CRF++-0.58 
ldconfig

# Install CaboCha
cd $HOME 
curl -c cabocha-0.69.tar.bz2 -s -L "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7SDd1Q1dUQkZQaUU" \
    | grep confirm | sed -e "s/^.*confirm=\(.*\)&amp;id=.*$/\1/" \
    | xargs -I{} curl -b  cabocha-0.69.tar.bz2 -L -o cabocha-0.69.tar.bz2 \
      "https://drive.google.com/uc?confirm={}&export=download&id=0B4y35FiV1wh7SDd1Q1dUQkZQaUU" 
tar jxf cabocha-0.69.tar.bz2 
cd cabocha-0.69 
export CPPFLAGS=-I/usr/local/include 
./configure --with-mecab-config=`which mecab-config` --with-charset=utf8 
make 
make install 
cd python 
python setup.py build 
python setup.py install 
cd $HOME
rm cabocha-0.69.tar.bz2 
rm -rf /cabocha-0.69 
ldconfig
