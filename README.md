# Gas Monitor App

A Flutter mobile application developed to monitor gas levels in gas cylinders. This application communicates with an STM32 device physically attached to the gas cylinder, ensuring that users always have accurate and up-to-date data regarding their gas levels.

## Description

The Gas Monitor App is a state-of-the-art solution intended to make gas level monitoring easy and convenient for its users. With the integration of both Bluetooth and 2G technology, users are ensured seamless data transmission regardless of their proximity to the gas cylinder. Here are the key processes detailed:

1. **Local Monitoring through Bluetooth**:
    - The STM32 device reads gas levels directly from the gas cylinder.
    - Through a Bluetooth connection, the device transmits this data directly to the Flutter mobile app, providing users with real-time gas level information.
   
2. **Remote Monitoring with 2G**:
    - For situations where the user might not be in direct proximity to the gas cylinder, the STM32 device utilizes its 2G capability.
    - The device sends the gas level data to a cloud storage system - specifically Firebase.
    - The Flutter mobile app fetches this online data, ensuring users can monitor gas levels remotely.

3. **Data Persistence in Firebase**:
    - To ensure users have a history of their gas consumption and to provide potential analytics in the future, all data sent through 2G is stored persistently in Firebase.
    - This not only serves as a backup for real-time data but also as a foundation for any future features that might require historical data analysis.


## Contribution

If you're interested in contributing to this project, please fork, edit and create a PR.

## License

MIT

