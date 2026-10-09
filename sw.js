var C="journal-v17";
self.addEventListener("install",function(e){self.skipWaiting()});
self.addEventListener("activate",function(e){e.waitUntil(self.clients.claim())});
self.addEventListener("fetch",function(e){
  var r=e.request;
  if(r.method!=="GET"||new URL(r.url).origin!==location.origin)return;
  e.respondWith(fetch(r).then(function(res){
    var copy=res.clone();caches.open(C).then(function(c){c.put(r,copy)});return res
  }).catch(function(){return caches.match(r).then(function(m){return m||caches.match("./")})}))
});
