package net.yuzumone.atalantify

import android.app.Activity
import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  companion object {
    private const val CHANNEL_NAME = "net.yuzumone/atalantify"
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, CHANNEL_NAME).setMethodCallHandler { methodCall, result ->
      when (methodCall.method) {
        "getAction" -> result.success(intent.action)
        else -> result.notImplemented()
      }
    }
    if (intent.action == "android.intent.action.CREATE_SHORTCUT") {
      // Use deprecated shortcut creation method as it is intended to be called from NFC Tools
      val shortcutIntent = Intent(Intent.ACTION_VIEW)
              .setClassName(this, "net.yuzumone.atalantify.MainActivity")
              .setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_NEW_TASK)
      val intent = Intent().apply {
        putExtra(Intent.EXTRA_SHORTCUT_INTENT, shortcutIntent)
        action = "com.android.launcher.action.INSTALL_SHORTCUT"
      }
      sendBroadcast(intent)
      this.setResult(Activity.RESULT_OK, intent)
      finish()
    }
  }
}
