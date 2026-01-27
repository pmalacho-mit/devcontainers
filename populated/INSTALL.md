# Install

Copy the appropriate command below into your project repository root to install a devcontainer configuration.

Each command uses the `degit` utility (from [suede](https://github.com/pmalacho-mit/suede))
to fetch the `.devcontainer/devcontainer.json` file from a specific branch
of the `pmalacho-mit/devcontainers` repository.

The command structure:
- `bash <(curl https://suede.sh/utils/degit)` — Downloads and executes the degit utility
- `--destination .` — Extracts files to the current directory
- `--repo pmalacho-mit/devcontainers` — Specifies the source repository
- `--branch <branch-name>` — Specifies which devcontainer configuration branch to use
- `--force` — Overwrites existing `.devcontainer/devcontainer.json` if present

## devcontainer.common.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch common --force
```

## devcontainer.docker-outside-of-docker.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch docker-outside-of-docker --force
```

## devcontainer.node-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch node-default --force
```

## devcontainer.poetry-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch poetry-default --force
```

## devcontainer.python-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch python-default --force
```

## devcontainer.svelte-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch svelte-default --force
```

## devcontainer.svelte-tailwind-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch svelte-tailwind-default --force
```

## devcontainer.svelte-yjs-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch svelte-yjs-default --force
```

## devcontainer.typescript-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch typescript-default --force
```

