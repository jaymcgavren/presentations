!SLIDE center subsection
#Anatomy of an Android app
![](android_anatomy.png)

!SLIDE bullets
#Activity
* Usually one per screen
* Has child Views
* Responsible for setup, teardown, persistence

!SLIDE bullets
#View
* A UI component
* CheckBox, Button, TextView...

!SLIDE bullets
#Resources: Drawables
* Bitmap
* PathShape
* etc.

!SLIDE bullets
#Resources: Layouts
* Portrait
* Landscape
* etc.

!SLIDE
#Resources: Strings
    <string name="app_name">MyApp</string>

!SLIDE bullets
#Service
* A background process - Music player, etc.
* Bind to it, call methods (ex: play(), pause(), etc.)
* Spawn a new thread for lengthy operations.

!SLIDE bullets
#BroadcastReceiver
* Responds to system messages
* (Timezone changed, low battery, picture taken...)
* Can launch Activity, display alert, etc.
* No UI

!SLIDE bullets
#Intent
* Launch or update an Activity or Service
* Send Broadcasts
