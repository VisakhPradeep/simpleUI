import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverTab extends StatelessWidget {
  final List<String> stories = [
    "assets/story1.jpg",
    "assets/story2.jpg",
    "assets/story3.jpg",
    "assets/story4.jpg",
    "assets/story5.jpg",
    "assets/story6.jpg",
    "assets/story7.jpg",
  ];

  final List<String> posts = [
    "assets/post6.jpg",
    "assets/post7.jpg",
    "assets/post3.jpg",
    "assets/post4.jpg",
    "assets/post5.jpg",
    "assets/post1.jpg",
    "assets/post2.jpg",
    "assets/post3.jpg",
  ];

  final List<String> profileImages = [
    "assets/profile1.jpg",
    "assets/profile2.jpg",
    "assets/profile3.jpg",
    "assets/profile4.jpg",
    "assets/profile5.jpg",
    "assets/profile6.jpg",
    "assets/profile7.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Story Section
            SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                itemCount: stories.length + 1,
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          child: Container(
                            width: 95,
                            height: 115,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 30,
                                  left: 20,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("assets/profile.jpg"),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 5,
                                  child: Text(
                                    "Your Story",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                                Positioned(
                                  top: 75,
                                  left: 38,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Color(0xFF03C6C6),
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF02355C),
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Container(
                          width: 95,
                          height: 115,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(stories[index - 1]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 5,
                                left: 5,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundImage:
                                      AssetImage(profileImages[index - 1]),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 5,
                                child: Text(
                                  "User $index",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Recently Post Title with Three Dots
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recently Post",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.more_horiz),
                ],
              ),
            ),

            // Post Section
            for (int i = 0; i < posts.length; i++) ...[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(profileImages[i % profileImages.length]),
                        radius: 25,
                      ),
                      title: Text(
                        "User $i",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Posted in 8s - 1h ago",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Color(0xFF777777)),
                      ),
                    ),

                    SizedBox(height: 10),

                    // Increased Image Height
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 200,
                        child: Image.asset(posts[i], fit: BoxFit.cover),
                      ),
                    ),

                    SizedBox(height: 10),

                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
