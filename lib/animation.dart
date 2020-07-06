import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class animation extends StatefulWidget {
  @override
  _animationState createState() => _animationState();
}

class _animationState extends State<animation> with TickerProviderStateMixin {
  Animation animation, delayedanimation, muchdelayedanimation,furtherdelayedanimation;
  AnimationController _controller;

  String name;
  String email;
  String password;
  @override
  void initState() {
//    Future.delayed(Duration(
//      seconds: 3,
//    ));
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    delayedanimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve:Interval(0.4,1.0,curve: Curves.easeInOut))
    );
    muchdelayedanimation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve:Interval(0.6,1.0,curve: Curves.easeInOut))
    );
    furtherdelayedanimation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: _controller,curve: Interval(0.8,1.0,curve: Curves.easeInOut)
    ));

    animation.addListener(() {
      setState(() {});
    });
    _controller.forward();

    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Align(
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: Center(

                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SizedBox(
                                height: 24,
                              ),
                              //  Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                              TextFormField(
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    filled: true,
                                    icon: Icon(Icons.person),
                                    hintText: "What is your name?",
                                    labelText: "Name *"),
                                onSaved: (String value) {
                                  this.name = value;
                                },
                              ),
                            ],
                          ),
                        ),

                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        delayedanimation.value * width, 0.0, 0.0),
                    child: Center(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //      mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SizedBox(
                                height: 24,
                              ),
                              //  Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                              TextFormField(
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    filled: true,
                                    icon: Icon(Icons.email),
                                    hintText: "What is your email?",
                                    labelText: "Email *"),
                                onSaved: (String value) {
                                  this.email = value;
                                },
                              ),
                            ],
                          ),
                        ),

                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(muchdelayedanimation.value*width, 0.0, 0.0),
                    child: Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 24,
                            ),
                            //  Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                            TextFormField(
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  filled: true,
                                  icon: Icon(Icons.fingerprint),
                                  hintText: "Security Keeper?",
                                  labelText: "Password*"),
                              onSaved: (String value) {
                                this.password = value;
                              },
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            //  Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                            TextFormField(
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  filled: true,
                                  icon: Icon(Icons.mobile_screen_share),
                                  hintText: "How should we contact you?",
                                  labelText: "Number *"),
                              onSaved: (String value) {
                                this.password = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
                  Transform(
                    transform: Matrix4.translationValues(furtherdelayedanimation.value*width, 0.0,0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                             RaisedButton(
                              child: Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF000000)),),
                                 color: Colors.deepOrange,

                               onPressed: (){

                                 },
                             )


                        ],
                      ),
                    )
                  )

                ],
              ),
            ),
          );
        });
  }
}
