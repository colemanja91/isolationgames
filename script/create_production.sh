#!/bin/bash

eb create isolationgames-production \
  --instance-type m5.large \
  --single \
  --envvars `paste -d, -s ./envvars`
