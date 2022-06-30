import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:superindo/cubit/getdata_cubit.dart';
import 'package:superindo/model/dataproduct_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<GetDataCubit>().getData();
  }

  List imgList = [
    'assets/Banner_(1349x434)MSI74.jpg',
    'assets/Banner_Murah_Terus_E-26.jpg',
    'assets/My_Super_Dream_web.jpg',
  ];

  Widget body(List<DataProduct> loadData) {
    List<DataProduct> data =
        loadData.where((e) => int.parse(e.proddisc) > 0).toList();
    Widget body() {
      final currencyFormatter = NumberFormat('#,##0', 'ID');
      return Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              height: 30,
              width: double.infinity,
              color: Colors.red[700],
              child: Center(
                child: Text(
                  'Best Offer This Week',
                  style: GoogleFonts.arvo(
                    color: Colors.white,
                  ),
                ),
              )),
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: data.isEmpty ? 0 : data.length,
              itemBuilder: (BuildContext context, int position) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.network(
                          data[position].imageurl,
                          width: 120,
                        ),
                        Text(
                          'Rp ${currencyFormatter.format(data[position].prodsellingprice)}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ],
      );
    }

    Widget header() {
      return CarouselSlider(
        options: CarouselOptions(
          height: 220.0,
          initialPage: 0,
          enlargeCenterPage: false,
          viewportFraction: 1,
          autoPlay: true,
        ),
        items: imgList.map((imgUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.fill,
                  width: 1000.0,
                ),
              );
            },
          );
        }).toList(),
      );
    }

    return SafeArea(
        child: ListView(
      children: [
        header(),
        body(),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GetDataCubit, GetDataState>(
        builder: (context, state) {
          if (state is GetDataSuccess) {
            return body(state.datamodel);
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
