#!/usr/bin/env bash

info() {
  echo -e "\033[1;34mINFO:\033[0m $*"
}

fail() {
  echo -e "\033[1;31mERROR:\033[0m $*" >&2
  exit 1
}