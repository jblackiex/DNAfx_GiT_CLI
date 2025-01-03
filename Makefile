SUDO=sudo


# STYLES color
RED=\033[0;31m
GREEN=\033[0;32m
NC=\033[0m # No Color


# DNAfx
# HID device access

DNAfx:
	@echo "${GREEN}DNAfx${NC}"
	$(SUDO) python3 src/midi_change.py

DNAfx_extract_from_loop_wav:
	@echo "${GREEN}DNAfx -> extract loop${NC}"
	$(SUDO) python3 src/extract_from_loop_wav.py

DNAfx_play:
	@echo "${GREEN}DNAfx -> play audio${NC}"
	$(SUDO) python3 src/play_AUX.py

DNAfx_find_bus:
	@echo "${GREEN}Finding USB device${NC}"
	$(SUDO) lsusb

DNAfx_find_bus_verbose:
	@echo "${GREEN}Finding USB device${NC}"
	$(SUDO) lsusb -v

DNAfx_hid_dump_descriptor:
	@echo "${GREEN}Dumping HID descriptor${NC}"
	$(SUDO) usbhid-dump -d 0483:5703 -e descriptor

DNAfx_sniff:
	@echo "${GREEN}Sniffing USB device${NC}"
	$(SUDO) modprobe usbmon
	$(SUDO) tcpdump -i usbmon1 -w usb_traffic.pcap

DNAfx_analyze_sniff:
	@echo "${GREEN}Sniffing USB device${NC}"
	$(SUDO) tshark -r usb_traffic.pcap -Y "usb.device_address == 24 && usb.endpoint_address == 0x02" -T fields -e usb.capdata

 