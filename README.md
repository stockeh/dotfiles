# dotfiles

My personal macOS setup.

## Setup

1. Manually download and install each app listed in [`applications.txt`](./applications.txt).
2. Open Ghostty and run:

   ```sh
   mkdir -p ~/Development/stockeh
   cd ~/Development/stockeh
   git clone https://github.com/stockeh/dotfiles.git
   cd dotfiles
   ./setup.sh
   ```

The setup is a thin wrapper that runs the scripts in [`scripts/`](./scripts/). More will be added over time.
