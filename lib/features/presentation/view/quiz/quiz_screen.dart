import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/color/color_const.dart';
import '../../../providers/answer_provider.dart';
import '../../../providers/question_providers.dart';

class QuizScreen extends ConsumerWidget {
  final String? quiz;
  final bool isLevel;

  const QuizScreen({
    super.key,
    this.quiz,
    required this.isLevel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentQuestionIndexProvider);
    final selectedOption = ref.watch(selectedOptionProvider);
    final questions = isLevel
        ? ref.watch(questionsByLevelProvider(quiz!))
        : ref.watch(questionsByCategoryProvider(quiz!));
    final answerState = ref.watch(answerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorConst.orangeBackground, ColorConst.blueBackground],
          ),
        ),
        child: SafeArea(
          child: questions.when(
            loading: () => const CircularProgressIndicator(),
            error: (e, s) => Text('Error: $e'),
            data: (questionsData) {
              return Column(
                children: [
                  // ====== App Bar ======
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            ref
                                    .read(currentQuestionIndexProvider.notifier)
                                    .state =
                                0;
                          },
                          child: _circleIcon(Icons.arrow_back),
                        ),
                        Text(
                          'Question ${currentIndex + 1}/${questionsData.length}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        _circleIcon(Icons.bookmark_border),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ====== Question Card ======
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF9B6CF7), Color(0xFFBFA6FF)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 26,
                      ),
                      child: Text(
                        questionsData[currentIndex].question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ====== Timer Bar ======
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: const LinearProgressIndicator(
                              value: 0.4,
                              minHeight: 8,
                              backgroundColor: Colors.white,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '00:12',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ====== Options ======
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        spacing: 12,
                        children: [
                          InkWell(
                            onTap: () {
                              ref.read(selectedOptionProvider.notifier).state =
                                  questionsData[currentIndex].answers[0];
                              ref
                                  .read(answerProvider.notifier)
                                  .answerQuestion(
                                    ref
                                            .read(selectedOptionProvider.notifier)
                                            .state ==
                                        questionsData[currentIndex].correctAnswer,
                                  );
                            },
                            child: _optionTile(
                              'A',
                              questionsData[currentIndex].answers[0],
                              selectedOption ==
                                  questionsData[currentIndex].answers[0],
                              answerState.color,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ref.read(selectedOptionProvider.notifier).state =
                                  questionsData[currentIndex].answers[1];
                              ref
                                  .read(answerProvider.notifier)
                                  .answerQuestion(
                                ref
                                    .read(selectedOptionProvider.notifier)
                                    .state ==
                                    questionsData[currentIndex].correctAnswer,
                              );
                            },
                            child: _optionTile(
                              'B',
                              questionsData[currentIndex].answers[1],
                              selectedOption ==
                                  questionsData[currentIndex].answers[1],
                              answerState.color,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ref.read(selectedOptionProvider.notifier).state =
                                  questionsData[currentIndex].answers[2];
                              ref
                                  .read(answerProvider.notifier)
                                  .answerQuestion(
                                ref
                                    .read(selectedOptionProvider.notifier)
                                    .state ==
                                    questionsData[currentIndex].correctAnswer,
                              );
                            },
                            child: _optionTile(
                              'C',
                              questionsData[currentIndex].answers[2],
                              selectedOption ==
                                  questionsData[currentIndex].answers[2],
                              answerState.color,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ref.read(selectedOptionProvider.notifier).state =
                                  questionsData[currentIndex].answers[3];
                              ref
                                  .read(answerProvider.notifier)
                                  .answerQuestion(
                                ref
                                    .read(selectedOptionProvider.notifier)
                                    .state ==
                                    questionsData[currentIndex].correctAnswer,
                              );
                            },
                            child: _optionTile(
                              'D',
                              questionsData[currentIndex].answers[3],
                              selectedOption ==
                                  questionsData[currentIndex].answers[3],
                              answerState.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ====== Bottom Buttons ======
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _bottomButton('Previous', Icons.skip_previous, () {}),
                        _bottomButton(
                          '${answerState.score}/${questionsData.length}',
                          Icons.confirmation_num_outlined,
                          () {},
                        ),
                        _bottomButton('Next', Icons.skip_next, () {
                          if (currentIndex < questionsData.length) {
                            ref
                                .read(currentQuestionIndexProvider.notifier)
                                .state++;
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // ====== Reusable Widgets ======

  Widget _circleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6),
        ],
      ),
      child: Icon(icon, size: 20),
    );
  }

  Widget _optionTile(String letter, String text, bool isSelected, Color color) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: isSelected ? color : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.green.shade300 : Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isSelected ? Colors.green.shade50 : Colors.grey.shade100,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.green : Colors.transparent,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              letter,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
          if (isSelected)
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: const Icon(Icons.check, size: 18, color: Colors.white),
            ),
        ],
      ),
    );
  }

  Widget _bottomButton(
    String label,
    IconData icon,
    void Function()? onPressed,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFE7A44),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: Colors.white),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
