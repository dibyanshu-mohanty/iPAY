import 'package:flutter/material.dart';

final _settings = [
  {
    'name' : 'My Account',
    'icon' : const Icon(Icons.account_circle),
  },
  {
    'name' : 'My Cards',
    'icon' : const Icon(Icons.credit_card_sharp),
  },
  {
    'name' : 'Privacy & Security',
    'icon' : const Icon(Icons.security),
  },
  {
    'name' : 'About',
    'icon' : const Icon(Icons.info_outline),
  },
  {
    'name' : 'Help',
    'icon' : const Icon(Icons.help_outline),
  },
  {
    'name' : 'Log Out',
    'icon' : const Icon(Icons.power_settings_new),
  }
];

List get settings{
  return [..._settings];
}