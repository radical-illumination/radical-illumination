# Radical Illumination

[![Build Status](https://travis-ci.org/radical-illumination/radical-illumination.svg?branch=master)](https://travis-ci.org/radical-illumination/radical-illumination)

This repository contains code that powers radical illumination website.

## Running in local

```bash
docker build . -t <<your docker username>>/radical-illumination:0.0.0
docker run --rm -p 8000:80 <<your docker username>>/radical-illumination:0.0.0
```