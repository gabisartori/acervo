HD="$HOME/media/hdd1tb"
PHONE="$HOME/media/phone/Armazenamento interno"
WHATSAPP="$PHONE/Android/media/com.whatsapp/WhatsApp/Media"

# Send songs from PC to phone
rsync -av --update "$HOME/musicas/" "$PHONE/Music"

# Moves stuff from phone to hard drive in order to free space for the phone + ensure that I won't lose it in case I loose my phone
## Camera photos and videos to camera
rsync -a --remove-source-files --progress "$PHONE/DCIM/Camera/" "$HD/var/backups/phone/camera"
## Screenshots and Video captures to screenshots
rsync -a --remove-source-files --progress "$PHONE/DCIM/Screenshots/" "$HD/var/backups/phone/screenshots"
rsync -a --remove-source-files --progress "$PHONE/DCIM/Videocaptures/" "$HD/var/backups/phone/screenshots"

## Whatsapp stuff
### Sent and received videos to camera
rsync -a --remove-source-files --progress "$WHATSAPP/WhatsApp Video/Sent/" "$HD/var/backups/phone/camera"
rsync -a --remove-source-files --progress --include="*.mp4" --exclude="*" "$WHATSAPP/WhatsApp Video/" "$HD/var/backups/phone/camera"

### Sent and received images to camera
rsync -a --remove-source-files --progress "$WHATSAPP/WhatsApp Images/Sent/" "$HD/var/backups/phone/camera"
rsync -a --remove-source-files --progress --include="*.jpg" --exclude="*" "$WHATSAPP/WhatsApp Images/" "$HD/var/backups/phone/camera"

## images/gifs/videos from the Download folder to downloads
rsync -a --remove-source-files --progress --include="*.[jpg|png|webp|gif|mp4]" --exclude="*" "$PHONE/Download/" "$HD/var/backups/phone/downloads"

## Everything in the Pictures folder, that's usually where images saved from apps go. Like reddit, bluesky, twitter, etc.
## Note that images dowloaded from the browser go into the Download folder instead
rsync -a --remove-source-files --progress "$PHONE"/Pictures/*/ "$HD/var/backups/phone/downloads"

## Instagram and Whatsapp saved stories to camera
rsync -a --remove-source-files --progress "$PHONE"/Movies/* "$HD/var/backups/phone/downloads"

