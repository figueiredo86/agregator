#!/bin/bash

echo > "sip_extensions.conf"
mysql -u root -p123 < ../../sql/create_tables.sql
rm *.cfg
