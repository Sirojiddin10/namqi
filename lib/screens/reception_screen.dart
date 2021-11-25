import 'package:flutter/material.dart';
import 'package:namqi_project/models/sound_recorder.dart';
import 'package:namqi_project/screens/user_details_screen.dart';
import 'package:namqi_project/widgets/user_component.dart';

class ReceptionScreen extends StatefulWidget {
  final bool isWorker;
  final String imagePath;
  const ReceptionScreen({this.imagePath = '', this.isWorker = false, Key? key})
      : super(key: key);

  @override
  _ReceptionScreenState createState() => _ReceptionScreenState();
}

class _ReceptionScreenState extends State<ReceptionScreen> {
  final List<String> reasons = [
    'Xodimlar masalasi bo\'yicha',
    'Talabalar masalasi bo\'yicha',
    'O\'quv ishlari masalasi bo\'yicha',
    'Tashkiliy ishlar masalasi bo\'yicha',
    'Ma`naviy marifiy masalasi bo\'yicha',
  ];
  final recorder = SoundRecorder();
  final List<String> workers = ['Talaba', 'Xodim', 'Fuqaro'];

  int currentItem = -1;
  int currentWorker = -1;

  @override
  void initState() {
    recorder.init();
    super.initState();
  }

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Murojaat sababini tanlang',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              if (!widget.isWorker) ...{
                ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      workers.length,
                      (index) => Expanded(
                        child: UserComponent(
                          onTap: () {
                            setState(() {
                              currentWorker = index;
                            });
                          },
                          text: workers[index],
                          isSelected: currentWorker == index,
                        ),
                      ),
                    ),
                  )
                ]
              },
              ...List.generate(
                reasons.length,
                (index) => UserComponent(
                  onTap: () {
                    setState(() {
                      currentItem = index;
                    });
                  },
                  text: reasons[index],
                  isSelected: currentItem == index,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              recorder.toggleRecording();
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blueAccent,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Text(
                            'Ovozli xabar jo\'natish uchun bosing',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserDetailsScreen(
                              imagePath: widget.imagePath,
                              name: 'Eshmatorv Toshmat',
                              reason:
                                  currentItem > -1 ? reasons[currentItem] : '',
                              position: 'Energetika fakulteti dekani',
                              audioPath: 'audio_someone.aac',
                            ),
                          ),
                        ),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blueAccent),
                          child: const Center(
                            child: Text(
                              'Tasdiqlash',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
