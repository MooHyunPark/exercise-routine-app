import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_detail_page/exercise_detail_vm.dart';

class ExerciseDetailBody extends ConsumerWidget {
  final id;

  ExerciseDetailBody(this.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ExerciseDetailModel? model = ref.watch(exerciseDetailProvider(id));

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 500,
                child: Center(
                  child: Text(
                    model.fitnessName,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(
                model.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "운동 설명",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    model.content,
                    style: TextStyle(
                      fontSize: 16.0, // 글자 크기
                      color: Colors.black87, // 텍스트 색상
                      fontWeight: FontWeight.normal, // 텍스트 굵기
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}