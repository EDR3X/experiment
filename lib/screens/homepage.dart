import 'package:date_format/date_format.dart';
import 'package:floatingbutton/api_service/api_services.dart';
import 'package:floatingbutton/screens/user_data.dart';
import 'package:floatingbutton/ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searching;

  @override
  Widget build(BuildContext context) {
    final searchField = TextField(
      onChanged: (value) => searching = value,
      decoration: const InputDecoration(
        hintText: "Search Stocks",
        border: InputBorder.none,
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );

    APIService().getAt();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                //* Datetime
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 12,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        formatDate(
                          DateTime.now(),
                          [MM, ' ', d, ', ', yyyy],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: appColor,
                    ),
                    child: Center(
                        child: SizedBox(
                      width: 200,
                      child: searchField,
                    )),
                  ),
                ),
                Container(
                  height: 150,
                  child: Row(children: [Text("s")]),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                          colors: [Colors.lightBlueAccent, Colors.amber])),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Trending",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.white),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (c, i) => ListTile(
                      title: Stack(alignment: Alignment.center, children: [
                        ListTile(
                          title: const Text("XBSS"),
                          subtitle: Text("subtitle"),
                          trailing: Column(children: const [
                            Text("XBSS"),
                            Text("subtitle"),
                          ]),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: 80,
                            height: kToolbarHeight * .7,
                            color: Colors.amber,
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  User _getUser(userJson) {
    return User.fromJson(userJson);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: APIService().getAt(url: "https://randomuser.me/api/"),
      builder: (c, data) => data.connectionState == ConnectionState.waiting
          ? Center(child: CircularProgressIndicator())
          : Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning "),
                    Text(
                      "${_getUser(data.data).results?.first.name?.first} ${_getUser(data.data).results?.first.name?.last}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  foregroundImage: NetworkImage(
                      "${_getUser(data.data).results?.first.picture?.large}"),
                ),
              ],
            ),
    );
  }
}
