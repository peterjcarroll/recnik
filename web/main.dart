// Copyright (c) 2016, PeterCarroll. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:http/browser_client.dart';

import 'package:recnik/app_component.dart';

BrowserClient HttpClientBackendServiceFactory() => new BrowserClient();

main() {
  bootstrap(AppComponent, const [
    const Provider(BrowserClient, useFactory: HttpClientBackendServiceFactory, deps: const [])
  ]);
}
