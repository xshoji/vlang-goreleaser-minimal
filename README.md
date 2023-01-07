# vlang-goreleaser-minimal

Minimal goreleaser settings by github action for vlang.

# Usage

In case of Linux, needs install "musl-dev".

```
# ubuntu
apt-get install musl-dev
```

```
./app -h
Usage:  [options] [ARGS]

Description:
  This is sample web app.

Options:
  -p, --port <int>          [optional] port (default: 8080)
  -h, --help                help

./app -p 8080
2023-01-06 22:55:59.526 Start vweb app.
[Vweb] Running app on http://localhost:8080/
```

# Release

```
# Create new tag and push ( release job is started )
git tag v0.0.1-linux -m "Release beta version." && git push --tags

# Delete tag
echo "v0.0.1-linux" |xargs -I{} bash -c "git tag -d {} && git push origin :{}"

# Delete tag and create new tag and push
echo "v0.0.2-linux" |xargs -I{} bash -c "git tag -d {} && git push origin :{}; git tag {} -m \"Test github action.\"; git push --tags"
```

# References

> Setting Up GitHub Actions for V ｜ The V Programming Language  
> https://blog.vlang.io/setting-up-github-actions-for-v/  

> Shipping Rust Binaries with GoReleaser ｜ by Dotan Nahum ｜ Medium  
> https://jondot.medium.com/shipping-rust-binaries-with-goreleaser-d5aa42a46be0  

> ［GitHub］Actionsの動作確認時は忘れずにACTIONS_RUNNER_DEBUGとACTIONS_STEP_DEBUGを設定しよう | DevelopersIO  
> https://dev.classmethod.jp/articles/set-secrets-before-actions-test/  

> How vlang compile static binary? - Stack Overflow  
> https://stackoverflow.com/questions/72855645/how-vlang-compile-static-binary  

> v/Dockerfile.alpine at master · vlang/v  
> https://github.com/vlang/v/blob/master/Dockerfile.alpine  
