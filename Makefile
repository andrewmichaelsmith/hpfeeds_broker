run:
	docker build -t andrewmichaelsmith/hpfeeds:latest .

shell:
	docker run --rm -ti andrewmichaelsmith/hpfeeds:latest /bin/bash
