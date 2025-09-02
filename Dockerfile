FROM lsiobase/rdesktop-web:focal


 RUN \
  apt-get update && \
  apt-get install -y anki wget zstd xdg-utils && \
  dpkg --remove anki && \
  wget https://github.com/ankitects/anki/releases/download/25.07.5/anki-launcher-25.07.5-linux.tar.zst && \
  tar --use-compress-program=unzstd -xvf anki-launcher-25.07.5-linux.tar.zst && \
  cd 25.07.5-linux-qt6 && ./install.sh &&  cd .. && \
  rm -rf anki-launcher-25.07.5-linux anki-launcher-25.07.5-linux.tar.zst && \
  apt-get clean && \
  mkdir -p /config/.local/share && \
  ln -s /config/app/Anki  /config/.local/share/Anki  && \
  ln -s /config/app/Anki2 /config/.local/share/Anki2

VOLUME "/config/app" 

COPY root/ /
