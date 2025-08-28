#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

tee ${SCRIPT_DIR}/usbauth.sh > /dev/null <<EOF
#!/usr/bin/env bash
echo 'ATTR{idVendor}=="0764", ATTR{idProduct}=="0601", MODE="0666"' | sudo tee /etc/udev/rules.d/99-nut-usb.rules
sudo udevadm control --reload
sudo udevadm trigger
EOF

chmod +x "${SCRIPT_DIR}/usbauth.sh"

# systemdサービスを登録
sudo tee /etc/systemd/system/nut-usb-setup.service > /dev/null <<EOF
[Unit]
Description=Setup NUT USB Udev Rule
After=network.target

[Service]
Type=oneshot
ExecStart=${SCRIPT_DIR}/usbauth.sh
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable nut_usb_setup.service
sudo systemctl start nut_usb_setup.service