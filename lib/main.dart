import 'package:atalantify/api/client.dart';
import 'package:atalantify/model/_model.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';

import 'api/auth.dart';
import 'model/token.dart';
import 'utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _StatefulProvider(
        child: _HomePage(),
      ),
    );
  }
}

class _StatefulProvider extends StatefulWidget {
  const _StatefulProvider({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _StatefulProviderState createState() => _StatefulProviderState();
}

class _StatefulProviderState extends State<_StatefulProvider> {
  CurrentlyPlaying _playing;
  Token _token;

  @override
  void initState() {
    super.initState();
    _initToken();
    _initAppShortcuts();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _playing,
      child: Provider.value(
        value: this,
        child: widget.child,
      ),
    );
  }

  Future<void> _initToken() async {
    getKey().then((key) {
      var clientId = key['client_id'];
      var clientSecret = key['client_secret'];
      getToken().then((token) {
        if (token == null) {
          authSpotify(clientId, clientSecret).then((apiToken) {
            _token = apiToken;
            setToken(apiToken);
            updateCurrentPlaying();
          });
        } else {
          refreshToken(clientId, clientSecret, token).then((apiToken) {
            _token = apiToken;
            setToken(apiToken);
            updateCurrentPlaying();
          });
        }
      });
    });
  }

  _initAppShortcuts() {
    final QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == 'action_share') {
        _initToken().then((_) {
          if (_playing != null) {
            Share.share(_playing.item.externalUrls['spotify']);
          }
        });
      }
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'action_share', localizedTitle: 'なうぷれ', icon: 'share'),
    ]);
  }

  updateCurrentPlaying() {
    var client = SpotifyClient(_token);
    client.getCurrentlyPlaying().then((playing) {
      setState(() => _playing = playing);
    });
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('atalantify'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const _PlayingButton(),
      ),
    );
  }
}

class _PlayingButton extends StatelessWidget {
  const _PlayingButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _playing = Provider.of<CurrentlyPlaying>(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          child: Text('Share track'),
          onPressed: () {
            Provider.of<_StatefulProviderState>(context, listen: false)
                .updateCurrentPlaying();
            if (_playing != null) {
              Share.share(_playing.item.externalUrls['spotify']);
            }
          },
        ),
        RaisedButton(
          child: Text('Open Album'),
          onPressed: () {
            Provider.of<_StatefulProviderState>(context, listen: false)
                .updateCurrentPlaying();
            if (_playing != null) {
              launchURL(_playing.item.album.externalUrls['spotify']);
            }
          },
        ),
        RaisedButton(
          child: Text('Open Artist'),
          onPressed: () {
            Provider.of<_StatefulProviderState>(context, listen: false)
                .updateCurrentPlaying();
            if (_playing != null) {
              launchURL(_playing.item.artists.first.externalUrls['spotify']);
            }
          },
        ),
      ],
    );
  }
}
