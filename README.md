# Delete Derived Data
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/rognick/delete_derived_data/blob/master/LICENSE)
[![Gem](https://img.shields.io/gem/v/delete_derived_data.svg?style=flat)](https://rubygems.org/gems/delete_derived_data)


Search all DerivedData folders and moves files or folders to the trash.

Optional delete Xcode Archives

## Installation
    $ gem install delete_derived_data

## Usage
    $ delete_derived_data

```
Usage: delete_derived_data [options] | delete_derived_data
    -d, --directory PATH             Directory that should be searching
    -a, --archives                   Xcode Archives should be deleted
    -s, --sempty                     Secure empty trash contents
    -t, --trash                      Empty trash contents
    -V, --verbose                    Show more debugging information
    -h, --help                       Show this message
    -v, --version                    Show version
```

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file.

> This project are in no way affiliated with Apple Inc. This project is open source under the MIT license, which means you have full access to the source code and can modify it to fit your own needs. All delete_derived_data tools run on your own computer or server, so your credentials or other sensitive information will never leave your own computer. You are responsible for how you use delete_derived_data tools.
