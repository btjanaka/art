# Art

Various pieces of art made for fun. Use the Makefile to convert all the art into
png's stored in the `build` directory. You will need to have `inkscape`
installed.

Note some SVG's may not render properly on GitHub or browsers because certain
features of SVG's, such as gradient meshes, are not fully supported yet. To view
the accurate versions, see the `build` directory.

## Manifest

- `landscapes`: 1920x1080 drawings of landscapes
- `quotes`: Source for the Instagram account
  [@q.e.quotes](https://www.instagram.com/q.e.quotes/). Mostly, these are
  1080x1920 drawings with a quote overlaid.
- `logos`: Experimental logo(s)
- `p5js`: Drawings made with [p5.js](https://p5js.org/). In each subdirectory,
  you will find an `index.html` file that can be opened in your browser. Some of
  these are based on Daniel Shiffman's
  [The Nature of Code](https://github.com/nature-of-code/noc-book-2).
  - These drawings can also be live-reloaded with
    [browser-sync](https://www.browsersync.io); to do so, run
    ```bash
    browser-sync start --server --listen localhost -f -w
    ```
  - The `template` directory contains a template for making new drawings. Copy
    this directory to get started.
- `build`: PNG output from the SVG files in the rest of the repo

## Site

There is a small site associated with this repo and served on Netlify at
<https://art.btjanaka.net>. To build it, run `make site`.

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">
  <img
    alt="Creative Commons License"
    style="border-width:0"
    src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png"
  />
</a>
<br />
Items in this repo are licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.
