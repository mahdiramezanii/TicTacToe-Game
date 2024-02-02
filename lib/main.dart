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
  bool hasResult = false;
  int scoreX = 0;
  int scoreO = 0;
  int fillBox = 0;
  String WinnerTitle = "";
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
                  _get_score_and_name_palyer("Player X", "$scoreX"),
                  _get_score_and_name_palyer("Player O", "$scoreO"),
                ],
              ),
              showBottom(),
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

  Widget showBottom() {
    return Visibility(
      visible: hasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.white, width: 1)),
        onPressed: () {
          setState(() {
            _resetGame();
            hasResult = false;
          });
        },
        child: Text(
          "$WinnerTitle",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
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
      fillBox = 0;
    });
  }

  void getOnTap(int index) {
    setState(() {
      if (hasResult) {
        return;
      }
      if (isturnO && trunOorTrunX[index] == "") {
        trunOorTrunX[index] = "X";
        isturnO = !isturnO;
        fillBox = fillBox + 1;
      } else {
        if (trunOorTrunX[index] == "") {
          trunOorTrunX[index] = "O";
          isturnO = !isturnO;
          fillBox = fillBox + 1;
        }
      }
      getScore();
    });
  }

  void setResult(String winner, String title) {
    setState(() {
      hasResult = true;
      WinnerTitle = title;

      if (winner == "X") {
        scoreX = scoreX + 1;
      } else if (winner == "O") {
        scoreO = scoreO + 1;
      } else {
        scoreO = scoreO + 1;
        scoreX = scoreX + 1;
      }
    });
  }

  void getScore() {
    // ===================== Check First Row ==============================
    if (trunOorTrunX[0] == trunOorTrunX[1] &&
        trunOorTrunX[1] == trunOorTrunX[2] &&
        trunOorTrunX[0] != "") {
      setResult(trunOorTrunX[0], "player ${trunOorTrunX[0]} baramdeh");
      return;
    }
    //==============================================================================

    // ===================== Check Two Row ==============================
    if (trunOorTrunX[3] == trunOorTrunX[4] &&
        trunOorTrunX[4] == trunOorTrunX[5] &&
        trunOorTrunX[3] != "") {
      setResult(trunOorTrunX[3], "player ${trunOorTrunX[3]} baramdeh");
      return;
    }
    //=======================================================================

    // ===================== Check tree Row ==============================
    if (trunOorTrunX[6] == trunOorTrunX[7] &&
        trunOorTrunX[7] == trunOorTrunX[8] &&
        trunOorTrunX[6] != "") {
      setResult(trunOorTrunX[6], "player ${trunOorTrunX[6]} baramdeh");
      return;
    }
    //=========================================================================

    //========================================= Check First Column ====================================
    if (trunOorTrunX[0] == trunOorTrunX[3] &&
        trunOorTrunX[3] == trunOorTrunX[6] &&
        trunOorTrunX[0] != "") {
      setResult(trunOorTrunX[0], "player ${trunOorTrunX[0]} baramdeh");
      return;
    }
    //======================================================================================

    //========================================= Check Two Column ====================================
    if (trunOorTrunX[1] == trunOorTrunX[4] &&
        trunOorTrunX[4] == trunOorTrunX[7] &&
        trunOorTrunX[1] != "") {
      setResult(trunOorTrunX[1], "player ${trunOorTrunX[1]} baramdeh");
      return;
    }

    //=============================================================================================

    //========================================= Check thre Column ====================================
    if (trunOorTrunX[2] == trunOorTrunX[5] &&
        trunOorTrunX[5] == trunOorTrunX[8] &&
        trunOorTrunX[2] != "") {
      setResult(trunOorTrunX[2], "player ${trunOorTrunX[2]} baramdeh");
      return;
    }
    //===================================================================================

    if (trunOorTrunX[0] == trunOorTrunX[4] &&
        trunOorTrunX[4] == trunOorTrunX[8] &&
        trunOorTrunX[0] != "") {
      setResult(trunOorTrunX[0], "player ${trunOorTrunX[0]} baramdeh");
      return;

      //===================================================
    }

    if (trunOorTrunX[2] == trunOorTrunX[4] &&
        trunOorTrunX[4] == trunOorTrunX[6] &&
        trunOorTrunX[2] != "") {
      setResult(trunOorTrunX[2], "player ${trunOorTrunX[2]} baramdeh");
      return;
    }

    if (fillBox == 9) {
      setResult("", "mosavi");
    }
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
              scoreO = 0;
              scoreX = 0;
              hasResult = false;
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
