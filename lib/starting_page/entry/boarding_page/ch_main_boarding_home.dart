import 'package:flutter/material.dart';
import 'package:projectedu/starting_page/diversion/ch_routefile.dart';
import 'package:projectedu/starting_page/entry/boarding_page/ch_boarding.dart';
import 'package:projectedu/starting_page/entry/boarding_page/ch_boarding_one.dart';
import 'package:projectedu/starting_page/entry/boarding_page/ch_boarding_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EntryScreenMain extends StatefulWidget {
  const EntryScreenMain({super.key});

  @override
  State<EntryScreenMain> createState() => _EntryScreenMainState();
}

class _EntryScreenMainState extends State<EntryScreenMain> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: const [
            RetroOne(),
            RetroThird(),
            RetroSecond(),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //skip

              GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    'SKIP',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 72, 118)),
                  )),

              //dot indicator

              SmoothPageIndicator(controller: _controller, count: 3),

              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const RoutePage();
                          }),
                        );
                      },
                      child: const Text(
                        'DONE',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
            ],
          ),
        ),
      ],
    ));
  }
}
