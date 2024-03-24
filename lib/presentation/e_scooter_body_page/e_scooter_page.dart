import 'package:e_scooter/core/utils/e_scooter_helper.dart';
import 'package:flutter/material.dart';
import 'package:e_scooter/core/e_scooter_export.dart';

class EScooterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height * 0.55,
                child: Row(
                  children: [
                    _buildDetailsSection(),
                    _buildImageSection(),
                  ],
                ),
              ),
              _buildFeatureRow(),
              _buildPromoSection(),
              _buildDigitalTechSection(),
              SizedBox(
                height: 25),
              _buildMoveOsSection(),
              SizedBox(
                height: 25
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return SizedBox(
      width: Get.width * 0.45,
      height: Get.height * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSpecs('115', 'KM/H', 'Top Speed'),
          _buildSpecs('3.0', 'SEC', '0 to 40 KM/H'),
          _buildSpecs('181', 'KM', 'Range'),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child:
                EScooterHelper.reserve11('ES-S1', 'Oct 2021', '8th Sept 2021'),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return SizedBox(
      width: Get.width * 0.55,
      height: Get.height * 0.8,
      child: Image(
        image: AssetImage(EScooterImageConstant.imgEScooter),
        alignment: Alignment(-0.35, 0),
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildSpecs(String value, String unit, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: EScooterHelper.specs(value, unit, label),
    );
  }

  Widget _buildFeatureRow() {
    return Row(
      children: [
        SizedBox(
          width: Get.width * .5,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeatureText('Meet the', 'revolutionary ', 'design'),
                _buildFeatureRowWithIcon(
                    Icons.palette_outlined,
                    '10 stunning colors',
                    'Available in glossy and matte finishes'),
                _buildFeatureRowWithIcon(
                    Icons.emoji_events_outlined,
                    'Largest bootspace',
                    "Helmet or a week's groceries fit right in"),
                _buildFeatureRowWithIcon(
                    Icons.light_mode_outlined,
                    'Iconic headlamp',
                    'Distinguishing personality that shines through'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: Get.width * .5,
          child: Image(
            image: AssetImage(EScooterImageConstant.imgYellowEScooter1),
            alignment: Alignment(-0.35, 0),
            fit: BoxFit.fitWidth
          ),
        )
      ],
    );
  }

  Widget _buildFeatureText(String text1, String text2, String text3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: GoogleFonts.montserrat(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        Row(
          children: [
            Text(
              text2,
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff16AB51)),
            ),
            Text(
              text3,
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureRowWithIcon(
      IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(
            width: Get.width * .03,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(
            width: 8
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Container(
                  width: Get.width * .35,
                  child: Text(
                    description,
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPromoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: SizedBox(
        height: Get.height * .3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(EScooterImageConstant.imgPromo),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white, // Adjust opacity as needed
                BlendMode.modulate,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                _buildPromoText('Best ', 'performance', Colors.white),
                _buildPromoText('ever seen in a scooter', '', Colors.white),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width * .5,
                        child: Column(
                          children: [
                            EScooterHelper.desc(
                                '115 KM/H top speed', Icons.speed_outlined),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: EScooterHelper.desc(
                                  '181 KM range', Icons.battery_full_outlined),
                            ),
                            EScooterHelper.desc('0 to 40 KM/H in 3.0 sec',
                                Icons.fast_forward_outlined),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPromoText(String text1, String text2, Color color) {
    return Row(
      children: [
        Text(
          text1,
          style: GoogleFonts.montserrat(
              fontSize: 20, fontWeight: FontWeight.w500, color: color),
        ),
        Text(
          text2,
          style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: appTheme.lime500),
        ),
      ],
    );
  }

  Widget _buildDigitalTechSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'DIGITAL',
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400]),
              ),
              Text(
                ' TECH',
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width * .45,
              child: Image(
                image: AssetImage(EScooterImageConstant.speed),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: Get.width * .45,
                child: Image(
                  image: AssetImage(EScooterImageConstant.imgDisplayBanner),
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width * .45,
              child: Image(
                image: AssetImage(EScooterImageConstant.imgNav1),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: Get.width * .45,
                child: Image(
                  image: AssetImage(EScooterImageConstant.imgNav2),
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildMoveOsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Introducing MoveOS that',
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                'truly moves with you',
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff16AB51)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Text(
                  'Meet MoveOS and its many Moods.\nDesigned to take you places,\nto keep you connected.',
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 120,
            height: 30,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff16AB51),
                    Color(0xff60BE85),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Reserve",
                    style: EScooterTextStyles.displaySmall1
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
