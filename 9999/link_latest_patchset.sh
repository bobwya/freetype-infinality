#!/bin/bash

latest_version="$( find .. -name "[0-9]*.[0-9]*" -printf "%f\n" | sort -V | tail -n 1 )"

rm "freetype-9999"*".patch" &>/dev/null
for freetype_patch in ../"${latest_version}/freetype-${latest_version}-"{0001..0024}*".patch"; do
	freetype_git_patch="$(basename "${freetype_patch}" | sed 's/[[:digit:]]\+[.][[:digit:]]\+\(\|[.][[:digit:]]\+\)/9999/' )"
	ln "${freetype_patch}" "${freetype_git_patch}"
done

