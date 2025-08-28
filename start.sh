#!/usr/bin/env bash

# CP750PFCLCDJP
mkdir -p /home/PEN/WS/config
cd /home/PEN/WS/config
VENDOR_ID="0764"
CONF_FILE="/etc/nut/ups.conf"

UPS_LINE=$(lsusb | grep "ID $VENDOR_ID")

if [ -z "$UPS_LINE" ]; then
    echo "CyberPower UPS not found."
    exit 1
fi

PRODUCT_ID=$(echo $UPS_LINE | awk '{print $6}' | cut -d: -f2)
DESC=$(echo $UPS_LINE | cut -d' ' -f7-)

BUS=$(echo "$UPS_LINE" | awk '{print $2}')
DEVICE=$(echo "$UPS_LINE" | awk '{print $4}' | sed 's/://')

USB_DEV="/dev/bus/usb/$BUS/$DEVICE"
sudo chmod 666 "$USB_DEV"
echo "Set permissions 666 on $USB_DEV"

PORT="auto"

echo "Detected UPS on $PORT"

# 出力を生成
cat > ups.conf <<EOF
[cyberpower]
    driver      = usbhid-ups
    port        = $PORT
    vendorid    = $VENDOR_ID
    productid   = $PRODUCT_ID
    desc        = "$DESC"
EOF

sudo cp ups.conf "$CONF_FILE"
echo "Generated $CONF_FILE successfully!"

# systemdをDockerで使うと不安定になることがある
echo "Starting NUT driver..."
sudo upsdrvctl start

echo "Starting upsd..."
sudo upsd

echo "Starting UPS monitor..."
sudo upsmon

cd /home/PEN/WS

while true; do
    clear
    if upsc cyberpower@localhost; then
        echo "UPSC successful"
    else
        echo "UPSC failed or service not ready"
    fi
    sleep 60 # 1分毎に表示
done