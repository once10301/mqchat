package com.once10301.mqchat;

import android.content.Context;
import android.content.Intent;

import androidx.annotation.NonNull;

import com.meiqia.meiqiasdk.util.MQConfig;
import com.meiqia.meiqiasdk.util.MQIntentBuilder;

import java.util.HashMap;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** MqchatPlugin */
public class MqchatPlugin implements FlutterPlugin, MethodCallHandler {
  private Context context;
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    this.context = binding.getApplicationContext();
    channel = new MethodChannel(binding.getBinaryMessenger(), "mqchat");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("init")) {
      String appKey = call.arguments.toString();
      MQConfig.init(context, appKey, null);
    } else if (call.method.equals("chat")) {
      HashMap<String, String> clientInfo = (HashMap<String, String>) call.arguments;
      Intent intent = new MQIntentBuilder(context)
              .updateClientInfo(clientInfo)
              .build();
      context.startActivity(intent);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
