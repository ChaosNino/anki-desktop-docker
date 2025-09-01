FROM lsiobase/rdesktop-web:focal


 RUN \
  apt-get update && \
  apt-get install -y anki wget zstd xdg-utils && \
  dpkg --remove anki && \
  wget https://github.com/ankitects/anki/releases/download/25.07.5/anki-25.07.5-linux-qt6.tar.zst && \
  tar --use-compress-program=unzstd -xvf anki-25.07.5-linux-qt6.tar.zst && \
  cd 25.07.5-linux-qt6 && ./install.sh &&  cd .. && \
  rm -rf anki-25.07.5-linux-qt6 anki-25.07.5-linux-qt6.tar.zst && \
  apt-get clean && \
  mkdir -p /config/.local/share && \
  ln -s /config/app/Anki  /config/.local/share/Anki  && \
  ln -s /config/app/Anki2 /config/.local/share/Anki2

VOLUME "/config/app" 

COPY root/ /
