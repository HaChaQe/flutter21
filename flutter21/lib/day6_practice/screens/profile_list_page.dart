import 'package:flutter/material.dart';
import 'package:flutter21/day6_practice/models/profile.dart';
import 'package:flutter21/day6_practice/screens/profile_detail_page.dart';

class ProfileListPage extends StatefulWidget {
  const ProfileListPage({super.key});

  @override
  State<ProfileListPage> createState() => _ProfileListPageState();
}

class _ProfileListPageState extends State<ProfileListPage> {
  
  List<Profile> profiles = [
    Profile(name: "Ronnie", bio: "Legendary frontman"),
    Profile(name: "Jimmy", bio: "Thunderous bassist"),
    Profile(name: "Vinny", bio: "Absolute drummer"),
    Profile(name: "Vivian", bio: "Shred machine"),
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile List"),),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Card(
            child: InkWell(
              onTap: () async {
                final updatedProfile = await Navigator.push<Profile>(context, MaterialPageRoute(builder: (context) => ProfileDetailPage(profile: profile,),));
                if (updatedProfile != null) {
                  setState(() {
                    profiles[index] = updatedProfile;
                  });
                }
              },
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profile.name, style: TextStyle(fontSize: 20),),
                      SizedBox(height: 2),
                      Text(profile.bio)
                    ],
                  ),
                ),
              ),
            ),
          );
      },),
    );
  }
}