import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/screens/detail_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  String name;
  String contactNumber;
  String email;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        contactNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset(
                "assets/icons/drawer.svg",
                height: 15,
                width: 34,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        backgroundColor: currentIndex == 3 ? Color(0xffF7F8FA) : Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.25,
        child: Drawer(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  'About',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Form',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
      body: <Widget>[
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
                'Home Page'
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'About Page'
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildName(),
                  buildPhoneNumber(),
                  buildEmail(),
                  SizedBox(height: 50),
                  RaisedButton(
                    color: Colors.black,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16)
                    ),
                    onPressed: () {
                      if (!formKey.currentState.validate()) {
                        return;
                      }

                      formKey.currentState.save();

                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                        return DetailScreen(
                        name: name,
                        email: email,
                        contactNumber: contactNumber,
                        );
                        }));

                      print(name);
                      print(email);
                      print(contactNumber);

                      //Send to API
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
                'Profile Page'
            ),
          ),
        ),
      ][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0,
        currentIndex: currentIndex,
        onTap: changePage,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/about.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/about.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("About")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/categories.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/categories.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Form")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/user.png')),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x5c000000),
                        offset: Offset(0, 1),
                        blurRadius: 5)
                  ],
                ),
              ),
              title: Text("Profile")),
        ],
      ),
    );
  }
}