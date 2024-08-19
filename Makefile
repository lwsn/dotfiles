stow_dirs = $(wildcard */) 
.PHONY : stow
stow :
	stow --target $(HOME) --verbose --no-folding $(stow_dirs)

.PHONY : dry-run
dry-run :
	stow --no --target $(HOME) --verbose --no-folding $(stow_dirs)

.PHONY : restow
restow :
	stow --target $(HOME) --verbose --no-folding --restow $(stow_dirs)

# Do this *before* moving to another directory.
.PHONY : delete
delete :
	stow --target $(HOME) --verbose --no-folding --delete $(stow_dirs)
