#!/bin/bash

echo -n > core.tex

for f in `ls *.tex` ; do
  if [[ -n "$(echo $f | grep -e '[0-9][0-9].tex')" ]]; then
    if [[ -z "$(cat $f | grep 'Шпаргалка: TODO')" ]]; then
       echo -e "\input{$f}\n" >> core.tex
    fi
  fi
done

for f in `ls main.tex` ; do
  pdflatex $f || exit
  pdflatex $f >/dev/null || exit
done

rm *.{toc,out,aux,log}
