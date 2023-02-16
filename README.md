replaceall.sh
-------------

`replaceall.sh` is a command-line script for replacing text in multiple files using either `rg` (ripgrep) and `sed`.

### Prerequisites

This script requires `rg` (version 0.8.0 or later) and `sed` to be installed on your system. To install `rg` on Ubuntu or Debian, you can use the following command:

`sudo apt-get install ripgrep`

To install `rg` on macOS using Homebrew, you can use the following command:

`brew install ripgrep`

### Usage

The syntax for using `replaceall.sh` is as follows:

`./replaceall.sh old_string new_string [options] [glob]`

where:

-   `old_string`: the text to be replaced
-   `new_string`: the replacement text
-   `options` (optional): any additional options to be passed to `rg` and `sed`
-   `glob` (optional): a file glob to limit the files to be processed (defaults to `*`)

#### Options

-   `-h`, `--help`: Show the help message and exit
-   `-w`, `--word-regexp`: Use whole-word matching

### Examples

```shell
# Replace all occurrences of "foo" with "bar" in all files under the current directory
./replaceall.sh foo bar

# Replace all occurrences of "foo" with "bar" in all JavaScript files under the current directory
./replaceall.sh foo bar '**/*.js'

# Replace all occurrences of "foo" with "bar" in all files under the current directory, using whole-word matching
./replaceall.sh foo bar -w
```

### Contributing

Contributions are welcome! If you find a bug or have a feature request, please [open an issue](https://github.com/balazser/replaceall.sh/issues/new). If you'd like to contribute code, please follow these steps:

1.  Fork the repository
2.  Create a new branch (`git checkout -b feature/my-new-feature`)
3.  Make your changes and commit them (`git commit -am 'Add some feature'`)
4.  Push your changes to your fork (`git push origin feature/my-new-feature`)
5.  Create a new pull request

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the [LICENSE](LICENSE) file for details.
