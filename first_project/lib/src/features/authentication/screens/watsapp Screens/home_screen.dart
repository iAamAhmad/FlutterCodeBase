import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 4,
    vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF128C7E),
        bottom: TabBar(
          // isScrollable: true,
          dragStartBehavior: DragStartBehavior.start,
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(
              child: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text('Chats'),
            ),
            Tab(
              child: Text('Status'),
            ),
            Tab(
              child: Text('Calls'),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('New group'),
              ),
              PopupMenuItem(
                child: Text('New broadcast'),
              ),
              PopupMenuItem(
                child: Text('WhatsApp Web'),
              ),
              PopupMenuItem(
                child: Text('Starred messages'),
              ),
              PopupMenuItem(
                child: Text('Settings'),
              ),
            ];
          })
        ],
        title: Text('WhatsApp'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text('Camera'),
          //?chat listing build for testing purpose
          ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  // radius: 30,
                  backgroundImage: NetworkImage(index % 2 == 0
                      ? 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.statusfacebook.com%2Fprofile_pictures%2FAwesome%2Fawesome-profile-picture-127.jpg&f=1&nofb=1&ipt=fd90f2daede427170ce481df8cd7e6c826c5650aa90cb73b4e94191a0befa473&ipo=images'
                      : 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F4.bp.blogspot.com%2F-9mtmwQIbz9U%2FUhNHNEk9zwI%2FAAAAAAAAEbM%2Fpxb9K-SOzSE%2Fs1600%2Ffacebook_photo_download_194639357233682.jpg&f=1&nofb=1&ipt=0c738a0a3aae9f496a91ddd8055df55df594ebf25203862839590ca11b85b4b9&ipo=images'),
                ),
                title:
                    index % 2 == 0 ? Text('Vicky Dep') : Text('Elli Fanning'),
                subtitle: index % 2 == 0
                    ? Text('The night is dark and..')
                    : Text('We are trying to see..'),
                trailing: index % 2 == 0 ? Text('12:00 PM') : Text('8:08 PM'),
              );
            },
          ),

          //?we are building status here now
          ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        index % 2 == 0 ? Colors.green : Colors.grey,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(index % 2 == 0
                          ? 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.imagesplatform.com%2Fmohsin_site%2Fuploads%2F2021_04_12%2Fstylish-cute-yellow-dp.jpg&f=1&nofb=1&ipt=e350021841e0b8fc1ce1186628453a87db6e1014b4f49e24842da91cdc97ef60&ipo=images'
                          : 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F4.bp.blogspot.com%2F-9mtmwQIbz9U%2FUhNHNEk9zwI%2FAAAAAAAAEbM%2Fpxb9K-SOzSE%2Fs1600%2Ffacebook_photo_download_194639357233682.jpg&f=1&nofb=1&ipt=0c738a0a3aae9f496a91ddd8055df55df594ebf25203862839590ca11b85b4b9&ipo=images'),
                    ),
                  ),
                ),
                title: Text('Vicky Dep'),
                subtitle: index % 2 == 0
                    ? Text('Today, 12:00 PM')
                    : Text('Yesterday, 12:00 PM'),
              );
            },
          ),

          //? generating call for testing purposes
          ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  // radius: 30,
                  backgroundImage: NetworkImage(index % 2 == 0
                      ? 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.imagesplatform.com%2Fmohsin_site%2Fuploads%2F2021_04_12%2Fstylish-cute-yellow-dp.jpg&f=1&nofb=1&ipt=e350021841e0b8fc1ce1186628453a87db6e1014b4f49e24842da91cdc97ef60&ipo=images'
                      : 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F4.bp.blogspot.com%2F-9mtmwQIbz9U%2FUhNHNEk9zwI%2FAAAAAAAAEbM%2Fpxb9K-SOzSE%2Fs1600%2Ffacebook_photo_download_194639357233682.jpg&f=1&nofb=1&ipt=0c738a0a3aae9f496a91ddd8055df55df594ebf25203862839590ca11b85b4b9&ipo=images'),
                ),
                title: Text('Vicky Dep'),
                subtitle: Text('You Missed a call'),
                trailing: Icon(index % 2 == 0 ? Icons.call : Icons.video_call),
              );
            },
          ),
        ],
      ),
    );
  }
}
