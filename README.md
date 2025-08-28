# CP750PFCLCDJPをARM Linux上のDockerでモニタリングする
## 環境構築
1. `./host.sh`を実行
2. Dockerでコンテナをビルド

## 停電時のログの例
```bash
battery.charge: 100
CyberPower_UPS_Control  | battery.charge.low: 10
CyberPower_UPS_Control  | battery.charge.warning: 20
CyberPower_UPS_Control  | battery.mfr.date: CPS
CyberPower_UPS_Control  | battery.runtime: 950
CyberPower_UPS_Control  | battery.runtime.low: 300
CyberPower_UPS_Control  | battery.status: 100%
CyberPower_UPS_Control  | battery.type: PbAcid
CyberPower_UPS_Control  | battery.voltage: 13.6
CyberPower_UPS_Control  | battery.voltage.nominal: 12
CyberPower_UPS_Control  | device.mfr: CPS
CyberPower_UPS_Control  | device.model: CP750PFCLCD JP
CyberPower_UPS_Control  | device.serial: BH1PN2000321
CyberPower_UPS_Control  | device.type: ups
CyberPower_UPS_Control  | driver.debug: 0
CyberPower_UPS_Control  | driver.flag.allow_killpower: 0
CyberPower_UPS_Control  | driver.name: usbhid-ups
CyberPower_UPS_Control  | driver.parameter.interrupt_pipe_no_events_tolerance: -1
CyberPower_UPS_Control  | driver.parameter.pollfreq: 12
CyberPower_UPS_Control  | driver.parameter.pollinterval: 2
CyberPower_UPS_Control  | driver.parameter.port: auto
CyberPower_UPS_Control  | driver.parameter.productid: 0601
CyberPower_UPS_Control  | driver.parameter.synchronous: auto
CyberPower_UPS_Control  | driver.parameter.vendorid: 0764
CyberPower_UPS_Control  | driver.state: quiet
CyberPower_UPS_Control  | driver.version: 2.8.3
CyberPower_UPS_Control  | driver.version.data: CyberPower HID 0.83
CyberPower_UPS_Control  | driver.version.internal: 0.62
CyberPower_UPS_Control  | driver.version.usb: libusb-1.0.29 (API: 0x0100010B)
CyberPower_UPS_Control  | input.sensitivity: normal
CyberPower_UPS_Control  | input.transfer.high: 123
CyberPower_UPS_Control  | input.transfer.low: 92
CyberPower_UPS_Control  | input.voltage: 100.0
CyberPower_UPS_Control  | input.voltage.nominal: 100
CyberPower_UPS_Control  | output.voltage: 100.0
CyberPower_UPS_Control  | ups.beeper.status: enabled
CyberPower_UPS_Control  | ups.delay.shutdown: 60
CyberPower_UPS_Control  | ups.delay.start: 120
CyberPower_UPS_Control  | ups.firmware: CR02207B5
CyberPower_UPS_Control  | ups.load: 26
CyberPower_UPS_Control  | ups.mfr: CPS
CyberPower_UPS_Control  | ups.model: CP750PFCLCD JP
CyberPower_UPS_Control  | ups.power: 164
CyberPower_UPS_Control  | ups.power.nominal: 750
CyberPower_UPS_Control  | ups.productid: 0601
CyberPower_UPS_Control  | ups.realpower: 139
CyberPower_UPS_Control  | ups.realpower.nominal: 525
CyberPower_UPS_Control  | ups.serial: BH1PN2000321
CyberPower_UPS_Control  | ups.status: OL
CyberPower_UPS_Control  | ups.test.result: Done and passed
CyberPower_UPS_Control  | ups.timer.shutdown: -60
CyberPower_UPS_Control  | ups.timer.start: -60
CyberPower_UPS_Control  | ups.vendorid: 0764
CyberPower_UPS_Control  | UPSC successful
```