!SLIDE center subsection
#Anatomy of a Ruboto project
![](ruboto_anatomy.png)

!SLIDE bullets
#Activity
* Usually one per screen
* Has child Views

!SLIDE
#AndroidManifest.xml
!SLIDE bullets transition=scrollUp
    <application>
        @name, @icon, @label
    <activity>
        <intent-filter>
            <action>
            <category>
    <service>
    <receiver>
    <provider>
!SLIDE transition=scrollUp
    <uses-permission>
        CALL_PHONE
        SEND_SMS
        RECORD_AUDIO
        WRITE_EXTERNAL_STORAGE
        INSTALL_SHORTCUT
        INTERNET
        ACCESS_COARSE_LOCATION
        ACCESS_FINE_LOCATION
        ...

!SLIDE bullets
#Rakefile
* Builds apk, etc.

!SLIDE bullets
#libs/
    jruby-core.jar
    jruby-stdlib.jar

!SLIDE bullets
#res/
!SLIDE bullets
#res/drawable/
* myimage.png
* Reference as: R::drawable::myimage

!SLIDE bullets
#res/layout/
!SLIDE bullets transition=scrollUp
#layoutname.xml
    <!-- A ViewGroup -->
    <LinearLayout
        id="@+id/myUniqueLayoutName"
        orientation="vertical"
    >
        <!-- 1 or more Views -->
        <EditText .../>
        <ScrollView .../>
        <view class="com.example.MyCustomView"/>
    </LinearLayout>
!SLIDE bullets transition=scrollUp
* Reference as:
* find_view_by_id(R::id::myUniqueLayoutName)

!SLIDE bullets
#res/values/
    strings.xml
      <string name="my_string_name">Any Value</string>
        Reference via Java: getResources().getText(R.string.main_title)
        Reference via XML: <application android:label="@string/my_string_name"/>
!SLIDE bullets
#src/com/yourapp/
#YourActivity.java
    @@@java
    onCreate(Bundle priorState)
    onRestart()
    onStart()
    onResume()
    onPause()
    onStop()
    onDestroy()
!SLIDE bullets transition=scrollUp
    @@@java
    package com.my.ruboto;
    import android.os.Bundle;

    public class MyActivity extends org.ruboto.RubotoActivity {
      public void onCreate(android.os.Bundle arg0) {
        try {
          setSplash(
            Class.forName("com.my.ruboto.R$layout")
              .getField("splash")
              .getInt(null)
          );
        } catch (Exception e) {}
        setScriptName("my_activity.rb");
        super.onCreate(arg0);
      }
    }

!SLIDE bullets transition=scrollUp
* Can keep generated onCreate()
* Can inherit most other methods
* Can redefine if you wish
* Can use Ruby callbacks if you wish

!SLIDE bullets
#src/org/ruboto/
* RubotoActivity.java
* RubotoBroadcastReceiver.java
* RubotoService.java

!SLIDE bullets transition=scrollUp
#src/org/ruboto/
* Look, don't touch
* Make subclasses in com.example.yourapp

!SLIDE bullets
#assets/scripts/ruboto.rb
* Require from your script
* Witchcraft!

!SLIDE transition=scrollUp
#&lt;Soapbox&gt;

!SLIDE transition=scrollUp
    @@@ruby
    def ruboto_import_widget
      view_class = java_import "android.widget.#{class_name}"
      RubotoActivity.class_eval "
      def #{(class_name.to_s.gsub(/([A-Z])/) {'_' + $1.downcase})[1..-1]}(params={})
        rv = #{class_name}.new self
        @view_parent.addView(rv) if @view_parent
        rv.configure self, params
        if block_given?
          old_view_parent, @view_parent = @view_parent, rv
          yield 
          @view_parent = old_view_parent
        end
        rv
      end
      "
    end

!SLIDE transition=scrollUp
#Witchcraft! (using ruboto.rb)
    @@@ruby
    ruboto_import_widgets
        :LinearLayout, :TextView
    linear_layout(:orientation => VERTICAL) do
        text_view(
          :text => 'foo',
          :text_size => 14
        )
    end

!SLIDE bullets transition=scrollUp
#Church-sanctioned code (without ruboto.rb)
    @@@ruby
    java_import "android.widget.LinearLayout"
    java_import "android.widget.EditText"
    layout = LinearLayout.new($activity)
    layout.orientation = LinearLayout::VERTICAL
    edit = EditText.new($activity)
    layout.add_view(edit)
    edit.text = 'foo'
    edit.text_size = 14
    self.content_view = layout

!SLIDE transition=scrollUp
#&lt;/Soapbox&gt;

!SLIDE bullets
#assets/scripts/your_script.rb
* def Activity#on_create
* activity.content_view = some_widget
* def Activity#on_create_options_menu(menu)
* def Activity#on_pause
!SLIDE bullets transition=scrollUp
* def Activity#on_save_instance_state(bundle)
* def Activity#on_restore_instance_state(bundle)
* def Activity#on_click(view)
