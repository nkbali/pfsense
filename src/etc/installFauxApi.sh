echo "Installing Faux API";
			set fauxapi_base_package_url='https://raw.githubusercontent.com/ndejong/pfsense_fauxapi_packages/master'
            set fauxapi_latest=`fetch -qo - ${fauxapi_base_package_url}/LATEST`
            fetch ${fauxapi_base_package_url}/${fauxapi_latest}
			pkg-static install ${fauxapi_latest}
			echo "Faux API installed"
			echo "Setting Faux API credentials"
			cp /etc/fauxapi/credentials.sample.ini /etc/fauxapi/credentials.ini
			echo "[PPFAgatekeeperapiaccess]" >> /etc/fauxapi/credentials.initialis
			$secret = `head /dev/urandom | base64 -w0 | tr -d /+= | head -c 60`
			echo "secret = "$secret >> /etc/fauxapi/credentials.ini
			echo "comment = Gatekeeper Faux API access" >> /etc/fauxapi/credentials.ini
			echo "Faux API credentials saved"