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

## Scan a directory

You can start scanning a directory by executing:

`volscan scan [PATH] --output=[OUTPUT]`

This will scan `[PATH]` and output all results, in JSON format, to `[OUTPUT]`. By default it will use a thread pool with
`2 * number_of_cores` threads, but you can customize this. Depending on your disk speed the number of threads can
drastically improve performance:

`volscan scan [PATH] --output=[OUTPUT] --threads=20`

You can also output the results in CSV:

`volscan scan [PATH] --output=[OUTPUT] --format=csv`

```
$ volscan scan ~/ --output=output.json --threads=20
[00:00:15] Files/s: 17324/s | Total: 258734 | Size: 99.01GB | Components: 14291 | Errors: IO=0 Other=36
```

## Stream results

You can stream all files to stdout by executing:

`volscan stream [PATH]`

If you wanted to remove all files in a disk in parallel, you could create a pipeline like:

`volscan stream /my-dir | xargs -d ‘\n’ -L10 -P500`

This would launch up to 500 `rm` processes, each deleting 10 files.

## Inspect results

Once a scan is complete you can inspect the output using:

`volscan parse [OUTPUT]`

For example:

```
$ volscan parse output.json --prefix=/System/
[00:00:02] Total: 580000 | Per sec: 220653/s
+----------------------+---------+----------+-------------+-------------+-------------+
| Prefix               | Files   | Size     | created     | accessed    | modified    |
+----------------------+---------+----------+-------------+-------------+-------------+
| /System/Applications | 57304   | 777.28MB | 2 weeks ago | 2 weeks ago | 2 weeks ago |
| /System/DriverKit    | 55      | 5.09MB   | 2 weeks ago | 2 weeks ago | 2 weeks ago |
| /System/Library      | 292190  | 13.56GB  | 7 hours ago | 1 hour ago  | 7 hours ago |
| /System/Volumes      | 1468296 | 197.93GB | 1 hour ago  | 1 hour ago  | 1 hour ago  |
| /System/iOSSupport   | 13856   | 600.20MB | 2 weeks ago | 2 weeks ago | 2 weeks ago |
+----------------------+---------+----------+-------------+-------------+-------------+
```

You can include more directories with the `--depth` flag, or change the prefix search with `--prefix`.

You can also order the results by `name` (the default), `size` or `files`:

```
$ volscan parse output.json --prefix=/System/ --sort=size
[00:00:02] Total: 580000 | Per sec: 220653/s
+----------------------+---------+----------+-------------+-------------+-------------+
| Prefix               | Files   | Size     | created     | accessed    | modified    |
+----------------------+---------+----------+-------------+-------------+-------------+
| /System/Volumes      | 1468296 | 197.93GB | 2 hours ago | 2 hours ago | 2 hours ago |
| /System/Library      | 292190  | 13.56GB  | 7 hours ago | 2 hours ago | 7 hours ago |
| /System/Applications | 57304   | 777.28MB | 2 weeks ago | 2 weeks ago | 2 weeks ago |
| /System/iOSSupport   | 13856   | 600.20MB | 2 weeks ago | 2 weeks ago | 2 weeks ago |
| /System/DriverKit    | 55      | 5.09MB   | 2 weeks ago | 2 weeks ago | 2 weeks ago |
+----------------------+---------+----------+-------------+-------------+-------------+
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
