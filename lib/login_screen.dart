import 'package:flutter/material.dart';
import 'package:tourist_safety_app/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController
  _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isEmailTab = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 60),

                // Logo
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.shield_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),

                const SizedBox(height: 32),

                // Welcome text
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Sign in to your SafeTravel account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 40),

                // Login form container
                Container(
                  padding: const EdgeInsets.all(
                    24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(
                          0,
                          2,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      // Email/Phone tabs
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isEmailTab =
                                      true;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                      vertical:
                                          12,
                                    ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color:
                                          _isEmailTab
                                          ? Colors
                                                .blue
                                          : Colors
                                                .transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                  children: [
                                    Icon(
                                      Icons
                                          .email_outlined,
                                      size: 20,
                                      color:
                                          _isEmailTab
                                          ? Colors
                                                .blue
                                          : Colors
                                                .grey,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                        color:
                                            _isEmailTab
                                            ? Colors.blue
                                            : Colors.grey,
                                        fontWeight:
                                            _isEmailTab
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isEmailTab =
                                      false;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                      vertical:
                                          12,
                                    ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color:
                                          !_isEmailTab
                                          ? Colors
                                                .blue
                                          : Colors
                                                .transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                  children: [
                                    Icon(
                                      Icons
                                          .phone_outlined,
                                      size: 20,
                                      color:
                                          !_isEmailTab
                                          ? Colors
                                                .blue
                                          : Colors
                                                .grey,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Phone',
                                      style: TextStyle(
                                        color:
                                            !_isEmailTab
                                            ? Colors.blue
                                            : Colors.grey,
                                        fontWeight:
                                            !_isEmailTab
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Email Address field
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller:
                            _emailController,
                        keyboardType:
                            TextInputType
                                .emailAddress,
                        decoration: InputDecoration(
                          hintText:
                              'Enter your email',
                          hintStyle: TextStyle(
                            color:
                                Colors.grey[400],
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(
                                  8,
                                ),
                            borderSide:
                                BorderSide(
                                  color: Colors
                                      .grey[300]!,
                                ),
                          ),
                          enabledBorder:
                              OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      8,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors
                                      .grey[300]!,
                                ),
                              ),
                          focusedBorder:
                              OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      8,
                                    ),
                                borderSide:
                                    const BorderSide(
                                      color: Colors
                                          .blue,
                                    ),
                              ),
                          contentPadding:
                              const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Password field
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller:
                            _passwordController,
                        obscureText:
                            !_isPasswordVisible,
                        decoration: InputDecoration(
                          hintText:
                              'Enter your password',
                          hintStyle: TextStyle(
                            color:
                                Colors.grey[400],
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(
                                  8,
                                ),
                            borderSide:
                                BorderSide(
                                  color: Colors
                                      .grey[300]!,
                                ),
                          ),
                          enabledBorder:
                              OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      8,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors
                                      .grey[300]!,
                                ),
                              ),
                          focusedBorder:
                              OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      8,
                                    ),
                                borderSide:
                                    const BorderSide(
                                      color: Colors
                                          .blue,
                                    ),
                              ),
                          contentPadding:
                              const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons
                                        .visibility
                                  : Icons
                                        .visibility_off,
                              color: Colors
                                  .grey[400],
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible =
                                    !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Forgot password
                      Align(
                        alignment:
                            Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Sign in button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MyHomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue,
                            foregroundColor:
                                Colors.white,
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                    8,
                                  ),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // OR divider
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                            child: Text(
                              'or',
                              style: TextStyle(
                                color: Colors
                                    .grey[600],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Google sign in
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Handle Google sign in
                          },
                          icon: Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://developers.google.com/identity/images/g-logo.png',
                                ),
                                fit: BoxFit
                                    .contain,
                              ),
                            ),
                          ),
                          label: const Text(
                            'Continue with Google',
                            style: TextStyle(
                              color:
                                  Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                    8,
                                  ),
                            ),
                            side: BorderSide(
                              color: Colors
                                  .grey[300]!,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Facebook sign in
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Handle Facebook sign in
                          },
                          icon: Icon(
                            Icons.facebook,
                            color:
                                Colors.blue[800],
                            size: 20,
                          ),
                          label: const Text(
                            'Continue with Facebook',
                            style: TextStyle(
                              color:
                                  Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                    8,
                                  ),
                            ),
                            side: BorderSide(
                              color: Colors
                                  .grey[300]!,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
