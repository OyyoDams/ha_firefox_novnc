ARG BUILD_FROM
FROM $BUILD_FROM

# Installer les dépendances nécessaires
# Utilisation d'Alpine Linux pour une image légère, ajustez pour Debian/Ubuntu si nécessaire
RUN apk add --no-cache \
    firefox \
    xorg-server \
    x11vnc \
    novnc \
    python3 \
    py3-pip \
    websockify \
    fluxbox \
    xvfb

# Copier le script de démarrage
COPY run.sh /
RUN chmod a+x /run.sh

# Définir l'utilisateur non root si possible (bonne pratique de sécurité)
# USER root # ou un utilisateur non root si vous le créez

# Exécuter le script de démarrage
CMD [ "/run.sh" ]
