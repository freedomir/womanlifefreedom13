#!/bin/bash

# بررسی اگر کاربر دسترسی root نداشته باشد، اسکریپت خاتمه می‌یابد.
if [ "$(id -u)" -ne 0 ]; then
    echo 'This script must be run as root' >&2
    exit 1
fi

# fبروزرسانی سیستم
apt update
apt upgrade -y

# نصب nginx
apt install -y nginx

# نصب curl اگر نصب نبود
apt install -y curl

# اجرای دستور نصب مورد نظر
bash <(curl -Ls https://raw.githubusercontent.com/therealaleph/xrayr-reality/main/install.sh)

# پیامی برای نصب کامل نمایش داده می‌شود.
echo "Installation completed successfully."
