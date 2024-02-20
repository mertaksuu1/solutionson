import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name - Surname'),
          TextFormField(
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name and surname cannot be left blank!';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          Text('Email'),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email cannot be left blank!';
              } else if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                  .hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          Text('Phone Number'),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please type your phone number!';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          Text('Password'),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please type a password!';
              }
              return null;
            },
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Form doğrulandı, kayıt işlemleri burada yapılır.
                String name = _nameController.text;
                String email = _emailController.text;
                String phone = _phoneController.text;
                String password = _passwordController.text;

                // Kayıt işlemleri burada yapılır.
                // Örneğin: registerUser(name, email, phone, password);

                // Kayıt işlemi başarılıysa sayfadan çıkılır.
                Navigator.pop(context);
              }
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
