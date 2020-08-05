// Flutter code sample for RaisedButton

// This sample shows how to render a disabled RaisedButton, an enabled RaisedButton





import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() => runApp(MyApp());

class User {
  final String nos;

  const User(
    {
    this.nos,
    }
  );
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'GPA CALCULATOR';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
   
        children: <Widget>[
        
               const Text.rich(
  TextSpan(
     // default text style
     children: <TextSpan>[
      
      TextSpan(text: 'Click You Want To Calculate', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
    ],
  ),
),
    const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CGPARoute()),
            );
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('CGPA', style: TextStyle(fontSize: 30)),
            ),
          ),
          const SizedBox(height: 30),
           RaisedButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SGPARoute()),
            );
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('SGPA', style: TextStyle(fontSize: 30)),
            ),
          ),
        ],
      ),
    );
  }
}
class CGPARoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CGPA"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class SGPARoute extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
        appBar: AppBar(
        title: Text("SGPA"),
      ),
      
     body: Center(
       
       child: Form(
    key: _formKey,
   
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: <Widget>[
        TextFormField(
          
          keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
    ],
          decoration: const InputDecoration(
            
            hintText: 'Enter Number of Subjects',
          
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please Enter Number';
            }
            var numValue = int.tryParse(value);
            if(numValue<1)
            {
              return 'Please Enter Valid Number';
            }
            
            return null;
            
            
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 140.0,vertical: 16.0),
          
          child: RaisedButton(
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              
              if (_formKey.currentState.validate()) {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new SGPACal(),
                  );
                  Navigator.of(context).push(route);
     
              }
     
            },
            child: Text('Submit'),
            textColor: Colors.white,
            color: Colors.lightBlue,
          ),
          
         
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 140.0,vertical: 16.0),
          
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
            textColor: Colors.white,
            color: Colors.black,
          ),
          
         
        ),
      ],
    ),
  ),
  ),

  );
  }
}

class SGPACal extends StatefulWidget {
  final User value;

  SGPACal({Key key, this.value}) : super(key: key);

  @override
  _SGPACalState createState() => _SGPACalState();
}

class _SGPACalState extends State<SGPACal> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('SGPACal')),
      body: new Container(
         child: new Center(
            child: Column(
              children: <Widget>[
        
                Padding(
                  child: new Text(
                    'Number Of Subjects: ${widget.value.nos}',
                     style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                    ),
                  padding: EdgeInsets.all(10.0),
                ),
                 


                 ],   
                 
                 ),
        ),
      ),
       
    );

  }
}