# NavKit

[![Build Status](https://travis-ci.org/wilbertliu/NavKit.svg?branch=master)](https://travis-ci.org/wilbertliu/NavKit)
[![Coverage Status](https://coveralls.io/repos/github/wilbertliu/NavKit/badge.svg?branch=master)](https://coveralls.io/github/wilbertliu/NavKit?branch=master)

Simple and integrated way to customize navigation bar experience on iOS app.
It should save our time that we usually use to make abstraction of navigation bar,
back button, and so on.

## Demo

![Blink Navigation Bar](Resources/Blink%20Navigation%20Bar.gif)
![Navigation Bar with Color](Resources/Navigation%20Bar%20with%20Color.png)
![Transition Navigation Bar](Resources/Transition%20Navigation%20Bar.gif)

## Installation

### CocoaPods

Add the following line into the `Podfile` :

```
pod 'NavKit'
```

After that, run the following command :

```
$ pod install
```

## Usage

Since the release of version `0.4`, NavKit has a huge redesign of its API. It makes the switch
of the mindset to the view controller's based navigation configuration, which means
we don't need additional layer to configure the navigation experience.

There are only 3 things to do in order to use NavKit :
1. Conforms to protocol `CustomizableNavigation` **and** `UIGestureRecognizerDelegate`.
2. Define the properties that we need to customize the navigation bar like `barBackgroundColor`, `backImage`, etc.
3. Call `self.updateNavigation()` wherever in view controller to update the navigation bar based on the defined properties.

## Global Style

There's a time when we want to make a general style because it would be used by most of the
screens. What we have to do is just make a protocol extension of `CustomizableNavigation`
and define the properties that we want to make as global. And of course, if you override
the properties on some controller, NavKit would use what's defined at controller instead.
Can we jump into some codes to show?

```swift
import Foundation
import NavKit

extension CustomizableNavigation where Self: UIViewController, Self: UIGestureRecognizerDelegate {
    var titleColor: UIColor { return .red }
    var titleFont: UIFont { return UIFont.systemFont(ofSize: 16, weight: UIFontWeightMedium) }
    var backImage: UIImage? { return UIImage(named: "something") }
}
```

## Example

Note that this section is taken from `Example` project. Make sure to check it to add some knowledge on how to use NavKit.

```swift
import UIKit
import NavKit

class DetailViewController: UIViewController, CustomizableNavigation, UIGestureRecognizerDelegate {
    // MARK: - Navigation Config

    var barBackgroundColor: UIColor = UIColor.blue.withAlphaComponent(0.5)
    var backText: String? = "<-- Go back"

    // MARK: - Life Cycles

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
        self.updateNavigation()
    }
}
```

## Support

Have any feedbacks? Feel free to submit a PR! And I'm more than happy to answer questions, or maybe just some hi?! To do that, shoot me a DM or tweet [@wilbertliu](https://twitter.com/wilbertliu)

## License

MIT © Wilbert Liu
