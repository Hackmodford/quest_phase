# Quest Phase

A mobile app that can help you manage the game state of Fantasy Flight's **The Lord of the Rings: The Card Game**.

## Inspiration

The Flutter version of Quest Phase is inspired by the Android App 
[Quest Phase](https://github.com/seastan/lotr-lcg-quest-phase) by Seastan. 
Permission was granted to me to recreate the app in Flutter to support the iOS platform.

## Setup

Quest Phase uses [FVM](https://fvm.app/) to manage flutter versions. 

Install FVM and use `fvm install` to download the correct Flutter sdk for the project. 
Then prepend `fvm` to all flutter commands. For example: `fvm flutter run` instead of `flutter run`.

## How to Build iOS

`fvm flutter build ipa --export-options-plist $PWD/ios/ExportOptions.plist`

## How to Build Android

`fvm flutter build appbundle`
