Raw SVG icons for RPG-Awesome
=============================

These are the raw SVG files used to generate font files and SCSS partials for [RPG Awesome](https://github.com/OpenDominion/Rpg-Awesome), a fork of the original [RPG Awesome](https://github.com/nagoshiashumari/Rpg-Awesome) by Daniela Howe and Ivan Montiel.


# Adding New Icons

First, add the new SVG file to `/Font`.

Next, use [IcoMoon](https://icomoon.io/app/) to import all of the SVG files located in `/Font`.

Once imported, select all of your icons and proceed to the next section "Download". Set your preferences to the following:

* Font Name: `rpgawesome-webfont`
* Class Prefix: `ra-var-icon`
* Include Metadata in Fonts: true
* Generate Stylesheet Variables for: Sass
* Metadata URL: `https://github.com/nagoshiashumari/Rpg-Awesome/`
* Metadata License: `MIT`

Without these changes, the font file will be rejected when issuing a pull request to RPG Awesome.

Once the Preferences are set, click Download. You will receive a ZIP file. In it, the important files you will need to copy over to the RPG Awesome repo are:

* `zip/fonts` => `rpg-awesome/fonts`

You will need to manually copy and paste the contents of `zip/variables.scss` into `rpg-awesome/scss/_variables.scss`, overwritting the old `ra-var-icon` variables.


# Building Assets (Automated)

Assets are generated using [icomoon-cli](https://www.npmjs.com/package/icomoon-cli) and consist of:

* `fonts/` — web font files (eot, ttf, woff, svg)
* `scss/_variables.scss` — Sass icon variables (e.g. `$ra-sword: '\e900';`)
* `scss/_icons.scss` — Sass CSS class definitions

## Steps

1. Add your SVG file(s) to the `/Font` folder
2. Commit and push your changes
3. Create and push a version tag — this triggers the GitHub Actions workflow, which builds all assets and attaches them to a GitHub Release automatically:

```bash
git tag v0.0.19
git push origin v0.0.19
```

The generated files can then be downloaded from the [Releases](https://github.com/OpenDominion/rpg-awesome-raw/releases) page.

## Running locally

To preview the output before releasing, Docker and Docker Compose are required. The output will be placed in `dist/`.

```bash
mkdir -p output dist
docker compose up --build
```
