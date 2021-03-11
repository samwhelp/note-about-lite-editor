#!/usr/bin/env bash


release_to_directory () {

	rm -rf release/1.0

	mkdir -p release/1.0
	install -m 755 ./app release/1.0/app


	mkdir -p release/1.0/data/core
	install -m 644 ./data/core/init.lua release/1.0/data/core

}


release_to_zip () {

	cd release
	rm app-1.0.zip

	cd 1.0
	zip -r ../app-1.0.zip ./*

}


release_to_directory
release_to_zip
