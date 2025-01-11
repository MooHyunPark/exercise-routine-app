import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/add_fitness_detail_vm.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_fitness_detail_Input.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_fitness_detail_button.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_fitness_detail_image.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_fitness_detail_title.dart';

class AddFitnessDetailBody extends ConsumerWidget {
  final _fitnessId;
  final _dayOfWeek;

  final _exerciseSet = TextEditingController(); // 세트 수
  final _repeat = TextEditingController(); // 반복 횟수
  final _weight = TextEditingController(); // 무게
  AddFitnessDetailBody(this._fitnessId, this._dayOfWeek);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    FitnessDetailModel? model = ref.watch(
        addFitnessDetailProvider(_fitnessId));

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 운동명 보여주는 컨테이너
            AddFitnessDetailTitle(exerciseName: model!.fitnessName),
            SizedBox(height: 30), // 간격

            // 이미지 or 영상 컨테이너 (버튼을 컨테이너로 변경)
            AddFitnessDetailImage(imagePath: '${model.imageUrl}'), // 이미지 경로 넣기
            SizedBox(height: 30),

            // 세트 수 입력 필드
            AddFitnessDetailInput(
                controller: _exerciseSet,
                labelText: '세트 수 입력',
                suffixText: '세트',
                icon: Icons.edit),
            SizedBox(height: 16),

            // 반복 횟수 입력 필드
            AddFitnessDetailInput(
                controller: _repeat,
                labelText: '반복 횟수 입력',
                suffixText: '회',
                icon: Icons.repeat),
            SizedBox(height: 16),

            // 무게 입력 필드
            AddFitnessDetailInput(
                controller: _weight,
                labelText: '무게 입력',
                suffixText: 'kg',
                icon: Icons.fitness_center),
            SizedBox(height: 30),

            // 추가하기 버튼
            AddFitnessDetailButton(_fitnessId, _dayOfWeek, _exerciseSet, _repeat, _weight),
          ],
        ),
      );
    }
 }
}
