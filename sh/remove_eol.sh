#!/bin/bash

perl -pe 'chomp if eof' $1 > $2
