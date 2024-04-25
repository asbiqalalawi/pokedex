# Pokedex Flutter App

This Flutter app is a Pokedex that allows users to view a list of Pokemon and see details about each Pokemon.

## Features

1. Display a list of Pokemon with pagination.
2. View details of each Pokemon, including its name, image, types, abilities, and stats.
3. Navigate between Pokemon details using next and previous buttons.
4. Clean code implementation using the Bloc state management pattern.
5. Adheres to the CLEAN architecture for folder structure.

## Getting Started

To run this project, follow these steps:

1. Clone this repository to your local machine.
2. Open the project in your preferred IDE or code editor.
3. Run `flutter pub get` to install dependencies.
4. Run the app on an emulator or physical device using `flutter run`.

## Folder Structure

The project follows the following folder structure:

- `lib`
  - `bloc`: Contains Bloc and Cubit classes for state management.
  - `components`: Contains reusable UI components.
  - `const`: Contains constant values used throughout the app.
  - `extensions`: Contains extension methods for built-in Dart types.
  - `models`: Contains data models used in the app.
  - `pages`: Contains UI screens/pages of the app.
  - `routes`: Contains route definitions and navigation logic.
  - `services`: Contains services for handling business logic and API interactions.
  - `style`: Contains stylesheets and themes for consistent UI styling.

## Credits

- Pokemon data is fetched from the [PokeAPI](https://pokeapi.co/).
- Design inspiration from [Figma](https://www.figma.com/file/b7bN8E5lMhR0QUaRDQdyO3/Pok%C3%A9dex-(Community)?type=design&node-id=1017%3A431&mode=design&t=GypvfpZXy3cx8IOi-1).

## Contributors

- [Asbiq Al Alawi](https://github.com/asbiqalalawi)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
