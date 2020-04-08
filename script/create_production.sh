#!/bin/bash

eb create isolationgames-production \
  --instance-types m5.large \
  --single \
  --envvars `paste -d, -s ./script/envvars`
