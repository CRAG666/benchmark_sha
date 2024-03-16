#! /bin/bash
FILE=./synthetic_file

[ ! -f "$FILE" ] && dd if=/dev/urandom of=synthetic_file bs=1M count=3072

hyperfine \
	"sha1sum $FILE" \
	"openssl dgst -sha1 -hmac "clave" $FILE" \
	"sha224sum $FILE" \
	"openssl dgst -sha224 -hmac "clave" $FILE" \
	"sha256sum $FILE" \
	"openssl dgst -sha256 -hmac "clave" $FILE" \
	"sha384sum $FILE" \
	"openssl dgst -sha384 -hmac "clave" $FILE" \
	"sha512sum $FILE" \
	"openssl dgst -sha512 -hmac "clave" $FILE" \
	-M 4 --export-csv benchmark.csv --export-json benchmark.json
