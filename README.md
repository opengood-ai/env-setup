# Environment Setup

[![Build](https://github.com/opengood-ai/env-setup/workflows/build/badge.svg)](https://github.com/opengood-ai/env-setup/actions?query=workflow%3Abuild)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/opengood-ai/env-setup/master/LICENSE)

Automated environment setup and configuration for OpenGood computing
environments

## Pre-Requisites

* Access to GitHub with permissions to clone repos
* Familiarity with running commands and scripts from `macOS` Terminal

## Compatibility

Installation is maintained for the recent version(s) of macOS and required
processors:

| Requirement | Version    |
|-------------|------------|
| macOS       | Tahoe 16.x |
| Processor   | Apple Mx   |

---

## Getting Started

* Open **Terminal** and type `git`
* One will be prompted to install the required
  **Command Line Developer Tools**
* Once installed, run the following commands from Terminal:

### Create `workspace` Directory

```bash
mkdir -p ~/workspace
```

### Download Repo

```bash
cd ~/workspace
git clone https://github.com/opengood-ai/env-setup
cd env-setup
```

---

## Workstation Setup

### Supported Packages

#### Base Packages (Core Tools)

* `homebrew` - Package manager for macOS
* `vim` - Text editor
* `bash` - Bash shell (5.0+)
* `bash_it` - Bash framework with themes and plugins
* `git` - Version control system

#### Required Packages (Standard Tools)

* `bats` - Bash Automated Testing System
* `claude_code` - Anthropic's official CLI for Claude
* `dockutil` - Dock management utility
* `gcc` - GNU Compiler Collection
* `google_chrome` - Google Chrome web browser
* `iterm` - Terminal emulator for macOS
* `jq` - JSON processor
* `maccy` - Clipboard manager
* `node` - Node.js runtime
* `os_prefs` - macOS preferences configuration
* `pip` - Python package installer
* `pycharm` - JetBrains IDE for Python
* `python` - Python programming language
* `rectangle` - Window management tool
* `uv` - Fast Python package installer and manager

#### Additional Packages (Optional Tools)

* `docker_compose` - Docker Compose tool for defining multi-container applications
* `docker_desktop` - Docker Desktop container platform
* `gnused` - GNU implementation of sed
* `gradle` - Build automation tool
* `intellij_idea` - JetBrains IDE for Java/Kotlin
* `java` - Java Development Kit
* `jenv` - Java environment manager
* `kafka` - Distributed streaming platform
* `kotlin` - Kotlin programming language
* `ktlint` - Kotlin linter
* `llama_cpp` - C/C++ implementation for running LLMs locally
* `minikube` - Local Kubernetes cluster
* `neo4j_desktop` - Graph database management system
* `ollama` - Run large language models locally
* `postgres` - PostgresSQL database
* `sqlite` - SQLite embedded database

---

### Install Default Tools

```bash
bin/setup-workstation.sh install all
```

**Notes:**

* One will be prompted to enter credentials to grant elevated privileges
  to install packages
* One will be prompted to interactively enter the path to the `Bash 5.0` or
  later shell, as this cannot be automated due to security restrictions in macOS
  requiring root level access to modify `/etc/shells` shells
  configuration file
* For `Git`, one will be prompted for the following information to complete the
  setup of various Git configurations:
    * Git `name`
    * Git `email`
    * GitHub `username`
    * GitHub `access token`
    * GitHub GPG signing key `gpg signing key`
* After `Maacy` and `Rectangle` are installed, one will need to
  open the *System Preferences* and grant them elevated privileges under
  `Security & Privacy > Privacy > Accessibility`

### Install Specific Tools

```bash
bin/setup-workstation.sh install <package>
```

### Uninstall Specific Tools

```bash
bin/setup-workstation.sh uninstall <package>
```

### Uninstall All Tools

```bash
bin/setup-workstation.sh uninstall all
```

---

## Custom Tools

### Install/Update BMad

To install or update BMad-Method framework:

```bash
npx bmad-method install
```

---

## Development

### Run Tests

This project uses BATS (Bash Automated Testing System) for testing.

To run tests:

#### Pre-Requisites

Ensure `bats` is installed:

```bash
bin/setup-workstation.sh install bats
```

#### Run All Tests

```bash
# run commons utility function tests
bats test/commons.bats

# run package management tests
bats test/package.bats
```

#### Test Structure

* `test/commons.bats` - Tests for utility functions in `modules/commons.sh`
* `test/package.bats` - Tests for package management functions
* `test/test-helper.bash` - Test setup and utilities

Tests use `bats-support` and `bats-assert` libraries for enhanced assertions and
output formatting.
