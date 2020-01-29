# Test of rotation and position

SwiftUI aff for testing rotation and GeometryReader.  
The view is rerendered on rotation. Rotation is detected in
```
    func windowScene(_ windowScene: UIWindowScene, didUpdate ...
        device.isPortrait = windowScene.interfaceOrientation.isPortrait
    }
```
and propagated to the view through an ObservabkeObject.

The view uses GeometryReader to get the size of the inner rectangle in order to place a circle at each corner using offset

![](/images/img1.png) ![](/images/img2.png)