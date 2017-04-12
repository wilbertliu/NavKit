# NavKit

[![Build Status](https://travis-ci.org/wilbertliu/NavKit.svg?branch=master)](https://travis-ci.org/wilbertliu/NavKit)
[![Coverage Status](https://coveralls.io/repos/github/wilbertliu/NavKit/badge.svg?branch=master)](https://coveralls.io/github/wilbertliu/NavKit?branch=master)

Simple and integrated way to customize navigation bar experience on iOS app.
It should save our time that we usually use to make abstraction of navigation bar,
back button, and so on.

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

### Defining Global Configuration

We usually want a global configuration for our navigation bar experience to maintain
design consistency throughout the app. In order to do that, we should make a class
that conforms to `CustomizableNavigation` protocol. Without further ado, here is an example :

```swift
import Foundation
import NavKit

class MyNavigationConfig: CustomizableNavigation {

    var barBackgroundColor: UIColor = .red
    var isBarTranslucent: Bool = false
    var backImage: UIImage = UIImage(named: "Back")!
    var backTappedAction: ((Any) -> Void)?

}
```

From example above, we just defined a configuration for navigation bar background color,
it's translucency, the back button image, and also whether or not we would have a custom
action when the back button is tapped. When the value of `backTappedAction` property is nil,
the action that would be performed is the standard pop animation. There are other properties that we could define, just make sure to check `CustomizableNavigation` protocol for further usage.

### Consuming Global Configuration

To make it worked, we have to instantiate an object of `NavigationKit` class in *every view controller*, and glue all the things that we have defined above.

```swift
import UIKit
import NavKit

class ViewController: UIViewController {

    // MARK: - Properties

    var navigationKit: NavigationKit!

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        if let navigationController = navigationController {
            navigationKit = NavigationKit(
                customizableNavigation: MyNavigationConfig(),
                navigationController: navigationController,
                navigationItem: navigationItem
            )

            navigationKit.updateNavigation()
        }
    }

}
```

### Customizing Experience on Specific View Controller

In order to customize the navigation bar experience on some specific view controller,
we just have to set a new value to any property that we have defined in a class
that conforms to `CustomizableNavigation` protocol. Here is an example to change
the navigation bar background color and it's behavior when the back button is tapped :

```swift
import UIKit
import NavKit

class ViewController: UIViewController {

    // MARK: - Properties

    var navigationKit: NavigationKit!

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        if let navigationController = navigationController {
            let navigationConfig = MyNavigationConfig()
            navigationConfig.barBackgroundColor = .blue

            navigationConfig.backTappedAction = { [unowned self] sender in
                _ = self.navigationController.popToRootViewController(animated: true)
            }

            navigationKit = NavigationKit(
                customizableNavigation: navigationConfig,
                navigationController: navigationController,
                navigationItem: navigationItem
            )

            navigationKit.updateNavigation()
        }
    }

}
```

## Support

If you have any feedbacks, feel free to submit a PR! And I'm more than happy to answer your
questions, or maybe just some hi?! To do that, shoot me a DM or tweet [@wilbertliu](https://twitter.com/wilbertliu)

## License

MIT © Wilbert Liu
