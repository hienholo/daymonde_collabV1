import 'package:daymonde_collaboration/components/onboarding/OnboardingContents.dart';
import 'package:daymonde_collaboration/components/onboarding/size_config.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:daymonde_collaboration/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;


  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: primary,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: SizeConfig.blockV! * 35,
                        ),
                        SizedBox(
                          height: (height >= 840) ? 50 : 20,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.justify,
                          style:  GoogleFonts.lato(textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "serif",
                            color: primary,
                            fontSize: (width <= 550) ? 30 : 25,
                            fontStyle: FontStyle.normal,
                          ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        const SizedBox(height: 12),
                        Text(
                          contents[i].desc,
                          style: TextStyle(

                            fontWeight: FontWeight.w300,color: Colors.black,
                            height: 1.2,
                            fontSize: width <= 321 ? 13 : 15,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                          (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> HomeScreen()));
                      },
                      child: const Text("Commencer",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: (width <= 321 )
                            ? const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 14)
                            : EdgeInsets.symmetric(
                            horizontal: width * 0.2, vertical: 14),
                        textStyle:
                        TextStyle(fontSize: (width <= 321) ? 13 : 17),
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:width * 0.3,
                          height: width*0.12,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1,
                                  color: primary
                              ),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),),
                            onPressed: () {
                              _controller.jumpToPage(3);
                            },
                            child: const Text(
                              "Sauter",
                              style: TextStyle(color: primary,fontSize: 14),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          },
                          child: const Text("Suivant",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 0,
                            padding: (width <= 550)
                                ? const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14)
                                : const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 16),
                            textStyle: TextStyle(
                                fontSize: (width <= 550) ? 13 : 17),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}