

.PHONE: doc
doc:
	sed -i -n '1,/^## Documentation/ p' README.md
	echo '\n```' >> README.md
	grep -E -- "\w+\)\s#" "./deps" | sed -E -- 's/^[[:space:]]*([-|[:alpha:]]+)\)\s#([^,]*), (.*)/\1 \2 - \3/' >> README.md
	echo '```' >> README.md
