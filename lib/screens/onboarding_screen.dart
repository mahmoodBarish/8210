import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black, // Default background color for the screen
      body: Stack(
        children: [
          // Background Image (Image Onboarding - id: 142:499)
          // The image fills the top portion of the screen, adjusted for responsiveness.
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/I142_500_417_719.png',
              width: screenWidth,
              height: screenHeight * (536 / 812), // Figma image frame height is 536px relative to 812px screen height
              fit: BoxFit.cover,
            ),
          ),

          // Gradient Overlay (Shadow Container - id: 142:502)
          // This gradient starts at y=452 (relative to 812px screen height)
          // and covers the bottom part of the image, fading into the dark background.
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * (360 / 812), // Figma gradient container height is 360px relative to 812px screen height
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [
                    // Figma gradient colors: from rgba(5,5,5,0) to rgba(5,5,5,255)
                    Color.fromRGBO(5, 5, 5, 0.0), // Alpha 0
                    Color.fromRGBO(5, 5, 5, 1.0), // Alpha 1
                  ],
                  // Figma gradient stops
                  stops: const [0.0, 0.23670603334903717],
                ),
              ),
            ),
          ),

          // Main Content (Text and Button)
          // Positioned at the bottom, above the home indicator, with responsive padding.
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: screenHeight * (54 / 812), // Calculated from Figma: 812 - (702 (button_y) + 56 (button_height)) = 54px bottom margin
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Shrink to fit content
                children: [
                  // Title Text (id: 142:506)
                  Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 32,
                      fontWeight: FontWeight.w600, // SemiBold
                      color: Colors.white,
                      letterSpacing: 0.16,
                      height: 48 / 32, // Line height 48px / font size 32px
                    ),
                  ),
                  SizedBox(
                      height: screenHeight *
                          (8 /
                              812)), // Item spacing from Figma between title and subtitle (8px)
                  // Subtitle Text (id: 142:507)
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w400, // Regular
                      color:
                          const Color(0xFFA2A2A2), // Figma color: rgba(162,162,162,1)
                      letterSpacing: 0.14,
                      height: 21 / 14, // Line height 21px / font size 14px
                    ),
                  ),
                  SizedBox(
                      height: screenHeight *
                          (32 /
                              812)), // Gap between text content (bottom 670) and button (top 702) is 32px
                  // Get Started Button (id: 142:503)
                  SizedBox(
                    width: double.infinity, // Fills horizontal space, respecting parent padding
                    height: 56, // Fixed height: 56px from Figma
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the home screen using go_router
                        context.go('/home_page'); // Changed to go_router navigation
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFC67C4E), // Figma button background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // Corner radius: 16px
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16), // Figma padding
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600, // SemiBold
                          color: Colors.white,
                          height: 24 / 16, // Line height 24px / font size 16px
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Status Bar (Iphone - id: 142:509)
          // Fixed at the very top of the screen, inside a SafeArea for notch handling.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false, // Ensure padding is applied only at the top for the notch
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41', // Time (I142:509;417:348)
                      style: GoogleFonts.sora(
                        fontSize: 15, // Approximate font size based on render bounds
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.signal_cellular_alt,
                            color: Colors.white, size: 17), // Mobile Signal icon
                        SizedBox(width: 4),
                        Icon(Icons.wifi, color: Colors.white, size: 17), // Wifi icon
                        SizedBox(width: 4),
                        Icon(Icons.battery_full,
                            color: Colors.white, size: 17), // Battery icon
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Home Indicator (Iphone - id: 142:508)
          // Fixed at the very bottom of the screen, inside a SafeArea for bottom padding.
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              top: false, // Ensure padding is applied only at the bottom
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom:
                          8), // Calculated from Figma: 812 (screen height) - 799 (indicator y) - 5 (indicator height) = 8px bottom margin
                  height: 5, // Fixed height: 5px from Figma
                  width: 134, // Fixed width: 134px from Figma
                  decoration: BoxDecoration(
                    color: const Color(0xFF242424), // Figma color: rgba(36,36,36,1)
                    borderRadius:
                        BorderRadius.circular(100), // Rounded corners: 100px
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}