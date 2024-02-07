#!/bin/bash
gunicorn -w 4 'quote:app' -b 0.0.0.0:80 --chdir src
