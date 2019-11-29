// Part 1
// Tower of Hanoi - 3 Moves
// Write a function which will check win in 3 moves, use the code you wrote yesterday

// Part 2
// Tower of Hanoi - N Moves
// Write a function which will check win in N moves for a given state of Tower of Hanoi
// The function will take an additional parameter 'n' (number of moves)


// Stretch: Show all moves which lead to win, given a state.
// Challenge
// Find the best move given the state of Towers of Hanoi board
List<List<List<int>>> result = [];

List<List<List<int>>> possibleMoves(List<List<int>> inputList) {
  for (int i = 0; i < inputList.length; i++) {
    for (int j = 0; j < inputList.length; j++) {
      if (validMove(inputList, i, j)) {
        List<List<int>> copyOfInputList = [];
        makeCopy(inputList, copyOfInputList);
        makeMove(copyOfInputList, i, j);
      }
    }
  }
  return result;
}

validMove(List<List<int>> inputList, int i, int j) {
  if (inputList[i].isEmpty) {
    return false;
  } else if (inputList[j].isEmpty) {
    return true;
  } else if (inputList[i][0] < inputList[j][0]) {
    return true;
  } else {
    return false;
  }
}

makeCopy(List<List<int>> inputList, List<List<int>> copyOfInputList) {
  for (int i = 0; i < inputList.length; i++) {
    List<int> temp = List.from(inputList[i]);
    copyOfInputList.add(temp);
  }
}

makeMove(List<List<int>> copyOfInputList, int i, int j) {
  copyOfInputList[j].insert(0, copyOfInputList[i][0]);
  copyOfInputList[i].removeAt(0);

  result.add(copyOfInputList);
}

List flattenList(List inputList, List outputList) {
  for (int i = 0; i < inputList.length; i++) {
    dynamic element = inputList[i];

    if (element is List) {
      flattenList(element, outputList);
    } else if (element is Function) {
      dynamic functionResult = element();

      if (functionResult is List) {
        flattenList(functionResult, outputList);
      } else {
        outputList.add(functionResult);
      }
      //outputList.add(inputList[i]());

    } else {
      outputList.add(element);
    }
  }
  return outputList;
}

main() {
  // print(possibleMoves([[1],[2],[3,4]]));
  // print(bestMove([[],[1],[2,3,4]]));
/* print(bestOneMoveToWin([
    [],
    [1,2],
    [3, 4]
  ]));*/
 /*print(bestTwoMoveToWin([
    [2],
    [1],
    [3, 4]
  ]));*/
  // print(bestMove([[1],[],[2,3,4]]));
 /*print(bestThreeMoveToWin([[1,2], [], [3,4]]));*/
  print(bestNMoveToWin([
    [2],
    [1],
    [3, 4]
  ], 2));
}

List<List<int>> bestOneMoveToWin(List<List<int>> inputList) {
  List<List<List<int>>> listOfPossibleMoves = possibleMoves(inputList);
  print(listOfPossibleMoves);
  for (int i = 0; i < listOfPossibleMoves.length; i++) {
    if (checkWin(listOfPossibleMoves[i])) {
      return inputList;
    }
  }
  return null;
}

bool checkWin(List<List<int>> inputList) {
  return ((inputList[0].isEmpty) && (inputList[1].isEmpty));
}

List<List<int>> bestTwoMoveToWin(List<List<int>> inputList) {
  List<List<List<int>>> listOfPossibleMoves = possibleMoves(inputList);
  for (int i = 0; i < listOfPossibleMoves.length; i++) {
     if((bestOneMoveToWin(listOfPossibleMoves[i]))!=null){
       return listOfPossibleMoves[i];
     }
  }
  return null;
}
List<List<int>> bestThreeMoveToWin(List<List<int>> inputList) {
  List<List<List<int>>> listOfPossibleMoves = possibleMoves(inputList);
  for (int i = 0; i < listOfPossibleMoves.length; i++) {
    if((bestTwoMoveToWin(listOfPossibleMoves[i]))!=null){
      return listOfPossibleMoves[i];
    }
  }
  return null;
}
List<List<int>> bestNMoveToWin(List<List<int>> inputList, int N) {
  if(N==1){
    return inputList;
  }
  List<List<List<int>>> listOfPossibleMoves = possibleMoves(inputList);
  for (int i = 0; i < listOfPossibleMoves.length; i++) {
    if(bestNMoveToWin(listOfPossibleMoves[i],N-1)!=null){
      return listOfPossibleMoves[i];
    }
  }
  return null;
}