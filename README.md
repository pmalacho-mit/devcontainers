# devcontainers

[](./populated/INSTALL.md)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 43 chars: 1430 -->
## Install

### devcontainer.common.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch common --force
```

### devcontainer.docker-outside-of-docker.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch docker-outside-of-docker --force
```

### devcontainer.node-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch node-default --force
```

### devcontainer.poetry-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch poetry-default --force
```

### devcontainer.python-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch python-default --force
```

### devcontainer.svelte-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch svelte-default --force
```

### devcontainer.svelte-tailwind-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch svelte-tailwind-default --force
```

### devcontainer.typescript-default.json
```bash
bash <(curl https://suede.sh/utils/degit) --destination . --repo pmalacho-mit/devcontainers --branch typescript-default --force
```


<!-- p↓ END -->

# Details

[](./src/README.md)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 676 chars: 12979 -->
## Full Configs (`devcontainer.*.json`)

Complete, composable devcontainer configurations that extend other files using the `extends` field.

### devcontainer.common.json

Base configuration shared by all devcontainers. Includes common features, customizations, mounts, and post-create commands.

[](src/devcontainer.common.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 20 chars: 545 -->

```json
{
  "extends": [
    "./image.ubuntu-24.json",
    "./feature.git-subrepo.json",
    "./feature.vim.json",
    "./customization.tab-size-2.json",
    "./customization.format-on-save.json",
    "./customization.markdown.json",
    "./mount.ssh.json",
    "./postCreateCommand.ignore-UseKeychain-in-ssh-config.json",
    "./postCreateCommand.git-config-vim-as-core-editor.json",
    "./postCreateCommand.git-config-merge-divergent.json",
    "./postCreateCommand.codeblockify.json",
    "./postCreateCommand.containersync.json"
  ]
}
```

<!-- p↓ END -->

### devcontainer.node-default.json

Node.js-focused devcontainer with common Node setup.

[](src/devcontainer.node-default.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 10 chars: 99 -->

```json
{
  "extends": [
    "./devcontainer.common.json",
    "./feature.node-20.json"
  ]
}
```

<!-- p↓ END -->

### devcontainer.python-default.json

Python-focused devcontainer with Python 3.12 and common Python tools.

[](src/devcontainer.python-default.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 11 chars: 138 -->

```json
{
  "extends": [
    "./devcontainer.common.json",
    "./feature.python-3.12.json",
    "./customization.python.json"
  ]
}
```

<!-- p↓ END -->

### devcontainer.typescript-default.json

TypeScript/Node.js devcontainer with TypeScript compiler and Node.js 20.

[](src/devcontainer.typescript-default.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 11 chars: 115 -->

```json
{
  "extends": [
    "./devcontainer.node-default.json",
    "./customization.typescript.json"
  ]
}

```

<!-- p↓ END -->

### devcontainer.svelte-default.json

Svelte-focused devcontainer with Svelte customizations and Node.js 20.

[](src/devcontainer.svelte-default.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 10 chars: 116 -->

```json
{
  "extends": [
    "./devcontainer.typescript-default.json",
    "./customization.svelte.json"
  ]
}
```

<!-- p↓ END -->

### devcontainer.svelte-tailwind-default.json

Svelte with Tailwind CSS devcontainer, combining Svelte and Tailwind configurations.

[](src/devcontainer.svelte-tailwind-default.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 10 chars: 117 -->

```json
{
  "extends": [
    "./devcontainer.svelte-default.json",
    "./customization.tailwindcss.json"
  ]
}
```

<!-- p↓ END -->

### devcontainer.poetry-default.json

Python devcontainer with Poetry dependency management.

[](src/devcontainer.poetry-default.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 11 chars: 146 -->

```json
{
  "extends": [
    "./devcontainer.python-default.json",
    "./customization.python-venv.json",
    "./feature.poetry.json"
  ]
}
```

<!-- p↓ END -->

### devcontainer.docker-outside-of-docker.json

Devcontainer configured to run Docker commands from within the container.

[](src/devcontainer.docker-outside-of-docker.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 10 chars: 103 -->

```json
{
  "extends": [
    "./devcontainer.common.json",
    "./docker-outside-of-docker"
  ]
}
```

<!-- p↓ END -->

## Customizations (`customization.*.json`)

VS Code editor customizations including settings, keybindings, and extensions.

### customization.format-on-save.json

Enables automatic code formatting when saving files.

[](src/customization.format-on-save.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 13 chars: 129 -->

```json
{
  "customizations": {
    "vscode": {
      "settings": {
        "editor.formatOnSave": true
      }
    }
  }
}
```

<!-- p↓ END -->

### customization.markdown.json

VS Code customizations specific to Markdown editing.

[](src/customization.markdown.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 15 chars: 169 -->

```json
{
  "customizations": {
    "vscode": {
      "settings": {
        "[markdown]": {
          "editor.defaultFormatter": null
        }
      }
    }
  }
}
```

<!-- p↓ END -->

### customization.mermaid.json

Extensions and settings for Mermaid diagram support in VS Code.

[](src/customization.mermaid.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 13 chars: 130 -->

```json
{
  "customizations": {
    "vscode": {
      "extensions": [
        "bierner.markdown-mermaid"
      ]
    }
  }
}
```

<!-- p↓ END -->

### customization.python.json

Python-specific VS Code customizations including linting and formatting tools.

[](src/customization.python.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 25 chars: 505 -->

```json
{
  "customizations": {
    "vscode": {
      "settings": {
        "python.analysis.typeCheckingMode": "standard",
        "python.formatting.provider": "black",
        "python.formatting.blackArgs": [
          "--line-length=88"
        ],
        "[python]": {
          "editor.defaultFormatter": "ms-python.black-formatter"
        }
      },
      "extensions": [
        "ms-python.python",
        "ms-python.vscode-pylance",
        "ms-python.black-formatter"
      ]
    }
  }
}
```

<!-- p↓ END -->

### customization.python-venv.json

Configures Python virtual environment detection and activation in VS Code.

[](src/customization.python-venv.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 15 chars: 307 -->

```json
{
  "customizations": {
    "vscode": {
      "settings": {
        "python.venvPath": "${containerWorkspaceFolder}/.venv",
        "python.defaultInterpreterPath": "${containerWorkspaceFolder}/.venv/bin/python",
        "python.terminal.activateEnvInCurrentTerminal": true
      }
    }
  }
}
```

<!-- p↓ END -->

### customization.svelte.json

Svelte language support and formatting customizations for VS Code.

[](src/customization.svelte.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 20 chars: 289 -->

```json
{
  "customizations": {
    "vscode": {
      "settings": {
        "svelte.enable-ts-plugin": true,
        "[svelte]": {
          "editor.defaultFormatter": "svelte.svelte-vscode"
        }
      },
      "extensions": [
        "svelte.svelte-vscode"
      ]
    }
  }
}

```

<!-- p↓ END -->

### customization.tab-size-2.json

Sets default editor tab size to 2 spaces.

[](src/customization.tab-size-2.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 13 chars: 121 -->

```json
{
  "customizations": {
    "vscode": {
      "settings": {
        "editor.tabSize": 2
      }
    }
  }
}
```

<!-- p↓ END -->

### customization.tailwindcss.json

Tailwind CSS IntelliSense and linting for VS Code.

[](src/customization.tailwindcss.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 13 chars: 131 -->

```json
{
  "customizations": {
    "vscode": {
      "extensions": [
        "bradlc.vscode-tailwindcss"
      ]
    }
  }
}
```

<!-- p↓ END -->

### customization.typescript.json

TypeScript-specific VS Code customizations including formatting and linting.

[](src/customization.typescript.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 19 chars: 299 -->

```json
{
  "customizations": {
    "vscode": {
      "settings": {
        "[typescript]": {
          "editor.defaultFormatter": "esbenp.prettier-vscode"
        }
      },
      "extensions": [
        "ms-vscode.vscode-typescript-next",
        "esbenp.prettier-vscode"
      ]
    }
  }
}
```

<!-- p↓ END -->

## Features (`feature.*.json`)

Devcontainer Features that install tools and runtimes into the container.

### feature.git-subrepo.json

Installs git-subrepo for managing git subrepositories.

[](src/feature.git-subrepo.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 9 chars: 109 -->

```json
{
  "features": {
    "ghcr.io/pmalacho-mit/devcontainer-features/git-subrepo:latest": {}
  }
}
```

<!-- p↓ END -->

### feature.node-20.json

Installs Node.js 20.x runtime.

[](src/feature.node-20.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 11 chars: 117 -->

```json
{
  "features": {
    "ghcr.io/devcontainers/features/node:latest": {
      "version": "20"
    }
  }
}
```

<!-- p↓ END -->

### feature.poetry.json

Installs Poetry dependency manager for Python projects.

[](src/feature.poetry.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 14 chars: 195 -->

```json
{
  "features": {
    "ghcr.io/devcontainers-extra/features/poetry:latest": {
      "version": "latest"
    }
  },
  "remoteEnv": {
    "POETRY_VIRTUALENVS_IN_PROJECT": "true"
  }
}
```

<!-- p↓ END -->

### feature.postgres.json

Installs PostgreSQL database server.

[](src/feature.postgres.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 9 chars: 113 -->

```json
{
  "features": {
    "ghcr.io/robbert229/devcontainer-features/postgresql-client:latest": {}
  }
}
```

<!-- p↓ END -->

### feature.python-3.12.json

Installs Python 3.12 runtime.

[](src/feature.python-3.12.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 11 chars: 121 -->

```json
{
  "features": {
    "ghcr.io/devcontainers/features/python:latest": {
      "version": "3.12"
    }
  }
}
```

<!-- p↓ END -->

### feature.vim.json

Installs Vim editor.

[](src/feature.vim.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 9 chars: 78 -->

```json
{
  "features": {
    "ghcr.io/guiyomh/features/vim:0": {}
  }
}
```

<!-- p↓ END -->

### feature.xclip.json

Installs xclip for clipboard access in terminal environments.

[](src/feature.xclip.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 12 chars: 136 -->

```json
{
  "features": {
    "ghcr.io/rocker-org/devcontainer-features/apt-packages:1": {
      "packages": "xclip"
    },
  }
}

```

<!-- p↓ END -->

## Images (`image.*.json`)

Base container images for devcontainers.

### image.ubuntu-24.json

Ubuntu 24.04 LTS base image.

[](src/image.ubuntu-24.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 7 chars: 80 -->

```json
{
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu-24.04"
}
```

<!-- p↓ END -->

## Mounts (`mount.*.json`)

Volume mounts that bind local directories into the container.

### mount.ssh.json

Mounts the local SSH config and keys into the container for Git operations and remote access.

> [!IMPORTANT]
> If you're using MacOS, ensure to also include [postCreateCommand.ignore-UseKeychain-in-ssh-config.json](#postcreatecommandignore-usekeychain-in-ssh-configjson) to avoid issues.

[](src/mount.ssh.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 10 chars: 148 -->

```json
{
  "mounts": [
    "source=${localEnv:HOME}${localEnv:USERPROFILE}/.ssh,target=/home/vscode/.ssh,type=bind,consistency=cached"
  ]
}

```

<!-- p↓ END -->

## Post Create Commands (`postCreateCommand.*.json`)

Commands executed automatically after the devcontainer is created, used for setup and configuration.

### postCreateCommand.codeblockify.json

Installs the `codeblockify` utility for converting files into Markdown code blocks.

[](src/postCreateCommand.codeblockify.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 7 chars: 276 -->

```json
{
  "postCreateCommand": "sudo curl -fsSL https://gist.githubusercontent.com/pmalacho-mit/d64caa8e16b0b0fdd5e58cc37a0ce242/raw/8f0f620d4a65f6f3d930ea14e7c2fdf382ef1bf1/codeblockify.sh -o /usr/local/bin/codeblockify && sudo chmod +x /usr/local/bin/codeblockify"
}
```

<!-- p↓ END -->

### postCreateCommand.containersync.json

Installs the `containersync` utility for syncing local devcontainer configs from the remote repository.

[](src/postCreateCommand.containersync.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 7 chars: 218 -->

```json
{
  "postCreateCommand": "sudo curl -fsSL https://raw.githubusercontent.com/pmalacho-mit/devcontainers/main/scripts/sync.sh -o /usr/local/bin/containersync && sudo chmod +x /usr/local/bin/containersync"
}
```

<!-- p↓ END -->

### postCreateCommand.git-config-merge-divergent.json

Configures Git to use rebase by default for merge operations.

[](src/postCreateCommand.git-config-merge-divergent.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 8 chars: 72 -->

```json
{
  "postCreateCommand": "git config pull.rebase false"
}

```

<!-- p↓ END -->

### postCreateCommand.git-config-vim-as-core-editor.json

Configures Vim as the default Git editor.

[](src/postCreateCommand.git-config-vim-as-core-editor.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 8 chars: 81 -->

```json
{
  "postCreateCommand": "git config core.editor '/usr/bin/vim'"
}

```

<!-- p↓ END -->

### postCreateCommand.ignore-UseKeychain-in-ssh-config.json

Adds `IgnoreUnknown UseKeychain` to SSH config for compatibility with non-macOS systems.

Used in tandem with [mount.ssh.json](#mountsshjson).

[](src/postCreateCommand.ignore-UseKeychain-in-ssh-config.json)
<!-- p↓ BEGIN -->
<!-- p↓ length lines: 8 chars: 186 -->

```json
{
  "postCreateCommand": "(grep -q 'IgnoreUnknown UseKeychain' ~/.ssh/config 2>/dev/null || sed -i '/UseKeychain/i IgnoreUnknown UseKeychain' ~/.ssh/config 2>/dev/null)"
}

```

<!-- p↓ END --> 
<!-- p↓ END -->