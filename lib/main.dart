import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool isturnO = true;
  List<String> trunOorTrunX = ["", "", "", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: _getAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _get_score_and_name_palyer("Player X", "2"),
                  _get_score_and_name_palyer("Player O", "2"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _getRowBox(),
              _getTurne(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTurne() {
    return Text(
      isturnO ? "Turne X" : "Turne O",
      style: TextStyle(color: Colors.white, fontSize: 20.0),
    );
  }

  Widget _getRowBox() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              getOnTap(index);
            },
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  "${trunOorTrunX[index]}",
                  style: TextStyle(
                      color:
                          trunOorTrunX[index] == "X" ? Colors.red : Colors.blue,
                      fontSize: 50),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _resetGame() {
    setState(() {
      for (var i = 0; i < trunOorTrunX.length; i++) {
        if (trunOorTrunX[i] != "") {
          trunOorTrunX[i] = "";
        }
      }
    });
  }

  void getOnTap(int index) {
    setState(() {
      if (isturnO && trunOorTrunX[index] == "") {
        trunOorTrunX[index] = "X";
        isturnO = !isturnO;
      } else {
        if (trunOorTrunX[index] == "") {
          trunOorTrunX[index] = "O";
          isturnO = !isturnO;
        }
      }
    });
  }

  Widget _get_score_and_name_palyer(String player, String score) {
    return Column(
      children: [
        Text(
          player,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          score,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "TicTacToe",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 87,
          ),
          IconButton(
            onPressed: () {
              _resetGame();
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
