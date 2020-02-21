all: dist/rstrap.css dist/rstrap.js

dist/rstrap.css: $(wildcard scss/*.scss)
	@mkdir -p dist
	node_modules/.bin/node-sass \
	  --include-path=node_modules/bootstrap/scss \
		--output-style=compressed scss/rstrap.scss \
		> dist/rstrap.css

dist/rstrap.js: $(wildcard src/*.js)
	npm run build
	sed -i="" "s/Bootstrap's/rstrap's/g" dist/rstrap.js

clean:
	rm -rf dist/
