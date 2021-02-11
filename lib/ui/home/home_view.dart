import 'package:atalantify/ui/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    context.read(homeViewModelProvider).getAction();
    final action =
        useProvider(homeViewModelProvider.select((value) => value.action));
    if (action == 'android.intent.action.VIEW') {
      final result = useProvider(
          homeViewModelProvider.select((value) => value.transferResult));
      if (result == null) {
        context.read(homeViewModelProvider).transferPlayback();
      } else {
        if (result == true) {
          Fluttertoast.showToast(msg: 'Spotify connnect transfer success');
        } else {
          Fluttertoast.showToast(msg: 'Spotify connnect transfer failed');
        }
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
      return Container();
    } else {
      context.read(homeViewModelProvider).getDevices();
      return Scaffold(
        appBar: AppBar(
          title: const Text('atalantify'),
        ),
        body: HookBuilder(builder: (context) {
          final devices = useProvider(
              homeViewModelProvider.select((value) => value.devices));
          return Container(
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (BuildContext context, int index) {
                var device = devices[index];
                return ListTile(
                  title: Text(device.name),
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: 'Set transfer device: ${device.name}');
                    context
                        .read(homeViewModelProvider)
                        .storeDeviceId(device.id);
                  },
                );
              },
            ),
          );
        }),
      );
    }
  }
}
