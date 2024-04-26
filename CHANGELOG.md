# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.8.2] - 2023-12-24
### Fixed
- Prevent crashing processes due to loading all guest users in memory during delete_old_guest_users task ([#42](https://github.com/cbeer/devise-guests/pull/42)) by [@hackartisan](https://github.com/hackartisan)
- Fix issue with passing batch_size to delete_old_guest_users task ([#52](https://github.com/cbeer/devise-guests/pull/52)) by [@whereismyjetpack](https://github.com/whereismyjetpack)

### Changed
- Update README with better detail around data migration ([#49](https://github.com/cbeer/devise-guests/pull/49)) by [@joshmenden](https://github.com/joshmenden)
- Update supported ruby versions ([#50](https://github.com/cbeer/devise-guests/pull/50)) by [@pacso](https://github.com/pacso)

## [0.8.1] - 2021-10-26
### Changed
- Simplify guest transfer ([#38](https://github.com/cbeer/devise-guests/pull/38))

## [0.8.0] - 2021-10-25
### Added
- Allow setting of custom params on guest model ([#31](https://github.com/cbeer/devise-guests/pull/31)) by [@pacso](https://github.com/pacso)
- Allow deletion of guest records to optionally be skipped ([#32](https://github.com/cbeer/devise-guests/pull/32)) by [@pacso](https://github.com/pacso)

### Changed
- Switch to SecureRandom.uuid for guest_user_unique_suffix ([#28](https://github.com/cbeer/devise-guests/pull/28)) by [@notch8](https://github.com/notch8)
- Update combustion gem ([#29](https://github.com/cbeer/devise-guests/pull/29)) by [@notch8](https://github.com/notch8)

### Fixed
- Defining the logging_in callback when the controller loads ([#34](https://github.com/cbeer/devise-guests/pull/34)) by [@davidkuz](https://github.com/davidkuz)

[Unreleased]: https://github.com/cbeer/devise-guests/compare/v0.8.1...HEAD
[0.8.1]: https://github.com/cbeer/devise-guests/compare/v0.8.0...v0.8.1
[0.8.0]: https://github.com/cbeer/devise-guests/compare/v0.7.0...v0.8.0
