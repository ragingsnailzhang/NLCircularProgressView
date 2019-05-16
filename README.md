# NLCircularProgressView

[![CI Status](https://img.shields.io/travis/wz_yinglong/NLCircularProgressView.svg?style=flat)](https://travis-ci.org/wz_yinglong/NLCircularProgressView)
[![Version](https://img.shields.io/cocoapods/v/NLCircularProgressView.svg?style=flat)](https://cocoapods.org/pods/NLCircularProgressView)
[![License](https://img.shields.io/cocoapods/l/NLCircularProgressView.svg?style=flat)](https://cocoapods.org/pods/NLCircularProgressView)
[![Platform](https://img.shields.io/cocoapods/p/NLCircularProgressView.svg?style=flat)](https://cocoapods.org/pods/NLCircularProgressView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```
NLCycleView *progressView = [[NLCycleView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
progressView.center = self.view.center;
progressView.fontSize = 10;
progressView.fontColor = [UIColor blackColor];
progressView.strokeColor = [UIColor blueColor];
progressView.progress = 0.0f;
_progressView = progressView;
[self.view addSubview:progressView];
```

## Requirements

## Installation

NLCircularProgressView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NLCircularProgressView'
```

## Author

wzyinglong, wz_yinglong@163.com

## License

NLCircularProgressView is available under the MIT license. See the LICENSE file for more info.
