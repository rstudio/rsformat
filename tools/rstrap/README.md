# rstrap

## Installation

1. Install [nvm](https://github.com/nvm-sh/nvm#installing-and-updating) (including restarting your terminal session if necessary)
2. `cd` to the repo
3. `nvm install` - this installs the Node.js version specified in `.nvmrc`
4. `nvm use` - this switches the current Node.js version to the one you just installed
5. `npm install` - this installs Node.js dependencies; run this every time dependencies change

## Building

`make` builds the CSS/JS artifacts and puts them in `dist`.

Run `make clean` to delete `dist`; you may need to do this if dependencies change that `make` does not detect.
