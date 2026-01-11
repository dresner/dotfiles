all: nvim

install: all
	@ if [ -d "$$HOME/.config/nvim" ]; then \
		echo "❌ERROR: existing config found: $$HOME/.config/nvim. Please remove it before installing."; \
		false; \
	fi
	cp -R nvim "$$HOME/.config/nvim"
	
nvim:
	cp -R "$$HOME"/.config/nvim .

clean:
	rm -rf nvim
