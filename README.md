# 🧹 VolScan

```text

__     __        _  ____
\ \   / /  ___  | |/ ___|   ___   __ _  _ __
 \ \ / /  / _ \ | |\___ \  / __| / _` || '_ \
  \ V /  | (_) || | ___) || (__ | (_| || | | |
   \_/    \___/ |_||____/  \___| \__,_||_| |_|

```

🚀 VolScan: High-speed, multi-threaded disk scanner providing detailed directory summaries with JSON/CSV output support.

## ✨ Features

- **⚡ High Performance**: Scans large disks at lightning speed, outperforming traditional tools like `du`, `find`, and `tree`.
- **📊 Detailed Directory Summaries**: Provides per-directory stats, including:
  - Number of files
  - Total size
  - Latest creation, access, and modification times
- **📂 Flexible Output Formats**: Outputs results in easy-to-analyze JSON or CSV formats.
- **🔄 Streaming Output**: Streams results directly to output files, maintaining low and consistent memory usage regardless of disk size.
- **🛠️ Customizable Threads**: Configurable multi-threading support to maximize performance based on your system's resources.
- **🌐 Network Disk Support**: Optimized for inspecting both local and network-mounted disks.
- **🎛️ Built-in Viewer**: Includes a lightweight viewer to analyze JSON/CSV outputs directly.
- **🔍 Precision Scanning**: Handles enormous filesystems while ensuring accuracy and reliability.

Perfect for professionals dealing with massive storage systems or anyone seeking deep insights into disk contents!

## 🚀 Installation

To install **volscan**, simply clone the repository and follow the instructions below:

```bash
git clone git@github.com:trinhminhtriet/volscan.git
cd volscan

cargo build --release
cp ./target/release/volscan /usr/local/bin/
```

Running the below command will globally install the `volscan` binary.

```bash
cargo install volscan
```

Optionally, you can add `~/.cargo/bin` to your PATH if it's not already there

```bash
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 💡 Usage

```sh
USAGE:
    volscan <SUBCOMMAND>

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    help      Prints this message or the help of the given subcommand(s)
    parse     Parse results files
    scan      Scan a directory
    stream    Stream file paths to stdout from a given set of directories

```

## 🗑️ Uninstallation

Running the below command will globally uninstall the `volscan` binary.

```bash
cargo uninstall volscan
```

Remove the project repo

```bash
rm -rf /path/to/git/clone/volscan
```

## 🤝 How to contribute

We welcome contributions!

- Fork this repository;
- Create a branch with your feature: `git checkout -b my-feature`;
- Commit your changes: `git commit -m "feat: my new feature"`;
- Push to your branch: `git push origin my-feature`.

Once your pull request has been merged, you can delete your branch.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
