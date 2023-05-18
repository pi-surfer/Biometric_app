import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// SEE SECOND ELEVATED BUTTON BELOW
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routename = 'Profilepage';

  @override
  State createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    TextEditingController names = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        title: Text('Hello Bob!', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Icon(Icons.account_circle),
        actions: [
            const Icon(Icons.access_time)
      ],
        automaticallyImplyLeading: false, // per tornare indietro con la navigazione
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 130, 204, 34),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                  padding: EdgeInsets.only(top:20),
                  child: Stack(
                    children:[ 
                      Container(
                        margin: EdgeInsets.only(top:80),
                        width: 400,
                        height: 475,
                        //width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(114, 255, 236, 66),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft:Radius.circular(40),
                            bottomRight:Radius.circular(40) 
                          )
                        ),
                        child: Column(
                          children: [    
                            Container(
                              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: names,
                                    decoration: InputDecoration(
                                      labelText: 'Names',
                                      prefixIcon: Icon(Icons.person),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  TextField(
                                    controller: names,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      prefixIcon: Icon(Icons.people),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  TextField(
                                    controller: names,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Icon(Icons.email),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  TextField(
                                    controller: names,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.password),
                                      border: myInputBorder(),
                                      enabledBorder: myInputBorder(),
                                      focusedBorder: myFocusBorder()
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  ElevatedButton(onPressed: () {}, 
                                  child: Text('Update'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 130, 204, 34),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 20),
                                      textStyle: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold)
                                  ),
                                  ),
                                  
                            
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Image.asset('assets/images/avatar_Carciofo.jpg', width: 150, height: 150, fit: BoxFit.cover)
                            ),
                          Positioned(
                            bottom: 5,
                            right: 15.5,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                              child: Icon(Icons.edit, size: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                    ]
                  ),
                ),

                // pensavo di rimandare alla pagina progetti o di mettere un expansion tile ma non riesco a farlo
                SizedBox(height: 15),
                ElevatedButton(onPressed: () {},
                  child: Text('Stai sostenendo: ... ', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(114, 255, 236, 66),
                  padding: EdgeInsets.symmetric(
                  horizontal: 25, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold)
                  )
                )
          ],
        ),
            
      ), 
          backgroundColor: Colors.white
    );
  }
  OutlineInputBorder myInputBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.black,
        width: 3,
      )
      );
  }
  OutlineInputBorder myFocusBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 3,
      )
      );
  }
}