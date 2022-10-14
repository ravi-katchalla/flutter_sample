import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class LoadFullImage extends StatelessWidget {
  String imagePath;
  LoadFullImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: imagePath,
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.fill)
                      ),
                      
               ),
            ),
            FadeInUp(
              delay: Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('The Ranger is usually the leader of the team, although there have been times where Rangers of other colors have been leaders. In recent times, Red Rangers have also been given the role of hot-headed rookie. Red Rangers also usually receive the most powerful weapons', 
                      style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 18, color: Colors.grey.shade900,
                        
                        ),),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}