import 'package:flutter/material.dart';
import 'package:quiz_app/firebase_service/quiz_questions.dart';
import 'home_screen.dart';
import 'winning_screen.dart';

class QuizPage extends StatefulWidget {
  String QuizId;
  QuizPage({
    required this.QuizId,
    super.key,
  });

  @override
  State<QuizPage> createState() => _HomePageState();
}

class _HomePageState extends State<QuizPage> {
  // Questions questionModel = new Questions();
  Future genQue() async {
    var ques = [];
    ques = await QuizQuestions.getQuestionsList("RSwH0d2yfC7yiLprJYSq");
    var randomQuestions = (ques..shuffle()).sublist(0, 2);
    if (ques.isEmpty) {
      return [
        {
          "question": "EMPTY",
          "correct_answer": "EMPTY",
          "option1": "EMPTY",
          "option2": "EMPTY",
          "option3": "EMPTY",
          "option4": "EMPTY",
        }
      ];
    }
    return ques;
  }

  @override
  void initState() {
    super.initState();
    genQue();
  }

  bool opt_A_locked = false;
  bool opt_B_locked = false;
  bool opt_C_locked = false;
  bool opt_D_locked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ElevatedButton(
        child: const Text(
          "QUIT GAME",
          style: TextStyle(fontSize: 27),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomePage()));
        },
      ),
      body: FutureBuilder(
        future: genQue(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 100,
                //   width: 100,
                //   child: Stack(
                //     fit: StackFit.expand,
                //     children: [
                //       CircularProgressIndicator(
                //         strokeWidth: 12,
                //         backgroundColor: Colors.green,
                //       ),
                //       Center(
                //           child: Text(
                //         "46",
                //         style: TextStyle(
                //             fontSize: 45,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //       ))
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      snapshot.data[0]["question"].toString(),
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onDoubleTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => WinPage()));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(34)),
                      child: Text(
                        "A. ${snapshot.data[0]["option1"].toString()}",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(14),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(34)),
                    child: Text(
                      "B. ${snapshot.data[0]["option2"].toString()}",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(14),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(34)),
                    child: Text(
                      "C. ${snapshot.data[0]["option3"].toString()}",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(14),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(34)),
                    child: Text(
                      "D. ${snapshot.data[0]["option4"].toString()}",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
