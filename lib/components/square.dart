import 'package:chess/components/piece.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
 final ChessPiece? piece;
 final bool isValidMove;
  final bool isSelected;
  final void Function()? onTap; 

  const Square({
    Key? key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.onTap,
    required this.isValidMove,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Color? squareColor;
    if(isSelected){
      squareColor = Colors.green;
    }
    else if (isValidMove){
      squareColor = Colors.green[200];
    }
    else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        color: squareColor,
        margin: EdgeInsets.all(isValidMove ? 4 : 4),
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    ); 
  }
}

