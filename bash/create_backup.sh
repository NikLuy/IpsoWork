#!/bin/bash
# Script to backup a directory
SOURCE=$1
DEST=$2
tar -czvf $DEST/backup.tar.gz $SOURCE
