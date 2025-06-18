# Kernel Module Builder

This repository contains a script to automatically build kernel modules for specific balenaOS versions and device types. The builds are automated using GitHub Actions, which compiles the modules and stores them as downloadable artifacts.

## Usage

### Prerequisites
- Ensure you have `wget` and `build-essential` installed on your system.
- Provide the necessary source files in the `src/<model>` directories.

### Building Locally
To build a kernel module locally, run the following command:
```bash
./scripts/build.sh -i src/<model> -o out -v <os_version> -s <slug>
```
Replace <model>, <os_version>, and <slug> with the appropriate values.

### GitHub Actions Workflow

The workflow defined in .github/workflows/build.yml will automatically build the kernel modules for specified models, OS versions, and device types whenever changes are pushed to the main branch or a pull request is created against it.
