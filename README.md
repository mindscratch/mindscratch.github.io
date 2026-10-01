# craigwickesser.com

Personal site for Craig Wickesser, served by GitHub Pages from the `docs/` folder on `master`.

- `docs/index.html` is the whole site: one hand-written page, no build step.
- `docs/archive/` is a frozen copy of the old Hugo site (2014–2020).

## Preview locally

```sh
python3 -m http.server 8000 --directory docs
```

Then open http://localhost:8000.

## Deploy

Push to `master`. GitHub Pages serves `docs/` (Settings → Pages → Source: `master` / `/docs`), with the custom domain set in `docs/CNAME`.
