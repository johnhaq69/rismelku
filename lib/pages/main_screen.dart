import 'package:rismelku/theme.dart';
import 'package:rismelku/widget/bottom_nav.dart';
import 'package:rismelku/widget/transaksi_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'dart:ffi';
import 'package:intl/intl.dart';

import '../util/db_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> transaksi = [];

  void refreshData() async {
    final data = await SqlHelper.getTransaksi(
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        DateFormat('yyyy-MM-dd').format(DateTime.now()));
    setState(() {
      transaksi = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Laporan Hari Ini",
          style: TextStyle(
            fontFamily: 'OkineSans',
            fontSize: 22,
            color: backgroundColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              refreshData();
            },
            icon: Icon(
              Icons.refresh,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavWidget(),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                "${DateFormat('dd MMMM yyyy').format(DateTime.now())}",
                style: TextStyle(
                  fontFamily: 'OkineSans',
                  fontSize: 18,
                  color: blackColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TransaksiCard(
              tanggal_awal: DateFormat('yyyy-MM-dd').format(DateTime.now()),
              tanggal_akhir: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            ),
          ],
        ),
      ),
    );
  }
}
