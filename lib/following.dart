import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowingTab extends StatefulWidget {
  final List<String> posts = [
    "assets/profile1.jpg",
    "assets/profile2.jpg",
    "assets/profile3.jpg",
    "assets/profile4.jpg",
    "assets/profile5.jpg",
  ];

  @override
  _FollowingTabState createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                SizedBox(height: 10),
                Text(
                  "Chris",
                  style: GoogleFonts.poppins(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Text(
                  "@ghgha",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                SizedBox(height: 10),
                Divider(color: Color(0xFFDDD8D8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStat("360", "Post"),
                    _buildStat("2M", "Follower"),
                    _buildStat("140k", "Following"),
                  ],
                ),
                Divider(color: Color(0xFFDDD8D8)),
                SizedBox(height: 15),
                _buildStorySection(),
                SizedBox(height: 20),
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      icon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.post_add),
                          SizedBox(width: 8),
                          Text("Post"),
                        ],
                      ),
                    ),
                    Tab(
                      icon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.announcement),
                          SizedBox(width: 8),
                          Text("MENTION"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: Colors.grey[100],
                  child: _buildPostSection(),
                ),
                Center(
                  child: Container(
                    child: Text(
                      "MENTION",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStorySection() {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: widget.posts.length + 1,
        separatorBuilder: (_, __) => SizedBox(width: 10),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildStoryTile("Your Story", "assets/profile.jpg",
                isOwnStory: true);
          }
          return _buildStoryTile("User $index", widget.posts[index - 1]);
        },
      ),
    );
  }

  Widget _buildStoryTile(String title, String image,
      {bool isOwnStory = false}) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Stack(
            children: [
              Container(
                width: 95,
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isOwnStory)
                Positioned(
                  top: 25,
                  left: 20,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(image),
                  ),
                ),
              if (isOwnStory)
                Positioned(
                  bottom: 20,
                  left: 40,
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
        SizedBox(height: 5),
      ],
    );
  }

  Widget _buildPostSection() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.only(bottom: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                title: Text(
                  "User $index",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "2 hours ago",
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),
                trailing: Icon(Icons.more_horiz),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.posts[index],
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 150,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStat(String count, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            count,
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
