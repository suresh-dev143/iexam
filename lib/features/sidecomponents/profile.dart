import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/auth/view/widgets/gradiant_btn.dart';
import 'dart:io';

import 'package:iexam/features/sidecomponents/profile/view/widgets/profilefields.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  // For profile image
  File? _profileImage;
  bool _isUploading = false;
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  // State selection
  String _selectedState = 'Select your state';
  final List<String> indianStates = [
    "Select your state",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman & Nicobar",
    "Chandigarh",
    "Dadra & Nagar Haveli and Daman & Diu",
    "Lakshadweep",
    "Delhi",
    "Puducherry",
    "Ladakh",
    "Jammu & Kashmir"
  ];

  // Date of birth
  // DateTime _selectedDate = DateTime(2000, 1, 1);

  @override
  void initState() {
    super.initState();
    // Initialize with user's data if available
    _nameController.text = "John Doe";
    _emailController.text = "john.doe@example.com";
    _phoneController.text = "+1 234 567 8900";
    _bioController.text =
        "Flutter developer passionate about creating beautiful UIs";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  Future<void> saveChanges() async {
    print('chal gya re');
    if (_nameController.text.isEmpty || _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
      ),
    );
    setState(() {
      _isEditing = false;
    });

    // Navigate back
    // Navigator.pop(context);
  }

  // Method to pick image
  Future<void> _pickImage() async {
    // This would normally use image_picker package
    // For now, we'll just simulate the image selection
    setState(() {
      _isUploading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isUploading = false;
      // In a real app, _profileImage would be set to the selected image
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile picture updated!'),
        backgroundColor: Colors.green,
      ),
    );
    setState(() {
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Pallete.blueDarkColor,
      appBar: AppBar(
        backgroundColor: Pallete.blueDarkColor,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.save : Icons.edit,
              color: Colors.white,
            ),
            onPressed: _isEditing ? saveChanges : _toggleEdit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: he * 0.03, vertical: he * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Section
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Pallete.textColor, width: 2),
                          ),
                          child: _isUploading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.white24,
                                  backgroundImage: _profileImage != null
                                      ? FileImage(_profileImage!)
                                          as ImageProvider
                                      : const AssetImage(
                                          'assets/images/user.png'),
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Pallete.textColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Pallete.blueDarkColor, width: 2),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Change Profile Picture',
                      style: TextStyle(
                        color: Pallete.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Personal Information Section
              _buildSectionHeader('Personal Information'),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Pallete.blueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name Field
                      const Text(
                        'Full Name',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: ProfilleFields(
                          isEditing: _isEditing,
                          fillColor: Pallete.profileTextFieldColor,
                          controller: _nameController,
                          hintText: 'Enter your full name',
                          icon: const Icon(CupertinoIcons.person_fill),
                          textinputtype: TextInputType.name,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Email Field
                      const Text(
                        'Email Address',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: ProfilleFields(
                          isEditing: _isEditing,
                          fillColor: Pallete.profileTextFieldColor,
                          controller: _emailController,
                          hintText: 'Enter your email address',
                          icon: const Icon(CupertinoIcons.mail_solid),
                          textinputtype: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Phone Number Field
                      const Text(
                        'Phone Number',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 60,
                        child: ProfilleFields(
                          isEditing: _isEditing,
                          fillColor: Pallete.profileTextFieldColor,
                          controller: _phoneController,
                          hintText: 'Enter your phone number',
                          icon: const Icon(CupertinoIcons.phone_fill),
                          textinputtype: TextInputType.phone,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // State Selection
                      const Text(
                        'State',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Pallete.blueLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedState,
                            isExpanded: true,
                            dropdownColor: Pallete.blueLightColor,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.white),
                            items: indianStates.map((String gender) {
                              return DropdownMenuItem<String>(
                                value: gender,
                                child: Text(
                                  gender,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  _selectedState = newValue;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Additional Information Section
              _buildSectionHeader('Additional Information'),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Pallete.blueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bio Field
                    const Text(
                      'Bio',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Pallete.profileTextFieldColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _bioController,
                        style: const TextStyle(color: Colors.black87),
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Tell us about yourself',
                          hintStyle: TextStyle(color: Colors.black12),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Save Button
              GradiantButton(
                buttonText: 'SAVE PROFILE',
                buttonWidth: double.infinity,
                onTap: () => saveChanges(),
              ),

              const SizedBox(height: 15),

              // Cancel Button
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Pallete.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build section headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Pallete.titleTextColor,
        ),
      ),
    );
  }
}
