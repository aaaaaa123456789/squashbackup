all: package.deb

clean:
	rm -rf package
	rm -rf *.deb

package.deb: squashbackup control
	mkdir -p package/usr/local/sbin
	cp squashbackup package/usr/local/sbin/
	chmod 0755 package/usr/local/sbin/squashbackup
	mkdir -p package/DEBIAN
	cp control package/DEBIAN/control
	chmod 0644 package/DEBIAN/control
	dpkg-deb --build --root-owner-group package
	rm -rf package
