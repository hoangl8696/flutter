import 'dart:async';

import 'package:crash_course/components/default_app_bar.dart';
import 'package:crash_course/components/location_tile.dart';
import 'package:crash_course/location_detail.dart';
import 'package:crash_course/models/location.dart';
import 'package:crash_course/styles.dart';
import 'package:flutter/material.dart';

const ListItemHeight = 245.0;

class LocationList extends StatefulWidget {
  @override
  _LocationListState createState() {
    return _LocationListState();
  }
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: RefreshIndicator(
        onRefresh: loadData,
        child: Column(
          children: <Widget>[
            renderProgressBar(context),
            Expanded(
              child: renderList(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderList(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: _listViewItemBuilder,
    );
  }

  Widget renderProgressBar(BuildContext context) {
    return this.isLoading
        ? LinearProgressIndicator(
            value: null,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          )
        : Container();
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    final location = locations[index];
    return GestureDetector(
      onTap: () => _navigationToLocationDetail(context, location.id),
      child: Container(
        height: ListItemHeight,
        child: Stack(children: [
          _tileImage(
              location.url, MediaQuery.of(context).size.width, ListItemHeight),
          _tileFooter(location),
        ]),
      ),
    );
  }

  Future<void> loadData() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
      Timer(Duration(milliseconds: 3000), () async {
        final List<Location> locations = await Location.fetchAll();
        setState(() {
          isLoading = false;
          this.locations = locations;
        });
      });
    }
  }

  void _navigationToLocationDetail(BuildContext context, int locationId) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationDetail(locationId),
        ));
  }

  Widget _tileImage(String url, double width, double height) {
    Image image;
    try {
      image = Image.network(url, fit: BoxFit.cover);
    } catch (e) {
      print('Could not load image for url $url');
    }
    return Container(
      constraints: BoxConstraints.expand(),
      child: image,
    );
  }

  Widget _tileFooter(Location location) {
    final info = LocationTile(location: location, darkTheme: true);
    final overlay = Container(
      padding: EdgeInsets.symmetric(
          vertical: 5.0, horizontal: Styles.horizontalPaddingDefault),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: info,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[overlay],
    );
  }

  Widget _itemTitle(Location location) {
    return Text(location.name, style: Styles.textDefault);
  }
}
