# NeuralSriYantra

A mock implementation of the NeuralSriYantra MindMonitor-style app built with Flutter.

## Firebase setup

1. Create a Firebase project named `NeuralSriYantra` with ID `neuralsriyantra`.
2. Enable Authentication providers for Apple, Google, and Email/Password.
3. Add an iOS app and include the downloaded `GoogleService-Info.plist` in `Runner`.
4. Create a `.env` file (not committed) with:
```
FIREBASE_PROJECT_ID=neuralsriyantra
FIREBASE_PROJECT_NUMBER=794690406543
FIREBASE_WEB_API_KEY=AIzaSyB1vwPqGjzLMMjrIiXIxWGN7f6usvbw3Qc
```

## Running with mock BLE

The app uses `MockBleService` by default which generates synthetic Muse data.
No hardware is required to run.

## iOS permissions

Add the following to `Info.plist`:
- `NSBluetoothAlwaysUsageDescription`
- `NSBluetoothPeripheralUsageDescription`

## Muse UUIDs

See `muse_uuids.dart` for placeholder UUIDs that must be filled in with real values when implementing real BLE support.

## Cloud streaming

`CloudRepository` contains a no-op implementation. A toggle to enable streaming is present in settings but disabled by default. Replace the repository with a real implementation in the future.
