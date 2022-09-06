package dev.emir.imei_getter

import android.content.Context
import android.content.Context.ALARM_SERVICE
import android.content.Context.TELEPHONY_SERVICE
import android.content.res.Resources
import android.os.Build
import android.telephony.TelephonyManager
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat.getSystemService
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*


/** ImeiGetterPlugin */
class ImeiGetterPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "imei_getter")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext;
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "getImei" -> {
                return try {
                    result.success(getImei());
                } catch (e: Exception) {
                    result.error("500", "Unhandled Exception", e.message);
                }
            }
            "getLanguage" -> {
                return result.success(Locale.getDefault().toString());
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    private fun getImei(): String? {
        var telephonyManager =
            context.getSystemService(TELEPHONY_SERVICE) as TelephonyManager

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            return telephonyManager.getImei(0);
        }

        throw Exception("The sdk version is not supported");

    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
