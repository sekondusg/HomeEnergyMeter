last=${PWD}/.last

$(last): HomeEnergyMeter.yaml
	yglu $< > esp_config.yaml
	echo 1 | docker run --rm -v "${PWD}":/config --device=/dev/ttyUSB0 -i esphome/esphome run esp_config.yaml | tee
	touch $@
	rm esp_config.yaml
