import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title,subtitile;
  const TopTitles({super.key, required this.title, required this.subtitile});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     
      children: [
        const SizedBox(
              height: kToolbarHeight+8,
            ),
            if(title=="Login"|| title=="Create Account"  ) 
               GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back_ios),
               ),
               const SizedBox(height: 8,),
              
            Text(title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(
              height: 12,
            ),
            Text(subtitile,
              style: const TextStyle(
              fontSize: 18.0,)
            ),
      ],
    );
  }
}