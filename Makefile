install_ropemacs:
	pip install git+https://github.com/python-rope/rope
	pip install git+https://github.com/python-rope/ropemode
	pip install git+https://github.com/python-rope/ropemacs
	mkdir -p private
	git clone https://github.com/pinard/Pymacs.git
	cd Pymacs && make check && make install
	cp Pymacs/pymacs.el private/
	rm -rf Pymacs

uninstall_ropemacs:
	rm -f private/pymacs.el
	pip uninstall -y rope ropemacs ropemode
	@echo "--------------------------"
	@echo "Manually uninstall Pymacs!"
	@echo "--------------------------"

install_nxhtml:
	mkdir -p private
	cd private && bzr co --lightweight http://bazaar.launchpad.net/~nxhtml/nxhtml/main nxhtml
