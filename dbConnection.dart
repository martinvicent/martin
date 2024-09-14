// ignore_for_file: file_names

import 'package:mysql1/mysql1.dart';
import 'dart:async';

// Function to establish and return a database connection
// ignore: non_constant_identifier_names
Future DBconnection() async {
  // Set up the connection settings for the MySQL database
  // ignore: await_only_futures
  var con = await ConnectionSettings(
      host: '127.0.0.1', // Database host
      port: 3306,        // Database port
      user: 'root',      // Database username
      password: '12345', // Database password
      db: 'dartandmysql'   // Database name
  );
  
  // Connect to the MySQL database using the connection settings
  var conn = await MySqlConnection.connect(con);
  
  // Return the established database connection
  return conn;
}
