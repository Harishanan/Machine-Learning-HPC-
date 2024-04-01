# Implementation of Machine Learning Application
A Tkinter-based GUI application that facilitates user registration and login, and offers cryptocurrency price predictions for Bitcoin, Ethereum (ETH), and Binance Coin (BNB). It uses SHA-256 hashing for password security and multithreading to enhance performance during price prediction processes.

The following flow chart has been created to facilitate understanding of the application's usage.

<p align="center">
 <img src="application flowchart.png" alt="Application Flow Chart">
</p>

### Core Functionality

- **Hashing Passwords**: Utilizes the `hashlib` library to securely hash passwords with SHA-256.
- **Storing User Credentials**: Handles file operations to store and retrieve hashed user credentials.
- **User Authentication**: Includes functions to register new users, check for existing users, and authenticate user logins.
- **Cryptocurrency Price Prediction**: Integrates separate modules (`Bitcoin`, `ETH`, `BNB`) to predict cryptocurrency prices, showing the progress through a dedicated progress window.

### GUI Components

- **Registration Interface**: Allows new users to create an account.
- **Login Interface**: Enables existing users to log in using their credentials.
- **Main Prediction Interface**: Displays after successful login, providing options to predict prices of various cryptocurrencies.

### Multithreading

- Employs the `threading` module to run prediction tasks in separate threads, preventing the GUI from freezing during long-running operations.

### Progress Tracking

- Creates a progress window that informs users about the ongoing prediction task.
- Updates the main interface with the time taken for the last prediction once the task is complete.

### Entry Point

- The `main()` function initializes the Tkinter window, maximizes it, and calls the registration interface.

### Usage

#### Starting the Application
To launch the application, navigate to the directory containing the script and execute it. The registration window will appear, prompting new users to create an account.

#### Registering a New User
1. Click on the "Register" button on the main screen.
2. Enter a desired username and password.
3. Confirm the password by entering it again in the "Retype Password" field.
4. Click the "Register" button to create your account.
5. A message will confirm successful registration.

#### Logging in to the Application
1. From the main screen, click on the "Login" button.
2. Enter your username and password.
3. Click the "Login" button.
4. If the credentials are correct, a success message will appear, and you will be taken to the main prediction interface.

#### Predicting Cryptocurrency Prices
1. Once logged in, select the cryptocurrency for which you wish to predict the price.
2. Click the corresponding button, such as "Predict Bitcoin Price."
3. The application will begin processing and a progress bar will appear, indicating the prediction is underway.
4. Wait for the prediction process to complete. The time taken will be displayed at the bottom of the window once the process is finished.
5. Review the plotted prices displayed in the application.

#### Exiting the Application
To exit the application at any time, click the "Exit" button on any screen. This will close the application safely.

Note: All predictions are based on the most recent available data and use advanced machine learning algorithms to forecast future prices. However, the market can be volatile, and predictions should not be used as the sole basis for investment decisions.
