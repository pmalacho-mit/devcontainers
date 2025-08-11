# devcontainers


```bash
echo poetry-default | bash -c 'read id || { echo "No identifier given" >&2; exit 1; }; f="devcontainer.${id}.json"; mkdir -p .devcontainer; curl -fL "https://raw.githubusercontent.com/pmalacho-mit/devcontainers/HEAD/populated/$f" -o .devcontainer/devcontainer.json; echo "✔ Wrote .devcontainer/devcontainer.json from $f"'
```
