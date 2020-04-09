#!/bin/bash

./script/precompile

eb create isolationgames-production \
  --instance-types t2.micro \
  --elb-type application \
  --min-instances 1 \
  --max-instances 4 \
  --envvars `paste -d, -s ./script/envvars`

.script/cleanup
