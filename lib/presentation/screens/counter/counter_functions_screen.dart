import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Counter Functions')),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              'Click${clickCounter == 1 ? '' : 's'}',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            shape: StadiumBorder(),
            icon: Icons.refresh_outlined,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ), 

          SizedBox(height: 10),

          CustomButton(
            shape: StadiumBorder(),
            icon: Icons.exposure_plus_1_outlined,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          ),

          SizedBox(height: 10),

          CustomButton(
            shape: StadiumBorder(),
            icon: Icons.exposure_neg_1_outlined,
            onPressed: () {
              setState(() {
                if(clickCounter > 0){
                  clickCounter--;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;
  final ShapeBorder? shape;


  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.shape = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 10,
      shape: shape,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
