

.PHONE: doc
doc:
	sed -i -n '1,/^## Documentation/ p' README.md
	echo '\n```' >> README.md
	grep -E -- "\w+\)\s#" "./prov" | sed -E -- 's/^[[:space:]]*([-|[:alpha:]]+)\)\s#([^,]*), (.*)/\1 \2 - \3/' >> README.md
	echo '```' >> README.md
	echo '## TODO' >> README.md
	sed -nE 's/.*#TODO (.*)/- \1/p' prov >> README.md
