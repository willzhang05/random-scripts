#!/bin/sh
### Janky backup script that tars useful directories
mount /dev/sdc1 /backups
tar -czf /backups/$(date -I)-backup.tar.gz /etc /var /home /root/ /vms /boot/
umount /dev/sdc1
