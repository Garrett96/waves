import 'package:flutter/material.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Perseids',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Perseids Customer App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _pay() {
    InAppPayments.setSquareApplicationId('sq0idp-s706WIQMJ6bMrn3ItQWW6w');
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _cardNonceRequestSuccess,
      onCardEntryCancel: _cardEntryCancel,
    );

  }

  void _cardEntryCancel() {
    //cancelled card entry
  }

  void _cardNonceRequestSuccess(CardDetails result){
    print(result.nonce);

    InAppPayments.completeCardEntry(onCardEntryComplete: 
    _cardEntryComplete,
    );
  }

  void _cardEntryComplete() {
    // Success
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Get Drone Delivery:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pay,
        tooltip: 'Payment',
        child: Icon(Icons.payment_rounded),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.indigo,
        child: Container(height: 50.0),
        ),    
      floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
    );
  }
}