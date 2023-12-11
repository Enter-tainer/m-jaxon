#!/bin/bash
set -exuo pipefail
yarn build
cp dist/mj.iife.js typst-package/mj.js
cp dist/third-party-licenses.txt typst-package/NOTICE
echo "Dependencies:" > typst-package/NOTICE
echo >> typst-package/NOTICE
cat dist/third-party-licenses.txt >> typst-package/NOTICE
cp README.md typst-package/
cp LICENSE typst-package/
typst compile ./mj.typ mj.svg
cp mj.svg typst-package/
