import 'package:flutter/material.dart';

import '../colors.dart';
import 'bottom-navigation-bar.dart';

class MusicList extends StatefulWidget {
  final List<Widget> actionsAppBar;
  final String titleAppBar;
  final Widget backgroundColumn;
  final calcOpacityBackground;
  final scrollController;
  final List<Widget> musicListColumn;
  final Widget musicBuilder;

  const MusicList({
    this.actionsAppBar,
    this.titleAppBar,
    this.backgroundColumn,
    this.calcOpacityBackground,
    this.scrollController,
    this.musicListColumn,
    this.musicBuilder,
  });

  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [(1 - 100 / (100 - (widget.calcOpacityBackground / 10))).abs(), 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [black, Color.fromRGBO(55, 0, 0, 1)])),
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBarDefault(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: AnimatedOpacity(
                duration: Duration(microseconds: 100),
                opacity: (widget.calcOpacityBackground / 300) < 1 ? (widget.calcOpacityBackground / 300) : 1.0,
                child: Text(widget.titleAppBar)),
            centerTitle: true,
            actions: widget.actionsAppBar,
          ),
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: 1 - (1 - 100 / (100 + widget.calcOpacityBackground)),
              child: Container(width: double.maxFinite, child: widget.backgroundColumn),
            ),
            SingleChildScrollView(
              controller: widget.scrollController,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: larguraTela / 1.1),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 100, left: 10, right: 10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.1, 0.25],
                                colors: [Colors.transparent, black])),
                        child: Column(
                          children: [...widget.musicListColumn, widget.musicBuilder],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: larguraTela / 4.5,
                    width: larguraTela / 1.7,
                    top: widget.scrollController.hasClients
                        ? widget.scrollController.offset < 405
                            ? larguraTela
                            : widget.scrollController.offset
                        : larguraTela,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.center,
                        height: 45,
                        child: Text("ORDEM ALEATÓRIA"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
