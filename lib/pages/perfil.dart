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
    'followers': 123,
    'following': 45,
    'posts': [
      {
        'id': 1,
        'imageURL':
            "https://live.staticflickr.com/4656/39811498731_c9a466e4f0_b.jpg",
      },
      {
        'id': 2,
        'imageURL':
            "https://live.staticflickr.com/917/42438929015_560baa3385_b.jpg",
      },
      {
        'id': 3,
        'imageURL':
            "https://live.staticflickr.com/919/42438772515_69a7df7a98_b.jpg",
      },
      {
        'id': 4,
        'imageURL':
            "https://live.staticflickr.com/1802/42625549874_c2f43b6958_b.jpg",
      },
      {
        'id': 5,
        'imageURL':
            "https://live.staticflickr.com/4718/38912808435_947e9139fc_b.jpg",
      },
      {
        'id': 6,
        'imageURL':
            "https://live.staticflickr.com/916/42438716915_df05e9ea84_b.jpg",
      },
      {
        'id': 7,
        'imageURL':
            "https://live.staticflickr.com/913/42438942375_bdc45a9229_b.jpg",
      },
      {
        'id': 8,
        'imageURL':
            "https://live.staticflickr.com/1763/43293207732_78111fd46f_b.jpg",
      },
    ]
  };

  Widget profileMetadataCount(String key, int value) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(value.toString(), style: Theme.of(context).textTheme.titleLarge),
      Text(key, style: const TextStyle(fontSize: 12.0))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
          stretch: true,
          expandedHeight: 250.0,
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
            background: Stack(fit: StackFit.expand, children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.network(
                  _profileData['backgroundImageURL'],
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 80.0),
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  backgroundImage:
                      NetworkImage(_profileData['profileImageURL']),
                ),
              )
            ]),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit Profile',
              onPressed: () {/* ... */},
            ),
          ]),
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
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return PostDetail(_profileData['posts'][index]['imageURL']);
                }));
              },
              child: Hero(
                tag: _profileData['posts'][index]['imageURL'],
                child: Image.network(
                  _profileData['posts'][index]['imageURL'],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          childCount: _profileData['posts'].length,
        ),
      ),
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
