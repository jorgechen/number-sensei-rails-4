#!/bin/bash
bundle exec rake erd filetype=dot
dot -Tpdf erd.dot -o erd.pdf
dot -Tpng erd.dot -o erd.png
