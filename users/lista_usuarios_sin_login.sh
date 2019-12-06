#!/bin/bash
passwd -S -a | cut -d" " -f1-2 | grep L | cut -d" " -f1
