'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest.json": "0fbba2073a2c93c52934c8e4e19c4e55",
"version.json": "90b39a2f4b098c91f9401ae812c685a9",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"index.html": "f60766d2d903df5c917a79e4a040124f",
"/": "f60766d2d903df5c917a79e4a040124f",
"main.dart.js": "5335104e5667654b2d9b3bf199fde042",
"assets/NOTICES": "8d0e11406e99c55399ddcc8b08b6a1aa",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/pixelarticons/fonts/pixelarticons.otf": "d38fa7c6111a0c992acc370505e76793",
"assets/shaders/ink_sparkle.frag": "7ff7388e83c41d3004d4335a0e6dca0c",
"assets/FontManifest.json": "06177a698b0201cdaad8620e4c6f6e28",
"assets/AssetManifest.json": "c0f53f85591ba70812df7f2e4102d626",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/badge10.png": "710d7473fb4bd1342acf15c68d5cd68d",
"assets/assets/images/brocoliOne.png": "04f4b985b1a55794161913eb6460047b",
"assets/assets/images/hi_bullet.png": "e8c2524639536db1823614d05c50e5af",
"assets/assets/images/physio.png": "e0e56db0368df7d6866d7c6fbe4ef3e6",
"assets/assets/images/dieteticiene.png": "03ae2ce5175a744b32f431cc783fdc5c",
"assets/assets/images/badge4.png": "52718fbad4cef926ba6da9ac558566e0",
"assets/assets/images/badge8.png": "03ae2ce5175a744b32f431cc783fdc5c",
"assets/assets/images/user.png": "3dfdf3d7e8858c26493899277841048f",
"assets/assets/images/pulsoxymetre.png": "495fa108aabab9dd4947b2c41a5c765d",
"assets/assets/images/badge15.png": "992e95c4082a9d81912e189ba374f53c",
"assets/assets/images/badge6.png": "38c538d8c64827e5c621d2b65c11ff41",
"assets/assets/images/badge5.png": "9ad35d8204d6f097670d99d302a313b4",
"assets/assets/images/tabacologue.png": "b21edd166cdc7ff4bcb873acb10c5e23",
"assets/assets/images/badge3.png": "4b2c99e90ccd2ddf24741a055261756b",
"assets/assets/images/badge13.png": "932987b7b826eb87150a4029901f2098",
"assets/assets/images/urgence.png": "992e95c4082a9d81912e189ba374f53c",
"assets/assets/images/objection_bullet.png": "2077e361f0ad011cb3ae2224ce854ce2",
"assets/assets/images/cms.png": "7c17132da969bdb606527a9df9d5b73b",
"assets/assets/images/badge1.png": "139d6ce37f6a57cf25e3a938691dd6be",
"assets/assets/images/badge7.png": "2acef993503969f3bda6b7c8e260d487",
"assets/assets/images/badge14.png": "b21edd166cdc7ff4bcb873acb10c5e23",
"assets/assets/images/badge11.png": "7c17132da969bdb606527a9df9d5b73b",
"assets/assets/images/intercept_bullet.png": "317e08cd8844d03053547e6804651ab0",
"assets/assets/images/infirmiere.png": "f823987cbfd1efedb79016324ae644d4",
"assets/assets/images/bag.png": "d977c83253d8c7f0a6ebb0cd22aa8db3",
"assets/assets/images/medecin.png": "932987b7b826eb87150a4029901f2098",
"assets/assets/images/stethoscope.png": "fdb7e9c90803c734d44aed8346df9507",
"assets/assets/images/thermometre.png": "22d022a0f5f8bdb5c9eb60b605632b9c",
"assets/assets/images/badge2.png": "22fa66720763857b262cfdae3afc0492",
"assets/assets/images/glycometre.png": "baca41719234d44dd21636aa4cbf4842",
"assets/assets/images/tensiometre.png": "f596f3b1d46ebc4dcfcd1db2761a5e56",
"assets/assets/images/aumonier.png": "710d7473fb4bd1342acf15c68d5cd68d",
"assets/assets/images/brocoliSon.png": "31fbec3a31690bbd45045f6ede13dbc6",
"assets/assets/images/insuline.png": "438051447e6ac1b6d2b0e52b8934fbde",
"assets/assets/images/badge12.png": "f823987cbfd1efedb79016324ae644d4",
"assets/assets/images/badge9.png": "474b137512e325cf47f9f04f1d45a5db",
"assets/assets/audio/goinghigher.mp3": "2057ee6b687b56fb853af3b3574711cf",
"assets/assets/audio/birthofahero.mp3": "f36273a6016f97ffa8e67f04df158259",
"assets/assets/audio/perception.mp3": "d35879fcbfe1b1baf870a502d428307a",
"assets/assets/audio/slowmotion.mp3": "e0e75e5b7f2eaa57ab39b3a6e5a40f0b",
"assets/assets/audio/smallguitar.mp3": "4eebc12f1d7a82249ff2220bf1de910c",
"assets/assets/audio/highoctane.mp3": "a47178461135a796005f17700ea7fadc",
"assets/assets/audio/endlessmotion.mp3": "b6df2d07665c3415f421857df2a68598",
"assets/assets/audio/ukulele.mp3": "9569869286a4e88efa8724d24f50bf47",
"assets/assets/audio/funday.mp3": "feae87868e1c7404583ec0ef2bd9d779",
"assets/assets/audio/smile.mp3": "aa215fb189f37b14d6777c115b43b70d",
"assets/assets/audio/happyrock.mp3": "80276ac2e9b80cdde919b3c40b4a79cc",
"assets/assets/audio/adventure.mp3": "d470b79f97de680743b51915f6dd788b",
"assets/assets/audio/hipjazz.mp3": "d11e76f4d0b724dbdf9edcc48a87dd66",
"assets/assets/audio/onceagain.mp3": "b7303a025fee4c52c32f735833b2bbfa",
"assets/assets/tiles/village1.tmx": "18731060b13641b4102e2c7f677598b6",
"assets/assets/tiles/tiles_sets/moutarde_home.tsx": "607ec7f0cfe8336d335ad78e1b19506c",
"assets/assets/tiles/tiles_sets/village.tsx": "6b64efae04209164ecd3cbd19a7cb44d",
"assets/assets/tiles/brocoli_home.tmx": "e005d403997406b508cba9d084e3b594",
"assets/assets/tiles/moutarde_home.tmx": "510d5fb98eb47f4213a33a2c42bae8f0",
"assets/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/assets/fonts/pixel_sans_serif.ttf": "e4f46b0b7d59ea0d679253c472632698",
"assets/assets/fonts/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
"assets/assets/fonts/novem.ttf": "9b2847883cca1f856c2b49a7d795a9a3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
