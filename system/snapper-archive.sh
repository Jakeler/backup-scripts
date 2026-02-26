snapper -c archive-backup --iso create -c timeline
snapper -c archive-media --iso create -c timeline

snapper -c archive-backup --iso cleanup timeline
snapper -c archive-media --iso cleanup timeline

snapper -c archive-backup --iso ls
