# SuperEasyLayout

[![CI Status](https://img.shields.io/travis/doil6317/SuperEasyLayout.svg?style=flat)](https://travis-ci.org/doil6317/SuperEasyLayout)
[![Version](https://img.shields.io/cocoapods/v/SuperEasyLayout.svg?style=flat)](https://cocoapods.org/pods/SuperEasyLayout)
[![License](https://img.shields.io/cocoapods/l/SuperEasyLayout.svg?style=flat)](https://cocoapods.org/pods/SuperEasyLayout)
[![Platform](https://img.shields.io/cocoapods/p/SuperEasyLayout.svg?style=flat)](https://cocoapods.org/pods/SuperEasyLayout)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift
let label = UILabel()
let button = UIButton()
view.addSubview(label)
view.addSubview(button)

label.left == view.left + 10.0
label.right <= view.right - 10.0
label.top == view.topMargin + 10.0
label.height == 20.0

button.centerX == view.centerX
button.width == view.width * 0.9
button.top == label.bottom + 20.0
button.height == 44.0
```

## Requirements

## Installation

### Swift package

* File > Swift Packages > Add Package Dependency
* Add https://github.com/doil6317/SuperEasyLayout.git
* Select "Up to Next Major"

### Cocoapods

SuperEasyLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SuperEasyLayout'
```

## Author

doil6317, doil6317@gmail.com

## License

SuperEasyLayout is available under the MIT license. See the LICENSE file for more info.
