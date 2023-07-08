import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final Map _profileData = {
    'backgroundImageURL':
        "https://live.staticflickr.com/4656/39811498731_c9a466e4f0_b.jpg",
    'profileImageURL':
        'https://vignette.wikia.nocookie.net/pkmnshuffle/images/c/c8/Turtwig.png/revision/latest?cb=20170409020509',
    'username': 'Diego',
    'followers': 0,
    'following': 0,
    'posts': []
  };

  Widget profileMetadataCount(String key, int value) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(value.toString(), style: Theme.of(context).textTheme.titleSmall),
      Text(key, style: const TextStyle(fontSize: 12.0))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@diegoga',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 64,
                    width: 64,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Diego García',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: const [
              Center(child: Text('Biografia...')),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            profileMetadataCount('tops', _profileData['posts'].length),
            profileMetadataCount('seguidores', _profileData['followers']),
            profileMetadataCount('siguiendo', _profileData['following'])
          ],
        ),
        const Divider(
          height: 24,
        )
      ],
    );

    CustomScrollView(slivers: [
      SliverAppBar(
        stretch: true,
        // expandedHeight: 250.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          stretchModes: const [
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],
          title: Text(
            _profileData['username'],
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          // background: Stack(fit: StackFit.expand, children: [
          //   Align(
          //     alignment: Alignment.topLeft,
          //     child: Image.network(
          //       _profileData['backgroundImageURL'],
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          //   Container(
          //     padding: const EdgeInsets.only(top: 80.0),
          //     alignment: Alignment.center,
          //     child: CircleAvatar(
          //       radius: 30.0,
          //       backgroundColor:
          //           Theme.of(context).colorScheme.tertiaryContainer,
          //       backgroundImage:
          //           NetworkImage(_profileData['profileImageURL']),
          //     ),
          //   )
          // ]),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.edit),
        //     tooltip: 'Edit Profile',
        //     onPressed: () {/* ... */},
        //   ),
        // ],
      ),
      SliverFixedExtentList(
        itemExtent: 50.0,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                "Biografía...",
                style: TextStyle(fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            );
          },
          childCount: 1,
        ),
      ),
      SliverGrid.count(crossAxisCount: 3, childAspectRatio: 1.2, children: [
        profileMetadataCount('tops', _profileData['posts'].length),
        profileMetadataCount('seguidores', _profileData['followers']),
        profileMetadataCount('siguiendo', _profileData['following'])
      ]),
      // SliverGrid(
      //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent: 200.0,
      //     mainAxisSpacing: 5.0,
      //     crossAxisSpacing: 5.0,
      //     childAspectRatio: 1.0,
      //   ),
      //   delegate: SliverChildBuilderDelegate(
      //     (BuildContext context, int index) {
      //       return GestureDetector(
      //         onTap: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (_) {
      //             return PostDetail(_profileData['posts'][index]['imageURL']);
      //           }));
      //         },
      //         child: Hero(
      //           tag: _profileData['posts'][index]['imageURL'],
      //           child: Image.network(
      //             _profileData['posts'][index]['imageURL'],
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       );
      //     },
      //     childCount: _profileData['posts'].length,
      //   ),
      // ),
    ]);
  }
}

class PostDetail extends StatelessWidget {
  final String url;
  const PostDetail(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            child: Hero(
              tag: url,
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("This is my post!"),
          )
        ],
      ),
    );
  }
}
