# Measurements App

A versatile unit conversion app for both **macOS** and **iOS**. It provides conversions for three major categories: **Temperature**, **Length**, and **Time**. Users can easily convert between different units of measurement with an intuitive interface. The app supports both macOS and iOS platforms, making it a cross-device solution for measurement conversions.

## Features

- **Temperature Conversion**: Convert between **Celsius** and **Fahrenheit**.
- **Length Conversion**: Convert between **Kilometers (KM)**, **Meters (M)**, **Centimeters (CM)**, and **Millimeters (MM)**.
- **Time Conversion**: Convert between **Hours (Hrs)**, **Minutes (Mins)**, **Seconds (Sec)**, and **Days**.

## Platforms

- **macOS**
- **iOS**

## Installation

### For iOS

1. Clone the repository or download the source code.
2. Open the project in **Xcode**.
3. Build and run the app on your desired iOS device or simulator.

### For macOS

1. Clone the repository or download the source code.
2. Open the project in **Xcode**.
3. Build and run the app on your macOS machine.

## Usage

1. **Launch the app**: Open the app on either macOS or iOS.
2. **Choose Conversion Type**: Use the picker to select the measurement type (Temperature, Length, or Time).
3. **Enter Input Value**: Type the value to convert in the text field.
4. **Choose Input and Output Units**: Select the input unit (e.g., Celsius, KM, Hrs) and the output unit (e.g., Fahrenheit, M, Mins).
5. **View Results**: The converted result will appear in the designated output section.

### Example

- **Temperature Conversion**: Convert **Celsius** to **Fahrenheit** and vice versa.
- **Length Conversion**: Convert **KM** to **M**, **M** to **CM**, and so on.
- **Time Conversion**: Convert **Days** to **Hrs**, **Mins**, and **Sec**.

## Code Overview

The app is written in **SwiftUI** and follows a simple yet effective layout. It uses **@State** and **@FocusState** for managing dynamic user inputs and focus handling. Based on the user's selection, the app provides real-time conversions, making it easy to switch between different units.

### Key Components:

- **Picker**: Used to select the conversion type and units (Temperature, Length, Time).
- **TextField**: Input field for the user to enter the value to be converted.
- **Switch Statements**: Handle different conversion logic based on the selected units.
- **FocusState**: Manages the focus state of the input field to ensure smooth user experience when interacting with the keyboard.


## Contributions

Feel free to contribute to the project by submitting issues or pull requests. If you have ideas for new features or enhancements, open an issue and let us know!

