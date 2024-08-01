import 'package:firebase_auth/firebase_auth.dart';
import 'package:start_up_workspace/resources/globals.dart';
import '../../../resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    homeController.fetchPostsFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Obx(() {
        return IndexedStack(
          index: homeController.selectedTabIndex.value,
          children: [
            _buildHomeTab(),
            _buildProfileTab(),
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeController.selectedTabIndex.value,
        onTap: (index) {
          homeController.changeTabIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: localizations.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الشخصية',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: homeController.searchController,
            decoration: InputDecoration(
              hintText: 'البحث...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (String? value) {
              homeController.filterPosts(value);
            },
          ),
        ),
        Expanded(
          child: Obx(() {
            if (homeController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (homeController.filteredPosts.isEmpty) {
              return const Center(child: Text('ابدا البحث عن المنشور '));
            }

            return ListView.builder(
              itemCount: homeController.filteredPosts.length,
              itemBuilder: (context, index) {
                final post = homeController.filteredPosts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  elevation: 4.0,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      post.name ?? 'No Name',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.email ?? 'No Email'),
                        const SizedBox(height: 8.0),
                        Text(post.body ?? 'No Body'),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildProfileTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('الاسم: ${Globals().userModel!.fullName}',
                  style: const TextStyle(fontSize: 18)),
              Text('العمر: ${Globals().userModel!.age}',
                  style: const TextStyle(fontSize: 18)),
              Text('لجنس: ${Globals().userModel!.gender}',
                  style: const TextStyle(fontSize: 18)),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              _logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => AuthView());
  }
}
