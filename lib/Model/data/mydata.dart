import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

List<Map<String,dynamic>> myTransactionData = [
  {
    'icon': FaIcon(FontAwesomeIcons.burger,color: Colors.white,),
    "color": Colors.yellow,
    "name":"food",
    "totalAmount":"-\$ 45.00",
    "date": "Today",
  },
  {
    'icon': FaIcon(FontAwesomeIcons.bagShopping,color: Colors.white,),
    "color": Colors.deepPurple,
    "name":"Shopping",
    "totalAmount":"-\$ 235.00",
    "date": "Today",
  },
  {
    'icon': FaIcon(FontAwesomeIcons.heartCircleCheck,color: Colors.white,),
    "color": Colors.green,
    "name":"food",
    "totalAmount":"-\$ 75.00",
    "date": "Today",
  },
  {
    'icon': FaIcon(FontAwesomeIcons.plane,color: Colors.white,),
    "color": Colors.blue,
    "name":"Travel",
    "totalAmount":"-\$ 450.00",
    "date": "Today",
  },
  {
    'icon': FaIcon(FontAwesomeIcons.ticket,color: Colors.white,),
    "color": Colors.red,
    "name":"Entertainment",
    "totalAmount":"-\$ 20.00",
    "date": "Yesterday",
  },
];
