#!/usr/bin/env bash

info() {
  echo "[INFO] $1"
}

fail() {
  echo "[ERROR] $1" >&2
  exit 1
}