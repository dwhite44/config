#!/bin/bash
scriptdir=`dirname "$(readlink -f $0)"`
bash $scriptdir/update-windows-hosts.sh
