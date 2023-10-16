package com.example.native_code

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*

class MainActivity: FlutterActivity() {
    private val CHANNEL = "NativeChannel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if(call.method=="generateRandomNumber"){
                val number = getRandomNumber();
                result.success(mapOf("RandomNumber" to number));
            }
            // This method is invoked on the main thread.
            // TODO
        }
    }

    /// We call this function and It will get us Random Number!
    private fun getRandomNumber(): Int {
        return Random().nextInt(200); // create instance of Random class
    }


}
