# Rocket-Astro-Tech
This app will display a list SpaceX's rockets.


### Prerequisites
This app is built using macOS Ventura v13.0.1 and XCode v14.1
This app doesn't use any third party library so it doesn't need to install any additional library.

### Building
You just need to tap on build or run button. Alternatively you can use "Command Button + B" or "Command Button + R" to build or run it.

### Brief Design
Functional Requirements
- As a user, I want to see a list of rockets in the rocket list screen
- As a user, I want to be able to filter the rockets in the rocket list screen
- As a user, I want to be able to see the rocket detail by clicking a rocket in the rocket list screen

Non-Functional Requirements
- Use Space-X API (https://github.com/r-spacex/SpaceX-API) for getting the rocket data.
- UI states (Loading, Fail/Retry, and Success)
- If an error occurred, user can retry by pressing retry button
- Minimum iOS version 13

### Tech Stacks
- SwiftUI
- Combine
- MVVM Pattern



