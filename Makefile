libsymfony-polyfill-php80.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Symfony libsymfony-polyfill-php80

libsymfony-polyfill-php80:
	bpc -v \
		-c bpc.conf  \
		-l symfony-polyfill-php80 \
		--input-file src.list

install-libsymfony-polyfill-php80:
	cd Symfony && bpc -l symfony-polyfill-php80 --install
