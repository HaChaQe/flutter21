import 'package:flutter/material.dart';
import 'package:flutter21/day6_practice/models/profile.dart';
import 'package:flutter21/day6_practice/screens/profile_edit_page.dart';

class ProfileDetailPage extends StatefulWidget {
  final Profile profile;

  const ProfileDetailPage({super.key, required this.profile});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  late Profile currentProfile;

  @override
  void initState() {
    super.initState();
    currentProfile = widget.profile;
  }

  @override
  Widget build(BuildContext context) {
    IconData profileIcon;

    switch (currentProfile.name) {
      case "Ronnie":
        profileIcon = Icons.mic_external_on_outlined;
        break;
      case "Jimmy":
        profileIcon = Icons.music_note;
        break;
      case "Vinny":
        profileIcon = Icons.album;
        break;
      case "Vivian":
        profileIcon = Icons.music_note;
        break;
      default:
        profileIcon = Icons.person_outline_rounded;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Detail"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, currentProfile);
          },
          icon: Icon(Icons.arrow_back),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 2,
                          currentProfile.name,
                          style: TextStyle(letterSpacing: 10, fontSize: 25),
                        ),
                        Text(
                          currentProfile.bio,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 16
                          )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(profileIcon, size: 40),
                  SizedBox(width: 20),
                  ElevatedButton(
                    child: SizedBox(
                      height: 40,
                      width: 36,
                      child: Center(
                        child: Text(
                          "EDIT",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final updatedProfile = await Navigator.push<Profile>(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileEditPage(profile: currentProfile),
                        ),
                      );
                      if (updatedProfile != null) {
                        setState(() {
                          currentProfile = updatedProfile;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
