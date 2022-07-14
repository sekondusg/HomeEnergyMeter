#
# The generation of the expanded ESP config YAML file uses yglu
#    See: https://github.com/lbovet/yglu/blob/master/README.md
#    Install: python3 -m venv venv venv
#             . venv/bin/activate
#             pip3 install yglu

last=${PWD}/.last

$(last): HomeEnergyMeter.yaml
	yglu $< > esp_config.yaml
	echo 1 | docker run --rm -v "${PWD}":/config --device=/dev/ttyUSB0 -i esphome/esphome run esp_config.yaml | tee
	touch $@
	rm esp_config.yaml
