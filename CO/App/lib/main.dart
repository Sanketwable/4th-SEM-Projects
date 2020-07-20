import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Distancing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  TextEditingController controllerpassword = TextEditingController();

  TextEditingController controlleremail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 15, 20, 1),
      appBar: AppBar(
        title: Text("Social Distancing"),
        centerTitle: true,
        elevation: 300,
        backgroundColor: Color.fromRGBO(0, 0, 0, 1.0),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "\nComputer Organisation Project\n",
                textScaleFactor: 1.5,
                style: TextStyle(
                    color: Color.fromRGBO(135, 206, 235, 1.0),
                    fontWeight: FontWeight.bold),
              ),
              Image(
                image: AssetImage('assets/nith.png'),
                width: 200,
                height: 200,
              ),
              // Text("\nConnect the Camera\n\n", textScaleFactor: 1.2, style: TextStyle(color: Color.fromRGBO(	33, 166, 248, 1.0), fontWeight: FontWeight.bold),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\n\n🇮🇳\t\t\tMade By\t\t\t🇮🇳\n",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Color.fromRGBO(33, 166, 248, 1.0),
                        fontWeight: FontWeight.bold),
                  ),
                  FlatButton(
                    onPressed: null,
                    child: Text(
                      "Avinash Yadav (185058)",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                          color: Color.fromRGBO(210, 210, 210, 1.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    onPressed: null,
                    child: Text(
                      "Sachin Wattamwar (185070)",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                          color: Color.fromRGBO(210, 210, 210, 1.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    onPressed: null,
                    child: Text(
                      "Wable Sanket (185088)\n",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                          color: Color.fromRGBO(210, 210, 210, 1.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  RaisedButton(
                    color: Color.fromRGBO(23, 156, 238, 1),
                    colorBrightness: Brightness.light,
                    child: Text("Proceed to Connnect"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MessagePage(),
                      ));
                    },
                  ),
                  FlatButton(
                    onPressed: null,
                    child: Text(
                      "\n-----------Under the Guidance of----------- \n \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tProf xyz",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                          color: Color.fromRGBO(210, 210, 210, 1.0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  //Set<Message> messages;

  @override
  void initState() {
    super.initState();
    //messages = Set();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connect to Camera"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "\n\n\nEnter the IP address of the camera you want to connect:",
                textScaleFactor: 1.1,
                style: TextStyle(
                    color: Color.fromRGBO(10, 10, 10, 1.0),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 120.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'IP', labelText: 'Enter IP for camera'),
                  ),
                  Text("\n"),
                  RaisedButton(
                    child: Text("Submit IP"),
                    onPressed: () {
                      LoginComplete();
                    },
                  ),
                ],
              ),
            ),
            /* Flexible(
              child: StreamBuilder<Message>(
                  stream: widget.service.recieveMessage(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    messages.add(snapshot.data);

                    return ListView(
                      children: messages
                          .map((msg) => ListTile(
                                leading: Text(msg.id.substring(0, 4)),
                                title: Text(msg.content),
                                subtitle: Text(msg.timestamp),
                              ))
                          .toList(),
                    );
                  }),
            ),*/
          ],
        ),
      ),
    );
  }
}

class LoginComplete extends StatefulWidget {
  @override
  _LoginCompleteState createState() => _LoginCompleteState();
}

class _LoginCompleteState extends State<LoginComplete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Login successfull "),
    );
  }
}
