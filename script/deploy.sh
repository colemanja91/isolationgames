#!/bin/bash

./script/precompile

eb deploy --staged

./script/cleanup
