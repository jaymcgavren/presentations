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
!SLIDE bullets transition=scrollUp
* A UI component
* LinearLayout, Button, TextView...

!SLIDE bullets
#Resources: Drawables
!SLIDE bullets transition=scrollUp
* Bitmap
* PathShape
* etc.

!SLIDE bullets
#Resources: Layouts
!SLIDE bullets transition=scrollUp
* Portrait
* Landscape
* etc.

!SLIDE
#Resources: Values
!SLIDE transition=scrollUp
#Strings
    <string name="app_name">AcidDraw</string>
!SLIDE transition=scrollUp
#Arrays
    <string-array name="planets">
      <item>Earth</item>
      <item>Pluto</item>
    </string-array>
!SLIDE bullets transition=scrollUp
#Styles
* layout_width
* textSize
* typeface
* etc.

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
