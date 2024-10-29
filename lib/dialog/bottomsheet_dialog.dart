import 'package:flutter/material.dart';

class BotttomSheetDialog extends StatefulWidget {
  final bool showLanguage;
  final bool showCurrency; // Determines whether to show language or avatar options
  final bool showNotification;

  const BotttomSheetDialog(
      {super.key,
      this.showLanguage = false,
      this.showCurrency = false,
      this.showNotification = false});

  @override
  State<BotttomSheetDialog> createState() => _BotttomSheetDialogState();
}

class _BotttomSheetDialogState extends State<BotttomSheetDialog> {
  String _selectedPattern = 'Pattern 1';
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'United States Dollar';
  String _selectedNotification = 'Transcation';

  List<String> notificationOptions = ['Transaction', 'Security', 'News'];
  List<bool> _selectedNotifications = [false, false, false];

  @override
  Widget build(BuildContext context) {
    // Show either the language selection, currency selection, or avatar options based on the flags
    if (widget.showLanguage) {
      return selectLanguage();
    }
     else if (widget.showCurrency) {
      return selectedCurrency();
    } 
     else if (widget.showNotification) {
      return selectedNotification();
    } 
    else {
      return avatarOptions();
    }
  }

  // Method to show avatar options
  Widget avatarOptions() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'Change Avatar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          _buildAvatarOption('Pattern 1', 'Pattern 1'),
          _buildAvatarOption('Pattern 2', 'Pattern 2'),
          _buildAvatarOption('Pattern 3', 'Pattern 3'),
          _buildAvatarOption('Pattern 4', 'Pattern 4'),
          Divider(),
          ListTile(
            leading: Icon(Icons.camera_alt_outlined),
            title: Text('Take a photo'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle taking a photo
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library_outlined),
            title: Text('Upload from gallery'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Handle uploading from the gallery
            },
          ),
        ],
      ),
    );
  }

  // Method to show language selection
  Widget selectLanguage() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'Choose Language',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          _buildLanguageOption('English (US)', 'English (US)'),
          _buildLanguageOption('Chinese', 'Chinese'),
          _buildLanguageOption('Hindi', 'Hindi'),
        ],
      ),
    );
  }

  // Helper method to build avatar options
  Widget _buildAvatarOption(String title, String value) {
    return ListTile(
      leading: Image.asset(
        'assets/pattern.png', // Replace with your avatar asset
        width: 40,
      ),
      title: Text(title),
      trailing: Radio<String>(
        value: value,
        groupValue: _selectedPattern,
        onChanged: (String? newValue) {
          setState(() {
            _selectedPattern = newValue!;
          });
        },
      ),
      onTap: () {
        setState(() {
          _selectedPattern = value;
        });
      },
    );
  }

  // Helper method to build language options
  Widget _buildLanguageOption(String title, String value) {
    return ListTile(
      title: Text(title),
      trailing: Radio<String>(
        value: value,
        groupValue: _selectedLanguage,
        onChanged: (String? newValue) {
          setState(() {
            _selectedLanguage = newValue!;
          });
        },
      ),
      onTap: () {
        setState(() {
          _selectedLanguage = value;
        });
      },
    );
  }

  Widget selectedCurrency() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'Choose Currency',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          _buildCurrencyOption('USD', 'USD'),
          _buildCurrencyOption('EUR', 'EUR'),
          _buildCurrencyOption('INR', 'INR'),
          _buildCurrencyOption('JPY', 'JPY'),
        ],
      ),
    );
  }

  Widget _buildCurrencyOption(String title, String value) {
    return ListTile(
      title: Text(title),
      trailing: Radio<String>(
        value: value,
        groupValue: _selectedCurrency,
        onChanged: (String? newValue) {
          setState(() {
            _selectedCurrency = newValue!;
          });
        },
      ),
      onTap: () {
        setState(() {
          _selectedCurrency = value;
        });
      },
    );
  }
  
  Widget selectedNotification() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            'Notifications',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        _buildNotificationOption('Transaction', 0),
        _buildNotificationOption('Security', 1),
        _buildNotificationOption('News', 2),
      ],
    ),
  );
}
  
  Widget _buildNotificationOption(String title, int index) {
  return SwitchListTile(
    title: Text(title),
    value: _selectedNotifications[index],
    onChanged: (bool value) {
      setState(() {
        _selectedNotifications[index] = value;
      });
    },
  );
}

}
