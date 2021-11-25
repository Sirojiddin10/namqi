import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

class UniversityInfoScreen extends StatelessWidget {
  const UniversityInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/university.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width - 40,
                child: Marquee(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height - 400),
                    child: Text(
                      '''O’zbekiston Respublikasi Vazirlar Mahkamasining 1991 yil 29-mart 75-sonli qarori bilan Toshkent mashinasozlik institutining Namangan filiali asosida tashkil qilingan Namangan sanoat-texnologiya instituti O’zbekiston Respublikasi Vazirlar Mahkamasining 1998 yil 24 fevral 77-sonli “Akademik litseylar va kasb-hunar kollejlarini tashkil etish va ular faoliyatini boshqarish to’risida”gi qaroriga asosan Namangan muhandislik-pedagogika institutiga aylantirilgan.O’zbekiston Respublikasi Prezidentining “Oliy ta’lim tizimini yanada rivojlantirish chora-tadbirlari to’g’risida” 2017 yil 20 apreldagi PQ-2909-son qaroriga muvofiq Namangan muhandislik-pedagogika instituti Namangan muhandislik-qurilish instituti sifatida qayta tashkil etildi.
Fakultetda hozirgi kunda quyidagi 6 ta kafedra faoliyat yuritmoqda, ulardan 5 tasi mutaxassislik kafedralari: 1. Qurilish materiallari, buyumlari va kоnstruktsiyalarini ishlab chiqarish. 2. Kimyoviy texnologiya. 3. Avtomobil yo'llari va aerodromlar. 4. Kasb ta`limi (oziq-ovqat texnologiyasi). 5. Qurilish-arxitektura. 6. Pedagogika va pedagogik texnologiya. 5 ta mutaxassislik kafedralarida quyidagi 7 ta ta`lim yo’nalishlarida bakalavrlar tayyorlanadi: 5340500 – Qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish. 55340300 – Shahar qurilishi va xo’jaligi. 3. 5111000 – Kasb ta`limi (oziq-ovqat texnologiyasi). 4. 5610100 – Xizmatlar sohasi (ovqatlanishni tashkil etish va servis). 5. 5111000 – Kasb ta`limi (Kimyoviy texnologiya). 6. 5340800 – Avtomobil yo’llari va aerodromlar. 7. 5341000-Qishloq xududlarini arxitektura-loyihaviy tashkil etish.
Fakultet talabalarining mukammal bilim оlishlari uchun barcha sharoitlar yaratilgan. Fakultetda 42 ta prоfessоr-o’qituvchilar faоliyat ko’rsatmоqdalar. Ulardan 2 nafari fan dоktоri, prоfessоr, 15 nafari esa fan nоmzоdlari dоtsentlardir. Fakultetda ilmiy salоhiyat 40.4 % ni tashkil etadi. 2018-2019 o’quv yili davоmida fakultet tasarrufidagi 44 ta akademik guruxlarda 1029 nafar talaba tahsil оlmoqda, shundan 293 nafari davlat granti asosida qolganlari to’lоv-shartnоma asоsida ta`lim olmoqdalar. O’quv jarayonida yangi pedagоgik texnоlоgiyalardan keng fоydalanilmоqda. Jumladan, talabalarni yuqori saviyada ta`lim olishlari uchun fakultetda kоmpyuter sinflari, videоprоektоrlar hamda o`quv laboratorya jihozlari bilan ta`minlangan auditoriyalar mavjud. ''',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  direction: Axis.vertical,
                  autoRepeat: true,
                  animationDuration: const Duration(seconds: 15),
                  directionMarguee: DirectionMarguee.TwoDirection,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
