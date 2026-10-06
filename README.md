# Nelsonlove Tap

## How do I install these formulae?

`brew install nelsonlove/tap/<formula>`

Or `brew tap nelsonlove/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "nelsonlove/tap"
brew "<formula>"
```

## Casks

- `alacritty`: the upstream Alacritty app. homebrew-cask disabled its cask on 2026-09-01 because the app is not notarised (`fails_gatekeeper_check`). This copy keeps the upstream URL, checksum, artifacts and `zap`, drops `disable!`, and clears the quarantine flag in `postflight_steps` so Gatekeeper does not block the app. `.github/workflows/bump-alacritty.yml` checks for a new release every Monday and commits the new version and sha256 to `main`.

`brew install --cask nelsonlove/tap/alacritty`

## Trust

Homebrew 7 loads formulae and casks from a non-official tap only when they are trusted. Trust this whole tap once per Mac:

`brew trust --tap nelsonlove/tap`

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
