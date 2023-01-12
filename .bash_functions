#!/usr/bin/env bash

# Determine size of a file or total size of a directory.
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		read -p "Sort by size? (y/n) " -n 1;
		echo "";
		arg+=c;
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			sudo du $arg .[^.]* ./* | gsort -hr;
		else
			sudo du $arg .[^.]* ./*;
		fi;
	fi;
}

# Create a data URL from a file.
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Create a git.io short URL.
function gitio() {
	if [ -z "${1}" -o -z "${2}" ]; then
		echo "Usage: \`gitio slug url\`";
		return 1;
	fi;
	curl -i https://git.io/ -F "url=${2}" -F "code=${1}";
	echo "";
}

# Start an HTTP server from a directory, optionally specifying the port.
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://0.0.0.0:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python3 -m http.server ${port}
}

# Start a PHP server from a directory, optionally specifying the port.
function server_php() {
	local port="${1:-4000}";
	local ip="0.0.0.0";
	sleep 1 && open "http://${ip}:${port}/" &
	php -S "${ip}:${port}";
}

# UTF-8-encode a string of Unicode symbols.
function escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}

# Show all the names (CNs and SANs) listed in the SSL certificate.
# for a given domain.
function get_ssl() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified.";
		return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}…";
	echo ""; # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" \
			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version");
		echo "Common Name:";
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
		echo ""; # newline
		echo "Subject Alternative Name(s):";
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
		return 0;
	else
		echo "ERROR: Certificate not found.";
		return 1;
	fi;
}

# `trees` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function trees() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Automates ImageOptim, ImageAlpha, and JPEGmini after that cleanup the trash.
function imagemin() {
	if [ -n "$1" ]; then
		if [ -d "$1" ]; then
			imageoptim -a -j "$1" && cleanup-trash;
		else
			echo "ERROR: Folder not found.";
		fi;
	else
		echo "ERROR: No folder specified.";
	fi;
}
