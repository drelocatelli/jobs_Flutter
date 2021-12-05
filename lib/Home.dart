import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _webservice = "https://api.github.com/repos/devfsa/vagas/issues";
  List<dynamic> jobList = [];

  void _openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _getJobs() async {

    http.Response request = await http.get(Uri.parse(_webservice));

    List<dynamic> response = json.decode(request.body);

    jobList = response;

  }

  Widget _jobList() {
    return Expanded(
      child: ListView.separated(
        itemCount: jobList.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: () {
              this._openLink(jobList[index]["html_url"].toString());
            },
            title: Text(jobList[index]["title"], style: TextStyle(color: Colors.black, fontSize: 12)),
            subtitle: Text(jobList[index]["created_at"], style: TextStyle(color: Colors.black26, fontSize: 13)),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 0);
        },
      ),
    );
  }

  @override
  void initState() {
    _getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Git Jobs"),
      ),
      body: Column(
        children: [
          Text("${this._webservice}", style: TextStyle(color: Colors.grey)),
          this._jobList(),
          ElevatedButton(onPressed: () => this._getJobs(), child: Text("Refresh"))
        ],
      ),
    );
  }
}
