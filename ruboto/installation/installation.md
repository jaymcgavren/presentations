!SLIDE subsection
#Installation

!SLIDE bullets incremental
#No purchase necessary to play!
* Grab the Android SDK (which includes an emulator).
* Get a pre-made Ruboto APK off of GitHub downloads.
* (Links at end).

!SLIDE bullets
#Make an Android Virtual Device
* Fire up the "android" GUI tool from the SDK.
!SLIDE center transition=scrollUp
![](01_create_avd.png)
!SLIDE center transition=scrollUp
![](02_launch_avd.png)

!SLIDE bullets
#Install Ruboto-IRB to the AVD.
* Use the SDK's "adb" debugger tool.
!SLIDE commandline incremental transition=scrollUp
    $ adb install ~/Downloads/IRB-0.2-preview1.apk
    -bash: adb: command not found

!SLIDE commandline incremental
#Oh, and make sure the SDK toolset is on your PATH.
    $ export PATH=$PATH:$HOME/android-sdk-mac_86/tools/
    $ adb install ~/Downloads/IRB-0.2-preview1.apk
!SLIDE center transition=scrollUp
![](03_ruboto_installed.png)
