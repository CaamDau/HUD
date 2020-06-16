
<p>
  <img src="https://github.com/liucaide/Images/blob/master/CaamDau/caamdau.png" align=centre />
</p>

[![CI Status](https://img.shields.io/travis/CaamDau/HUD.svg?style=flat)](https://travis-ci.org/CaamDau/HUD)
[![Version](https://img.shields.io/cocoapods/v/CaamDauHUD.svg?style=flat)](https://cocoapods.org/pods/CaamDauHUD)
[![License](https://img.shields.io/cocoapods/l/CaamDauHUD.svg?style=flat)](https://cocoapods.org/pods/CaamDauHUD)
[![Platform](https://img.shields.io/cocoapods/p/CaamDauHUD.svg?style=flat)](https://cocoapods.org/pods/CaamDauHUD)
[![](https://img.shields.io/badge/Swift-4.0~5.0-orange.svg?style=flat)](https://cocoapods.org/pods/CaamDauHUD)


# HUD 提示窗

## Installation

CaamDau is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CaamDauHUD'

pod 'CaamDau/HUD'
```
<p>
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud10.png" width="20%" />
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud11.png" width="20%" />
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud12.png" width="20%" />
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud13.png" width="20%" />
</p>

<p>
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud14.png" width="20%" />
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud1.png" width="20%" />
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud2.png" width="20%" />
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud3.png" width="20%" />
</p>

<p>
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud15.png" width="20%" />
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud20.png" width="20%" />
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud21.png" width="20%" />
  <img src="https://github.com/liucaide/Images/blob/master/CD/hud22.png" width="20%" />
</p>

## Usage
```ruby

hud = HUD().show(with:view, style:style, title: title, detail: detail, model: model)
hud.remove()

HUD.show(with:view, style:style, title: title, detail: detail, model: model)
HUD.remove(for:view)
```

```ruby

CD.window?.cd.hud(.text, title:"HUD")

CD.window?.cd.hud(.loading(.activity), title: "HUD", detail: "Detail").hud_remove(10)

CD.window?.cd.hud(.loading(.images(images,0.3,0)), title: "HUD", detail: "Detail").hud_remove(10)

```

- 友情链接 [SwiftMessages](https://github.com/SwiftKickMobile/SwiftMessages)

## Author

liucaide, 565726319@qq.com

## License

CaamDau is available under the MIT license. See the LICENSE file for more info.
