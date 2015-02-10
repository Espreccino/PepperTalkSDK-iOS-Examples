## Pepper Talk Sample App

### Introduction
This is a sample app to demonstrate the iOS SDK for Pepper Talk.

### Steps to Setup & Run Pepper Talk Sample App
#### Download PepperTalkSDK-iOS-Examples
* git clone https://github.com/Espreccino/PepperTalkSDK-iOS-Examples.git

#### Setup With CocoaPods
* PepperTalkSDK-iOS-Examples uses Cocoapods to setup PepperTalkSDK-iOS as dependency.
* If you don't have Cocoapods installed on your system, refer to [Cocoapods Guide](http://guides.cocoapods.org/using/getting-started.html#installation)
* Once cocoapods in installed issue command 'pod install'. This will setup the dependency on PepperTalkSDK-iOS

#### Setup Without Cocoapods
* If you don't want to use Cocoapods follow the Manual section from [PepperTalkSDK-iOS Documentation](https://github.com/Espreccino/PepperTalkSDK-iOS#download-sdk) to download the required files [Dependecies Resources](https://github.com/Espreccino/PepperTalkSDK-iOS/tree/master/Dependencies%20Resources) & [Framework](https://github.com/Espreccino/PepperTalkSDK-iOS/tree/master/PepperTalk.embeddedframework)
* Remove libPods.a from Build Phases->Link binary with libraries section
* Add icucore.dylib in Build Phases->Link binary with libraries section
* Add -ObjC to Build Settings->Other Linker Flags if already not present

#### Run Sample App
* Open PepperTalkExamples.xcworkspace
* Create a plist file called config.plist & add the generated clientId value with clientId as key & generated clientSecret with clientSecret as key in the config.plist file. Add config.plist to the project.
* Build & Run Example-Programmatic project for simulator
* When asked to select user, select User1
* Perform above steps on another machine and this time when asked to select user, select User2
* Thats it! Now User1 & User2 can chat with each other.
