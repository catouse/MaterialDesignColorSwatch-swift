# MaterialDesignColorSwatch-swift
Get awsome color swatch defined in Google Material Design, write in swift and available for OSX and iOS development.

## Installation
Drag and drop `MaterialColor.swift` file into your project

## Usage
```Swift
// Get the UIColor(for iOS, NSColor for OSX) directly
let blue: UIColor = MaterialColor.Blue.primary.hue.color // UIColor for iOS
let blue: NSColor = MaterialColor.Blue.primary.hue.color // NSColor for OSX

// Get color for text
let blue: UIColor = MaterialColor.Blue.primary.hue.text // UIColor for iOS
let blue: NSColor = MaterialColor.Blue.primary.hue.text // NSColor for OSX

```

## More examples
```Swift
// Get the 'Red' color swatch
let redSwatch = MaterialColor.Red

// Get the primary color set of the 'redSwatch'
let primaryColorSet = redSwatch.primary

// Get other color set of the  'redSwatch'
let p50ColorSet = redSwatch.P50
let p70ColorSet = redSwatch.P700
let A200ColorSet = redSwatch.A200
// ...

// Get the accent color from the color set
let p50AccentColor = p50ColorSet.hue

// Get the text color for use the accent color as background
let p50TextColor = p50ColorSet.Text
```

## Requirements
iOS 7+ or OSX 10+

## License
Under [MIT](http://thi.mit-license.org/).

Inspired by [Google design guidelines](http://www.google.com/design/spec/style/color.html) and [MaterialDesignColorsSwift](https://github.com/daktales/MaterialDesignColorsSwift).