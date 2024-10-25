import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

Widget specialIcon(
        {String icon = MaterialSymbols.arrow_back_ios_new_rounded,
        Function? onTap}) =>
    GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Container(
          padding: const EdgeInsetsDirectional.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100],
          ),
          child: Iconify(
            icon,
            color: Colors.grey[600]!,
          )),
    );
