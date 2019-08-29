# iOS-TwillioVideoCallDemo
The respository contains a source code illustrating how to create a VideoCalling application

## Code Configurations
1. Download or clone the respository.
2. Under the file `ViewController.swift`, you can find two `accessToken` variables. These two tokens are meant for two different devices.
3. Go to [Twillio Console](https://www.twilio.com/console). Create a new project and enable service `Programmable Video` for the project.
4. After enabling Programmable Video feature, go to the camera icon as shown below:

![Twillio Console](https://github.com/manish-1612/iOS-TwillioVideoCallDemo/blob/master/Resources/ImageTwillioConsole.png)

5. Under the `Tools -> Testing Tools` section generate two different access tokens by using two different `CLIENT IDENTITY` but same `Room Name`. Make sure the room name used in Twillio Console is same as the one used in `ViewController.swift` file
6. After generating the access tokens, replace the existing access tokens with the new ones, and create build in two different devices by using different access token for each device. 
7. Through one device, click on `Create Room` button and after 5 - 6 seconds on other device click the `Join Room` button.


**NOTE** : The access token expires almost in every 2 hours. So make sure to be fast while creating the access tokens.
