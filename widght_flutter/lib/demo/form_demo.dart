import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('formDemo'),
        elevation: 0.0,
      ),
      body: Theme(
        data: ThemeData(primaryColor: Colors.blue),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[RegisterForm()],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;
  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('username:$username');
      debugPrint('password:$password');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('注册中...'),
      ));
    } else {
      setState(() {
         autovalidate = true;
      });
    }
  }

  String validateUserName(value) {
    if (value.isEmpty) {
      return '用户名不能为空';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'UserName',
              helperText: '',
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validateUserName,
            autovalidate: autovalidate, //自动验证
          ),
          TextFormField(
            obscureText: true, //密文
            decoration: InputDecoration(labelText: 'Password'),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  final Widget child;

  TextFieldDemo({Key key, this.child}) : super(key: key);

  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    // textEditingController.text='hi';
    textEditingController.addListener(() {
      debugPrint('input : ${textEditingController.text}');
    });
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      // onChanged: (value){
      //   debugPrint('input $value');
      // },
      controller: textEditingController,
      // onSubmitted: (value){
      //   debugPrint('submit $value');
      // },
      decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: 'title',
          hintText: '提示',
          // border: InputBorder.none,
          // border: OutlineInputBorder()
          filled: true),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).primaryColor);
  }
}
