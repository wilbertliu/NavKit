# NavigationKit

[![Build Status](https://travis-ci.org/wilbertliu/NavigationKit.svg?branch=master)](https://travis-ci.org/wilbertliu/NavigationKit)
[![Coverage Status](https://coveralls.io/repos/github/wilbertliu/NavigationKit/badge.svg?branch=master)](https://coveralls.io/github/wilbertliu/NavigationKit?branch=master)

Simple and integrated way to customize navigation bar experience on our app.
It should save our time that we usually use to make abstraction of navigation bar,
back button, and so on.

## Installation

### CocoaPods

Add the following line into the `Podfile` :

```
pod 'NavigationKit'
```

After that, run the following command :

```
$ pod install
```

## Usage

### Navigation Bar Appearance

In order to define the navigation bar appearance,
we should make a class that conforms to `NavigationConfig` protocol.
Here is an example of defining the navigation bar background color :

```
import Foundation
import NavigationKit

class MyNavigationConfig: NavigationConfig {

    var barBackgroundColor: UIColor {
        return .blue
    }

}
```

There are other properties that we could define. Make sure to check
`NavigationConfig` protocol for further usage.

### Back Button Appearance

To customize the back button appearance, we should make a class that conforms
to `BackConfig` protocol. Here is an example of defining the back button
image and text on it's right :

```
import Foundation
import NavigationKit

class MyBackConfig: BackConfig {

    var backImage: UIImage {
        return UIImage(named: "Back")
    }

    var backText: String {
        return "Back"
    }

}
```

### Back Button Action

If we define the back button experience, by default the user would be directed to the
previous screen when tapping into the button. But sometimes we need to define the custom
behavior on some specific screen. In order to do that, we should make a class that conforms to `BackActionConfig` protocol, or possibly just conform the protocol from the respecting controller's class. Let's say we want to direct user to the "root screen", here is an example :

```
import UIKit
import NavigationKit

class ViewController: UIViewController, BackActionConfig {

    // MARK: - Back Action Config

    func backTappedAction(sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }

}
```

### Gluing Altogether

To make it worked, we have to instantiate an object of `NavigationKit` class in *every view controller*, and glue all the things that we have defined above.

```
import UIKit
import NavigationKit

class ViewController: UIViewController, BackActionConfig {

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        if let navigationController = navigationController {
            let navigationKit = NavigationKit(
                navigationController: navigationController,
                navigationItem: navigationItem
            )

            navigationKit.navigationConfig = MyNavigationConfig()
            navigationKit.backConfig = MyBackConfig()
            navigationKit.backActionConfig = self

            navigationKit.doSetup()
        }
    }

    // MARK: - Back Action Config

    func backTappedAction(sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }

}
```

Note : If you are sure that your project would use a single configuration for your navigation bar, you should consider to put the instantiation above into an *extension*. Thus, you just have to call the method on your *extension* in every controller. Hence, makes your code simpler.

## Support

If you have any feedbacks, feel free to submit a PR! And I'm more than happy to answer your
questions, or maybe just some hi?! To do that, shoot me a DM or tweet [@wilbertliu](https://twitter.com/wilbertliu)

## License

MIT © Wilbert Liu
